import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable, of } from 'rxjs';
import { delay, map } from 'rxjs/operators';
import { ApiService } from '../api.service';
import { Message } from '../../models/messaging/message.model';
import { Conversation, Participant } from '../../models/messaging/conversation.model';

@Injectable({
  providedIn: 'root'
})
export class MessagingService {
  private currentUserIdSubject = new BehaviorSubject<number>(1); // Mock current user ID
  public currentUserId$ = this.currentUserIdSubject.asObservable();

  private conversations: Conversation[] = [];
  private messages: Record<string, Message[]> = {};

  constructor(private apiService: ApiService) {
    // Initialize with mock data
    this.initMockData();
  }

  /**
   * Get all conversations for the current user
   */
  public getConversations(): Observable<Conversation[]> {
    // In a real app, this would call the API
    // return this.apiService.get<Conversation[]>('/conversations')
    //   .then(response => response.data);

    // For now, return mock data
    return of(this.conversations).pipe(delay(500)); // Simulate network delay
  }

  /**
   * Get a conversation by ID
   */
  public getConversation(id: string): Observable<Conversation | undefined> {
    // In a real app, this would call the API
    // return this.apiService.get<Conversation>(`/conversations/${id}`)
    //   .then(response => response.data);

    // For now, return mock data
    return of(this.conversations.find(c => c.id === id)).pipe(delay(300));
  }

  /**
   * Get messages for a conversation
   */
  public getMessages(conversationId: string): Observable<Message[]> {
    // In a real app, this would call the API
    // return this.apiService.get<Message[]>(`/conversations/${conversationId}/messages`)
    //   .then(response => response.data);

    // For now, return mock data
    return of(this.messages[conversationId] || []).pipe(delay(300));
  }

  /**
   * Send a message
   */
  public sendMessage(conversationId: string, content: string): Observable<Message> {
    const currentUserId = this.currentUserIdSubject.value;
    const conversation = this.conversations.find(c => c.id === conversationId);

    if (!conversation) {
      throw new Error(`Conversation with ID ${conversationId} not found`);
    }

    // Create a new message
    const newMessage: Message = {
      id: `msg_${Date.now()}`,
      conversationId,
      senderId: currentUserId,
      senderName: 'Current User', // In a real app, get from user service
      content,
      timestamp: new Date(),
      read: false
    };

    // In a real app, this would call the API
    // return this.apiService.post<Message>(`/conversations/${conversationId}/messages`, {
    //   content
    // }).then(response => response.data);

    // For now, update mock data
    if (!this.messages[conversationId]) {
      this.messages[conversationId] = [];
    }

    this.messages[conversationId].push(newMessage);

    // Update the conversation's last message
    conversation.lastMessage = {
      content: newMessage.content,
      senderId: newMessage.senderId,
      senderName: newMessage.senderName,
      timestamp: newMessage.timestamp,
      read: newMessage.read
    };

    conversation.updatedAt = new Date();

    // For participants other than the sender, increment unread count
    if (!conversation.isGroup) {
      conversation.unreadCount = 0; // Sender has read their own message
    }

    return of(newMessage).pipe(delay(300));
  }

  /**
   * Mark messages as read
   */
  public markAsRead(conversationId: string): Observable<boolean> {
    const conversation = this.conversations.find(c => c.id === conversationId);

    if (!conversation) {
      throw new Error(`Conversation with ID ${conversationId} not found`);
    }

    // In a real app, this would call the API
    // return this.apiService.post(`/conversations/${conversationId}/read`)
    //   .then(() => true);

    // For now, update mock data
    conversation.unreadCount = 0;

    if (this.messages[conversationId]) {
      this.messages[conversationId].forEach(message => {
        if (message.senderId !== this.currentUserIdSubject.value) {
          message.read = true;
        }
      });
    }

    return of(true).pipe(delay(200));
  }

  /**
   * Create a new conversation
   */
  public createConversation(participants: number[], isGroup: boolean, title?: string): Observable<Conversation> {
    const currentUserId = this.currentUserIdSubject.value;

    // Ensure current user is included
    if (!participants.includes(currentUserId)) {
      participants.push(currentUserId);
    }

    // Create participant objects
    const participantObjects: Participant[] = participants.map(id => ({
      id,
      name: id === currentUserId ? 'Current User' : `User ${id}`,
      status: 'online',
      lastSeen: new Date()
    }));

    // Create a new conversation
    const newConversation: Conversation = {
      id: `conv_${Date.now()}`,
      title: title || (isGroup ? 'New Group' : undefined),
      participants: participantObjects,
      unreadCount: 0,
      createdAt: new Date(),
      updatedAt: new Date(),
      isGroup
    };

    // In a real app, this would call the API
    // return this.apiService.post<Conversation>('/conversations', {
    //   participants,
    //   isGroup,
    //   title
    // }).then(response => response.data);

    // For now, update mock data
    this.conversations.push(newConversation);
    this.messages[newConversation.id] = [];

    return of(newConversation).pipe(delay(300));
  }

  /**
   * Delete a conversation
   */
  public deleteConversation(conversationId: string): Observable<boolean> {
    // In a real app, this would call the API
    // return this.apiService.delete(`/conversations/${conversationId}`)
    //   .then(() => true);

    // For now, update mock data
    const index = this.conversations.findIndex(c => c.id === conversationId);

    if (index !== -1) {
      this.conversations.splice(index, 1);
      delete this.messages[conversationId];
      return of(true).pipe(delay(300));
    }

    return of(false).pipe(delay(300));
  }

  /**
   * Initialize mock data for testing
   */
  private initMockData(): void {
    const currentUserId = this.currentUserIdSubject.value;

    // Create some mock participants
    const participants: Participant[] = [
      {
        id: currentUserId,
        name: 'Current User',
        avatar: 'assets/avatars/user1.png',
        status: 'online',
        lastSeen: new Date()
      },
      {
        id: 2,
        name: 'John Doe',
        avatar: 'assets/avatars/user2.png',
        status: 'online',
        lastSeen: new Date()
      },
      {
        id: 3,
        name: 'Jane Smith',
        avatar: 'assets/avatars/user3.png',
        status: 'offline',
        lastSeen: new Date(Date.now() - 3600000) // 1 hour ago
      },
      {
        id: 4,
        name: 'Bob Johnson',
        avatar: 'assets/avatars/user4.png',
        status: 'away',
        lastSeen: new Date(Date.now() - 1800000) // 30 minutes ago
      }
    ];

    // Create some mock conversations
    this.conversations = [
      {
        id: 'conv_1',
        participants: [participants[0], participants[1]],
        lastMessage: {
          content: 'Hey, how are you?',
          senderId: 2,
          senderName: 'John Doe',
          timestamp: new Date(Date.now() - 3600000), // 1 hour ago
          read: false
        },
        unreadCount: 1,
        createdAt: new Date(Date.now() - 86400000 * 7), // 7 days ago
        updatedAt: new Date(Date.now() - 3600000), // 1 hour ago
        isGroup: false
      },
      {
        id: 'conv_2',
        participants: [participants[0], participants[2]],
        lastMessage: {
          content: 'Can you send me the report?',
          senderId: currentUserId,
          senderName: 'Current User',
          timestamp: new Date(Date.now() - 7200000), // 2 hours ago
          read: true
        },
        unreadCount: 0,
        createdAt: new Date(Date.now() - 86400000 * 14), // 14 days ago
        updatedAt: new Date(Date.now() - 7200000), // 2 hours ago
        isGroup: false
      },
      {
        id: 'conv_3',
        title: 'Project Team',
        participants: [participants[0], participants[1], participants[2], participants[3]],
        lastMessage: {
          content: 'Meeting at 3 PM tomorrow',
          senderId: 3,
          senderName: 'Jane Smith',
          timestamp: new Date(Date.now() - 10800000), // 3 hours ago
          read: false
        },
        unreadCount: 2,
        createdAt: new Date(Date.now() - 86400000 * 30), // 30 days ago
        updatedAt: new Date(Date.now() - 10800000), // 3 hours ago
        isGroup: true
      }
    ];

    // Create some mock messages
    this.messages = {
      'conv_1': [
        {
          id: 'msg_1_1',
          conversationId: 'conv_1',
          senderId: 2,
          senderName: 'John Doe',
          content: 'Hi there!',
          timestamp: new Date(Date.now() - 86400000), // 1 day ago
          read: true
        },
        {
          id: 'msg_1_2',
          conversationId: 'conv_1',
          senderId: currentUserId,
          senderName: 'Current User',
          content: 'Hello! How are you?',
          timestamp: new Date(Date.now() - 86400000 + 3600000), // 1 day ago + 1 hour
          read: true
        },
        {
          id: 'msg_1_3',
          conversationId: 'conv_1',
          senderId: 2,
          senderName: 'John Doe',
          content: 'I\'m good, thanks! How about you?',
          timestamp: new Date(Date.now() - 86400000 + 7200000), // 1 day ago + 2 hours
          read: true
        },
        {
          id: 'msg_1_4',
          conversationId: 'conv_1',
          senderId: currentUserId,
          senderName: 'Current User',
          content: 'Doing well, just working on the project.',
          timestamp: new Date(Date.now() - 86400000 + 10800000), // 1 day ago + 3 hours
          read: true
        },
        {
          id: 'msg_1_5',
          conversationId: 'conv_1',
          senderId: 2,
          senderName: 'John Doe',
          content: 'Hey, how are you?',
          timestamp: new Date(Date.now() - 3600000), // 1 hour ago
          read: false
        }
      ],
      'conv_2': [
        {
          id: 'msg_2_1',
          conversationId: 'conv_2',
          senderId: currentUserId,
          senderName: 'Current User',
          content: 'Hi Jane, do you have the quarterly report?',
          timestamp: new Date(Date.now() - 86400000), // 1 day ago
          read: true
        },
        {
          id: 'msg_2_2',
          conversationId: 'conv_2',
          senderId: 3,
          senderName: 'Jane Smith',
          content: 'Yes, I\'ll send it over soon.',
          timestamp: new Date(Date.now() - 86400000 + 3600000), // 1 day ago + 1 hour
          read: true
        },
        {
          id: 'msg_2_3',
          conversationId: 'conv_2',
          senderId: currentUserId,
          senderName: 'Current User',
          content: 'Great, thanks!',
          timestamp: new Date(Date.now() - 86400000 + 7200000), // 1 day ago + 2 hours
          read: true
        },
        {
          id: 'msg_2_4',
          conversationId: 'conv_2',
          senderId: currentUserId,
          senderName: 'Current User',
          content: 'Can you send me the report?',
          timestamp: new Date(Date.now() - 7200000), // 2 hours ago
          read: true
        }
      ],
      'conv_3': [
        {
          id: 'msg_3_1',
          conversationId: 'conv_3',
          senderId: 2,
          senderName: 'John Doe',
          content: 'Hello team!',
          timestamp: new Date(Date.now() - 86400000 * 2), // 2 days ago
          read: true
        },
        {
          id: 'msg_3_2',
          conversationId: 'conv_3',
          senderId: currentUserId,
          senderName: 'Current User',
          content: 'Hi everyone!',
          timestamp: new Date(Date.now() - 86400000 * 2 + 3600000), // 2 days ago + 1 hour
          read: true
        },
        {
          id: 'msg_3_3',
          conversationId: 'conv_3',
          senderId: 3,
          senderName: 'Jane Smith',
          content: 'We need to discuss the project timeline.',
          timestamp: new Date(Date.now() - 86400000 * 2 + 7200000), // 2 days ago + 2 hours
          read: true
        },
        {
          id: 'msg_3_4',
          conversationId: 'conv_3',
          senderId: 4,
          senderName: 'Bob Johnson',
          content: 'I agree, let\'s schedule a meeting.',
          timestamp: new Date(Date.now() - 86400000 + 3600000), // 1 day ago + 1 hour
          read: true
        },
        {
          id: 'msg_3_5',
          conversationId: 'conv_3',
          senderId: 3,
          senderName: 'Jane Smith',
          content: 'Meeting at 3 PM tomorrow',
          timestamp: new Date(Date.now() - 10800000), // 3 hours ago
          read: false
        }
      ]
    };
  }
}
