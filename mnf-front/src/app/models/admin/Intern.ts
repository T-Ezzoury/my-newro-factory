import { Promotion } from './Promotion';

export interface Intern {
  id?: number;
  first_name: string;
  last_name: string;
  arrival: Date | null;
  formation_over: Date | null;
  promotion_id: number | null;
  promotion?: Promotion;
}
