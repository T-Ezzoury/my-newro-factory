import {Ingredient} from './Ingredient';

export interface RecipeIngredient {
  quantity: number;
  unit: string;
  ingredient: Ingredient;
  id?: number;
}
