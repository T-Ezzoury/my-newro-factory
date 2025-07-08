import {RecipeIngredient} from './RecipeIngredient';

export interface RecipeModel {
  description: string;
  instructions: Array<string>;
  name: string;
  ingredients: Array<RecipeIngredient>;
  picture: string;
  id?: number;
}
