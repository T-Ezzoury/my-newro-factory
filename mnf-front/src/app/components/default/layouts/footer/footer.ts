import { Component } from "@angular/core";
import { RouterLink } from "@angular/router";
import { MaterialModules } from "../../../../material/material";
import { TranslatePipe } from "../../../../pipes/translate.pipe";

@Component({
  selector: "app-footer",
  imports: [MaterialModules, TranslatePipe],
  templateUrl: "./footer.html",
  standalone: true,
  styleUrl: "./footer.css",
})
export class Footer {}
