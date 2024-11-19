import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { initializeApp, provideFirebaseApp } from '@angular/fire/app';
import { getAuth, provideAuth } from '@angular/fire/auth';
import { RouterModule } from '@angular/router';
import { AppComponent } from './app.component';

import { AngularFireModule } from '@angular/fire/compat';
import { getDatabase, provideDatabase } from '@angular/fire/database';
import { FormsModule } from '@angular/forms';
import { AppRoutingModule } from './app-routing.module';
import { AddVoucherComponent } from './component/add-voucher/add-voucher.component';
import { EditVoucherComponent } from './component/edit-voucher/edit-voucher.component';
import { LoginComponent } from './component/login/login.component';
import { QAndAComponent } from './component/q-and-a/q-and-a.component';
import { QaEditComponent } from './component/qa-edit/qa-edit.component';
import { RatingsListComponent } from './component/ratings-list/ratings-list.component';
import { ReportsComponent } from './component/reports/reports.component';
import { UsersListComponent } from './component/users-list/users-list.component';
import { VouchersListComponent } from './component/vouchers-list/vouchers-list.component';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    UsersListComponent,
    VouchersListComponent,
    AddVoucherComponent,
    RatingsListComponent,
    ReportsComponent,
    QAndAComponent,
    EditVoucherComponent,
    QaEditComponent,
  ],
  imports: [
    BrowserModule,
    FormsModule,
    RouterModule,
    provideFirebaseApp(() => initializeApp({ "projectId": "riyadh-transportation-re-a7e4b", "appId": "1:478491100495:web:458e3d674ade94bba0b13a", "databaseURL": "https://riyadh-transportation-re-a7e4b-default-rtdb.firebaseio.com", "storageBucket": "riyadh-transportation-re-a7e4b.firebasestorage.app", "apiKey": "AIzaSyDkXhh4KVqcpBt_59TwiiIv6homFcd2nTA", "authDomain": "riyadh-transportation-re-a7e4b.firebaseapp.com", "messagingSenderId": "478491100495", "measurementId": "G-V0YCWY1K46" })),
    provideAuth(() => getAuth()),
    provideDatabase(() => getDatabase()),

    AngularFireModule.initializeApp({ "projectId": "riyadh-transportation-re-a7e4b", "appId": "1:478491100495:web:458e3d674ade94bba0b13a", "databaseURL": "https://riyadh-transportation-re-a7e4b-default-rtdb.firebaseio.com", "storageBucket": "riyadh-transportation-re-a7e4b.firebasestorage.app", "apiKey": "AIzaSyDkXhh4KVqcpBt_59TwiiIv6homFcd2nTA", "authDomain": "riyadh-transportation-re-a7e4b.firebaseapp.com", "messagingSenderId": "478491100495", "measurementId": "G-V0YCWY1K46" }),
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
