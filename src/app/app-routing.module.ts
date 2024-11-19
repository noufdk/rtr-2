import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';

import { RouterModule, Routes } from '@angular/router';
import { AddVoucherComponent } from './component/add-voucher/add-voucher.component';
import { EditVoucherComponent } from './component/edit-voucher/edit-voucher.component';
import { LoginComponent } from './component/login/login.component';
import { QAndAComponent } from './component/q-and-a/q-and-a.component';
import { RatingsListComponent } from './component/ratings-list/ratings-list.component';
import { ReportsComponent } from './component/reports/reports.component';
import { UsersListComponent } from './component/users-list/users-list.component';
import { VouchersListComponent } from './component/vouchers-list/vouchers-list.component';
import { QaEditComponent } from './component/qa-edit/qa-edit.component';

const routes: Routes = [
  { path: '', redirectTo: 'login', pathMatch: 'full' },
  { path: 'login', component: LoginComponent },
  { path: 'addVoucher', component: AddVoucherComponent },
  { path: 'editVoucher', component: EditVoucherComponent },
  { path: 'usersList', component: UsersListComponent },
  { path: 'vouchersList', component: VouchersListComponent },
  { path: 'ratingsList', component: RatingsListComponent },
  { path: 'reports', component: ReportsComponent },
  { path: 'qapage', component: QAndAComponent },
  { path: 'qaedit', component: QaEditComponent },

];

@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    RouterModule.forRoot(routes)
  ]
})
export class AppRoutingModule { }
