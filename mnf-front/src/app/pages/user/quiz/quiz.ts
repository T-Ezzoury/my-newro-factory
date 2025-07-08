import { Component, signal } from "@angular/core";
import { Reponse } from "../../../components/user/quiz/reponse/reponse";
import { AnswerService } from "../../../services/admin/answer.service";
import { Answer } from "../../../models/admin/Answer";

@Component({
  selector: "app-quiz",
  imports: [Reponse],
  templateUrl: "./quiz.html",
  styleUrl: "./quiz.css",
})
export class QuizPage {
  constructor(public answerService: AnswerService) {}

  // ngOnInit() {
  //   this.answerService.getAnswers().then((chaps) => (this.chapitres = chaps));
  // }

  reponses: Answer[] = [
    {
      text: "Ceci est une réponse",
      valid_answer: false,
      label: "",
      question_id: 0,
    },
    {
      text: "Ceci est une réponse",
      valid_answer: false,
      label: "",
      question_id: 0,
    },
    {
      text: "Ceci est une bonne réponse",
      valid_answer: true,
      label: "",
      question_id: 0,
    },
    {
      text: "Ceci est une réponse",
      valid_answer: false,
      label: "",
      question_id: 0,
    },
    {
      text: "Ceci est une bonne réponse",
      valid_answer: true,
      label: "",
      question_id: 0,
    },
  ];

  selectedAnswers = signal<Answer[]>([]);

  toggleAnswer(answer: Answer) {
    if (this.isValidated()) return;

    const current = this.selectedAnswers();
    const index = current.indexOf(answer);
    if (index > -1) {
      // Déjà sélectionné → on le retire
      this.selectedAnswers.set([
        ...current.slice(0, index),
        ...current.slice(index + 1),
      ]);
    } else {
      // Pas encore sélectionné → on l’ajoute
      this.selectedAnswers.set([...current, answer]);
    }
  }

  isSelected(answer: Answer): boolean {
    return this.selectedAnswers().includes(answer);
  }

  isValidated = signal(false);

  validate() {
    this.isValidated.set(true);
  }

  getAnswerClass(answer: Answer): string {
    if (!this.isValidated()) return this.isSelected(answer) ? "selected" : "";

    const isSelected = this.isSelected(answer);
    const isValid = answer.valid_answer;

    if (isSelected && isValid) return "correct";
    if (isSelected && !isValid) return "incorrect";
    if (!isSelected && isValid) return "missed";

    return "validated";
  }
}
