import { Component, OnInit, ViewChild, AfterViewInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterLink, Router, ActivatedRoute } from '@angular/router';
import { PaginationComponent } from '../../../components/shared/pagination/pagination';
import { InternListComponent } from '../../../components/admin/intern/intern-list/intern-list';
import { PromotionListComponent } from '../../../components/admin/promotion/promotion-list/promotion-list';
import { ChapterListComponent } from '../../../components/admin/chapter/chapter-list/chapter-list';
import { QuestionListComponent } from '../../../components/admin/question/question-list/question-list';
import { AnswerListComponent } from '../../../components/admin/answer/answer-list/answer-list';
import { AdminListComponent } from '../../../components/admin/admin/admin-list/admin-list';
import { UserListComponent } from '../../../components/admin/user/user-list/user-list';
import { FavoriteButtonComponent } from '../../../components/user/favorites/favorite-button';
import { FavoritesListComponent } from '../../../components/admin/favorites/favorites-list/favorites-list';
import { InternService } from '../../../services/admin/intern.service';
import { PromotionService } from '../../../services/admin/promotion.service';
import { ChapterService } from '../../../services/admin/chapter.service';
import { QuestionService } from '../../../services/admin/question.service';
import { AnswerService } from '../../../services/admin/answer.service';
import { AdminService } from '../../../services/admin/admin.service';
import { UserService } from '../../../services/admin/user.service';
import { FavoritesService } from '../../../services/favorites/favorites.service';
import { AuthService } from '../../../services/auth.service';

interface TableColumn {
  key: string;
  label: string;
  format?: string;
}

@Component({
  selector: 'app-list-container',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    RouterLink,
    PaginationComponent,
    InternListComponent,
    PromotionListComponent,
    ChapterListComponent,
    QuestionListComponent,
    AnswerListComponent,
    AdminListComponent,
    UserListComponent,
    FavoriteButtonComponent,
    FavoritesListComponent
  ],
  templateUrl: './list-container.html',
  styleUrl: './list-container.css'
})
export class ListContainerComponent implements OnInit, AfterViewInit {
  activeTab: string = 'interns';

  // Common UI properties
  loading: boolean = true;
  error: string = '';
  items: any[] = [];
  selectedItems: number[] = [];

  // Make Math available in the template
  Math = Math;

  // Pagination properties
  currentPage: number = 1;
  pageSize: number = 10;
  totalItems: number = 0;
  totalPages: number = 0;

  // ViewChild references to list components
  @ViewChild('internList') internList?: InternListComponent;
  @ViewChild('promotionList') promotionList?: PromotionListComponent;
  @ViewChild('chapterList') chapterList?: ChapterListComponent;
  @ViewChild('questionList') questionList?: QuestionListComponent;
  @ViewChild('answerList') answerList?: AnswerListComponent;
  @ViewChild('adminList') adminList?: AdminListComponent;
  @ViewChild('userList') userList?: UserListComponent;
  @ViewChild('favoritesList') favoritesList?: FavoritesListComponent;

  constructor(
    private internService: InternService,
    private promotionService: PromotionService,
    private chapterService: ChapterService,
    private questionService: QuestionService,
    private answerService: AnswerService,
    private adminService: AdminService,
    private userService: UserService,
    private favoritesService: FavoritesService,
    private authService: AuthService,
    private router: Router,
    private route: ActivatedRoute
  ) {}

  ngOnInit(): void {
    // Reset dataLoaded flag when component is initialized
    this.dataLoaded = false;

    // Determine the active tab based on the current route
    const url = this.router.url;
    const urlParts = url.split('/');

    // The URL format is expected to be /admin/dashboard/[tab]
    // Extract the tab name from the URL
    if (urlParts.length >= 4) {
      const tab = urlParts[3]; // This should be 'interns', 'promotions', etc.
      this.activeTab = tab;
    } else {
      // Default to 'interns' if the URL doesn't contain a tab
      this.activeTab = 'interns';
    }
    // Reset pagination
    this.currentPage = 1;
  }

  ngAfterViewInit(): void {
    // Load data after view is initialized, with a small delay to ensure the view is ready
    setTimeout(() => {
      this.loadData();
    }, 0);
  }

  setActiveTab(tab: string): void {
    // Only reset dataLoaded if the tab actually changes
    if (this.activeTab !== tab) {
      this.activeTab = tab;
      // Reset pagination when changing tabs
      this.currentPage = 1;
      // Reset dataLoaded flag to ensure data is loaded for the new tab
      this.dataLoaded = false;
      // Data will be loaded in ngAfterViewInit
    }
  }

  // Track if data is already loaded for the current tab
  private dataLoaded = false;

  loadData(): void {
    // If data is already loaded for this tab, don't reload it
    if (this.dataLoaded) {
      return;
    }

    this.loading = true;
    this.error = '';
    this.items = [];
    this.dataLoaded = true;

    switch (this.activeTab) {
      case 'interns':
        this.internService.getInterns()
          .then(interns => {
            this.items = interns;
            this.calculatePagination();
            this.loading = false;
          })
          .catch(error => {
            this.error = 'Failed to load interns. Please try again.';
            this.loading = false;
            this.dataLoaded = false;
            console.error('Error loading interns:', error);
          });
        break;

      case 'promotions':
        this.promotionService.getPromotions()
          .then(promotions => {
            this.items = promotions;
            this.calculatePagination();
            this.loading = false;
          })
          .catch(error => {
            this.error = 'Failed to load promotions. Please try again.';
            this.loading = false;
            this.dataLoaded = false;
            console.error('Error loading promotions:', error);
          });
        break;

      case 'chapters':
        this.chapterService.getChapters()
          .then(chapters => {
            this.items = chapters;
            this.calculatePagination();
            this.loading = false;
          })
          .catch(error => {
            this.error = 'Failed to load chapters. Please try again.';
            this.loading = false;
            this.dataLoaded = false;
            console.error('Error loading chapters:', error);
          });
        break;

      case 'questions':
        // Load questions using QuestionService
        this.questionService.getQuestions()
          .then(questions => {
            this.items = questions;
            this.calculatePagination();
            this.loading = false;
          })
          .catch(error => {
            this.error = 'Failed to load questions. Please try again.';
            this.loading = false;
            this.dataLoaded = false;
            console.error('Error loading questions:', error);
          });
        break;

      case 'answers':
        // Load answers using AnswerService
        this.answerService.getAnswers()
          .then(answers => {
            this.items = answers;
            this.calculatePagination();
            this.loading = false;
          })
          .catch(error => {
            this.error = 'Failed to load answers. Please try again.';
            this.loading = false;
            this.dataLoaded = false;
            console.error('Error loading answers:', error);
          });
        break;

      case 'admins':
        this.adminService.getAdmins()
          .then(admins => {
            this.items = admins;
            this.calculatePagination();
            this.loading = false;
          })
          .catch(error => {
            this.error = 'Failed to load admins. Please try again.';
            this.loading = false;
            this.dataLoaded = false;
            console.error('Error loading admins:', error);
          });
        break;

      case 'users':
        this.userService.getUsers()
          .then(users => {
            this.items = users;
            this.calculatePagination();
            this.loading = false;
          })
          .catch(error => {
            this.error = 'Failed to load users. Please try again.';
            this.loading = false;
            this.dataLoaded = false;
            console.error('Error loading users:', error);
          });
        break;

      case 'favorites':
        const currentUser = this.authService.currentUserValue;
        if (currentUser) {
          this.favoritesService.getFavorites(currentUser.id)
            .then(favorites => {
              this.items = favorites;
              this.calculatePagination();
              this.loading = false;
            })
            .catch(error => {
              this.error = 'Failed to load favorites. Please try again.';
              this.loading = false;
              this.dataLoaded = false;
              console.error('Error loading favorites:', error);
            });
        } else {
          this.error = 'You must be logged in to view favorites.';
          this.loading = false;
          this.dataLoaded = false;
        }
        break;
    }
  }

  calculatePagination(): void {
    this.totalItems = this.items.length;
    this.totalPages = Math.ceil(this.totalItems / this.pageSize);
  }

  get paginatedItems(): any[] {
    const startIndex = (this.currentPage - 1) * this.pageSize;
    const endIndex = startIndex + this.pageSize;
    return this.items.slice(startIndex, endIndex);
  }

  onPageChange(page: number): void {
    this.currentPage = page;
  }

  // Methods to update pagination from child components
  updatePagination(totalItems: number, totalPages: number): void {
    this.totalItems = totalItems;
    this.totalPages = totalPages;
  }

  // Dynamic UI methods
  getActiveTabTitle(): string {
    switch (this.activeTab) {
      case 'interns': return 'Interns';
      case 'promotions': return 'Promotions';
      case 'chapters': return 'Chapters';
      case 'questions': return 'Questions';
      case 'answers': return 'Answers';
      case 'admins': return 'Admins';
      case 'users': return 'Users';
      case 'favorites': return 'Favorites';
      default: return '';
    }
  }

  getSingularTabName(): string {
    switch (this.activeTab) {
      case 'interns': return 'intern';
      case 'promotions': return 'promotion';
      case 'chapters': return 'chapter';
      case 'questions': return 'question';
      case 'answers': return 'answer';
      case 'admins': return 'admin';
      case 'users': return 'user';
      case 'favorites': return 'favorite';
      default: return '';
    }
  }

  getAddButtonText(): string {
    return `Ajouter`;
  }

  getAddButtonLink(): string {
    return `/admin/${this.activeTab}/create`;
  }

  getTableColumns(): TableColumn[] {
    switch (this.activeTab) {
      case 'interns':
        return [
          { key: 'id', label: 'ID' },
          { key: 'first_name', label: 'First Name' },
          { key: 'last_name', label: 'Last Name' },
          { key: 'arrival', label: 'Arrival', format: 'date' },
          { key: 'formation_over', label: 'Formation Over', format: 'date' },
          { key: 'promotion_id', label: 'Promotion' }
        ];
      case 'promotions':
        return [
          { key: 'id', label: 'ID' },
          { key: 'name', label: 'Name' }
        ];
      case 'chapters':
        return [
          { key: 'id', label: 'ID' },
          { key: 'title', label: 'Title' },
          { key: 'path', label: 'Path' }
        ];
      case 'questions':
        return [
          { key: 'id', label: 'ID' },
          { key: 'text', label: 'Question' }
        ];
      case 'answers':
        return [
          { key: 'id', label: 'ID' },
          { key: 'text', label: 'Answer' }
        ];
      case 'admins':
        return [
          { key: 'id', label: 'ID' },
          { key: 'name', label: 'Name' },
          { key: 'email', label: 'Email' }
        ];
      case 'users':
        return [
          { key: 'id', label: 'ID' },
          { key: 'name', label: 'Name' },
          { key: 'email', label: 'Email' },
          { key: 'role', label: 'Role' }
        ];
      case 'favorites':
        return [
          { key: 'id', label: 'ID' },
          { key: 'favoriteUserName', label: 'Name' },
          { key: 'favoriteUserEmail', label: 'Email' }
        ];
      default:
        return [];
    }
  }

  getItemProperty(item: any, key: string): any {
    if (key === 'promotion_id' && this.activeTab === 'interns') {
      return this.getPromotionName(item.promotion_id);
    }
    return item[key];
  }

  getPromotionName(promotionId: number | null): string {
    if (promotionId === null) return 'None';

    const promotion = this.items.find(p => p.id === promotionId);
    return promotion ? promotion.name : `Promotion ${promotionId}`;
  }

  getViewLink(): string {
    return `/admin/${this.activeTab}`;
  }

  getEditLink(): string {
    return `/admin/${this.activeTab}/edit`;
  }

  getHeaderIcon(): string {
    switch (this.activeTab) {
      case 'interns': return 'fas fa-user-graduate';
      case 'promotions': return 'fas fa-users';
      case 'chapters': return 'fas fa-book';
      case 'questions': return 'fas fa-question-circle';
      case 'answers': return 'fas fa-comment-dots';
      case 'admins': return 'fas fa-user-shield';
      case 'users': return 'fas fa-user';
      case 'favorites': return 'fas fa-star';
      default: return 'fas fa-list';
    }
  }

  onPageSizeChange(): void {
    // Convert pageSize to a number to ensure proper calculations
    this.pageSize = Number(this.pageSize);
    this.currentPage = 1; // Reset to first page when changing page size
    this.calculatePagination();

    // Reset dataLoaded flag to ensure data is reloaded
    this.dataLoaded = false;

    // Reload data to ensure child components are updated with the new page size
    this.loadData();
  }

  // Toggle item selection
  toggleSelection(id: number): void {
    const index = this.selectedItems.indexOf(id);
    if (index === -1) {
      this.selectedItems.push(id);
    } else {
      this.selectedItems.splice(index, 1);
    }
  }

  // Check if an item is selected
  isSelected(id: number): boolean {
    return this.selectedItems.includes(id);
  }

  // Delete selected items
  deleteSelectedItems(): void {
    if (this.selectedItems.length === 0) {
      return;
    }

    if (!confirm(`Are you sure you want to delete ${this.selectedItems.length} ${this.getActiveTabTitle().toLowerCase()}?`)) {
      return;
    }

    this.loading = true;
    const deletePromises: Promise<boolean>[] = [];

    for (const id of this.selectedItems) {
      switch (this.activeTab) {
        case 'interns':
          deletePromises.push(this.internService.deleteIntern(id));
          break;
        case 'promotions':
          deletePromises.push(this.promotionService.deletePromotion(id));
          break;
        case 'chapters':
          deletePromises.push(this.chapterService.deleteChapter(id));
          break;
        case 'questions':
          deletePromises.push(this.questionService.deleteQuestion(id));
          break;
        case 'answers':
          deletePromises.push(this.answerService.deleteAnswer(id));
          break;
        case 'admins':
          deletePromises.push(this.adminService.deleteAdmin(id));
          break;
        case 'users':
          deletePromises.push(this.userService.deleteUser(id));
          break;
        case 'favorites':
          deletePromises.push(this.favoritesService.removeFavorite(id));
          break;
      }
    }

    Promise.all(deletePromises)
      .then(results => {
        const allSuccessful = results.every(result => result === true);
        if (allSuccessful) {
          // Reset dataLoaded flag to ensure data is reloaded next time
          this.dataLoaded = false;

          // Update items list by filtering out deleted items
          this.items = this.items.filter(item => !this.selectedItems.includes(item.id));
          this.selectedItems = [];
          this.calculatePagination();
        } else {
          this.error = `Failed to delete some ${this.getActiveTabTitle().toLowerCase()}. Please try again.`;
        }
        this.loading = false;
      })
      .catch(error => {
        this.error = `Failed to delete ${this.getActiveTabTitle().toLowerCase()}. Please try again.`;
        this.loading = false;
        console.error(`Error deleting ${this.getActiveTabTitle().toLowerCase()}:`, error);
      });
  }

  // Edit item
  editItem(id: number): void {
    this.router.navigate([this.getEditLink(), id]);
  }

  deleteItem(id: number): void {
    if (!confirm(`Are you sure you want to delete this ${this.getSingularTabName()}?`)) {
      return;
    }

    this.loading = true;

    switch (this.activeTab) {
      case 'interns':
        this.internService.deleteIntern(id)
          .then(success => {
            if (success) {
              // Reset dataLoaded flag to ensure data is reloaded next time
              this.dataLoaded = false;
              this.items = this.items.filter(item => item.id !== id);
              this.calculatePagination();
            } else {
              this.error = `Failed to delete ${this.getSingularTabName()}. Please try again.`;
            }
            this.loading = false;
          })
          .catch(error => {
            this.error = `Failed to delete ${this.getSingularTabName()}. Please try again.`;
            this.loading = false;
            console.error(`Error deleting ${this.getSingularTabName()}:`, error);
          });
        break;

      case 'promotions':
        this.promotionService.deletePromotion(id)
          .then(success => {
            if (success) {
              // Reset dataLoaded flag to ensure data is reloaded next time
              this.dataLoaded = false;
              this.items = this.items.filter(item => item.id !== id);
              this.calculatePagination();
            } else {
              this.error = `Failed to delete ${this.getSingularTabName()}. Please try again.`;
            }
            this.loading = false;
          })
          .catch(error => {
            this.error = `Failed to delete ${this.getSingularTabName()}. Please try again.`;
            this.loading = false;
            console.error(`Error deleting ${this.getSingularTabName()}:`, error);
          });
        break;

      case 'chapters':
        this.chapterService.deleteChapter(id)
          .then(success => {
            if (success) {
              // Reset dataLoaded flag to ensure data is reloaded next time
              this.dataLoaded = false;
              this.items = this.items.filter(item => item.id !== id);
              this.calculatePagination();
            } else {
              this.error = `Failed to delete ${this.getSingularTabName()}. Please try again.`;
            }
            this.loading = false;
          })
          .catch(error => {
            this.error = `Failed to delete ${this.getSingularTabName()}. Please try again.`;
            this.loading = false;
            console.error(`Error deleting ${this.getSingularTabName()}:`, error);
          });
        break;

      case 'questions':
        this.questionService.deleteQuestion(id)
          .then(success => {
            if (success) {
              // Reset dataLoaded flag to ensure data is reloaded next time
              this.dataLoaded = false;
              this.items = this.items.filter(item => item.id !== id);
              this.calculatePagination();
            } else {
              this.error = `Failed to delete ${this.getSingularTabName()}. Please try again.`;
            }
            this.loading = false;
          })
          .catch(error => {
            this.error = `Failed to delete ${this.getSingularTabName()}. Please try again.`;
            this.loading = false;
            console.error(`Error deleting ${this.getSingularTabName()}:`, error);
          });
        break;

      case 'answers':
        this.answerService.deleteAnswer(id)
          .then(success => {
            if (success) {
              // Reset dataLoaded flag to ensure data is reloaded next time
              this.dataLoaded = false;
              this.items = this.items.filter(item => item.id !== id);
              this.calculatePagination();
            } else {
              this.error = `Failed to delete ${this.getSingularTabName()}. Please try again.`;
            }
            this.loading = false;
          })
          .catch(error => {
            this.error = `Failed to delete ${this.getSingularTabName()}. Please try again.`;
            this.loading = false;
            console.error(`Error deleting ${this.getSingularTabName()}:`, error);
          });
        break;

      case 'admins':
        this.adminService.deleteAdmin(id)
          .then(success => {
            if (success) {
              // Reset dataLoaded flag to ensure data is reloaded next time
              this.dataLoaded = false;
              this.items = this.items.filter(item => item.id !== id);
              this.calculatePagination();
            } else {
              this.error = `Failed to delete ${this.getSingularTabName()}. Please try again.`;
            }
            this.loading = false;
          })
          .catch(error => {
            this.error = `Failed to delete ${this.getSingularTabName()}. Please try again.`;
            this.loading = false;
            console.error(`Error deleting ${this.getSingularTabName()}:`, error);
          });
        break;

      case 'users':
        this.userService.deleteUser(id)
          .then(success => {
            if (success) {
              // Reset dataLoaded flag to ensure data is reloaded next time
              this.dataLoaded = false;
              this.items = this.items.filter(item => item.id !== id);
              this.calculatePagination();
            } else {
              this.error = `Failed to delete ${this.getSingularTabName()}. Please try again.`;
            }
            this.loading = false;
          })
          .catch(error => {
            this.error = `Failed to delete ${this.getSingularTabName()}. Please try again.`;
            this.loading = false;
            console.error(`Error deleting ${this.getSingularTabName()}:`, error);
          });
        break;

      case 'favorites':
        this.favoritesService.removeFavorite(id)
          .then(success => {
            if (success) {
              // Reset dataLoaded flag to ensure data is reloaded next time
              this.dataLoaded = false;
              this.items = this.items.filter(item => item.id !== id);
              this.calculatePagination();
            } else {
              this.error = `Failed to delete ${this.getSingularTabName()}. Please try again.`;
            }
            this.loading = false;
          })
          .catch(error => {
            this.error = `Failed to delete ${this.getSingularTabName()}. Please try again.`;
            this.loading = false;
            console.error(`Error deleting ${this.getSingularTabName()}:`, error);
          });
        break;

      default:
        this.loading = false;
        break;
    }
  }
}
