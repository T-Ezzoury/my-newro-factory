import { Injectable } from '@angular/core';
import { ApiService } from '../api.service';
import { BehaviorSubject, Observable } from 'rxjs';
import { User } from '../../models/user.model';

export interface Channel {
  id: number;
  name: string;
  ownerId: number;
  createdAt?: string;
}

export interface ChannelInvitation {
  id: number;
  channelId: number;
  userId: number;
  invitedById: number;
  status: 'pending' | 'accepted' | 'declined';
  createdAt?: string;
}

export interface ChannelMember {
  id: number;
  channelId: number;
  userId: number;
  user?: User;
  role: 'owner' | 'member';
  joinedAt?: string;
}

@Injectable({
  providedIn: 'root'
})
export class ChannelService {
  private channelsSubject: BehaviorSubject<Channel[]>;
  public channels$: Observable<Channel[]>;

  private invitationsSubject: BehaviorSubject<ChannelInvitation[]>;
  public invitations$: Observable<ChannelInvitation[]>;

  private membersSubject: BehaviorSubject<ChannelMember[]>;
  public members$: Observable<ChannelMember[]>;


  constructor(private apiService: ApiService) {
    this.channelsSubject = new BehaviorSubject<Channel[]>([]);
    this.channels$ = this.channelsSubject.asObservable();

    this.invitationsSubject = new BehaviorSubject<ChannelInvitation[]>([]);
    this.invitations$ = this.invitationsSubject.asObservable();

    this.membersSubject = new BehaviorSubject<ChannelMember[]>([]);
    this.members$ = this.membersSubject.asObservable();
  }

  /**
   * Get all channels for the current user
   * @param userId The current user's ID
   * @returns Promise with the channels
   */
  getUserChannels(userId: number): Promise<Channel[]> {
    return this.apiService.get<Channel[]>(`api/channels?userId=${userId}`)
      .then(response => {
        const channels = response.data;
        this.channelsSubject.next(channels);
        return channels;
      });
  }

  /**
   * Get a channel by ID
   * @param channelId The channel ID
   * @returns Promise with the channel
   */
  getChannel(channelId: number): Promise<Channel | null> {
    return this.apiService.get<Channel>(`api/channels/${channelId}`)
      .then(response => response.data)
      .catch(error => {
        console.error('Error fetching channel:', error);
        return null;
      });
  }

  /**
   * Create a new channel
   * @param name The channel name
   * @param ownerId The ID of the user creating the channel
   * @returns Promise with the created channel
   */
  createChannel(name: string, ownerId: number): Promise<Channel> {
    return this.apiService.post<Channel>('api/channels', { name, ownerId })
      .then(response => {
        const newChannel = response.data;

        // Update the channels subject with the new channel
        const currentChannels = this.channelsSubject.value;
        this.channelsSubject.next([...currentChannels, newChannel]);

        return newChannel;
      });
  }

  /**
   * Get all members of a channel
   * @param channelId The channel ID
   * @returns Promise with the channel members
   */
  getChannelMembers(channelId: number): Promise<ChannelMember[]> {
    return this.apiService.get<ChannelMember[]>(`api/channels/${channelId}/members`)
      .then(response => {
        const members = response.data;

        // Update the members subject with the channel members
        this.membersSubject.next(members);

        return members;
      });
  }

  /**
   * Invite a user to a channel
   * @param channelId The channel ID
   * @param userId The ID of the user to invite
   * @param invitedById The ID of the user sending the invitation
   * @returns Promise with the created invitation
   */
  inviteUserToChannel(channelId: number, userId: number, invitedById: number): Promise<ChannelInvitation> {
    return this.apiService.post<ChannelInvitation>('api/channel-invitations', { channelId, userId, invitedById })
      .then(response => {
        const newInvitation = response.data;

        // Update the invitations subject with the new invitation
        const currentInvitations = this.invitationsSubject.value;
        this.invitationsSubject.next([...currentInvitations, newInvitation]);

        return newInvitation;
      });
  }

  /**
   * Get all invitations for a user
   * @param userId The user ID
   * @returns Promise with the invitations
   */
  getUserInvitations(userId: number): Promise<ChannelInvitation[]> {
    return this.apiService.get<ChannelInvitation[]>(`api/channel-invitations?userId=${userId}`)
      .then(response => {
        const invitations = response.data;

        // Update the invitations subject with the user's invitations
        this.invitationsSubject.next(invitations);

        return invitations;
      });
  }

  /**
   * Accept a channel invitation
   * @param invitationId The invitation ID
   * @returns Promise with the updated invitation
   */
  acceptInvitation(invitationId: number): Promise<ChannelInvitation | null> {
    return this.apiService.put<ChannelInvitation>(`api/channel-invitations/${invitationId}/accept`)
      .then(response => {
        const updatedInvitation = response.data;

        // Update the invitations subject with the updated invitation
        const currentInvitations = this.invitationsSubject.value;
        const updatedInvitations = currentInvitations.map(inv =>
          inv.id === invitationId ? updatedInvitation : inv
        );
        this.invitationsSubject.next(updatedInvitations);

        // Refresh the channel members since a new member was added
        if (updatedInvitation.channelId) {
          this.getChannelMembers(updatedInvitation.channelId);
        }

        return updatedInvitation;
      })
      .catch(error => {
        console.error('Error accepting invitation:', error);
        return null;
      });
  }

  /**
   * Decline a channel invitation
   * @param invitationId The invitation ID
   * @returns Promise with the updated invitation
   */
  declineInvitation(invitationId: number): Promise<ChannelInvitation | null> {
    return this.apiService.put<ChannelInvitation>(`api/channel-invitations/${invitationId}/decline`)
      .then(response => {
        const updatedInvitation = response.data;

        // Update the invitations subject with the updated invitation
        const currentInvitations = this.invitationsSubject.value;
        const updatedInvitations = currentInvitations.map(inv =>
          inv.id === invitationId ? updatedInvitation : inv
        );
        this.invitationsSubject.next(updatedInvitations);

        return updatedInvitation;
      })
      .catch(error => {
        console.error('Error declining invitation:', error);
        return null;
      });
  }

  /**
   * Remove a member from a channel
   * @param channelId The channel ID
   * @param userId The user ID to remove
   * @returns Promise with a boolean indicating success
   */
  removeMember(channelId: number, userId: number): Promise<boolean> {
    return this.apiService.delete(`api/channels/${channelId}/members/${userId}`)
      .then(() => {
        // Refresh the channel members after removing a member
        this.getChannelMembers(channelId);
        return true;
      })
      .catch(error => {
        console.error('Error removing member:', error);
        return false;
      });
  }
}
