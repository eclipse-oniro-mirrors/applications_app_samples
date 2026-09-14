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
import { InterruptHintType, AudioState, MUSIC_SAMPLE_RATE, MUSIC_CHANNEL_COUNT,
  MUSIC_SAMPLE_FORMAT, MUSIC_BYTE_RATE, MUSIC_DURATION_MS } from '../../constants/AudioConstants';
import { PROGRESS_REFRESH_INTERVAL_MS, FILE_START_OFFSET } from '../../constants/CommonConstants';
import { common } from '@kit.AbilityKit';
import { resourceManager } from '@kit.LocalizationKit';
import { fileIo } from '@kit.CoreFileKit';

const TAG = 'MusicController';

export class MusicController {
  private static instance: MusicController;
  private notifyStateChangeCallback?: (state: number, isInterrupt: boolean) => void;
  private interval = 0;
  private isPlaying: boolean = false;
  private duration: number = MUSIC_DURATION_MS;
  private context: common.UIAbilityContext | undefined = AppStorage.get('context');
  private musicFile: fileIo.File | null = null;

  public static getInstance(): MusicController {
    if (!MusicController.instance) {
      MusicController.instance = new MusicController();
    }
    return MusicController.instance;
  }

  async init() {
    this.registerInterruptCallback();
    audio.setMusicRendererParams(MUSIC_SAMPLE_RATE, MUSIC_CHANNEL_COUNT, MUSIC_SAMPLE_FORMAT, false);
    await audio.musicRendererInit();
    await this.loadMusicInfo();
  }

  async start() {
    Logger.info(TAG, `music start`);
    audio.resetMusicFileOffset();
    audio.musicRendererStart();
    this.isPlaying = true;
    if (this.notifyStateChangeCallback) {
      this.notifyStateChangeCallback(AudioState.RUNNING, false);
    }
  }

  async pause() {
    Logger.info(TAG, `music pause`);
    audio.musicRendererPause();
    this.isPlaying = false;
    if (this.notifyStateChangeCallback) {
      this.notifyStateChangeCallback(AudioState.PAUSED, false);
    }
  }

  async stop() {
    Logger.info(TAG, `music stop`);
    audio.musicRendererStop();
    this.isPlaying = false;
    if (this.notifyStateChangeCallback) {
      this.notifyStateChangeCallback(AudioState.STOPPED, false);
    }
  }

  async release() {
    Logger.info(TAG, `music release`);
    audio.musicRendererRelease();
    this.isPlaying = false;
    this.duration = MUSIC_DURATION_MS;
  }

  onStateChange(callback: (state: number, isInterrupt: boolean) => void) {
    this.notifyStateChangeCallback = callback;
  }

  registerInterruptCallback() {
    audio.onMusicInterrupt((forceType: number, hintType: number) => {
      Logger.info(TAG, `Music interrupt: forceType: ${forceType}, hintType: ${hintType}`);
      switch (hintType) {
        case InterruptHintType.INTERRUPT_HINT_DUCK:
          this.isPlaying = true;
          if (this.notifyStateChangeCallback) {
            this.notifyStateChangeCallback(AudioState.DUCKED, true);
          }
          break;
        case InterruptHintType.INTERRUPT_HINT_UNDUCK:
          if (this.notifyStateChangeCallback) {
            this.notifyStateChangeCallback(AudioState.UNDUCKED, true);
          }
          break;
        case InterruptHintType.INTERRUPT_HINT_PAUSE:
          audio.musicRendererPause();
          this.isPlaying = false;
          if (this.notifyStateChangeCallback) {
            this.notifyStateChangeCallback(AudioState.PAUSED, true);
          }
          break;
        case InterruptHintType.INTERRUPT_HINT_RESUME:
          audio.musicRendererStart();
          this.isPlaying = true;
          if (this.notifyStateChangeCallback) {
            this.notifyStateChangeCallback(AudioState.RUNNING, true);
          }
          break;
        case InterruptHintType.INTERRUPT_HINT_STOP:
          audio.musicRendererStop();
          audio.musicRendererRelease();
          this.isPlaying = false;
          if (this.notifyStateChangeCallback) {
            this.notifyStateChangeCallback(AudioState.STOPPED, true);
          }
          break;
        default:
          break;
      }
    });
    this.onProgress();
  }

  onProgress() {
    clearInterval(this.interval);
    this.interval = setInterval(() => {
      if (!this.isPlaying) {
        return;
      }
      let progress: number = audio.getMusicProgress();
      if (progress >= this.duration) {
        this.stop();
      }
    }, PROGRESS_REFRESH_INTERVAL_MS);
  }

  async loadMusicInfo() {
    if (this.context) {
      const rawFile = await this.context.resourceManager.getRawFileContent('music_sample.pcm');
      const filesDir = this.context.filesDir;
      const filePath = `${filesDir}/music_sample.pcm`;
      const writeFile = await fileIo.open(filePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.WRITE_ONLY);
      await fileIo.write(writeFile.fd, rawFile.buffer as ArrayBuffer);
      await fileIo.close(writeFile.fd);

      this.musicFile = await fileIo.open(filePath, fileIo.OpenMode.READ_ONLY);
      const stat = await fileIo.stat(filePath);
      this.duration = MUSIC_DURATION_MS;
      audio.loadMusicInfo(this.musicFile.fd, stat.size, this.duration, FILE_START_OFFSET);
    }
  }
}
