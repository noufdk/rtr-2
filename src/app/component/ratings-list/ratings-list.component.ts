import { Component, OnInit } from '@angular/core';
import { DataService } from 'src/app/shared/data.service';

interface Rating {
  name: string;
  message: string;
  stars: number;
}

@Component({
  selector: 'app-ratings',
  templateUrl: './ratings-list.component.html',
  styleUrls: ['./ratings-list.component.css'],
})
export class RatingsListComponent implements OnInit {
  ratings: Rating[] = [];

  constructor(private data: DataService){}

  ngOnInit(): void {
    this.getAllRatings();
  }

  getAllRatings() {
    this.data.getAllRatings().on('value', snapshotChanges => {
      this.ratings = [];
      snapshotChanges.forEach(child => {
        var cardData = child.val();
        cardData.key = child.key;
        this.ratings.push(cardData);
      });
    });

  }
}
