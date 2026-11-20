/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { resourceManager } from '@kit.LocalizationKit';
import Logger from '../Logger';
import audioPlayer from 'libentry.so'
import { MediaControlCenterCallbackAction } from './MediaControlCenterCallbackAction';
import { PreferencesUtil } from '../PreferencesUtil';
import { DEFAULT_VOLUME, SILENT_ID, VOLUME_ID, EFFECT_ID } from '../../constants/PlayerConstants';

const TAG = 'MediaControlCenterHandle';

export class MediaControlCenterHandle {
  private interval = -1;
  private isPlaying = false;
  private static mediaControlCenterHandle: MediaControlCenterHandle;

  public static getInstance(): MediaControlCenterHandle {
    if (!MediaControlCenterHandle.mediaControlCenterHandle) {
      Logger.info(TAG, 'no mediaControlCenterHandle')
      MediaControlCenterHandle.mediaControlCenterHandle = new MediaControlCenterHandle();
    }
    return MediaControlCenterHandle.mediaControlCenterHandle;
  }

  /**
   * Check whether the native player module (libentry.so) is loaded.
   * In some environments (e.g. ohosTest process) the native module may fail to load;
   * all native calls must be guarded to avoid a process crash.
   */
  private isPlayerReady(): boolean {
    if (!audioPlayer) {
      Logger.error(TAG, 'audioPlayer is undefined, native module libentry.so not loaded');
      return false;
    }
    return true;
  }

  // Initialize the playback instance class and place it in this method.
  async init() {
    if (!this.isPlayerReady()) {
      return;
    }
    audioPlayer.initPlayer();
  }

  async create() {
    await this.init();
  }

  // Use a timer to update the progress bar at 500ms intervals
  // [Start onProgress]
  onProgress() {
    clearInterval(this.interval);
    this.interval = setInterval(() => {
      if (!this.isPlaying) {
        return;
      }
      let progress = audioPlayer.getProgress();
      Logger.info(TAG, `current progress is ${progress}`)
      MediaControlCenterCallbackAction.getInstance().doUpdateProgressAction(progress);
      let duration = Math.floor(AppStorage.get<number>('totalMsTime') ?? 0);
      Logger.info(TAG, `duration is ${duration}`)
      // Duration is unknown until the audio format is parsed. Treating it as 0 would end the song on the
      // first tick and trigger a stop/release/create cycle right after playback starts.
      if (duration > 0 && this.isPlaying && progress >= duration) {
        MediaControlCenterCallbackAction.getInstance().doPlayNextAction();
        clearInterval(this.interval)
      }
    }, 500)
  }
  // [End onProgress]

  registerCallback() {
    if (!this.isPlayerReady()) {
      return;
    }
    audioPlayer.onPlayStatus((state) => {
      Logger.info(TAG, `onPlayStateChange is ${state}`)
      if (state === 4) {
        MediaControlCenterCallbackAction.getInstance().doPlayCompleteAction();
      }
      if (state === 3) {
        MediaControlCenterCallbackAction.getInstance().doStopAction();
      }
      if (state === 2) {
        MediaControlCenterCallbackAction.getInstance().doPauseAction();
      }
      if (state === 1) {
        MediaControlCenterCallbackAction.getInstance().doPlayAction();
      }
    })
    this.onProgress();
  }

  // Load the song information. The song information can be obtained from this interface, including fd length offset
  loadSongAssent(songRawFileDescriptor: resourceManager.RawFileDescriptor, fileName: string) {
    if (!this.isPlayerReady()) {
      return;
    }
    audioPlayer.loadSongInfo(fileName, songRawFileDescriptor.fd, songRawFileDescriptor.length,
    songRawFileDescriptor.offset);

      Logger.info(TAG, `loadSongAssent is ${fileName} fd ${songRawFileDescriptor.fd},
        songFileSize ${songRawFileDescriptor.length}, songOffset ${songRawFileDescriptor.offset}`);
    this.registerCallback();
  }

  // Execute play
  play() {
    if (!this.isPlayerReady()) {
      return;
    }
    this.isPlaying = true;
    audioPlayer.playSong();
  }

  // Set speed
  setSpeed(speed: number) {
    if (!this.isPlayerReady()) {
      return;
    }
    audioPlayer.setPlayingSpeed(speed);
  }

  // Get Volume
  getVolume() {
    let volume: number | undefined;
    volume = PreferencesUtil.getInstance().getValue(VOLUME_ID) as number;
    if (volume === undefined) {
      return DEFAULT_VOLUME;
    } else {
      return volume
    }
  }

  // Set Volume
  setVolume(volume: number) {
    if (!this.isPlayerReady()) {
      return;
    }
    audioPlayer.setPlayingVolume(volume);
    if (!AppStorage.get('isSilentMode') || volume !== 0) {
      PreferencesUtil.getInstance().preferencesPut(VOLUME_ID, volume);
    }
    Logger.info(TAG, `setVolume is ${volume}`)
  }

  // Set whether to mute
  setSilentMode(isSilentMode: boolean) {
    if (!this.isPlayerReady()) {
      return;
    }
    audioPlayer.setSilentMode(isSilentMode);
    PreferencesUtil.getInstance().preferencesPut(SILENT_ID, isSilentMode);
  }

  setEffectMode(isEffectMode: boolean) {
    if (!this.isPlayerReady()) {
      return;
    }
    audioPlayer.setEffectMode(isEffectMode);
    PreferencesUtil.getInstance().preferencesPut(EFFECT_ID, isEffectMode);
  }

  // Execute pause
  pause() {
    if (!this.isPlayerReady()) {
      this.isPlaying = false;
      return;
    }
    audioPlayer.pauseSong();
    this.isPlaying = false;
  }

  // Stop progress update
  stopProgressUpdate() {
    this.isPlaying = false;
    Logger.info(TAG, 'stopProgressUpdate: isPlaying set to false');
  }

  // Execute seek
  seek(ms: number) {
    if (!this.isPlayerReady()) {
      return;
    }
    audioPlayer.seekPlaySong(ms)
  }

  // Execute stop
  async stop() {
    if (!this.isPlayerReady()) {
      return;
    }
    audioPlayer.stopSong();
  }

  // Execute release
  release() {
    clearInterval(this.interval);
    if (!this.isPlayerReady()) {
      return;
    }
    audioPlayer.releasePlayer();
  }

  // Get song duration
  getSongDuration(): number {
    if (!this.isPlayerReady()) {
      return 0;
    }
    return audioPlayer.getSongDuration();
  }
}