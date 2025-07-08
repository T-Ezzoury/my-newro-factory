export interface QuestionSeries {
  id?: number;
  name: string;
  description?: string;
  userId: number;
  questions: number[]; // Array of question IDs
  createdAt?: Date;
  updatedAt?: Date;
}

export interface QuestionSeriesItem {
  questionId: number;
  title: string;
  statement: string;
  chapterId: number;
  chapterName?: string;
}
