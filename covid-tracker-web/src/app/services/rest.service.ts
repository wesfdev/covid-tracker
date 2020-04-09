import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpErrorResponse } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { map, catchError, tap } from 'rxjs/operators';

const endpoint = 'http://localhost:3000';
const endpoint_covid = 'https://covid-193.p.rapidapi.com';
const httpOptions = {
  headers: new HttpHeaders({
    'Content-Type':  'application/json'
  })
};

const httpOptionsApi = {
  headers: new HttpHeaders({
    'Content-Type':  'application/json',
    'x-rapidapi-host':'covid-193.p.rapidapi.com',
    'x-rapidapi-key':'9d6176a3c9msh981a2c7a13141a4p1e7bb1jsnd0a52ae0eaed'
  })
};

@Injectable({
  providedIn: 'root'
})
export class RestService {

  constructor(private httpClient: HttpClient) { }

  private extractData(response: Response) {
    let body = response;
    return body || { };
  }

  http(){
    return this.httpClient;
  }

  getHeaderCovid(){
    return httpOptionsApi;
  }

  getEndpoint(){
    return endpoint;
  }

  getEndpointCovid(){
    return endpoint_covid;
  }

  getPDF(url){
    let headers = new HttpHeaders();
    headers = headers.set('Accept', 'application/pdf');
    return this.httpClient.get(url, { headers: headers, responseType: 'blob' as 'json' });
  }


  gethttp(url): Observable<any> {
    return this.httpClient.get(endpoint + url).pipe(
      map(this.extractData));
  }

  posthttp(url, data): Observable<any> {
    return this.httpClient.post(endpoint + url,JSON.stringify(data), httpOptions).pipe(
      tap(_ => console.log(`posted =${url}`)),
      catchError(this.handleError<any>('post'))
    );
  }

  puthttp(url, data): Observable<any> {
    return this.httpClient.put(endpoint + url, JSON.stringify(data), httpOptions).pipe(
      tap(_ => console.log(`updated =${url}`)),
      catchError(this.handleError<any>('put'))
    );
  }

  deletehttp(url): Observable<any> {
    return this.httpClient.delete(endpoint + url, httpOptions).pipe(
      tap(_ => console.log(`deleted =${url}`)),
      catchError(this.handleError<any>('delete'))
    );
  }

  private handleError<T> (operation = 'operation', result?: T) {
    return (error: any): Observable<T> => {
      console.error(error); // log to console instead
      console.log(`${operation} failed: ${error.message}`);
      return of(result as T);
    };
  }

}
