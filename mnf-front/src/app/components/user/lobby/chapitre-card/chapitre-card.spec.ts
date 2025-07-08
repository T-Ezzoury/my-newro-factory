import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ChapitreCard } from './chapitre-card';

describe('ChapitreCard', () => {
  let component: ChapitreCard;
  let fixture: ComponentFixture<ChapitreCard>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ChapitreCard]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ChapitreCard);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
