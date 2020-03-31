import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { HelpmeComponent } from './helpme.component';

describe('HelpmeComponent', () => {
  let component: HelpmeComponent;
  let fixture: ComponentFixture<HelpmeComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ HelpmeComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(HelpmeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
