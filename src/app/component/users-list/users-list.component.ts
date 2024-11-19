import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { User } from 'src/app/model/user';
import { DataService } from 'src/app/shared/data.service';




@Component({
  selector: 'app-users-list',
  templateUrl: './users-list.component.html',
  styleUrls: ['./users-list.component.css']
})



export class UsersListComponent {
  usersList: User[] = [];
  users: User[] = [];
  users1: User[] = [];
  usersPerPage: number = 5;
  public selectedPage = 1;
  public pageIndex = 0;
  loading: boolean = true;
  searchText: any;

  constructor(private data: DataService, private router: Router) { }

  ngOnInit(): void {
    this.getAllUsers();
    this.pageIndex = (this.selectedPage - 1) * this.usersPerPage;
  }

  logout() {
    this.data.logout();
    this.router.navigateByUrl("/login");
  }

  cards(user: any) {
    this.router.navigate(['/cards'], { queryParams: user });
  }

  getAllUsers() {
    this.data.getAllrenters().on('value', snapshotChanges => {
      this.usersList = [];
      snapshotChanges.forEach(child => {
        var cardData = child.val();
        cardData.key = child.key;
        this.usersList.push(cardData);
      });
      this.loading = false;
    });


  }

}
