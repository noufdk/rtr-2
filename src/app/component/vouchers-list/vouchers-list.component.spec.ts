import { ComponentFixture, TestBed } from '@angular/core/testing';

import { VouchersListComponent } from './vouchers-list.component';

describe('VouchersListComponent', () => {
  let component: VouchersListComponent;
  let fixture: ComponentFixture<VouchersListComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [VouchersListComponent]
    });
    fixture = TestBed.createComponent(VouchersListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
