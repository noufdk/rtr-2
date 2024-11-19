import { Component, OnInit } from '@angular/core';
import { QA } from 'src/app/model/qa';
import { DataService } from 'src/app/shared/data.service';

@Component({
  selector: 'app-q-and-a',
  templateUrl: './q-and-a.component.html',
  styleUrls: ['./q-and-a.component.css'],
})
export class QAndAComponent implements OnInit {
  qa = {
    question: '',
    answer: '',
  };

  constructor(private data:DataService){}
  ngOnInit(): void {
    this.getAllQA();
  }

  qaList:QA[] = [];

  onSubmit(): void {
    
      
      // Add the Q&A to the list
      this.qaList.push({uid:"", question: this.qa.question, answer: this.qa.answer });
      this.data.addQuestion(this.qa.question, this.qa.answer);
      // Clear the form
      this.qa.question = '';
      this.qa.answer = '';
    
  }
  getAllQA() {
    this.data.getAllQA().on('value', snapshotChanges => {
      this.qaList = [];
      snapshotChanges.forEach(child => {
        var cardData = child.val();
        cardData.key = child.key;
        this.qaList.push(cardData);
      });
    });
  }

  

  // Update the Q&A
  onUpdate() {
    // const index = this.qaList.findIndex((item) => item.uid === this.selectedQA.uid);
    // if (index !== -1) {
    //   this.qaList[index] = { ...this.selectedQA }; // Update the list
    //   this.selectedQA = null; // Reset selection
    // }
  }

  onDelete(id:string){
    this.data.deleteQA(id);
  }
}
