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
import logger from './Logger';
import { InterruptMode, AudioStreamState, StreamUsageType } from '../constants/AudioConstants';

// Audio rendering constants
const DEFAULT_SAMPLE_RATE = 44100;
const DEFAULT_CHANNEL_COUNT = 2;
const DEFAULT_FREQUENCY = 440;
const DEFAULT_AMPLITUDE = 0.3;
const MAX_16BIT_SAMPLE = 32767;
const BYTES_PER_SAMPLE = 2;
const RENDERER_FLAGS_NONE = 0;

export class AudioStreamController {
  private renderer: audio.AudioRenderer | null = null;
  private streamUsage: audio.StreamUsage = audio.StreamUsage.STREAM_USAGE_MUSIC;
  private interruptMode: audio.InterruptMode = audio.InterruptMode.SHARE_MODE;
  private isPlaying: boolean = false;
  private isInitialized: boolean = false;
  private bufferSize: number = 0;
  private sampleRate: number = DEFAULT_SAMPLE_RATE;
  private channelCount: number = DEFAULT_CHANNEL_COUNT;
  private interruptLog: string[] = [];
  private notifyStateChangeCallback?: (state: AudioStreamState) => void;
  private notifyInterruptCallback?: (logEntry: string) => void;
  private phase: number = 0;
  private frequency: number = DEFAULT_FREQUENCY;
  private amplitude: number = DEFAULT_AMPLITUDE;

  constructor(streamUsage: StreamUsageType, frequency: number = DEFAULT_FREQUENCY) {
    this.frequency = frequency;
    this.streamUsage = this.mapStreamUsage(streamUsage);
  }

  private mapStreamUsage(type: StreamUsageType): audio.StreamUsage {
    switch (type) {
      case StreamUsageType.MUSIC:
        return audio.StreamUsage.STREAM_USAGE_MUSIC;
      case StreamUsageType.MOVIE:
        return audio.StreamUsage.STREAM_USAGE_MOVIE;
      case StreamUsageType.GAME:
        return audio.StreamUsage.STREAM_USAGE_GAME;
      case StreamUsageType.AUDIOBOOK:
        return audio.StreamUsage.STREAM_USAGE_AUDIOBOOK;
      case StreamUsageType.NAVIGATION:
        return audio.StreamUsage.STREAM_USAGE_NAVIGATION;
      default:
        return audio.StreamUsage.STREAM_USAGE_MUSIC;
    }
  }

  async init(interruptMode: InterruptMode): Promise<boolean> {
    this.interruptMode = this.mapInterruptMode(interruptMode);
    logger.info(`Init stream: usage=${this.streamUsage}, mode=${this.interruptMode}`);

    const audioStreamInfo: audio.AudioStreamInfo = {
      samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100, // 44100 Hz matches DEFAULT_SAMPLE_RATE
      channels: audio.AudioChannel.CHANNEL_2, // Stereo matches DEFAULT_CHANNEL_COUNT
      sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE, // 16-bit signed little-endian
      encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW, // Raw PCM data
    };

    const audioRendererInfo: audio.AudioRendererInfo = {
      usage: this.streamUsage,
      rendererFlags: RENDERER_FLAGS_NONE, // No special renderer flags
    };

    const audioRendererOptions: audio.AudioRendererOptions = {
      streamInfo: audioStreamInfo,
      rendererInfo: audioRendererInfo,
    };

    try {
      this.renderer = await audio.createAudioRenderer(audioRendererOptions); // 创建AudioRenderer实例
      this.renderer.on('audioInterrupt', (interruptEvent: audio.InterruptEvent) => { // 注册音频中断事件回调，系统打断时回调此方法
        this.handleInterrupt(interruptEvent);
      });
      await this.renderer.setInterruptMode(this.interruptMode); // 设置焦点模式，必须在start之前
      this.bufferSize = await this.renderer.getBufferSize();
      this.renderer.on('writeData', (buffer: ArrayBuffer) => {
        this.fillBuffer(buffer);
      });
      this.isInitialized = true;
      logger.info(`AudioRenderer created, interrupt mode=${this.interruptMode}, bufferSize=${this.bufferSize}`);
      return true;
    } catch (err) {
      logger.error(`Failed to create AudioRenderer: ${JSON.stringify(err)}`);
      return false;
    }
  }

  private mapInterruptMode(mode: InterruptMode): audio.InterruptMode {
    switch (mode) {
      case InterruptMode.SHARE_MODE:
        return audio.InterruptMode.SHARE_MODE;
      case InterruptMode.INDEPENDENT_MODE:
        return audio.InterruptMode.INDEPENDENT_MODE;
      default:
        return audio.InterruptMode.SHARE_MODE;
    }
  }

  private fillBuffer(buffer: ArrayBuffer): void {
    if (!this.isPlaying) {
      return;
    }
    const dataView = new DataView(buffer);
    const frameSize = buffer.byteLength / (this.channelCount * BYTES_PER_SAMPLE);
    const twoPi = 2 * Math.PI;
    for (let i = 0; i < frameSize; i++) {
      const sample = this.amplitude * Math.sin(twoPi * this.frequency * this.phase / this.sampleRate);
      const intSample = Math.max(-MAX_16BIT_SAMPLE, Math.min(MAX_16BIT_SAMPLE, Math.round(sample * MAX_16BIT_SAMPLE)));
      for (let ch = 0; ch < this.channelCount; ch++) {
        dataView.setInt16(i * this.channelCount * BYTES_PER_SAMPLE + ch * BYTES_PER_SAMPLE, intSample, true);
      }
      this.phase++;
    }
  }

  private handleInterrupt(interruptEvent: audio.InterruptEvent): void { // 系统音频中断回调，收到焦点事件后更新播放状态
    const forceType = interruptEvent.forceType; // FORCE=系统强制处理，SHARE=系统建议处理（应用可自行决定）
    const hintType = interruptEvent.hintType; // 中断提示类型：PAUSE/STOP/DUCK/UNDUCK/RESUME等
    const forceStr = forceType === audio.InterruptForceType.INTERRUPT_FORCE ? 'FORCE' : 'SHARE';
    const hintStr = this.getHintString(hintType);
    const logEntry = `[Interrupt] ${forceStr} ${hintStr}`;
    this.interruptLog.push(logEntry); // 记录中断日志
    logger.info(`Stream interrupt: ${logEntry}`);

    if (this.notifyInterruptCallback) { // 通知UI层显示中断信息
      this.notifyInterruptCallback(logEntry);
    }

    if (forceType === audio.InterruptForceType.INTERRUPT_FORCE) { // FORCE类型：系统已自动完成打断，应用只需更新状态
      switch (hintType) {
        case audio.InterruptHint.INTERRUPT_HINT_STOP: // STOP：流被永久停止，不会收到RESUME，无法自动恢复
          this.isPlaying = false; // 停止播放
          this.notifyState(AudioStreamState.STOPPED); // 通知UI：流已停止
          break;
        case audio.InterruptHint.INTERRUPT_HINT_PAUSE: // PAUSE：流被暂停，结束后会收到RESUME可恢复
          this.isPlaying = false; // 暂停播放
          this.notifyState(AudioStreamState.PAUSED); // 通知UI：流已暂停
          break;
        case audio.InterruptHint.INTERRUPT_HINT_DUCK: // DUCK：降低音量，流仍在播放
          this.notifyState(AudioStreamState.RUNNING); // 通知UI：流仍在播放（音量降低）
          break;
        case audio.InterruptHint.INTERRUPT_HINT_UNDUCK: // UNDUCK：音量恢复，流仍在播放
          this.notifyState(AudioStreamState.RUNNING); // 通知UI：音量恢复
          break;
        default:
          break;
      }
    } else if (forceType === audio.InterruptForceType.INTERRUPT_SHARE) { // SHARE类型：系统建议处理，应用需自行响应
      switch (hintType) {
        case audio.InterruptHint.INTERRUPT_HINT_RESUME: // RESUME：之前被暂停的流可以恢复播放
          this.isPlaying = true; // 恢复播放
          this.notifyState(AudioStreamState.RUNNING); // 通知UI：流已恢复播放
          break;
        default:
          break;
      }
    }
  }

  private getHintString(hintType: audio.InterruptHint): string {
    switch (hintType) {
      case audio.InterruptHint.INTERRUPT_HINT_NONE: return 'NONE';
      case audio.InterruptHint.INTERRUPT_HINT_RESUME: return 'RESUME';
      case audio.InterruptHint.INTERRUPT_HINT_PAUSE: return 'PAUSE';
      case audio.InterruptHint.INTERRUPT_HINT_STOP: return 'STOP';
      case audio.InterruptHint.INTERRUPT_HINT_DUCK: return 'DUCK';
      case audio.InterruptHint.INTERRUPT_HINT_UNDUCK: return 'UNDUCK';
      default: return 'UNKNOWN';
    }
  }

  private notifyState(state: AudioStreamState): void {
    if (this.notifyStateChangeCallback) {
      this.notifyStateChangeCallback(state);
    }
  }

  async startPlay(): Promise<void> {
    if (!this.renderer || !this.isInitialized) {
      logger.error('Renderer not initialized');
      return;
    }
    try {
      this.phase = 0;
      await this.renderer.start();
      this.isPlaying = true;
      this.notifyState(AudioStreamState.RUNNING);
      logger.info('Renderer started');
    } catch (err) {
      logger.error(`Failed to start renderer: ${JSON.stringify(err)}`);
    }
  }

  async stopPlay(): Promise<void> {
    if (!this.renderer) {
      return;
    }
    try {
      await this.renderer.stop();
      this.isPlaying = false;
      this.notifyState(AudioStreamState.STOPPED);
      logger.info('Renderer stopped');
    } catch (err) {
      logger.error(`Failed to stop renderer: ${JSON.stringify(err)}`);
    }
  }

  async pausePlay(): Promise<void> {
    if (!this.renderer) {
      return;
    }
    try {
      await this.renderer.pause();
      this.isPlaying = false;
      this.notifyState(AudioStreamState.PAUSED);
      logger.info('Renderer paused');
    } catch (err) {
      logger.error(`Failed to pause renderer: ${JSON.stringify(err)}`);
    }
  }

  async release(): Promise<void> {
    if (!this.renderer) {
      return;
    }
    try {
      if (this.isPlaying) {
        await this.renderer.stop();
      }
      this.renderer.off('audioInterrupt');
      this.renderer.off('writeData');
      await this.renderer.release();
      this.renderer = null;
      this.isPlaying = false;
      this.isInitialized = false;
      this.interruptLog = [];
      this.notifyState(AudioStreamState.RELEASED);
      logger.info('Renderer released');
    } catch (err) {
      logger.error(`Failed to release renderer: ${JSON.stringify(err)}`);
    }
  }

  getIsPlaying(): boolean { return this.isPlaying; }
  getInterruptLog(): string[] { return this.interruptLog; }
  clearInterruptLog(): void { this.interruptLog = []; }
  onStateChange(callback: (state: AudioStreamState) => void): void { this.notifyStateChangeCallback = callback; }
  onInterrupt(callback: (logEntry: string) => void): void { this.notifyInterruptCallback = callback; }

  getStreamUsageName(): string {
    switch (this.streamUsage) {
      case audio.StreamUsage.STREAM_USAGE_MUSIC: return 'MUSIC';
      case audio.StreamUsage.STREAM_USAGE_MOVIE: return 'MOVIE';
      case audio.StreamUsage.STREAM_USAGE_GAME: return 'GAME';
      case audio.StreamUsage.STREAM_USAGE_AUDIOBOOK: return 'AUDIOBOOK';
      case audio.StreamUsage.STREAM_USAGE_NAVIGATION: return 'NAVIGATION';
      default: return 'UNKNOWN';
    }
  }
}
