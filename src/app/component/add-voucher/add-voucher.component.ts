import { Component } from '@angular/core';
import { DataService } from 'src/app/shared/data.service';
import { Voucher } from '../../model/voucher';

@Component({
  selector: 'app-add-voucher',
  templateUrl: './add-voucher.component.html',
  styleUrls: ['./add-voucher.component.css']
})
export class AddVoucherComponent {


  title: string = '';
  points: number = 0;
  item: string = '';
  itemsList: string[] = [];

  constructor(private data: DataService){}


  // Add item to the list
  addItem(): void {
    if (this.item.trim() !== '') {
      this.itemsList.push(this.item.trim());
      this.item = ''; // Clear the input field
    }
  }

  // Submit form
  onSubmit(): void {
    const voucherData = new Voucher( this.title, this.points, this.itemsList);
    this.data.addVoucher(voucherData)
    this.title = '';
    this.points = 0;
    this.itemsList = [];

  }
}

