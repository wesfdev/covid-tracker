import { Component, OnInit } from '@angular/core';
import { RestService } from '../services/rest.service';

@Component({
  selector: 'app-statistics',
  templateUrl: './statistics.component.html',
  styleUrls: ['./statistics.component.css']
})
export class StatisticsComponent implements OnInit {
  public statistics:any = { cases: { }, deaths:{} };
  public historyList:any = [];
  public country:string = '';
  public url:string = '';
  public headers:any = null;

  constructor(public api: RestService) { 
    let storageCountry = localStorage.getItem('country');
    this.country = storageCountry?storageCountry:'Guatemala';
    this.url = this.api.getEndpointCovid();
    this.headers = this.api.getHeaderCovid();
    this.getStatisticsByCountry(this.country);
    this.getHistoryByCountry(this.country);
  }

  ngOnInit() {

  }

  public async getStatisticsByCountry(country:string){
    let statisticsRs:any =  await this.api.http().get(`${this.url}/statistics?country=${country}`, this.headers).toPromise();
    this.statistics = statisticsRs.response[0];
  }

  public async getHistoryByCountry(country:string){
    let statisticsRs:any =  await this.api.http().get(`${this.url}/history?country=${country}`, this.headers).toPromise();
    this.historyList = statisticsRs.response;
  }

  public search(){
      localStorage.setItem('country', this.country);    
      this.getStatisticsByCountry(this.country);
  }

  public history(){
    this.getHistoryByCountry(this.country);
  }


}

