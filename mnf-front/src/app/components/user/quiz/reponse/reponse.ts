import { Component, Input, signal } from "@angular/core";
import { Answer } from "../../../../models/admin/Answer";

@Component({
  selector: "app-reponse",
  imports: [],
  templateUrl: "./reponse.html",
  styleUrl: "./reponse.css",
})
export class Reponse {
  @Input() reponse!: Answer;
  @Input() selected = false;
  @Input() class: string = "";
}
