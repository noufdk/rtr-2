import { Component, OnInit } from '@angular/core';
import jsPDF from 'jspdf';
import { Redemption } from 'src/app/model/redemption';
import { User } from 'src/app/model/user';
import { DataService } from 'src/app/shared/data.service';

@Component({
  selector: 'app-reports',
  templateUrl: './reports.component.html',
  styleUrls: ['./reports.component.css']
})
export class ReportsComponent implements OnInit {
  ngOnInit(): void {
    this.getAllUsers();
    this.getAllRedemptions();
  }

  constructor(private data: DataService){}

  usersList:User[] = [];
  redemptionsList:Redemption[] = [];
  // tripsList:any[] = [];


  getAllUsers() {
    this.data.getAllrenters().on('value', snapshotChanges => {
      this.usersList = [];
      snapshotChanges.forEach(child => {
        var cardData = child.val();
        cardData.key = child.key;
        this.usersList.push(cardData);
      });
    });
  }

  getAllRedemptions(){
    this.data.getAllRedemptions().on('value', snapshotChanges => {
      this.redemptionsList = [];
      snapshotChanges.forEach(child => {
        var cardData = child.val();
        cardData.key = child.key;
        this.redemptionsList.push(cardData);
      });
    });
  }
  // getAllTrips(){
  //   this.data.getAllTrips().on('value', snapshotChanges => {
  //     this.tripsList = [];
  //     snapshotChanges.forEach(child => {
  //       var cardData = child.val();
  //       cardData.key = child.key;
  //       this.tripsList.push(cardData);
  //     });
  //   });
  // }

  generatePDF(): void {

    
    const doc = new jsPDF(); // Initialize jsPDF
    const pageHeight = doc.internal.pageSize.height; // Height of the PDF page
    const lineHeight = 10; // Height of each line
    let y = 10; // Y-coordinate to start writing
  
    doc.setFontSize(16);
    doc.text('Users Information', 10, y);
    y += lineHeight;
  
    this.usersList.forEach((user, index) => {
      var count = 0;
      if (y + lineHeight > pageHeight) {
        doc.addPage(); // Add a new page if content exceeds the page height
        y = 10; // Reset Y-coordinate for the new page
      }
  
      doc.setFontSize(12);
      doc.text(`User ${index + 1}:`, 10, y);
      y += lineHeight;
      doc.text(`Name: ${user.name}`, 15, y);
      y += lineHeight;
      doc.text(`Email: ${user.email}`, 15, y);
      y += lineHeight;
      for(var s of this.redemptionsList){
        if(count == 0) {doc.text("Redemption History:", 10, y)
        y += lineHeight;
        }

        if(s.id == user.uid){
          doc.text(`${count + 1}:`, 10, y);
          y += lineHeight;
          doc.text(`Date ${s.createdAt}`, 15, y)
          y += lineHeight;
          doc.text(`Title ${s.title}`, 15, y)
          y += lineHeight;
          doc.text(`Points ${s.points}`, 15, y)
          y += lineHeight;
        }
        count++;
        
      }
      y += lineHeight;

    });
  
    // Save the PDF
    doc.save('Users_Information.pdf');
  }
  
}
