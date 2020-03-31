import { Component, OnInit, ViewChild } from '@angular/core';
import Stepper from 'bs-stepper';
import { RestService } from '../services/rest.service';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
declare var $: any;

@Component({
  selector: 'app-symptom',
  templateUrl: './symptom.component.html',
  styleUrls: ['./symptom.component.css']
})
export class SymptomComponent implements OnInit {

  @ViewChild('videoPlayer') videoplayer: any;

  public stepper: Stepper;
  public listGender:any = [];
  public listTypeJob:any = [];
  public listTypeContact:any = [];
  public listSymptoms:any = [];
  public selectedRow : Number;
  public selectedRowRisk : Number;
  public selectedRowContact : Number;
  public listCities:any = [];
  public symptomDetail:any = [];
  public setObj:any = JSON.stringify;
  public result:any = { probability: [{}]};
  public listPDF:any = [];
  public showPDF:boolean = false;
  public viewFile:boolean = false;
  public pdfSrc:any = null;
  public videoSource:string;

  public formSymptoms: FormGroup;

  constructor(public api: RestService, public fb: FormBuilder) { 
    this.videoSource = 'assets/videos/coronavirus.mp4';
    this.validateForm();
    this.getPDF();
  }

  toggleVideo(event: any) {
    this.videoplayer.play();
}
  public async validateForm() {
    this.formSymptoms = this.fb.group({
      name: [null],
      age:[null],
      gender:[null],
      typeJob:[null],
      typeContact:[null],
      riskArea:[null],      
      typeContactWork:[null],
      city:[null],
      lastSymptom:[null]
    });
  }

  next() {
    this.stepper.next();
  }

  async getPDF(){
    let valueList:any =  await this.api.gethttp('/v1/value-list/discriminator/CovidPDF') .toPromise();
    this.listPDF = valueList.body;
    this.showPDF = !this.showPDF;
  }

  setPDF(pdf, type){
    if(type == 'view'){
      this.pdfSrc = pdf.description;      
      this.viewFile = false;
      this.viewFile = true;
     //$('#pdfModal').modal();
    }else{
      this.viewFile = false;
      this.downloadURI(pdf.description);
      this.pdfSrc = null;
    }
  }

  downloadURI(uri) {
    var link = document.createElement("a");
    link.download = uri.split("/").pop(-1);;
    link.href = uri;
    link.click();
   } 


  async onSubmit() {

    let body:any = {};
    body.diagnostic = this.formSymptoms.value;
    body.detail = this.symptomDetail;

    let request = await this.api.posthttp('/v1/resources/diagnostic', body).toPromise();
    console.log(request);
    this.result = request.body;
    this.next();

  }


  openDiagnostic(){
    //this.getStepper();
    this.selectedRow = null;
    this.selectedRowContact = null;
    this.selectedRowRisk = null;
    this.formSymptoms.reset();
    this.loadConfigurations();
    $('#diagnosis').modal();
  }

  ngOnInit() {
    this.getStepper();
  }

  getStepper(){
    this.stepper = new Stepper(document.querySelector('#stepper1'), {
      linear: false,
      animation: true
    })
  }

  addSymptom(value){
    if(value){
      let item =JSON.parse(value);
      let foundIndex = this.symptomDetail.findIndex(x => x.symptom == item.symptom);

      if(foundIndex > -1){
        this.symptomDetail[foundIndex] = item;      
      }else{
        this.symptomDetail.push(item);
      }


    }
  }

  setValue(property, value){
    this.formSymptoms.controls[property].setValue(value);
  }

  filterByDiscriminator(array, property){
    return array.filter((element)=> element.discriminator == property);
  }

  async loadConfigurations (){
      let valueList:any =  await this.api.gethttp('/v1/value-list') .toPromise();
      this.listGender = this.filterByDiscriminator(valueList.body, 'Gender');
      this.listTypeContact = this.filterByDiscriminator(valueList.body, 'TypeContact');
      this.listTypeJob = this.filterByDiscriminator(valueList.body, 'TypeJob');

      let symptoms = await this.api.gethttp('/v1/symptom').toPromise();
      this.listSymptoms = symptoms.body;

      let cities = await this.api.gethttp('/v1/resources/cities').toPromise();
      this.listCities = cities.body;

  }



}
