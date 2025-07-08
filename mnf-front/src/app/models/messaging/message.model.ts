/**
 * Represents a chat message in the messaging system
 */
export interface Message {
  id: string;
  conversationId: string;
  senderId: number;
  senderName: string;
  content: string;
  timestamp: Date;
  read: boolean;
  attachments?: Attachment[];
}

/**
 * Represents an attachment in a message
 */
export interface Attachment {
  id: string;
  type: 'image' | 'file' | 'link';
  url: string;
  name: string;
  size?: number;
  mimeType?: string;
}
