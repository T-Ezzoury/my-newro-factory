import { Chapter } from './Chapter';

export interface Question {
  id?: number;
  title: string;
  statement: string;
  chapter_id: number;
  chapter?: Chapter;
}
