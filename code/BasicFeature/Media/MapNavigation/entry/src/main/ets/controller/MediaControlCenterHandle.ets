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
import { Logger } from '../utils/Logger';
import audioPlayer from 'libentry.so'
import { MediaControlCenterCallbackAction } from './MediaControlCenterCallbackAction';
import { MediaTools } from './MediaTools';

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

  // Initialize the playback instance class and place it in this method.
  async init() {
    audioPlayer.initPlayer();
  }

  registerCallback() {
    audioPlayer.onPlayStatus((state: number) => {
      Logger.info(TAG, `onPlayStateChange is ${state}`)
      if (state === 2) {
        MediaControlCenterCallbackAction.getInstance().doPauseAction();
      }
      if (state === 1) {
        MediaControlCenterCallbackAction.getInstance().doPlayAction();
      }
    })
  }

  // Load the current pcm information.
  // The pcm information can be obtained from this interface, including fd length offset.
  loadPcmAssent(pcmRawFileDescriptor: resourceManager.RawFileDescriptor) {
    audioPlayer.loadPcmInfo(pcmRawFileDescriptor.fd, pcmRawFileDescriptor.length,
      MediaTools.getMsFromByteLength(pcmRawFileDescriptor.length), pcmRawFileDescriptor.offset);
    this.registerCallback();
  }

  // Execute play
  play() {
    this.isPlaying = true;
    audioPlayer.playPcm();
  }

  // Execute pause
  pause() {
    audioPlayer.pausePcm();
    this.isPlaying = false;
  }

  // Execute stop
  async stop() {
    audioPlayer.stopPcm();
  }

  // Execute release
  release() {
    // 执行release
    audioPlayer.releasePlayer();
  }
}