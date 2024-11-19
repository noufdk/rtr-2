import { Injectable } from '@angular/core';
import { AngularFireAuth } from '@angular/fire/compat/auth';
import { AngularFireDatabase } from '@angular/fire/compat/database';
import { Router } from '@angular/router';
import { QA } from '../model/qa';
import { Voucher } from '../model/voucher';
// import { Card } from '../model/card';
// import { User } from '../model/user';

@Injectable({
  providedIn: 'root'
})
export class DataService {

  isLoggedIn: boolean;
  currentFirebaseUser: any = null;

  constructor(private db: AngularFireDatabase, private fAuth: AngularFireAuth, private router: Router) {
    this.isLoggedIn = this.adminUID ? true : false;
  }

  get adminUID(): any {
    return localStorage.getItem("adminUID");
  }
  get logg(): any {
    return localStorage.getItem("loggedIn");
  }

  async signin(email: string, password: string) {
    await this.fAuth.signInWithEmailAndPassword(email, password).then(
      res => {
        this.fAuth.currentUser.then(response => {
          this.currentFirebaseUser = response;



          console.log(this.currentFirebaseUser);
          this.db.database.ref("adminUID").once('value', snapshotChanges => {


            if (this.currentFirebaseUser.uid == snapshotChanges.val()) {
              localStorage.setItem('adminUID', JSON.stringify(response?.getIdToken));
              localStorage.setItem('loggedIn', JSON.stringify(response?.getIdToken));
              this.router.navigate(['/usersList']);

            }
            else {
              alert("Error");
              return
            }
          });
        });
        this.isLoggedIn = true;


      }
    ).catch(e => {
      alert(e);
    });
  }


  logout() {
    localStorage.clear();
  }

  async editUser(user: any, oldUser: any) {
    await this.fAuth.signInWithEmailAndPassword(oldUser.email, oldUser.password).then(
      res => {
        this.fAuth.currentUser.then(response => {
          response?.updateEmail(user.email);
          response?.updatePassword(user.password);
        });
      }
    ).then(() => {
      this.db.object('users/' + user.id).update({
        id: user.id,
        name: user.name,
        email: user.email,
        password: user.password,
        credits: user.credits
      });
      alert("User Updated Successfully!");
    }).catch((e) => {
      console.log(e);
    }

    ).catch((e) => {
      console.log(e);
    });
  }

  addVoucher(voucher: Voucher) {
    var id = this.db.createPushId();
    if (voucher.title==''|| voucher.points==0) {
      alert("Please fill all the fields!");
      return;
    }
    voucher.id = id;
    this.db.object('rewards/' + id).set(voucher).then(() =>{
      alert("Voucher added successfully!")
      this.router.navigate(['/vouchersList']);
    }
    );

  }

  editVoucher(voucher: Voucher) {
    if (voucher.title==''|| voucher.points==0) {
      alert("Please fill all the fields!");
      return;
    }
    this.db.object('rewards/' + voucher.id).update(voucher).then(() =>{
      alert("Voucher updated successfully!")
    this.router.navigate(['/vouchersList']);}
      
    );

  }

  async deleteVoucher(voucherId: string) {
    await this.db.object('rewards/' + voucherId).remove().then(()=>alert("Voucher deleted successfully!"));
  }
  async deleteQA(qID: string) {
    await this.db.object('qa/' + qID).remove().then(()=>alert("Question deleted successfully!"));
  }

  addQuestion(question: string, answer: string) {
    var uid = this.db.createPushId();
    if (question==''||answer == '') {
      alert("Please fill all the fields!");
      return;
    }
    this.db.object('qa/' + uid).set({
      question,answer, uid
    }).then(() =>{
      alert("Question added successfully!")
    }
    );

  }

  editQA(qa: QA) {
    if (qa.question==''|| qa.answer=='') {
      alert("Please fill all the fields!");
      return;
    }
    this.db.object('qa/' + qa.uid).update(qa).then(() =>{
      alert("Question updated successfully!")
    this.router.navigate(['/qapage']);}
      
    );

  }


  getAllrenters() {
    // this.db.database.ref('cards').orderByChild('creatorId').equalTo('asdasdsadas').on('value',snapshotChanges => )
    return this.db.database.ref('users');
  }

  getAllQA() {
    // this.db.database.ref('cards').orderByChild('creatorId').equalTo('asdasdsadas').on('value',snapshotChanges => )
    return this.db.database.ref('qa');
  }

  getAllVouchers() {
    return this.db.database.ref('rewards');
  }

  getAllRatings() {
    return this.db.database.ref('ratings');
  }
  
  getAllRedemptions() {
    return this.db.database.ref('redemptions');
  }
  
  getAllTrips() {
    return this.db.database.ref('trips');
  }

  
}
