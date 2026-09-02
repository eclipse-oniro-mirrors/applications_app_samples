/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { CommonConstants as Const } from '../common/CommonConstants';

export interface PlayerSourceOptions {
  inputFileFd: number;
  inputFileOffset: number;
  inputFileSize: number;
  isSmartFluencySupported: boolean;
}

export interface PlayerOptions extends PlayerSourceOptions {
  videoDecoderType: number;
  videoDecoderRunMode: number;
  videoDecoderSyncMode: number;
  enableVideoDump: boolean;
  retainLastFrame: boolean;
  enableLowLatency: boolean;
  outputInDecodingOrder: boolean;
  convertHdrVividToBt709: boolean;
  audioVolume: number;
  enableAudioLowLatency: boolean;
  audioTrackIndex: number;
}

export class PlayerSettingsModel {
  public videoDecoderType: number = 0;
  public videoDecoderRunMode: number = 0;
  public videoDecoderSyncMode: number = 0;
  public enableVideoDump: boolean = false;
  public retainLastFrame: boolean = true;
  public enableLowLatency: boolean = false;
  public outputInDecodingOrder: boolean = false;
  public convertHdrVividToBt709: boolean = false;
  /** Audio output volume as a percentage in the range [0, 100]. */
  public audioVolume: number = 100;
  /** Applies when the audio renderer is created for the next playback task. */
  public enableAudioLowLatency: boolean = false;
  /** Container audio track index; -1 selects the first audio track. */
  public audioTrackIndex: number = -1;

  applyPickerValues(values: string[], audioVolume: number = this.audioVolume): boolean {
    if (values.length < Const.PLAYER_INFO.length) {
      return false;
    }
    const decoderType = Const.VIDEO_DECODE_TYPE.indexOf(values[0]);
    const runMode = Const.VIDEO_DECODER_RUN_MODE.indexOf(values[1]);
    const syncMode = Const.VIDEO_DECODER_SYNC_MODE.indexOf(values[2]);
    const dumpMode = Const.VIDEO_DUMP_MODE.indexOf(values[3]);
    const lastFrameMode = values.length > 4 ? Const.VIDEO_LAST_FRAME_MODE.indexOf(values[4]) : 0;
    const lowLatencyMode = values.length > 5 ? Const.VIDEO_FEATURE_MODE.indexOf(values[5]) : 0;
    const decodingOrderMode = values.length > 6 ? Const.VIDEO_FEATURE_MODE.indexOf(values[6]) : 0;
    const colorConversionMode = values.length > 7 ? Const.VIDEO_FEATURE_MODE.indexOf(values[7]) : 0;
    const audioLatencyMode = values.length > 8 ? Const.AUDIO_RENDERER_LATENCY_MODE.indexOf(values[8]) : 0;
    if (decoderType < 0 || runMode < 0 || syncMode < 0 || dumpMode < 0 || lastFrameMode < 0 ||
      lowLatencyMode < 0 || decodingOrderMode < 0 || colorConversionMode < 0 || audioLatencyMode < 0 ||
      !Number.isFinite(audioVolume) || audioVolume < 0 || audioVolume > 100) {
      return false;
    }
    this.videoDecoderType = decoderType;
    this.videoDecoderRunMode = runMode;
    this.videoDecoderSyncMode = syncMode;
    this.enableVideoDump = dumpMode === 1;
    this.retainLastFrame = lastFrameMode === 0;
    this.enableLowLatency = lowLatencyMode === 1;
    this.outputInDecodingOrder = decodingOrderMode === 1;
    this.convertHdrVividToBt709 = colorConversionMode === 1;
    this.audioVolume = audioVolume;
    this.enableAudioLowLatency = audioLatencyMode === 1;
    return true;
  }

  createPlayOptions(source: PlayerSourceOptions): PlayerOptions {
    const options: PlayerOptions = {
      inputFileFd: source.inputFileFd,
      inputFileOffset: source.inputFileOffset,
      inputFileSize: source.inputFileSize,
      isSmartFluencySupported: source.isSmartFluencySupported,
      videoDecoderType: this.videoDecoderType,
      videoDecoderRunMode: this.videoDecoderRunMode,
      videoDecoderSyncMode: this.videoDecoderSyncMode,
      enableVideoDump: this.enableVideoDump,
      retainLastFrame: this.retainLastFrame,
      enableLowLatency: this.enableLowLatency,
      outputInDecodingOrder: this.outputInDecodingOrder,
      convertHdrVividToBt709: this.convertHdrVividToBt709,
      audioVolume: this.audioVolume / 100,
      enableAudioLowLatency: this.enableAudioLowLatency,
      audioTrackIndex: this.audioTrackIndex
    };
    return options;
  }
}
