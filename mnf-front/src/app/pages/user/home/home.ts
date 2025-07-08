import { Component } from '@angular/core';
import { MatToolbarModule } from '@angular/material/toolbar';
import { TranslatePipe } from '../../../pipes/translate.pipe';
import { CommonModule } from '@angular/common';
import { Router, RouterLink } from '@angular/router';
import { MatDialog } from '@angular/material/dialog';
import { MaterialModules } from '../../../material/material';
import { UserListDialogComponent } from '../../../components/user/user-list-dialog/user-list-dialog';

@Component({
  selector: 'app-home',
  imports: [MatToolbarModule, TranslatePipe, CommonModule, MaterialModules, RouterLink],
  templateUrl: './home.html',
  standalone: true,
  styleUrl: './home.css'
})
export class HomePage {

  constructor(
    private router: Router,
    private dialog: MatDialog
  ) {}

  /**
   * Navigate to join quiz page
   */
  joinQuiz(): void {
    this.router.navigate(['/lobby']);
  }

  /**
   * Navigate to create quiz page (lobby)
   */
  createQuiz(): void {
    this.router.navigate(['/user/lobby']);
  }

  /**
   * Open the user list dialog
   */
  openUserListDialog(): void {
    this.dialog.open(UserListDialogComponent, {
      width: '600px',
      maxHeight: '80vh',
      autoFocus: false
    });
  }
}
