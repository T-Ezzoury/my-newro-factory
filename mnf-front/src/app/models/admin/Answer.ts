import { Question } from './Question';

export interface Answer {
  id?: number;
  label: string;
  text: string;
  valid_answer: boolean;
  question_id: number;
  question?: Question;
}
