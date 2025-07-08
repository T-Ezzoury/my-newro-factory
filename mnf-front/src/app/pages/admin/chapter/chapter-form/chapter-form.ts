import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { ChapterService } from '../../../../services/admin/chapter.service';
import { Chapter } from '../../../../models/admin/Chapter';
import { NotificationService } from '../../../../services/notification.service';

@Component({
  selector: 'app-chapter-form',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule, RouterLink],
  templateUrl: './chapter-form.html',
  styleUrl: '../../list-container/list-container.css'
})
export class ChapterFormComponent implements OnInit {
  chapterForm: FormGroup;
  isEditMode = false;
  chapterId: number | null = null;
  loading = false;
  error = '';
  success = '';

  constructor(
    private fb: FormBuilder,
    private chapterService: ChapterService,
    private route: ActivatedRoute,
    private router: Router,
    private notificationService: NotificationService
  ) {
    this.chapterForm = this.fb.group({
      title: ['', [Validators.required, Validators.minLength(3)]],
      path: ['', [Validators.required]],
      content: [''],
      parentPath: ['']
    });
  }

  ngOnInit(): void {
    const id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.isEditMode = true;
      this.chapterId = +id;
      this.loadChapter(this.chapterId);
    }
  }

  loadChapter(id: number): void {
    this.loading = true;
    this.chapterService.getChapterById(id)
      .then(chapter => {
        if (chapter) {
          this.chapterForm.patchValue({
            title: chapter.title,
            path: chapter.path,
            content: chapter.content,
            parentPath: chapter.parentPath
          });
        } else {
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

  onSubmit(): void {
    if (this.chapterForm.invalid) {
      return;
    }

    this.loading = true;
    this.error = '';
    this.success = '';

    const chapterData = this.chapterForm.value;

    if (this.isEditMode && this.chapterId) {
      this.chapterService.updateChapter(this.chapterId, chapterData)
        .then(chapter => {
          if (chapter) {
            this.success = 'Chapter updated successfully';
            // Immediate navigation without delay
            this.router.navigate(['/admin/dashboard/chapters']);
          } else {
            this.error = 'Failed to update chapter';
          }
          this.loading = false;
        })
        .catch(err => {
          this.error = 'Failed to update chapter';
          this.loading = false;
          console.error('Error updating chapter:', err);
        });
    } else {
      this.chapterService.createChapter(chapterData)
        .then(chapter => {
          if (chapter) {
            this.success = 'Chapter created successfully';
            this.chapterForm.reset();
            // Immediate navigation without delay
            this.router.navigate(['/admin/dashboard/chapters']);
          } else {
            this.error = 'Failed to create chapter';
          }
          this.loading = false;
        })
        .catch(err => {
          this.error = 'Failed to create chapter';
          this.loading = false;
          console.error('Error creating chapter:', err);
        });
    }
  }
}
