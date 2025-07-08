import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';

export interface Notification {
  message: string;
  type: 'success' | 'error';
  id: number;
}

@Injectable({
  providedIn: 'root'
})
export class NotificationService {
  private notifications = new BehaviorSubject<Notification[]>([]);
  private nextId = 0;

  constructor() {}

  getNotifications(): Observable<Notification[]> {
    return this.notifications.asObservable();
  }

  success(message: string): void {
    this.addNotification({
      message,
      type: 'success',
      id: this.nextId++
    });
  }

  error(message: string): void {
    this.addNotification({
      message,
      type: 'error',
      id: this.nextId++
    });
  }

  private addNotification(notification: Notification): void {
    const current = this.notifications.value;
    this.notifications.next([...current, notification]);

    // Auto-remove notification after 5 seconds
    setTimeout(() => {
      this.removeNotification(notification.id);
    }, 5000);
  }

  removeNotification(id: number): void {
    const current = this.notifications.value;
    this.notifications.next(current.filter(notification => notification.id !== id));
  }
}
