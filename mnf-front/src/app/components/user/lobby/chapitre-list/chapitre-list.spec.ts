import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ChapitreList } from './chapitre-list';

describe('ChapitreList', () => {
  let component: ChapitreList;
  let fixture: ComponentFixture<ChapitreList>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ChapitreList]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ChapitreList);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
