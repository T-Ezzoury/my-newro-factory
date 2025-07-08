import { Component, OnInit, Input, Output, EventEmitter, OnChanges, SimpleChanges } from '@angular/core';
import { RouterLink } from '@angular/router';
import { CommonModule } from '@angular/common';
import { ChapterService } from '../../../../services/admin/chapter.service';
import { Chapter } from '../../../../models/admin/Chapter';

@Component({
  selector: 'app-chapter-list',
  standalone: true,
  imports: [CommonModule, RouterLink],
  templateUrl: './chapter-list.html',
  styleUrl: './chapter-list.css'
})
export class ChapterListComponent implements OnInit, OnChanges {
  chapters: Chapter[] = [];
  loading = true;
  error = '';

  // Pagination inputs from parent
  @Input() currentPage = 1;
  @Input() pageSize = 10;

  // Pagination outputs to parent
  @Output() paginationChange = new EventEmitter<{totalItems: number, totalPages: number}>();

  // Calculated pagination values
  totalPages = 0;

  // Make Math available in the template
  Math = Math;

  constructor(private chapterService: ChapterService) {}

  ngOnInit(): void {
    this.loadChapters();
  }

  ngOnChanges(changes: SimpleChanges): void {
    // React to changes in pagination inputs
    if (changes['currentPage'] && !changes['currentPage'].firstChange) {
      // No need to reload data, just update the view
      console.log('Current page changed to:', this.currentPage);
    }
  }

  loadChapters(): void {
    this.loading = true;
    this.error = '';

    this.chapterService.getChapters()
      .then(chapters => {
        this.chapters = chapters;
        this.calculateTotalPages();
        this.loading = false;
      })
      .catch(err => {
        this.error = 'Failed to load chapters. Please try again.';
        this.loading = false;
        console.error('Error loading chapters:', err);
      });
  }

  calculateTotalPages(): void {
    this.totalPages = Math.ceil(this.chapters.length / this.pageSize);
    // Emit pagination info to parent component
    this.paginationChange.emit({
      totalItems: this.chapters.length,
      totalPages: this.totalPages
    });
  }

  get paginatedChapters(): Chapter[] {
    const startIndex = (this.currentPage - 1) * this.pageSize;
    const endIndex = startIndex + this.pageSize;
    return this.chapters.slice(startIndex, endIndex);
  }

  deleteChapter(id: number): void {
    if (confirm('Are you sure you want to delete this chapter?')) {
      this.chapterService.deleteChapter(id)
        .then(success => {
          if (success) {
            this.chapters = this.chapters.filter(chapter => chapter.id !== id);
          } else {
            this.error = 'Failed to delete chapter. Please try again.';
          }
        })
        .catch(err => {
          this.error = 'Failed to delete chapter. Please try again.';
          console.error('Error deleting chapter:', err);
        });
    }
  }
}
