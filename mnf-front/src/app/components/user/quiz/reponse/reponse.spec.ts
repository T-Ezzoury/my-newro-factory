import { ComponentFixture, TestBed } from "@angular/core/testing";

import { Reponses } from "./reponse";

describe("Reponse", () => {
  let component: Reponses;
  let fixture: ComponentFixture<Reponses>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Reponses],
    }).compileComponents();

    fixture = TestBed.createComponent(Reponses);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it("should create", () => {
    expect(component).toBeTruthy();
  });
});
