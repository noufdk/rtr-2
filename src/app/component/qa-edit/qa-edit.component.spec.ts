import { ComponentFixture, TestBed } from '@angular/core/testing';

import { QaEditComponent } from './qa-edit.component';

describe('QaEditComponent', () => {
  let component: QaEditComponent;
  let fixture: ComponentFixture<QaEditComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [QaEditComponent]
    });
    fixture = TestBed.createComponent(QaEditComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
