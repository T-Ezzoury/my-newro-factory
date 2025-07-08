import { Component } from '@angular/core';
import { RouterLink } from '@angular/router';
import { MaterialModules } from '../../../material/material';
import { TranslatePipe } from '../../../pipes/translate.pipe';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-not-found',
  imports: [RouterLink, MaterialModules, TranslatePipe, CommonModule],
  templateUrl: './not-found.html',
  standalone: true,
  styleUrl: './not-found.css'
})
export class NotFoundPage {
  // Constructor can be empty or include dependencies if needed
}
