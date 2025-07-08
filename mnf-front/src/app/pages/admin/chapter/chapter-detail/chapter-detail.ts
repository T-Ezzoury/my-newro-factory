import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { ChapterService } from '../../../../services/admin/chapter.service';
import { Chapter } from '../../../../models/admin/Chapter';

@Component({
  selector: 'app-chapter-detail',
  standalone: true,
  imports: [CommonModule, RouterLink],
  templateUrl: './chapter-detail.html',
  styleUrl: './chapter-detail.css'
})
export class ChapterDetailComponent implements OnInit {
  chapter: Chapter | null = null;
  loading = true;
  error = '';

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private chapterService: ChapterService
  ) {}

  ngOnInit(): void {
    this.loadChapter();
  }

  loadChapter(): void {
    const id = this.route.snapshot.paramMap.get('id');
    if (!id) {
      this.error = 'Chapter ID is required';
      this.loading = false;
      return;
    }

    this.chapterService.getChapterById(+id)
      .then(chapter => {
        this.chapter = chapter;
        if (!chapter) {
          this.error = 'Chapter not found';
        }
        this.loading = false;
      })
      .catch(err => {
        this.error = 'Failed to load chapter';
        this.loading = false;
        console.error('Error loading chapter:', err);
      });
  }

  deleteChapter(): void {
    if (!this.chapter || this.chapter.id === undefined) return;

    if (confirm('Are you sure you want to delete this chapter?')) {
      this.loading = true;
      this.chapterService.deleteChapter(this.chapter.id)
        .then(success => {
          if (success) {
            this.router.navigate(['/admin/chapters']);
          } else {
            this.error = 'Failed to delete chapter';
            this.loading = false;
          }
        })
        .catch(err => {
          this.error = 'Failed to delete chapter';
          this.loading = false;
          console.error('Error deleting chapter:', err);
        });
    }
  }
}
