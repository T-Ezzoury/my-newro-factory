import { Routes } from "@angular/router";
import { HomePage } from "./pages/user/home/home";
import { UserLayout } from "./layouts/user-layout/user-layout";
import { DefaultLayout } from "./layouts/default-layout/default-layout";
import { AdminLayout } from "./layouts/admin-layout/admin-layout";
import { AuthPage } from "./pages/default/auth/auth-page/auth-page";
import { NotFoundPage } from "./pages/error/not-found/not-found";
import { GeneralErrorPage } from "./pages/error/general-error/general-error";
import { EnvironmentSwitcherComponent } from "./pages/default/environment-switcher/environment-switcher";
import { MessagingPage } from "./pages/user/messaging/messaging";
import { AuthGuard } from "./guards/auth.guard";
import { AdminGuard } from "./guards/admin.guard";
import { AuthPageGuard } from "./guards/auth-page.guard";
import { LobbyPage } from "./pages/user/lobby/lobby";
import { QuizPage } from "./pages/user/quiz/quiz";
import { ProfilePage } from './pages/user/profile/profile';
import { FavoritesPage } from './pages/user/favorites/favorites';
import { QuestionSeriesPage } from './pages/user/question-series/question-series';
import { QuizManagementPage } from './pages/user/quiz-management/quiz-management';

export const routes: Routes = [
  // User routes
  {
    path: "",
    component: UserLayout,
    children: [
      { path: "", component: HomePage },
      { path: "home", component: HomePage },
      { path: "lobby", component: LobbyPage },
      { path: "quiz", component: QuizPage },
      { path: "environment", component: EnvironmentSwitcherComponent },
      { path: "messaging", component: MessagingPage },
      { path: "messaging/:id", component: MessagingPage },
      { path: "profile", component: ProfilePage, canActivate: [AuthGuard] },
      { path: "favorites", component: FavoritesPage, canActivate: [AuthGuard] },
      { path: "quiz-management", component: QuizManagementPage, canActivate: [AuthGuard] },
    ],
  },
  // Question Series route (no layout)
  {
    path: "question-series",
    component: QuestionSeriesPage,
    canActivate: [AuthGuard]
  },
  // Admin routes
  {
    path: "admin",
    component: AdminLayout,
    canActivate: [AdminGuard],
    children: [
      { path: "", redirectTo: "dashboard", pathMatch: "full" },
      {
        path: "dashboard",
        loadChildren: () =>
          import("./pages/admin/dashboard/dashboard.routes").then(
            (m) => m.DASHBOARD_ROUTES
          ),
      },

      // Legacy direct routes - kept for backward compatibility
      {
        path: "promotions",
        loadChildren: () =>
          import("./pages/admin/promotion/promotion.routes").then(
            (m) => m.PROMOTION_ROUTES
          ),
      },
      {
        path: "interns",
        loadChildren: () =>
          import("./pages/admin/intern/intern.routes").then(
            (m) => m.INTERN_ROUTES
          ),
      },
      {
        path: "chapters",
        loadChildren: () =>
          import("./pages/admin/chapter/chapter.routes").then(
            (m) => m.CHAPTER_ROUTES
          ),
      },
      {
        path: "questions",
        loadChildren: () =>
          import("./pages/admin/question/question.routes").then(
            (m) => m.QUESTION_ROUTES
          ),
      },
      {
        path: "answers",
        loadChildren: () =>
          import("./pages/admin/answer/answer.routes").then(
            (m) => m.ANSWER_ROUTES
          ),
      },
    ],
  },
  // Auth and error routes
  {
    path: 'auth',
    component: DefaultLayout,
    canActivate: [AuthPageGuard],
    children: [
      { path: '', component: AuthPage },
    ]
  },
  // Error routes with DefaultLayout
  {
    path: 'error',
    component: DefaultLayout,
    children: [
      { path: '', component: GeneralErrorPage }
    ]
  },
  {
    path: '404',
    component: DefaultLayout,
    children: [
      { path: '', component: NotFoundPage }
    ]
  },
  // Wildcard route for 404
  {
    path: '**',
    redirectTo: '/404'
  }
];
