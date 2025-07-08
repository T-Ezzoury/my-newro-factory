import { Component, signal } from "@angular/core";
import { FormsModule } from "@angular/forms";
import { MaterialModules } from "../../../../material/material";

@Component({
  selector: "app-code",
  imports: [FormsModule, MaterialModules],
  templateUrl: "./code.html",
  styleUrl: "./code.css",
})
export class CodeComponent {
  code = signal<string>("");
  isCodeReadonly = signal<boolean>(false);

  joinQuiz() {
    // Récupérer le code entré par l'utilisateur
    console.log("Code entré:", this.code());
    // Ajoutez ici la logique pour rejoindre un quiz avec le code
  }

  createSession() {
    // Générer un code aléatoire de 6 caractères alphanumériques
    this.code.set(this.generateRandomCode());
    this.isCodeReadonly.set(true);
    console.log("Nouveau code généré:", this.code());
    // Ajoutez ici la logique pour créer une session avec le nouveau code
  }

  generateRandomCode(): string {
    const chars =
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    let result = "";
    for (let i = 0; i < 6; i++) {
      result += chars.charAt(Math.floor(Math.random() * chars.length));
    }
    return result;
  }
}
