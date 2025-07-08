/**
 * Represents a conversation in the messaging system
 */
export interface Conversation {
  id: string;
  title?: string;
  participants: Participant[];
  lastMessage?: {
    content: string;
    senderId: number;
    senderName: string;
    timestamp: Date;
    read: boolean;
  };
  unreadCount: number;
  createdAt: Date;
  updatedAt: Date;
  isGroup: boolean;
}

/**
 * Represents a participant in a conversation
 */
export interface Participant {
  id: number;
  name: string;
  avatar?: string;
  status?: 'online' | 'offline' | 'away' | 'busy';
  lastSeen?: Date;
}
