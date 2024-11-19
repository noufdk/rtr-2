import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { Voucher } from 'src/app/model/voucher';
import { DataService } from 'src/app/shared/data.service';

@Component({
  selector: 'app-vouchers-list',
  templateUrl: './vouchers-list.component.html',
  styleUrls: ['./vouchers-list.component.css']
})
export class VouchersListComponent {

  vouchersList: Voucher[] = [];
  loading: boolean = true;
  constructor(private data: DataService, private router: Router) { }

  ngOnInit(): void {
    this.getAllVouchers();
  }




  deleteVoucher(id:string){
    this.data.deleteVoucher(id);
  }
  getAllVouchers() {
    this.data.getAllVouchers().on('value', snapshotChanges => {
      this.vouchersList = [];
      snapshotChanges.forEach(child => {
        var cardData = child.val();
        cardData.key = child.key;
        this.vouchersList.push(cardData);
      });
      this.loading = false;
    });

  }
}
