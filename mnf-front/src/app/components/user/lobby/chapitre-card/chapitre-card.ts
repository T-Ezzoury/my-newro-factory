import { Component, Input } from "@angular/core";
import { Chapter } from "../../../../models/admin/Chapter";

@Component({
  selector: "app-chapitre-card",
  imports: [],
  templateUrl: "./chapitre-card.html",
  styleUrl: "./chapitre-card.css",
})
export class ChapitreCard {
  @Input() chapitre!: Chapter;
  @Input() selected = false;
}
