import { Component, OnInit } from "@angular/core";
import { CommonModule } from "@angular/common";
import { MaterialModules } from "../../../material/material";
import { CodeComponent } from "../../../components/user/lobby/code/code";
import { ChapitreList } from "../../../components/user/lobby/chapitre-list/chapitre-list";
import { MatDialog } from "@angular/material/dialog";
import { ChannelInviteDialogComponent } from "../../../components/user/channel-invite-dialog/channel-invite-dialog";
import { AuthService } from "../../../services/auth.service";
import { ChannelService, Channel } from "../../../services/channel/channel.service";

@Component({
  selector: "app-lobby",
  standalone: true,
  imports: [CommonModule, MaterialModules, CodeComponent, ChapitreList],
  templateUrl: "./lobby.html",
  styleUrls: ["./lobby.css"],
})
export class LobbyPage implements OnInit {
  channels: Channel[] = [];
  currentChannel: Channel | null = null;
  loading = false;

  constructor(
    private dialog: MatDialog,
    private authService: AuthService,
    private channelService: ChannelService
  ) {}

  ngOnInit(): void {
    this.loadUserChannels();
  }

  /**
   * Load channels for the current user
   */
  loadUserChannels(): void {
    const currentUser = this.authService.currentUserValue;
    if (!currentUser) return;

    this.loading = true;
    this.channelService.getUserChannels(currentUser.id)
      .then(channels => {
        this.channels = channels;
        if (channels.length > 0) {
          this.currentChannel = channels[0];
        }
        this.loading = false;
      })
      .catch(error => {
        console.error('Error loading channels:', error);
        this.loading = false;
      });
  }

  /**
   * Open the channel invite dialog
   */
  openChannelInviteDialog(): void {
    const dialogRef = this.dialog.open(ChannelInviteDialogComponent, {
      width: '600px',
      maxHeight: '80vh',
      autoFocus: false,
      data: {
        channelId: this.currentChannel?.id,
        createNewChannel: !this.currentChannel
      }
    });

    dialogRef.afterClosed().subscribe(result => {
      if (result) {
        this.loadUserChannels();
      }
    });
  }
}
