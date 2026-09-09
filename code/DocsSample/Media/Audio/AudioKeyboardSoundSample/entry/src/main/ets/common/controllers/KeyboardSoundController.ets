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
import { BusinessError } from '@kit.BasicServicesKit';
import { AudioConstants } from '../constants/AudioConstants';
import Logger from '../utils/Logger';

/**
 * Default scenario: keyboard sound uses STREAM_USAGE_MUSIC.
 * Default focus strategy with external audio (MUSIC/MOVIE) is STOP, no resume after interrupt.
 */
export class DefaultKeyboardController {
  private renderer: audio.AudioRenderer | null = null;
  private isStarted: boolean = false;
  private phase: number = 0;
  private playToken: number = 0;

  async init(): Promise<void> {
    this.renderer = await audio.createAudioRenderer({
      streamInfo: {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      },
      rendererInfo: {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0,
      },
    });
    const r = this.renderer;
    r.on('writeData', (buf: ArrayBuffer) => { this.fillAudioData(buf) });
  }

  async play(): Promise<void> {
    if (!this.renderer) {
      return;
    }
    const token = ++this.playToken;
    if (this.isStarted) {
      await this.renderer.stop();
      this.isStarted = false;
    }
    this.renderer.setIndependentAudioSessionStrategy({
      concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_DEFAULT
    }, audio.AudioSessionBehaviorFlags.DEFAULT_BEHAVIOR);
    await this.renderer.start();
    this.isStarted = true;
    await new Promise<void>((resolve: () => void) => {
      setTimeout(resolve, AudioConstants.KEY_SOUND_DURATION_MS);
    });
    if (token === this.playToken && this.isStarted) {
      await this.renderer.stop();
      this.isStarted = false;
    }
  }

  private fillAudioData(buf: ArrayBuffer): void {
    const dv = new DataView(buf);
    const frameCount = buf.byteLength / AudioConstants.FRAME_SIZE;
    const inc = (2 * Math.PI * AudioConstants.KEY_SOUND_FREQUENCY) /
      AudioConstants.SAMPLE_RATE;
    for (let i = 0; i < frameCount; i++) {
      const sample = Math.floor(Math.sin(this.phase) *
        AudioConstants.AMPLITUDE * 32767);
      const offset = i * AudioConstants.FRAME_SIZE;
      dv.setInt16(offset, sample, true);
      dv.setInt16(offset + AudioConstants.BYTES_PER_SAMPLE, sample, true);
      this.phase = (this.phase + inc) % (2 * Math.PI);
    }
  }

  async release(): Promise<void> {
    this.playToken++;
    if (this.renderer) {
      if (this.isStarted) {
        await this.renderer.stop();
      }
      await this.renderer.release();
      this.renderer = null;
    }
  }
}

/**
 * Solution: keyboard sound uses NOTIFICATION + MIX.
 */
export class SolutionKeyboardController {
  private renderer: audio.AudioRenderer | null = null;
  private isStarted: boolean = false;
  private phase: number = 0;
  private playToken: number = 0;

  // [Start keyboard_notification_mix]
  async init(): Promise<void> {
    this.renderer = await audio.createAudioRenderer({
// [StartExclude keyboard_stream_info]
      streamInfo: {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
      },
// [EndExclude keyboard_stream_info]
      rendererInfo: {
        // 使用通知音类型，将默认焦点策略从 STOP 降为 DUCK。
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION,
        rendererFlags: 0,
      },
    });
// [StartExclude keyboard_write_data]
    const r = this.renderer;
    r.on('writeData', (buf: ArrayBuffer) => { this.fillAudioData(buf) });
// [EndExclude keyboard_write_data]
  }

  async play(): Promise<void> {
    if (!this.renderer) {
      return;
    }
    const token = ++this.playToken;
    if (this.isStarted) {
      await this.renderer.stop();
      this.isStarted = false;
    }
    // 设置 MIX 策略，优先级低于 DUCK，实现完全并发。
    this.renderer.setIndependentAudioSessionStrategy({
      concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_MIX_WITH_OTHERS
    }, audio.AudioSessionBehaviorFlags.DEFAULT_BEHAVIOR);
    // 播放按键音。
    await this.renderer.start();
    this.isStarted = true;
    await new Promise<void>((resolve: () => void) => {
      setTimeout(resolve, AudioConstants.KEY_SOUND_DURATION_MS_NOTIFICATION);
    });
    if (token === this.playToken && this.isStarted) {
      await this.renderer.stop();
      this.isStarted = false;
    }
  }
  // [End keyboard_notification_mix]

  // [StartExclude keyboard_fillbeep_release]
  private fillAudioData(buf: ArrayBuffer): void {
    const dv = new DataView(buf);
    const frameCount = buf.byteLength / AudioConstants.FRAME_SIZE;
    const inc = (2 * Math.PI * AudioConstants.KEY_SOUND_FREQUENCY) /
      AudioConstants.SAMPLE_RATE;
    for (let i = 0; i < frameCount; i++) {
      const sample = Math.floor(Math.sin(this.phase) *
        AudioConstants.AMPLITUDE * 32767);
      const offset = i * AudioConstants.FRAME_SIZE;
      dv.setInt16(offset, sample, true);
      dv.setInt16(offset + AudioConstants.BYTES_PER_SAMPLE, sample, true);
      this.phase = (this.phase + inc) % (2 * Math.PI);
    }
  }

  async release(): Promise<void> {
    this.playToken++;
    if (this.renderer) {
      if (this.isStarted) {
        await this.renderer.stop();
      }
      await this.renderer.release();
      this.renderer = null;
    }
  }

  resetStrategy(): void {
    if (this.renderer) {
      this.renderer.setIndependentAudioSessionStrategy({
        concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_DEFAULT
      }, audio.AudioSessionBehaviorFlags.DEFAULT_BEHAVIOR);
    }
  }
  // [EndExclude keyboard_fillbeep_release]
}
