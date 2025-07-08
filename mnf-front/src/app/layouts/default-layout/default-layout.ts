import { Component } from '@angular/core';
import {RouterOutlet} from '@angular/router';
import {MaterialModules} from '../../material/material';
import {CommonModule} from '@angular/common';
import {Header} from '../../components/default/layouts/header/header';
import {Footer} from '../../components/default/layouts/footer/footer';

@Component({
  selector: 'app-default-layout',
  imports: [RouterOutlet, MaterialModules, CommonModule, Header, Footer],
  templateUrl: './default-layout.html',
  styleUrl: './default-layout.css'
})
export class DefaultLayout {
  // Navigation links for the header
  navLinks = [
    { label: 'Home', path: '/' },
    { label: 'Auth', path: '/auth' }
  ];
}
