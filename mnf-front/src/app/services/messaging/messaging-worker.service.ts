import { Injectable, OnDestroy } from '@angular/core';
import { Observable, Subject, fromEvent, of } from 'rxjs';
import { map, takeUntil } from 'rxjs/operators';
import { MessagingService } from './messaging.service';
import { Conversation } from '../../models/messaging/conversation.model';
import { Message } from '../../models/messaging/message.model';

@Injectable({
  providedIn: 'root'
})
export class MessagingWorkerService implements OnDestroy {
  private worker: Worker | null = null;
  private destroy$ = new Subject<void>();

  // Subjects to emit data from the worker
  private conversationsSubject = new Subject<Conversation[]>();
  private messagesSubject = new Subject<{ conversationId: string, messages: Message[] }>();
  private errorSubject = new Subject<any>();

  // Observables that components can subscribe to
  public conversations$ = this.conversationsSubject.asObservable();
  public messages$ = this.messagesSubject.asObservable();
  public error$ = this.errorSubject.asObservable();

  constructor(private messagingService: MessagingService) {
    this.initWorker();
  }

  ngOnDestroy(): void {
    this.destroy$.next();
    this.destroy$.complete();
    this.terminateWorker();
  }

  /**
   * Initialize the Web Worker
   */
  private initWorker(): void {
    if (typeof Worker !== 'undefined') {
      // Create a new worker
      this.worker = new Worker(new URL('../../../app/workers/messaging.worker.ts', import.meta.url), { type: 'module' });

      // Listen for messages from the worker
      fromEvent<MessageEvent>(this.worker, 'message')
        .pipe(takeUntil(this.destroy$))
        .subscribe(event => {
          const { type, payload } = event.data;

          switch (type) {
            case 'FETCH_CONVERSATIONS':
              // When the worker requests conversations, fetch them from the service
              this.messagingService.getConversations().subscribe(conversations => {
                this.conversationsSubject.next(conversations);
              });
              break;

            case 'FETCH_MESSAGES':
              // When the worker requests messages, fetch them from the service
              if (payload && payload.conversationId) {
                this.messagingService.getMessages(payload.conversationId).subscribe(messages => {
                  this.messagesSubject.next({
                    conversationId: payload.conversationId,
                    messages
                  });
                });
              }
              break;

            case 'ERROR':
              // Handle errors from the worker
              this.errorSubject.next(payload);
              console.error('Worker error:', payload);
              break;

            default:
              console.warn('Unknown message type from worker:', type);
          }
        });
    } else {
      console.error('Web Workers are not supported in this environment');
    }
  }

  /**
   * Start polling for new messages
   */
  public startPolling(intervalMs: number = 10000): void {
    if (this.worker) {
      this.worker.postMessage({
        type: 'START_POLLING',
        payload: {
          intervalMs,
          apiUrl: '/api' // This would be the base API URL in a real app
        }
      });
    }
  }

  /**
   * Stop polling for new messages
   */
  public stopPolling(): void {
    if (this.worker) {
      this.worker.postMessage({
        type: 'STOP_POLLING'
      });
    }
  }

  /**
   * Set the current conversation
   */
  public setConversation(conversationId: string | null): void {
    if (this.worker) {
      this.worker.postMessage({
        type: 'SET_CONVERSATION',
        payload: {
          conversationId
        }
      });
    }
  }

  /**
   * Terminate the worker
   */
  private terminateWorker(): void {
    if (this.worker) {
      this.worker.terminate();
      this.worker = null;
    }
  }

  /**
   * Get conversations (initial load)
   */
  public getConversations(): Observable<Conversation[]> {
    return this.messagingService.getConversations();
  }

  /**
   * Get messages for a conversation (initial load)
   */
  public getMessages(conversationId: string): Observable<Message[]> {
    return this.messagingService.getMessages(conversationId);
  }

  /**
   * Send a message
   */
  public sendMessage(conversationId: string, content: string): Observable<Message> {
    return this.messagingService.sendMessage(conversationId, content);
  }

  /**
   * Mark messages as read
   */
  public markAsRead(conversationId: string): Observable<boolean> {
    return this.messagingService.markAsRead(conversationId);
  }

  /**
   * Create a new conversation
   */
  public createConversation(participants: number[], isGroup: boolean, title?: string): Observable<Conversation> {
    return this.messagingService.createConversation(participants, isGroup, title);
  }

  /**
   * Delete a conversation
   */
  public deleteConversation(conversationId: string): Observable<boolean> {
    return this.messagingService.deleteConversation(conversationId);
  }
}
