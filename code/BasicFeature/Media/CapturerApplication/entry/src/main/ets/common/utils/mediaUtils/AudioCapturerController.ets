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

import audio from 'libentry.so'
import Logger from '../Logger'
import { APP_ROOT_FILE_PATH } from '../../constants/CommonConstants'
import { AudioSamplingRate, AudioChannel, AudioSampleFormat, InterruptHintType, AudioState} from '../../constants/AudioConstants'
import { PreferencesUtil } from '../PreferencesUtil'
import { RecordingMetadata } from '../../model/RecordingMetadata'
import { BackgroundUtil } from './BackgroundUtil'
import { common } from '@kit.AbilityKit'
import { fileIo } from '@kit.CoreFileKit'

const TAG = 'AudioCapturerController';

export class AudioCapturerController {

  private static capturerController: AudioCapturerController;
  private context: common.UIAbilityContext | undefined = AppStorage.get('context');
  private isLowLatency: boolean = false;
  private sampleRate: number = AudioSamplingRate.SAMPLE_RATE_48000;
  private channelCount: number = AudioChannel.STEREO;
  private sampleFormat: number = AudioSampleFormat.S16LE;
  private recordingFilePath: string = '';
  private recordingFile: fileIo.File | null = null;
  private notifyStateChangeCallback?: (state: number) => void;

  public static getInstance(): AudioCapturerController {
    if (!AudioCapturerController.capturerController) {
      Logger.info(TAG, 'no capturerController')
      AudioCapturerController.capturerController = new AudioCapturerController();
    }
    return AudioCapturerController.capturerController;
  }

  async init() {
    Logger.info(TAG, `capturer init`);
    this.createFilePath();
    this.registerInterruptCallback();
    await audio.audioCapturerInit();
    await this.loadRecordingInfo();
  }

  async start() {
    Logger.info(TAG, `capturer start`);
    BackgroundUtil.startContinuousTask(this.context);
    audio.audioCapturerStart();
    try{
      this.saveRecordingMetadata();
    } catch (e) {
      Logger.error(TAG, `capturer stop ${e}`);
    }
  }

  async pause() {
    Logger.info(TAG, `capturer pause`);
    audio.audioCapturerPause();
  }

  async stop() {
    Logger.info(TAG, `capturer stop`);
    audio.audioCapturerStop();
    BackgroundUtil.stopContinuousTask(this.context!);
  }

  async release() {
    Logger.info(TAG, `capturer release`);
    audio.audioCapturerRelease();
  }

  createFilePath() {
    const now = new Date();
    const timestamp = `${now.getMonth()+1}-${now.getDate()}-${now.getHours()}:${now.getMinutes()}:${now.getSeconds()}`;
    this.recordingFilePath = `${APP_ROOT_FILE_PATH}/recording_${timestamp}.pcm`;
  }

  setAudioParams(sourceType: number, samplingRate: number, channelCount: number,
    sampleFormat: number, isLowLatency: boolean) {
    Logger.info(TAG, `capturer setAudioParams ${samplingRate} ${channelCount}`);
    this.sampleRate = samplingRate;
    this.channelCount = channelCount;
    this.sampleFormat = sampleFormat;
    audio.setCapturerParams(sourceType, samplingRate, channelCount, sampleFormat, isLowLatency);
  }

  private async saveRecordingMetadata() {
    if (!this.recordingFilePath) {
      Logger.warn(TAG, 'No file path to save metadata');
      return;
    }

    const fileName = this.recordingFilePath.split('/').pop() || '';
    const metadata: RecordingMetadata = {
      isLowLatencyMode: this.isLowLatency,
      samplingRate: this.sampleRate,
      channelCount: this.channelCount,
      sampleFormat: this.sampleFormat
    };

    PreferencesUtil.getInstance().preferencesPut(`metadata_${fileName}`, JSON.stringify(metadata));
    Logger.info(TAG, `Saved metadata for ${fileName}`);
  }

  onStateChange(callback: (state: number) => void) {
    this.notifyStateChangeCallback = callback;
  }

  registerInterruptCallback() {
    audio.onCapturerInterrupt((forceType, hintType) => {
      Logger.info(TAG, `Capturer audioInterrupt: hintType: ${hintType}`);
      switch (hintType) {
        case InterruptHintType.INTERRUPT_HINT_PAUSE:
          this.pause();
          if(this.notifyStateChangeCallback) {
            this.notifyStateChangeCallback(AudioState.PAUSED);
          }
          break;
        case InterruptHintType.INTERRUPT_HINT_RESUME:
          this.start();
          if(this.notifyStateChangeCallback) {
            this.notifyStateChangeCallback(AudioState.RUNNING);
          }
          break;
        case InterruptHintType.INTERRUPT_HINT_STOP:
          this.stop();
          this.release();
          if(this.notifyStateChangeCallback) {
            this.notifyStateChangeCallback(AudioState.STOPPED);
          }
          break;
        case InterruptHintType.INTERRUPT_HINT_MUTE:
          if(this.notifyStateChangeCallback) {
            this.notifyStateChangeCallback(AudioState.MUTED);
          }
          break;
        case InterruptHintType.INTERRUPT_HINT_UNMUTE:
          if(this.notifyStateChangeCallback) {
            this.notifyStateChangeCallback(AudioState.UNMUTED);
          }
          break;
        default:
          break;
      }
    });
  }

  async loadRecordingInfo() {
    if (this.recordingFilePath) {
      this.recordingFile = await fileIo.open(this.recordingFilePath,
        fileIo.OpenMode.CREATE | fileIo.OpenMode.WRITE_ONLY);
      audio.loadCapturerRecordingInfo(this.recordingFile.fd);
    }
  }
}



