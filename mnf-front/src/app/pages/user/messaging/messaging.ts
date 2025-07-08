import { Component, OnInit, OnDestroy } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ActivatedRoute, Router, RouterModule } from '@angular/router';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatListModule } from '@angular/material/list';
import { MatIconModule } from '@angular/material/icon';
import { MatBadgeModule } from '@angular/material/badge';
import { MatDividerModule } from '@angular/material/divider';
import { MatMenuModule } from '@angular/material/menu';
import { MatTooltipModule } from '@angular/material/tooltip';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { Subject } from 'rxjs';
import { takeUntil } from 'rxjs/operators';

import { MessagingWorkerService } from '../../../services/messaging/messaging-worker.service';
import { Conversation } from '../../../models/messaging/conversation.model';
import { Message } from '../../../models/messaging/message.model';
import { TranslatePipe } from '../../../pipes/translate.pipe';

@Component({
  selector: 'app-messaging',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    RouterModule,
    MatButtonModule,
    MatCardModule,
    MatFormFieldModule,
    MatInputModule,
    MatListModule,
    MatIconModule,
    MatBadgeModule,
    MatDividerModule,
    MatMenuModule,
    MatTooltipModule,
    MatProgressSpinnerModule,
    TranslatePipe
  ],
  templateUrl: './messaging.html',
  styleUrl: './messaging.css'
})
export class MessagingPage implements OnInit, OnDestroy {
  conversations: Conversation[] = [];
  selectedConversation: Conversation | undefined;
  messages: Message[] = [];
  newMessage = '';
  loading = true;
  messagesLoading = false;

  private destroy$ = new Subject<void>();

  constructor(
    private messagingWorkerService: MessagingWorkerService,
    private route: ActivatedRoute,
    private router: Router
  ) {}

  ngOnInit(): void {
    // Load conversations
    this.loadConversations();

    // Check for conversation ID in route params
    this.route.params.pipe(
      takeUntil(this.destroy$)
    ).subscribe(params => {
      if (params['id']) {
        this.selectConversation(params['id']);
      }
    });

    // Subscribe to conversations updates from the worker
    this.messagingWorkerService.conversations$.pipe(
      takeUntil(this.destroy$)
    ).subscribe(conversations => {
      this.conversations = conversations;
    });

    // Subscribe to messages updates from the worker
    this.messagingWorkerService.messages$.pipe(
      takeUntil(this.destroy$)
    ).subscribe(data => {
      // Only update if this is for the currently selected conversation
      if (this.selectedConversation && data.conversationId === this.selectedConversation.id) {
        // Only update if we have new messages
        if (data.messages.length !== this.messages.length) {
          this.messages = data.messages;

          // Scroll to bottom of messages
          setTimeout(() => {
            this.scrollToBottom();
          }, 100);
        }
      }
    });

    // Subscribe to error notifications from the worker
    this.messagingWorkerService.error$.pipe(
      takeUntil(this.destroy$)
    ).subscribe(error => {
      console.error('Messaging worker error:', error);
      // Handle error (could show a notification to the user)
    });

    // Start polling for new messages (every 10 seconds)
    this.messagingWorkerService.startPolling(10000);
  }

  ngOnDestroy(): void {
    // Stop the worker polling
    this.messagingWorkerService.stopPolling();

    this.destroy$.next();
    this.destroy$.complete();
  }

  /**
   * Load all conversations
   */
  loadConversations(): void {
    this.loading = true;

    this.messagingWorkerService.getConversations().pipe(
      takeUntil(this.destroy$)
    ).subscribe(conversations => {
      this.conversations = conversations;
      this.loading = false;

      // If no conversation is selected and we have conversations, select the first one
      if (!this.selectedConversation && this.conversations.length > 0) {
        this.selectConversation(this.conversations[0].id);
      }
    });
  }

  /**
   * Select a conversation and load its messages
   */
  selectConversation(conversationId: string): void {
    // Update the URL without reloading the page
    this.router.navigate(['/messaging', conversationId], { replaceUrl: true });

    const conversation = this.conversations.find(c => c.id === conversationId);

    if (conversation) {
      this.selectedConversation = conversation;
      this.loadMessages(conversationId);

      // Update the worker with the selected conversation
      this.messagingWorkerService.setConversation(conversationId);

      // Mark messages as read
      if (conversation.unreadCount > 0) {
        this.messagingWorkerService.markAsRead(conversationId).pipe(
          takeUntil(this.destroy$)
        ).subscribe(() => {
          conversation.unreadCount = 0;
        });
      }
    }
  }

  /**
   * Load messages for a conversation
   */
  loadMessages(conversationId: string): void {
    this.messagesLoading = true;

    this.messagingWorkerService.getMessages(conversationId).pipe(
      takeUntil(this.destroy$)
    ).subscribe(messages => {
      this.messages = messages;
      this.messagesLoading = false;

      // Scroll to bottom of messages
      setTimeout(() => {
        this.scrollToBottom();
      }, 100);
    });
  }

  /**
   * Refresh messages for the current conversation
   * Note: This is now handled by the worker service's messages$ observable
   * but kept for backward compatibility
   */
  refreshMessages(conversationId: string): void {
    // No need to manually refresh as the worker will handle this
    // The messages$ observable will emit new messages when they arrive
  }

  /**
   * Send a new message
   */
  sendMessage(): void {
    if (!this.newMessage.trim() || !this.selectedConversation) {
      return;
    }

    this.messagingWorkerService.sendMessage(this.selectedConversation.id, this.newMessage.trim()).pipe(
      takeUntil(this.destroy$)
    ).subscribe(message => {
      // Add the new message to the list
      this.messages.push(message);

      // Clear the input
      this.newMessage = '';

      // Scroll to bottom of messages
      setTimeout(() => {
        this.scrollToBottom();
      }, 100);
    });
  }

  /**
   * Create a new conversation
   */
  createNewConversation(): void {
    // In a real app, this would open a dialog to select participants
    // For now, just create a conversation with a mock user
    this.messagingWorkerService.createConversation([2], false).pipe(
      takeUntil(this.destroy$)
    ).subscribe(conversation => {
      this.conversations.unshift(conversation);
      this.selectConversation(conversation.id);
    });
  }

  /**
   * Delete a conversation
   */
  deleteConversation(conversationId: string): void {
    this.messagingWorkerService.deleteConversation(conversationId).pipe(
      takeUntil(this.destroy$)
    ).subscribe(success => {
      if (success) {
        // Remove the conversation from the list
        this.conversations = this.conversations.filter(c => c.id !== conversationId);

        // If the deleted conversation was selected, select another one
        if (this.selectedConversation && this.selectedConversation.id === conversationId) {
          this.selectedConversation = undefined;
          this.messages = [];

          // Update the worker that no conversation is selected
          this.messagingWorkerService.setConversation(null);

          if (this.conversations.length > 0) {
            this.selectConversation(this.conversations[0].id);
          } else {
            this.router.navigate(['/messaging']);
          }
        }
      }
    });
  }

  /**
   * Format a date for display
   */
  formatDate(date: Date): string {
    const now = new Date();
    const messageDate = new Date(date);

    // If the message is from today, show the time
    if (messageDate.toDateString() === now.toDateString()) {
      return messageDate.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
    }

    // If the message is from yesterday, show "Yesterday"
    const yesterday = new Date(now);
    yesterday.setDate(now.getDate() - 1);
    if (messageDate.toDateString() === yesterday.toDateString()) {
      return 'Yesterday';
    }

    // If the message is from this week, show the day name
    const weekAgo = new Date(now);
    weekAgo.setDate(now.getDate() - 7);
    if (messageDate > weekAgo) {
      return messageDate.toLocaleDateString([], { weekday: 'long' });
    }

    // Otherwise, show the date
    return messageDate.toLocaleDateString();
  }

  /**
   * Check if a message is from the current user
   */
  isCurrentUser(senderId: number): boolean {
    return senderId === 1; // Mock current user ID
  }

  /**
   * Get participant avatar by ID
   */
  getParticipantAvatar(participantId: number): string | undefined {
    if (!this.selectedConversation) return undefined;

    const participant = this.selectedConversation.participants.find(p => p.id === participantId);
    return participant?.avatar;
  }

  /**
   * Get participant name by ID
   */
  getParticipantName(participantId: number): string {
    if (!this.selectedConversation) return 'Unknown';

    const participant = this.selectedConversation.participants.find(p => p.id === participantId);
    return participant?.name || 'Unknown';
  }

  /**
   * Get participant initial by ID
   */
  getParticipantInitial(participantId: number): string {
    const name = this.getParticipantName(participantId);
    return name.charAt(0) || '?';
  }

  /**
   * Scroll to the bottom of the messages container
   */
  private scrollToBottom(): void {
    const messagesContainer = document.querySelector('.messages-container');
    if (messagesContainer) {
      messagesContainer.scrollTop = messagesContainer.scrollHeight;
    }
  }
}
