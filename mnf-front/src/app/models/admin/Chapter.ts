export interface Chapter {
  id?: number;
  name: string;
  title: string;
  path: string;
  content?: string;
  parent_path?: string;
  parentPath?: string;
  parents?: any[] | null;
  createdAt?: Date;
  updatedAt?: Date;
}
