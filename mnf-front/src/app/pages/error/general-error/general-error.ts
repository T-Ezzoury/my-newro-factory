import { Component, OnInit } from '@angular/core';
import { RouterLink, ActivatedRoute } from '@angular/router';
import { MaterialModules } from '../../../material/material';
import { TranslatePipe } from '../../../pipes/translate.pipe';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-general-error',
  imports: [RouterLink, MaterialModules, TranslatePipe, CommonModule],
  templateUrl: './general-error.html',
  standalone: true,
  styleUrl: './general-error.css'
})
export class GeneralErrorPage implements OnInit {
  errorCode: string = '500';

  constructor(private route: ActivatedRoute) {}

  ngOnInit() {
    // First check query parameters for error code
    this.route.queryParams.subscribe(params => {
      if (params['code']) {
        this.errorCode = params['code'];
      } else {
        // Fallback to route data if no query parameter
        this.route.data.subscribe(data => {
          if (data && data['errorCode']) {
            this.errorCode = data['errorCode'];
          }
        });
      }
    });
  }
}
