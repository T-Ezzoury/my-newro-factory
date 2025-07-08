export interface Quiz {
  id?: number;
  name: string;
  description?: string;
  userId: number;
  createdAt?: Date;
  updatedAt?: Date;
}

export interface QuizQuestion {
  id?: number;
  quizId: number;
  questionId: number;
  position: number;
  question?: {
    id: number;
    title: string;
    statement: string;
    chapterId: number;
  };
}
