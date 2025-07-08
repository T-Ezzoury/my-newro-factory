import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule, FormGroup, FormBuilder, Validators } from '@angular/forms';
import { RouterLink, Router, ActivatedRoute } from '@angular/router';
import { MaterialModules } from '../../../../material/material';
import { trigger, transition, style, animate } from '@angular/animations';
import { TranslatePipe } from '../../../../pipes/translate.pipe';
import { AuthService } from '../../../../services/auth.service';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, RouterLink, MaterialModules, TranslatePipe],
  templateUrl: './login.html',
  styleUrl: './login.css',
  animations: [
    trigger('formAnimation', [
      transition(':enter', [
        style({ opacity: 0, transform: 'translateY(10px)' }),
        animate('300ms ease-out', style({ opacity: 1, transform: 'translateY(0)' }))
      ]),
      transition(':leave', [
        animate('300ms ease-in', style({ opacity: 0, transform: 'translateY(10px)' }))
      ])
    ])
  ]
})
export class LoginPage implements OnInit {
  loginForm!: FormGroup;
  hidePassword = true;
  loading = false;
  error = '';
  returnUrl = '';

  constructor(
    private fb: FormBuilder,
    private authService: AuthService,
    private router: Router,
    private route: ActivatedRoute
  ) {}

  ngOnInit(): void {
    this.loginForm = this.fb.group({
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.minLength(6)]]
    });

    // Get return URL from route parameters or default to '/'
    this.returnUrl = this.route.snapshot.queryParams['returnUrl'] || '/';
  }

  onSubmit(): void {
    if (this.loginForm.valid) {
      this.loading = true;
      this.error = '';

      const { email, password } = this.loginForm.value;

      this.authService.login(email, password)
        .then(user => {
          this.router.navigateByUrl(this.returnUrl);
        })
        .catch(error => {
          this.error = 'Invalid email or password';
          console.error('Login error:', error);
        })
        .finally(() => {
          this.loading = false;
        });
    }
  }

  getErrorMessage(controlName: string): string {
    const control = this.loginForm.get(controlName);
    if (control?.hasError('required')) {
      return 'common.required';
    }
    if (control?.hasError('email')) {
      return 'common.invalidEmail';
    }
    if (control?.hasError('minlength')) {
      return 'common.passwordMinLength';
    }
    return '';
  }
}
