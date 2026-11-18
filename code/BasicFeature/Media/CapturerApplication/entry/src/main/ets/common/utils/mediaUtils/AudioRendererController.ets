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

import { common } from '@kit.AbilityKit';
import audio from 'libentry.so'
import Logger from '../Logger'
import { APP_ROOT_FILE_PATH } from '../../constants/CommonConstants'
import { PreferencesUtil } from '../PreferencesUtil'
import { RecordingMetadata } from '../../model/RecordingMetadata'
import { resourceManager } from '@kit.LocalizationKit';
import { fileIo } from '@kit.CoreFileKit';
import { AudioState, InterruptHintType } from '../../constants/AudioConstants';
import { MediaTools } from './MediaTools';

const TAG = 'AudioRendererController';

export class AudioRendererController {

  private static capturerController: AudioRendererController;
  private notifyStateChangeCallback?: (state: number, isInterrupt: boolean) => void;
  private interval = 0;
  private recordingFilePath: string = '';
  private recordingFile: fileIo.File | null = null;
  private isPlaying: boolean = false;
  private duration: number = 0;
  private currentMetadata: RecordingMetadata | undefined = undefined;

  public static getInstance(): AudioRendererController {
    if (!AudioRendererController.capturerController) {
      AudioRendererController.capturerController = new AudioRendererController();
    }
    return AudioRendererController.capturerController;
  }

  async init() {
    this.registerInterruptCallback();
    await this.setRendererParams();
    await audio.audioRendererInit();
    await this.loadRecordingInfo();
  }

  async start() {
    Logger.info(TAG, `renderer start`);
    audio.audioRendererStart();
    this.isPlaying = true;
  }

  async pause() {
    Logger.info(TAG, `capturer pause`);
    audio.audioRendererPause();
    this.isPlaying = false;
  }

  async stop() {
    Logger.info(TAG, `capturer stop`);
    audio.audioRendererStop();
    this.isPlaying = false;
  }

  async release() {
    Logger.info(TAG, `capturer release`);
    audio.audioRendererRelease();
    this.isPlaying = false;
    this.duration = 0;
  }

  async setRendererParams() {
    if (this.currentMetadata) {
      audio.setRendererParams(this.currentMetadata.samplingRate, this.currentMetadata.channelCount,
        this.currentMetadata.sampleFormat, this.currentMetadata.isLowLatencyMode);
    } else {
      Logger.error(TAG, `Failed to set metadata`);
    }
  }

  getRecordingMetadata(fileName: string) : RecordingMetadata | undefined {
    const filePath = `${APP_ROOT_FILE_PATH}/${fileName}`;
    this.recordingFilePath = filePath;
    try {
      const metadataKey = `metadata_${fileName}`;
      const metadataJson = PreferencesUtil.getInstance().getValue(metadataKey) as string;
      if (metadataJson) {
        const metadata = JSON.parse(metadataJson) as RecordingMetadata;
        Logger.info(TAG, `Loaded metadata for ${fileName}: ${JSON.stringify(metadata)}`);
        this.currentMetadata = metadata;
        return metadata;
      }
      return undefined;
    } catch (err) {
      Logger.error(TAG, `Failed to get metadata for ${fileName}: ${JSON.stringify(err)}`);
      return undefined;
    }
  }

  registerInterruptCallback() {
    audio.onRendererInterrupt((forceType, hintType) => {
      Logger.info(`renderer interrput hintType: ${hintType}`);
      switch (hintType) {
        case InterruptHintType.INTERRUPT_HINT_PAUSE:
          this.pause();
          if(this.notifyStateChangeCallback) {
            this.notifyStateChangeCallback(AudioState.PAUSED, true);
          }
          break;
        case InterruptHintType.INTERRUPT_HINT_RESUME:
          this.start();
          if(this.notifyStateChangeCallback) {
            this.notifyStateChangeCallback(AudioState.RUNNING, true);
          }
          break;
        case InterruptHintType.INTERRUPT_HINT_STOP:
          this.stop();
          this.release();
          if(this.notifyStateChangeCallback) {
            this.notifyStateChangeCallback(AudioState.STOPPED, true);
          }
          break;
        default:
          break;
      }
    });
    this.onProgress();
  }

  onStateChange(callback: (state: number, isInterrupt: boolean) => void) {
    this.notifyStateChangeCallback = callback;
  }

  onProgress() {
    clearInterval(this.interval);
    this.interval = setInterval(() => {
      if (!this.isPlaying) {
        return;
      }
      let progress = audio.getRendererProgress();
      if (progress == this.duration) {
        this.stop();
        if(this.notifyStateChangeCallback) {
          this.notifyStateChangeCallback(AudioState.STOPPED, false);
        }
      }
      console.info(`progress ${progress}`)
    }, 250);
  }

  async loadRecordingInfo() {
    if (this.recordingFilePath) {
      this.recordingFile = await fileIo.open(this.recordingFilePath, fileIo.OpenMode.READ_ONLY);
      const stat = await fileIo.stat(this.recordingFilePath);
      this.duration = MediaTools.getMsFromByteLength(stat.size)
      audio.loadRendererRecordingInfo(this.recordingFile.fd, stat.size,this.duration, 0);
      console.info(`load ${MediaTools.getMsFromByteLength(stat.size)}`)
    }
  }
}



