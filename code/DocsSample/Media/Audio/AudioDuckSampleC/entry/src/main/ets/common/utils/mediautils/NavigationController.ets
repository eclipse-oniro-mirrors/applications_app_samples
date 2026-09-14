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
import audio from 'libentry.so';
import Logger from '../Logger';
import { InterruptHintType, AudioState, NAV_SAMPLE_RATE, NAV_CHANNEL_COUNT,
  NAV_SAMPLE_FORMAT, NAV_DURATION_MS } from '../../constants/AudioConstants';
import { PROGRESS_REFRESH_INTERVAL_MS, FILE_START_OFFSET } from '../../constants/CommonConstants';
import { common } from '@kit.AbilityKit';
import { fileIo } from '@kit.CoreFileKit';

const TAG = 'NavigationController';

export class NavigationController {
  private static instance: NavigationController;
  private notifyStateChangeCallback?: (state: number, isInterrupt: boolean) => void;
  private onPlaybackEndCallback?: () => void;
  private interval = 0;
  private isNavigating: boolean = false;
  private useDuckSession: boolean = false;
  private duration: number = NAV_DURATION_MS;
  private navFile: fileIo.File | null = null;
  private context: common.UIAbilityContext | undefined = AppStorage.get('context');

  public static getInstance(): NavigationController {
    if (!NavigationController.instance) {
      NavigationController.instance = new NavigationController();
    }
    return NavigationController.instance;
  }

  async init(useDuckSession: boolean = false) {
    this.useDuckSession = useDuckSession;
    this.registerInterruptCallback();
    audio.setNavRendererParams(NAV_SAMPLE_RATE, NAV_CHANNEL_COUNT, NAV_SAMPLE_FORMAT, false);
    audio.navRendererInit();
    await this.loadNavInfo();
    this.onProgress();
  }

  onPlaybackEnd(callback: () => void) {
    this.onPlaybackEndCallback = callback;
  }

  async start() {
    Logger.info(TAG, `nav start`);
    audio.resetNavFileOffset();
    audio.navRendererStart();
    this.isNavigating = true;
    if (this.notifyStateChangeCallback) {
      this.notifyStateChangeCallback(AudioState.RUNNING, false);
    }
  }

  async stop() {
    Logger.info(TAG, `nav stop`);
    audio.navRendererStop();
    this.isNavigating = false;
    if (this.notifyStateChangeCallback) {
      this.notifyStateChangeCallback(AudioState.STOPPED, false);
    }
  }

  async finishWithDuckSession() {
    Logger.info(TAG, `nav finish with duck session`);
    audio.navRendererStop();
    this.isNavigating = false;
    this.useDuckSession = false;
    if (this.notifyStateChangeCallback) {
      this.notifyStateChangeCallback(AudioState.STOPPED, false);
    }
  }

  async release() {
    Logger.info(TAG, `nav release`);
    audio.navRendererRelease();
    this.isNavigating = false;
    this.duration = NAV_DURATION_MS;
  }

  onStateChange(callback: (state: number, isInterrupt: boolean) => void) {
    this.notifyStateChangeCallback = callback;
  }

  onProgress() {
    clearInterval(this.interval);
    this.interval = setInterval(() => {
      if (!this.isNavigating) {
        return;
      }
      let progress: number = audio.getNavProgress();
      if (progress >= this.duration) {
        if (this.onPlaybackEndCallback) {
          this.onPlaybackEndCallback();
        } else {
          this.stop();
        }
      }
    }, PROGRESS_REFRESH_INTERVAL_MS);
  }

  registerInterruptCallback() {
    audio.onNavInterrupt((forceType: number, hintType: number) => {
      Logger.info(TAG, `Nav interrupt: forceType: ${forceType}, hintType: ${hintType}`);
      switch (hintType) {
        case InterruptHintType.INTERRUPT_HINT_PAUSE:
          audio.navRendererStop();
          this.isNavigating = false;
          if (this.notifyStateChangeCallback) {
            this.notifyStateChangeCallback(AudioState.PAUSED, true);
          }
          break;
        case InterruptHintType.INTERRUPT_HINT_RESUME:
          audio.navRendererStart();
          this.isNavigating = true;
          if (this.notifyStateChangeCallback) {
            this.notifyStateChangeCallback(AudioState.RUNNING, true);
          }
          break;
        case InterruptHintType.INTERRUPT_HINT_STOP:
          audio.navRendererStop();
          this.isNavigating = false;
          if (this.notifyStateChangeCallback) {
            this.notifyStateChangeCallback(AudioState.STOPPED, true);
          }
          break;
        default:
          break;
      }
    });
  }

  async loadNavInfo() {
    if (this.context) {
      const rawFile = await this.context.resourceManager.getRawFileContent('nav_sample.pcm');
      const filesDir = this.context.filesDir;
      const filePath = `${filesDir}/nav_sample.pcm`;
      const writeFile = await fileIo.open(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.WRITE_ONLY);
      await fileIo.write(writeFile.fd, rawFile.buffer as ArrayBuffer);
      await fileIo.close(writeFile.fd);

      this.navFile = await fileIo.open(filePath, fileIo.OpenMode.READ_ONLY);
      const stat = await fileIo.stat(filePath);
      audio.loadNavInfo(this.navFile.fd, stat.size, NAV_DURATION_MS, FILE_START_OFFSET);
    }
  }
}
