import { Component, OnInit } from "@angular/core";
import { RouterOutlet } from "@angular/router";
import { MaterialModules } from "../../material/material";
import { CommonModule } from "@angular/common";
import { Header } from "../../components/user/layouts/header/header";
import { Footer } from "../../components/user/layouts/footer/footer";
import { AuthService } from "../../services/auth.service";

@Component({
  selector: "app-user-layout",
  imports: [RouterOutlet, MaterialModules, CommonModule, Header, Footer],
  templateUrl: "./user-layout.html",
  styleUrl: "./user-layout.css",
})
export class UserLayout implements OnInit {
  // Navigation links for the header
  navLinks = [
    { label: "Messages", path: "/messaging" },
    { label: "Question", path: "/question" },
    { label: "Quiz Management", path: "/quiz-management" },
  ];

  constructor(private authService: AuthService) {}

  ngOnInit() {
    // We don't need to add the profile link to navLinks
    // It's handled directly in the header component based on authentication status
  }
}
