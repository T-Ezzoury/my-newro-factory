import { Component, computed, signal } from "@angular/core";
import { MaterialModules } from "../../../../material/material";
import { Chapter } from "../../../../models/admin/Chapter";
import { ChapitreCard } from "../chapitre-card/chapitre-card";
import { CommonModule } from "@angular/common";
import { FormsModule } from "@angular/forms";
import { ChapterService } from "../../../../services/admin/chapter.service";

@Component({
  selector: "app-chapitre-list",
  standalone: true,
  imports: [CommonModule, FormsModule, MaterialModules, ChapitreCard],
  templateUrl: "./chapitre-list.html",
  styleUrl: "./chapitre-list.css",
})
export class ChapitreList {
  searchTerm = signal("");
  selectedChapitres = signal<Chapter[]>([]);

  constructor(public chapterService: ChapterService) {}

  // ngOnInit() {
  //   this.chapterService.getChapters().then((chaps) => (this.chapitres = chaps));
  // }

  chapitres: Chapter[] = [
    { name: "Introduction à Angular", title: "", path: "", parent_path: "" },
    { name: "Composants et Templates", title: "", path: "", parent_path: "" },
    {
      name: "Services et Injection de dépendance",
      title: "",
      path: "",
      parent_path: "",
    },
    { name: "Routing et Navigation", title: "", path: "", parent_path: "" },
    { name: "Java", title: "", path: "", parent_path: "" },
    { name: "AAAAAAAAAAAA", title: "", path: "", parent_path: "" },
    {
      name: "Mais nan",
      title: "",
      path: "",
      parent_path: "",
    },
  ];

  filteredChapitres = computed(() => {
    const term = this.searchTerm().toLowerCase().trim();
    const selected = this.selectedChapitres();

    return this.chapitres.filter((chapitre) => {
      const matchesSearch = chapitre.name.toLowerCase().includes(term);
      const isSelected = selected.includes(chapitre);
      return matchesSearch && !isSelected;
    });
  });

  addChapitre(chapitre: Chapter) {
    this.selectedChapitres.update((chapitres) => [...chapitres, chapitre]);
  }

  removeChapitre(chapitre: Chapter) {
    this.selectedChapitres.update((chapitres) => {
      const index = chapitres.indexOf(chapitre);
      if (index !== -1) {
        return [...chapitres.slice(0, index), ...chapitres.slice(index + 1)];
      }
      return chapitres;
    });
  }
}
