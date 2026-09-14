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
import { Constants } from '../common/Constants';
import { audioStateString } from '../utils/StringUtil';
import { fileIo } from '@kit.CoreFileKit';
import { Logger } from '../utils/Logger';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = 'AudioRendererManager';

export class AudioRendererManager {
  private playFile?: fileIo.File;
  private fileSize: number = 0;
  private readOffset: number = 0;
  private sampleValCnt: number = 0;
  private sampleValSum: number = 0;
  private renderer?: audio.AudioRenderer;

  // [Start calculate_decibel]
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
  // [Start calculate_decibel]

  rendererState(): audio.AudioState | undefined {
    return this.renderer !== undefined ? this.renderer.state : undefined;
  }

  async initRenderer() {
    try {
      if (this.rendererState() !== undefined) {
        return;
      }
      let audioStreamInfo: audio.AudioStreamInfo = {
        channels: audio.AudioChannel.CHANNEL_1,
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      };
      let audioRendererInfo: audio.AudioRendererInfo = {
        rendererFlags: 0,
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
      };
      let audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo,
      };

      this.renderer = await audio.createAudioRenderer(audioRendererOptions);

      this.renderer.on('stateChange', (state: audio.AudioState) => {
        Logger.info(TAG, `Audio renderer state changed: ${audioStateString(state)}`);
      });

      // [Start writeData]
      this.renderer.on('writeData', (buffer: ArrayBuffer) => {
        let lastLen: number = this.fileSize - this.readOffset;
        let readLen: number = lastLen >= buffer.byteLength ? buffer.byteLength : lastLen;
        try {
          fileIo.readSync(this.playFile?.fd, buffer, { offset: this.readOffset, length: readLen });
        } catch (error) {
          Logger.error(TAG, `writeData error. message:${(error as BusinessError).message}`);
        }

        this.readOffset += readLen;
        AppStorage.setOrCreate('RWOffset', this.readOffset);
        if (this.readOffset >= this.fileSize) {
          this.readOffset = 0;
        }
        // sum samples
        let samples: Int16Array = new Int16Array(buffer);
        for (let i = 0; i < samples.length; i++) {
          let val: number = samples[i] / Constants.VOLUME_MAX;
          this.sampleValSum += val * val;
          this.sampleValCnt += 1;
        }
      });
      // [Start writeData]
    } catch (error) {
      Logger.error(TAG, `initRenderer error. message:${(error as BusinessError).message}`);
    }
  }

  async startRenderer(path?: string) {
    try {
      if (this.renderer === undefined) {
        throw new Error(`Realse AudioRederer at undefined state`);
      }
      let state: audio.AudioState = this.renderer.state;
      if (state === audio.AudioState.STATE_INVALID) {
        this.renderer = undefined;
        throw new Error(`Start AudioRenderer at invalid state.`);
      }
      if (state !== audio.AudioState.STATE_PREPARED && state !== audio.AudioState.STATE_STOPPED &&
        state !== audio.AudioState.STATE_PAUSED) {
        throw new Error(`Start AudioRenderer at wrong state, ${audioStateString(state)}`);
      }
      if (path !== undefined) {
        this.playFile = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        this.fileSize = fileIo.statSync(path).size;
        this.readOffset = 0;
      }

      await this.renderer.start();
    } catch (error) {
      if (this.playFile) {
        try {
          fileIo.closeSync(this.playFile.fd);
        } catch (err) {
          Logger.error(TAG, `startRenderer error. message:${(error as BusinessError).message}`);
        }
      }
      Logger.error(TAG, `startRenderer error. message:${(error as BusinessError).message}`);
    }
  }

  async pauseRenderer() {
    if (this.renderer === undefined) {
      throw new Error(`Realse AudioRenderer at undefined state`);
    }
    let state: audio.AudioState = this.renderer.state;
    if (state === audio.AudioState.STATE_INVALID) {
      this.renderer = undefined;
      throw new Error(`Pause AudioRenderer at invalid state.`);
    }
    if (state !== audio.AudioState.STATE_RUNNING) {
      throw new Error(`Pause AudioRenderer at wrong state, ${audioStateString(state)}`);
    }
    await this.renderer.pause();
  }

  async stopRenderer() {
    if (this.renderer === undefined) {
      throw new Error(`Realse AudioRenderer at undefined state`);
    }
    let state: audio.AudioState = this.renderer.state;
    if (state === audio.AudioState.STATE_INVALID) {
      this.renderer = undefined;
      throw new Error(`Stop AudioRenderer at invalid state.`);
    }
    if (state !== audio.AudioState.STATE_RUNNING && state !== audio.AudioState.STATE_PAUSED) {
      throw new Error(`Stop AudioRenderer at wrong state, ${audioStateString(state)}`);
    }

    try {
      this.renderer.off('stateChange');
      this.renderer.off('writeData');
      await this.renderer.stop().then(() => {
        this.releaseRenderer();
      });
      fileIo.closeSync(this.playFile?.fd);
    } catch (error) {
      if (this.playFile) {
        if (this.playFile) {
          try {
            fileIo.closeSync(this.playFile.fd);
          } catch (err) {
            Logger.error(TAG, `stopRenderer error. message:${(error as BusinessError).message}`);
          }
        }
      }
      Logger.error(TAG, `stopRenderer error. message:${(error as BusinessError).message}`);
    }
  }

  async releaseRenderer() {
    if (this.renderer === undefined) {
      throw new Error(`Realse AudioRenderer at undefined state`);
    }
    let state: audio.AudioState = this.renderer.state;
    if (state === audio.AudioState.STATE_INVALID) {
      this.renderer = undefined;
      throw new Error(`Release AudioRenderer at invalid state.`);
    }
    if (state !== audio.AudioState.STATE_PAUSED && state !== audio.AudioState.STATE_STOPPED &&
      state !== audio.AudioState.STATE_PREPARED) {
      throw new Error(`Release AudioRenderer at wrong state, ${audioStateString(state)}`);
    }
    await this.renderer.release();
  }
}