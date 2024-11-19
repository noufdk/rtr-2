import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Voucher } from 'src/app/model/voucher';
import { DataService } from 'src/app/shared/data.service';

@Component({
  selector: 'app-edit-voucher',
  templateUrl: './edit-voucher.component.html',
  styleUrls: ['./edit-voucher.component.css']
})
export class EditVoucherComponent implements OnInit {

  title: string = '';
  uid: string = '';
  points: number = 0;
  item: string = '';
  itemsList: string[] = [];

  constructor(private data: DataService,private route:ActivatedRoute){}
  ngOnInit(): void {
    this.route.queryParamMap.subscribe((params) => {
      this.uid = params.get('uid')??"";
      this.title = params.get('title')??"";
      this.points = parseInt(params.get('points')??'0');
      this.itemsList = params.getAll('items'); 
      console.log('Retrieved Items:', this.itemsList);
    });
  }

  addItem(): void {
    if (this.item.trim() !== '') {
      this.itemsList.push(this.item.trim());
      this.item = ''; // Clear the input field
    }
  }

  // Submit form
  onSubmit(): void {
    const voucherData = new Voucher(this.title, this.points, this.itemsList);
    voucherData.id = this.uid;
    this.data.editVoucher(voucherData)
  }
}
