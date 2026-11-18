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

import { audio } from '@kit.AudioKit';
import { WriteOptions, fileIo } from '@kit.CoreFileKit';
import { util } from '@kit.ArkTS';
import { Constants } from '../common/Constants';
import { audioStateString } from '../utils/StringUtil';
import { Logger } from '../utils/Logger';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = 'AudioCapturerManager';

export class AudioCapturerManager {
  private context: Context;
  private tmpPath: string = '';
  private recordFile?: fileIo.File;
  private writeOffset: number = 0;
  private sampleValCnt: number = 0;
  private sampleValSum: number = 0;
  private capturer?: audio.AudioCapturer;

  constructor(context: Context) {
    this.context = context;
  }

  // [Start calculateDecibel]
  calculateDecibel(): number {
    if (this.sampleValCnt === 0) {
      return 0;
    }
    let rms: number = this.sampleValSum / this.sampleValCnt;
    // calculate dBFS
    let dBFS: number = Math.max(Constants.MIN_DB, Math.min(0, 20 * Math.log10(rms)));
    this.sampleValCnt = 0;
    this.sampleValSum = 0;

    return (dBFS + Math.abs(Constants.MIN_DB)) / Math.abs(Constants.MIN_DB);
  }

  // [End calculateDecibel]

  capturerState(): audio.AudioState | undefined {
    return this.capturer !== undefined ? this.capturer.state : undefined;
  }

  async initCapturer(): Promise<void> {
    try {
      let audioStreamInfo: audio.AudioStreamInfo = {
        channels: audio.AudioChannel.CHANNEL_1,
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioCapturerInfo: audio.AudioCapturerInfo = {
        capturerFlags: 0,
        source: audio.SourceType.SOURCE_TYPE_MIC,
      };
      let audioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo,
      };

      this.capturer = await audio.createAudioCapturer(audioCapturerOptions);
      Logger.info(TAG + ',createAudioCapturer:' + this.capturer);

      this.capturer.on('stateChange', (state: audio.AudioState) => {
        Logger.info(TAG, `Audio capturer state changed: ${audioStateString(state)}`);
      });

      // [Start readData]
      this.capturer.on('readData', (buffer: ArrayBuffer) => {
        let options: WriteOptions = { offset: this.writeOffset, length: buffer.byteLength };
        fileIo.writeSync(this.recordFile?.fd, buffer, options);
        this.writeOffset += buffer.byteLength;
        AppStorage.setOrCreate('RWOffset', this.writeOffset);
        // sum samples
        let samples = new Int16Array(buffer);
        for (let i = 0; i < samples.length; i++) {
          let val = samples[i] / Constants.VOLUME_MAX;
          this.sampleValSum += val * val;
          this.sampleValCnt += 1;
        }
      });
      // [End readData]
    } catch (error) {
      Logger.error(TAG, `initCapturer error. message:${(error as BusinessError).message}`);
    }
  }

  async startCapturer(): Promise<void> {
    if (this.capturer === undefined) {
      throw new Error(`Realse AudioCapturer at undefined state`);
    }
    let state = this.capturer.state;
    if (state === audio.AudioState.STATE_INVALID) {
      this.capturer = undefined;
      throw new Error(`AudioCapturer at invalid state.`);
    }
    if (state !== audio.AudioState.STATE_PREPARED && state !== audio.AudioState.STATE_STOPPED) {
      throw new Error(`Release AudioCapturer at wrong state, ${audioStateString(state)}`);
    }
    try {
      this.tmpPath = this.context.tempDir + `/${util.generateRandomUUID()}`;
      let openMode = fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.CREATE | fileIo.OpenMode.TRUNC;
      this.recordFile = fileIo.openSync(this.tmpPath, openMode);
      this.writeOffset = 0;

      await this.capturer.start();
    } catch (error) {
      Logger.error(TAG, `startCapturer error. message:${(error as BusinessError).message}`);
    }
  }

  async stopCapturer(): Promise<void> {
    if (this.capturer === undefined) {
      throw new Error(`Realse AudioCapturer at undefined state`);
    }
    let state = this.capturer.state;
    if (state === audio.AudioState.STATE_INVALID) {
      this.capturer = undefined;
      throw new Error(`AudioCapturer at invalid state.`);
    }
    if (state !== audio.AudioState.STATE_RUNNING) {
      return;
    }
    try {
      await this.capturer.stop();
      fileIo.closeSync(this.recordFile?.fd);

      let dirPath: string = this.context.filesDir + Constants.DATA_DIR;
      let files: string[] = fileIo.listFileSync(dirPath);
      for (let i = 0; i <= files.length; i++) {
        let fileName: string = 'recorder' + (i + 1);
        if (files.indexOf(fileName) === -1) {
          let newPath: string = dirPath + `/${fileName}`;
          fileIo.renameSync(this.tmpPath, newPath);
          break;
        }
      }
    } catch (error) {
      Logger.error(TAG, `stopCapturer error. message:${(error as BusinessError).message}`);
    }
  }

  async releaseCapturer(): Promise<void> {
    if (this.capturer === undefined) {
      throw new Error(`Realse AudioCapturer at undefined state`);
    }
    let state = this.capturer.state;
    if (state === audio.AudioState.STATE_INVALID) {
      this.capturer = undefined;
      throw new Error(`AudioCapturer at invalid state.`);
    }
    if (state !== audio.AudioState.STATE_PREPARED && state !== audio.AudioState.STATE_STOPPED) {
      throw new Error(`Release AudioCapturer at wrong state, ${audioStateString(state)}`);
    }
    try {
      this.capturer.off('readData');
      await this.capturer.release();
      this.capturer = undefined;
    } catch (error) {
      Logger.error(TAG, `releaseCapturer error. message:${(error as BusinessError).message}`);
    }
  }
}