import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { HttpClientModule } from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NgSelectModule } from '@ng-select/ng-select';
import { RouterModule, Routes } from "@angular/router";
import { NgxChartsModule } from '@swimlane/ngx-charts';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { PdfViewerModule } from 'ng2-pdf-viewer';

import { AppComponent } from './app.component';
import { StatisticsComponent } from './statistics/statistics.component';
import { SymptomComponent } from './symptom/symptom.component';
import { HeaderComponent } from './header/header.component';
import { HelpmeComponent } from './helpme/helpme.component';
import { AboutComponent } from './about/about.component';
import { NavigationComponent } from './navigation/navigation.component';
import { AnalyticsComponent } from './analytics/analytics.component';

const appRoutes: Routes = [
  { path: '', component: NavigationComponent, pathMatch: 'full', data: { title: 'tracker' } },
  { path: 'analytics', component: AnalyticsComponent, data: { title: 'analytics' } }
];

@NgModule({
  declarations: [
    AppComponent,
    StatisticsComponent,
    SymptomComponent,
    HeaderComponent,
    HelpmeComponent,
    AboutComponent,
    NavigationComponent,
    AnalyticsComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
    NgSelectModule,
    NgxChartsModule,
    BrowserAnimationsModule,
    PdfViewerModule,
    RouterModule.forRoot(
      appRoutes,
      { useHash: true } // <-- debugging purposes only
    )
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
