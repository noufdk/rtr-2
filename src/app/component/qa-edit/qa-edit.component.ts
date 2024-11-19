import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { DataService } from 'src/app/shared/data.service';

@Component({
  selector: 'app-qa-edit',
  templateUrl: './qa-edit.component.html',
  styleUrls: ['./qa-edit.component.css']
})
export class QaEditComponent implements OnInit {
  qa = {
    uid:'',
    question: '',
    answer: '',
  };

  constructor(private data:DataService,private route:ActivatedRoute){}
  ngOnInit(): void {
    this.route.queryParamMap.subscribe((params) => {
      this.qa.uid = params.get('uid')??"";
      this.qa.question = params.get('question')??"";
      this.qa.answer = params.get('answer')??'';
    });
  }
  onSubmit(): void {
    
    this.data.editQA(this.qa);
    this.qa.question = '';
    this.qa.answer = '';
  
}
}
