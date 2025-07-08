import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet, CommonModule],
  templateUrl: './app.html',
  standalone: true,
  styleUrl: './app.css'
})
export class App {
  protected title = 'mnf-front';
  isDarkMode = false;

  onThemeChanged(isDarkMode: boolean): void {
    this.isDarkMode = isDarkMode;
  }
}
