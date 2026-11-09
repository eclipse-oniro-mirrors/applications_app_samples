/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { UIContext } from '@kit.ArkUI';
import player, { MediaTrackInfo } from 'libplayer.so';
import { CommonConstants as Const } from '../common/CommonConstants';
import { LocalizedText } from '../common/LocalizedText';
import { getPickerSelectedIndex } from '../common/utils/MediaUtils';
import { PlayerSettingsModel } from '../model/PlayerSettingsModel';

export class PlaybackAudioController {
  private ui: () => UIContext;
  private settings: PlayerSettingsModel;
  private rejectWhileSeeking: () => boolean;
  private getText: (resource: Resource) => string;
  private onTrackChanged: () => void;
  private isMuted: () => boolean;
  private setMuted: (muted: boolean) => void;
  private getVolumeBeforeMute: () => number;
  private setVolumeBeforeMute: (volume: number) => void;

  constructor(ui: () => UIContext, settings: PlayerSettingsModel,
    rejectWhileSeeking: () => boolean, getText: (resource: Resource) => string,
    onTrackChanged: () => void, isMuted: () => boolean, setMuted: (muted: boolean) => void,
    getVolumeBeforeMute: () => number, setVolumeBeforeMute: (volume: number) => void) {
    this.ui = ui;
    this.settings = settings;
    this.rejectWhileSeeking = rejectWhileSeeking;
    this.getText = getText;
    this.onTrackChanged = onTrackChanged;
    this.isMuted = isMuted;
    this.setMuted = setMuted;
    this.getVolumeBeforeMute = getVolumeBeforeMute;
    this.setVolumeBeforeMute = setVolumeBeforeMute;
  }

  private formatTrackLabel(track: MediaTrackInfo, position: number): string {
    const details: string[] = [];
    if (track.codecMime.length > 0) {
      details.push(track.codecMime);
    }
    if (track.audioSampleRate > 0) {
      details.push((track.audioSampleRate / 1000).toFixed(1) + ' kHz');
    }
    if (track.audioChannelCount > 0) {
      details.push(track.audioChannelCount + this.getText($r('app.string.playback_audio_channel_unit')));
    }
    if (track.bitrate > 0) {
      details.push((track.bitrate / 1000).toFixed(0) + ' kbps');
    }
    const label = this.getText($r('app.string.playback_audio_track')) + ' ' + (position + 1) +
      ' (ID ' + track.index + ')';
    return details.length > 0 ? label + ' | ' + details.join(' | ') : label;
  }

  selectTrack(): void {
    if (this.rejectWhileSeeking()) {
      return;
    }
    let tracks: MediaTrackInfo[] = [];
    try {
      tracks = player.getMediaInfo().tracks.filter(
        (track: MediaTrackInfo): boolean => track.type === 0
      );
    } catch (error) {
      this.ui().getPromptAction().showToast({
        message: $r('app.string.playback_audio_track_failed'), duration: Const.DURATION, bottom: Const.BOTTOM
      });
      return;
    }
    if (tracks.length <= 1) {
      this.ui().getPromptAction().showToast({ message: $r('app.string.playback_no_audio_track') });
      return;
    }
    const labels: string[] = tracks.map(
      (track: MediaTrackInfo, index: number): string => this.formatTrackLabel(track, index));
    this.ui().showTextPickerDialog({
      range: labels,
      canLoop: false,
      selected: Math.max(0,
        tracks.findIndex((track: MediaTrackInfo): boolean => track.index === this.settings.audioTrackIndex)),
      onAccept: (value: TextPickerResult): void => {
        const selected: number = getPickerSelectedIndex(value.index);
        if (selected < 0 || selected >= tracks.length || this.rejectWhileSeeking()) {
          return;
        }
        if (!player.selectAudioTrack(tracks[selected].index)) {
          this.ui().getPromptAction().showToast({
            message: $r('app.string.playback_audio_track_unsupported'),
            duration: Const.DURATION,
            bottom: Const.BOTTOM
          });
          return;
        }
        this.settings.audioTrackIndex = tracks[selected].index;
        this.onTrackChanged();
        this.ui().getPromptAction().showToast({
          message: labels[selected] + this.getText($r('app.string.playback_audio_track_switched')),
          duration: Const.DURATION,
          bottom: Const.BOTTOM
        });
      }
    });
  }

  toggleMute(): void {
    if (this.rejectWhileSeeking()) {
      return;
    }
    if (this.isMuted()) {
      player.setVolume(this.getVolumeBeforeMute() / 100);
      this.setMuted(false);
      return;
    }
    this.setVolumeBeforeMute(this.settings.audioVolume);
    player.setVolume(0);
    this.setMuted(true);
  }
}
