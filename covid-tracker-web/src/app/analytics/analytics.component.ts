import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { RestService } from '../services/rest.service';
import { NgxChartsModule } from '@swimlane/ngx-charts';
import * as xlsx from 'xlsx';

declare var google: any;
const maxI = 50, rad = 24, opac = .6;    


@Component({
  selector: 'app-analytics',
  templateUrl: './analytics.component.html',
  styleUrls: ['./analytics.component.css']
})
export class AnalyticsComponent implements OnInit {
  @ViewChild('epltable') epltable: ElementRef;
  @ViewChild('epltabledetail') epltabledetail: ElementRef;

  public diagnostics:any = [];
  public diagnosticsByCity:any = [];
  singleByCityChar: any[] = [];
  view: any[] = [600, 600];
  // options
  showLegend: boolean = true;
  showLabels: boolean = true;
  gradient: boolean = true;
  isDoughnut: boolean = false;
  legendPosition: string = 'below';

  constructor(public api: RestService) { }

  exportToExcel(name:string, type) {
    let ws: xlsx.WorkSheet = null;
    if(type == 'unified'){
      ws = xlsx.utils.table_to_sheet(this.epltable.nativeElement);;
    }else if(type == 'detail'){
      ws = xlsx.utils.table_to_sheet(this.epltabledetail.nativeElement);;
    }
    //const ws: xlsx.WorkSheet =  xlsx.utils.table_to_sheet(this.epltable.nativeElement);
    const wb: xlsx.WorkBook = xlsx.utils.book_new();
    xlsx.utils.book_append_sheet(wb, ws, 'Casos COVID-19');
    xlsx.writeFile(wb, `${name}.xlsx`);
   }

  colorScheme = {
    domain: ['#5AA454', '#E44D25', '#CFC0BB', '#7aa3e5', '#a8385d', '#aae3f5']
  };

  ngOnInit() {
    this.getDiagnostics()
  }

  onSelect(data): void {
    console.log('Item clicked', JSON.parse(JSON.stringify(data)));
  }

  onActivate(data): void {
    console.log('Activate', JSON.parse(JSON.stringify(data)));
  }

  onDeactivate(data): void {
    console.log('Deactivate', JSON.parse(JSON.stringify(data)));
  }

  sortBy(array:any, prop: string) {
    return array.sort((a, b) => a[prop] > b[prop] ? 1 : a[prop] === b[prop] ? 0 : -1);
  }

  public async getDiagnostics(){
    let diagnosticsRs:any =  await this.api.gethttp('/v1/resources/diagnostic').toPromise();
    this.diagnostics = diagnosticsRs.body;
    let diagnosticsCityRs:any =  await this.api.gethttp('/v1/resources/city-diagnostic').toPromise();
    this.diagnosticsByCity = diagnosticsCityRs.body;
    this.singleByCityChar = this.convertChart(this.diagnosticsByCity);
    this.initMap(this.diagnosticsByCity)
  }

  convertChart(array){
    let newArray:any = [];
    for(let i=0; i<array.length;i++){
      newArray.push({name:array[i].cityName, value:array[i].cases});
    }
    return newArray;
  }


   initMap(result) {

    document.getElementById('mapByCity').style.display = 'block';
    let map = new google.maps.Map(document.getElementById('mapByCity'), {
      zoom: 7.6,
      center: {lat: 15.5000000, lng: -90.2500000},
      mapTypeId: 'roadmap',
    });

        let locations = [];

        result.forEach(location => {
          let lat = Number(location.latitude)
          let ln = Number(location.longitude)
          let factor = 10 * location.cases;
          let i = 0;

          let iconUrl = 'assets/images/bacteria.png';

          while (i < factor) {
            locations.push(new google.maps.LatLng(lat, ln));
            
            let contentString = `<div><b>${location.cityName}</b><br/>Casos sospechosos: <b>${location.cases}</b></div>`;
            let infowindow = new google.maps.InfoWindow({
              content: contentString
            });

            let marker = new google.maps.Marker({
              position: {lat: lat, lng: ln},
              map: map,
              icon: iconUrl
            });

            marker.addListener('click', function() {
              infowindow.open(map, marker);
            });

            i++;
          }
        });

        let analyticsMap = new google.maps.visualization.HeatmapLayer({
          data: locations,
          map: map,
          maxIntensity: maxI,
          radius: rad,
          opacity: opac
        });
        

   }  

}
