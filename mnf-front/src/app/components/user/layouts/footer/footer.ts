import { Component } from '@angular/core';
import { MaterialModules } from '../../../../material/material';
import { TranslatePipe } from '../../../../pipes/translate.pipe';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-footer',
  imports: [MaterialModules, TranslatePipe, CommonModule],
  templateUrl: './footer.html',
  standalone: true,
  styleUrl: './footer.css'
})
export class Footer {

}
