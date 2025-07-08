import { Component, OnInit, Inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { MatDialogModule, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatDividerModule } from '@angular/material/divider';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatSnackBar } from '@angular/material/snack-bar';
import { TranslatePipe } from '../../../pipes/translate.pipe';
import { AuthService } from '../../../services/auth.service';
import { UserService } from '../../../services/admin/user.service';
import { FavoritesService, Favorite } from '../../../services/favorites/favorites.service';
import { ChannelService, Channel, ChannelInvitation } from '../../../services/channel/channel.service';

export interface ChannelInviteDialogData {
  channelId?: number;
  createNewChannel?: boolean;
}

@Component({
  selector: 'app-channel-invite-dialog',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    MatDialogModule,
    MatButtonModule,
    MatIconModule,
    MatInputModule,
    MatFormFieldModule,
    MatDividerModule,
    MatProgressSpinnerModule,
    TranslatePipe
  ],
  templateUrl: './channel-invite-dialog.html',
  styleUrl: './channel-invite-dialog.css'
})
export class ChannelInviteDialogComponent implements OnInit {
  // All users
  users: any[] = [];
  filteredUsers: any[] = [];
  searchTerm: string = '';

  // Favorites
  favorites: Favorite[] = [];

  // Channel
  channel: Channel | null = null;
  channelName: string = '';
  channelMembers: number[] = [];
  invitedUsers: number[] = [];

  // Loading states
  loadingUsers: boolean = true;
  loadingFavorites: boolean = true;
  loadingChannel: boolean = false;
  creatingChannel: boolean = false;
  invitingUsers: boolean = false;

  // Error states
  userError: string = '';
  favoriteError: string = '';
  channelError: string = '';

  // Mode
  createNewChannel: boolean = false;

  constructor(
    private dialogRef: MatDialogRef<ChannelInviteDialogComponent>,
    @Inject(MAT_DIALOG_DATA) private data: ChannelInviteDialogData,
    private authService: AuthService,
    private userService: UserService,
    private favoritesService: FavoritesService,
    private channelService: ChannelService,
    private snackBar: MatSnackBar
  ) {
    this.createNewChannel = data.createNewChannel || false;
  }

  ngOnInit(): void {
    this.loadUsers();
    this.loadFavorites();

    if (!this.createNewChannel && this.data.channelId) {
      this.loadChannel(this.data.channelId);
    }
  }

  /**
   * Load channel details
   */
  loadChannel(channelId: number): void {
    this.loadingChannel = true;
    this.channelService.getChannel(channelId)
      .then(channel => {
        this.channel = channel;
        if (channel) {
          this.channelName = channel.name;
          return this.channelService.getChannelMembers(channel.id);
        }
        return Promise.resolve([]);
      })
      .then(members => {
        this.channelMembers = members.map(m => m.userId);
        this.loadingChannel = false;
      })
      .catch(error => {
        this.channelError = 'Failed to load channel';
        this.loadingChannel = false;
        console.error('Error loading channel:', error);
      });
  }

  /**
   * Load all users
   */
  loadUsers(): void {
    this.loadingUsers = true;
    this.userService.getUsers()
      .then(users => {
        this.users = users;
        this.applyFilter();
        this.loadingUsers = false;
      })
      .catch(error => {
        this.userError = 'Failed to load users';
        this.loadingUsers = false;
        console.error('Error loading users:', error);
      });
  }

  /**
   * Load favorites for the current user
   */
  loadFavorites(): void {
    const currentUser = this.authService.currentUserValue;
    if (!currentUser) {
      this.loadingFavorites = false;
      return;
    }

    this.loadingFavorites = true;
    this.favoritesService.getFavorites(currentUser.id)
      .then(favorites => {
        this.favorites = favorites;
        this.loadingFavorites = false;
      })
      .catch(error => {
        this.favoriteError = 'Failed to load favorites';
        this.loadingFavorites = false;
        console.error('Error loading favorites:', error);
      });
  }

  /**
   * Apply search filter to users
   */
  applyFilter(): void {
    if (!this.searchTerm.trim()) {
      this.filteredUsers = [...this.users];
    } else {
      const searchTermLower = this.searchTerm.toLowerCase().trim();
      this.filteredUsers = this.users.filter(user =>
        user.name.toLowerCase().includes(searchTermLower)
      );
    }
  }

  /**
   * Check if a user is in favorites
   */
  isInFavorites(userId: number): boolean {
    return this.favorites.some(fav => fav.favoriteUserId === userId);
  }

  /**
   * Check if a user is already a member of the channel
   */
  isChannelMember(userId: number): boolean {
    return this.channelMembers.includes(userId);
  }

  /**
   * Check if a user is already invited
   */
  isInvited(userId: number): boolean {
    return this.invitedUsers.includes(userId);
  }

  /**
   * Get favorite users that are not already members
   */
  get availableFavoriteUsers(): any[] {
    return this.filteredUsers.filter(user =>
      this.isInFavorites(user.id) &&
      !this.isChannelMember(user.id) &&
      user.id !== this.authService.currentUserValue?.id
    );
  }

  /**
   * Get non-favorite users that are not already members
   */
  get availableOtherUsers(): any[] {
    return this.filteredUsers.filter(user =>
      !this.isInFavorites(user.id) &&
      !this.isChannelMember(user.id) &&
      user.id !== this.authService.currentUserValue?.id
    );
  }

  /**
   * Toggle selection of a user for invitation
   */
  toggleUserSelection(userId: number): void {
    const index = this.invitedUsers.indexOf(userId);
    if (index === -1) {
      this.invitedUsers.push(userId);
    } else {
      this.invitedUsers.splice(index, 1);
    }
  }

  /**
   * Create a new channel and invite selected users
   */
  createChannelAndInviteUsers(): void {
    if (!this.channelName.trim()) {
      this.snackBar.open('Please enter a channel name', 'Close', { duration: 3000 });
      return;
    }

    if (this.invitedUsers.length === 0) {
      this.snackBar.open('Please select at least one user to invite', 'Close', { duration: 3000 });
      return;
    }

    const currentUser = this.authService.currentUserValue;
    if (!currentUser) {
      this.snackBar.open('You must be logged in to create a channel', 'Close', { duration: 3000 });
      return;
    }

    this.creatingChannel = true;
    this.channelService.createChannel(this.channelName, currentUser.id)
      .then(channel => {
        this.channel = channel;
        return this.inviteUsers(channel.id);
      })
      .then(() => {
        this.snackBar.open('Channel created and invitations sent', 'Close', { duration: 3000 });
        this.dialogRef.close(true);
      })
      .catch(error => {
        this.snackBar.open('Failed to create channel', 'Close', { duration: 3000 });
        this.creatingChannel = false;
        console.error('Error creating channel:', error);
      });
  }

  /**
   * Invite selected users to the existing channel
   */
  inviteUsersToChannel(): void {
    if (!this.channel) {
      this.snackBar.open('No channel selected', 'Close', { duration: 3000 });
      return;
    }

    if (this.invitedUsers.length === 0) {
      this.snackBar.open('Please select at least one user to invite', 'Close', { duration: 3000 });
      return;
    }

    const currentUser = this.authService.currentUserValue;
    if (!currentUser) {
      this.snackBar.open('You must be logged in to invite users', 'Close', { duration: 3000 });
      return;
    }

    this.invitingUsers = true;
    this.inviteUsers(this.channel.id)
      .then(() => {
        this.snackBar.open('Invitations sent successfully', 'Close', { duration: 3000 });
        this.dialogRef.close(true);
      })
      .catch(error => {
        this.snackBar.open('Failed to send invitations', 'Close', { duration: 3000 });
        this.invitingUsers = false;
        console.error('Error inviting users:', error);
      });
  }

  /**
   * Invite users to a channel
   */
  private inviteUsers(channelId: number): Promise<ChannelInvitation[]> {
    const currentUser = this.authService.currentUserValue;
    if (!currentUser) {
      return Promise.reject('No authenticated user');
    }

    const invitationPromises = this.invitedUsers.map(userId =>
      this.channelService.inviteUserToChannel(channelId, userId, currentUser.id)
    );

    return Promise.all(invitationPromises);
  }

  /**
   * Close the dialog
   */
  close(): void {
    this.dialogRef.close();
  }
}
