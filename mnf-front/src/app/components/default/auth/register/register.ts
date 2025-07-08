import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule, FormGroup, FormBuilder, Validators } from '@angular/forms';
import { Router, ActivatedRoute } from '@angular/router';
import { MaterialModules } from '../../../../material/material';
import { trigger, transition, style, animate } from '@angular/animations';
import { TranslatePipe } from '../../../../pipes/translate.pipe';
import { AuthService } from '../../../../services/auth.service';

@Component({
  selector: 'app-register',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, MaterialModules, TranslatePipe],
  templateUrl: './register.html',
  styleUrl: './register.css',
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
export class RegisterPage implements OnInit {
  registerForm!: FormGroup;
  hidePassword = true;
  hideConfirmPassword = true;
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
    this.registerForm = this.fb.group({
      firstName: ['', [Validators.required]],
      lastName: ['', [Validators.required]],
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.minLength(6)]],
      confirmPassword: ['', [Validators.required]]
    }, {
      validators: this.passwordMatchValidator
    });

    // Get return URL from route parameters or default to '/'
    this.returnUrl = this.route.snapshot.queryParams['returnUrl'] || '/';
  }

  passwordMatchValidator(form: FormGroup) {
    const password = form.get('password')?.value;
    const confirmPassword = form.get('confirmPassword')?.value;

    if (password !== confirmPassword) {
      form.get('confirmPassword')?.setErrors({ passwordMismatch: true });
      return { passwordMismatch: true };
    }

    return null;
  }

  onSubmit(): void {
    if (this.registerForm.valid) {
      this.loading = true;
      this.error = '';

      const { firstName, lastName, email, password, confirmPassword } = this.registerForm.value;

      this.authService.register(firstName, lastName, email, password, confirmPassword)
        .then(user => {
          // Navigate to the return URL after successful registration
          this.router.navigateByUrl(this.returnUrl);
        })
        .catch(error => {
          this.error = 'Registration failed. Please try again.';
          console.error('Registration error:', error);
        })
        .finally(() => {
          this.loading = false;
        });
    }
  }

  getErrorMessage(controlName: string): string {
    const control = this.registerForm.get(controlName);
    if (control?.hasError('required')) {
      return 'common.required';
    }
    if (control?.hasError('email')) {
      return 'common.invalidEmail';
    }
    if (control?.hasError('minlength')) {
      return 'common.passwordMinLength';
    }
    if (control?.hasError('passwordMismatch')) {
      return 'common.passwordMismatch';
    }
    return '';
  }
}
