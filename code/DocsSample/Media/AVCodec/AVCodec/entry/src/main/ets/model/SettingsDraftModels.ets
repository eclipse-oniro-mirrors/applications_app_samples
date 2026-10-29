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
import { PlayerSettingsModel } from './PlayerSettingsModel';
import { RecorderSettingsModel } from './RecorderSettingsModel';
import { RecorderPreprocessModel } from './RecorderPreprocessModel';
import { CameraDataModel } from './CameraDataModel';

// 草稿独立于已应用参数；选择立即刷新，取消时不写回，点击应用才转换。
@Observed
export class PlayerSettingsDraft {
  public decoderType: number = 0;
  public runMode: number = 0;
  public syncMode: number = 0;
  public dump: boolean = false;
  public retainLastFrame: boolean = true;
  public lowLatency: boolean = false;
  public outputInDecodingOrder: boolean = false;
  public convertHdrVividToBt709: boolean = false;
  public audioVolume: number = 100;
  public audioLowLatency: boolean = false;
  public audioTrackIndex: number = -1;
  public autoHideControls: boolean = true;

  load(settings: PlayerSettingsModel): void {
    this.decoderType = settings.videoDecoderType;
    this.runMode = settings.videoDecoderRunMode;
    this.syncMode = settings.videoDecoderSyncMode;
    this.dump = settings.enableVideoDump &&
      this.runMode === Const.VIDEO_DECODER_RUN_MODE_BUFFER;
    this.retainLastFrame = settings.retainLastFrame;
    this.lowLatency = settings.enableLowLatency;
    this.outputInDecodingOrder = settings.outputInDecodingOrder;
    this.convertHdrVividToBt709 = settings.convertHdrVividToBt709 &&
      this.runMode === Const.VIDEO_DECODER_RUN_MODE_DIRECT_OUTPUT;
    this.audioVolume = Math.round(settings.audioVolume);
    this.audioLowLatency = settings.enableAudioLowLatency;
    this.audioTrackIndex = settings.audioTrackIndex;
    this.autoHideControls = settings.autoHideControls;
  }

  apply(settings: PlayerSettingsModel): boolean {
    const values: string[] = [
      Const.VIDEO_DECODE_TYPE[this.decoderType],
      Const.VIDEO_DECODER_RUN_MODE[this.runMode],
      Const.VIDEO_DECODER_SYNC_MODE[this.syncMode],
      this.dump ? Const.VIDEO_DUMP_MODE[1] : Const.VIDEO_DUMP_MODE[0],
      this.retainLastFrame ? Const.VIDEO_LAST_FRAME_MODE[0] : Const.VIDEO_LAST_FRAME_MODE[1],
      this.lowLatency ? Const.VIDEO_FEATURE_MODE[1] : Const.VIDEO_FEATURE_MODE[0],
      this.outputInDecodingOrder ? Const.VIDEO_FEATURE_MODE[1] : Const.VIDEO_FEATURE_MODE[0],
      this.convertHdrVividToBt709 ? Const.VIDEO_FEATURE_MODE[1] : Const.VIDEO_FEATURE_MODE[0],
      this.audioLowLatency ? Const.AUDIO_RENDERER_LATENCY_MODE[1] : Const.AUDIO_RENDERER_LATENCY_MODE[0]
    ];
    if (!settings.applyPickerValues(values, this.audioVolume)) {
      return false;
    }
    settings.autoHideControls = this.autoHideControls;
    return true;
  }
}

@Observed
export class RecorderSettingsDraft {
  public codec: number = 1;
  public outputFormat: number = 0;
  public resolution: number = 1;
  public frameRate: number = 0;
  public syncMode: number = 0;
  public bitrate: number = 1;
  public bitrateMode: number = 0;
  public iFrameInterval: number = 0;
  public audioSampleRate: number = 1;
  public audioChannelCount: number = 1;
  public audioBitrate: number = 0;
  public audioLatency: number = 0;
  public stabilization: number = 1;
  public preprocMode: number = 0;
  public cropPercent: number = 75;
  public downsamplingHeight: number = 720;
  public secondaryHeight: number = 720;
  public dropFrameRate: number = 0;
  public dualOutput: number = 0;
  public videoDump: boolean = false;
  public stopOnLowSpace: boolean = false;

  load(data: CameraDataModel, advanced: boolean): void {
    this.outputFormat = data.outputFormat === Const.FORMAT_FLV ? 1 : 0;
    this.codec = data.isHDRVivid === Const.TRUE ? 0 :
      data.videoCodecMime === Const.MIME_VIDEO_AVC ? 1 : 2;
    this.resolution = data.cameraWidth >= Const.VIDEO_WIDTH_4K ? 0 :
      data.cameraWidth >= Const.VIDEO_WIDTH_1080P ? 1 : 2;
    this.frameRate = data.frameRate >= Const.FRAMERATE_VIDEO_60FPS ? 1 : 0;
    this.syncMode = data.isSync;
    this.bitrate = data.bitRate <= Const.BITRATE_VIDEO_10M ? 0 :
      data.bitRate >= Const.BITRATE_VIDEO_30M ? 2 : 1;
    this.bitrateMode = data.bitrateMode === Const.VIDEO_BITRATE_MODE_VBR ? 1 : 0;
    this.iFrameInterval = data.iFrameInterval <= Const.I_FRAME_INTERVAL_100_MS ? 0 :
      data.iFrameInterval <= Const.I_FRAME_INTERVAL_1_S ? 1 : 2;
    this.audioSampleRate = data.audioSampleRate <= Const.AUDIO_SAMPLE_RATE_44100 ? 0 : 1;
    this.audioChannelCount = data.audioChannelCount === Const.AUDIO_CHANNEL_COUNT_MONO ? 0 : 1;
    this.audioBitrate = data.audioBitRate <= Const.AUDIO_BITRATE_32K ? 0 :
      data.audioBitRate >= Const.AUDIO_BITRATE_128K ? 2 : 1;
    this.audioLatency =
      data.audioCaptureLatencyMode === Const.AUDIO_CAPTURE_LATENCY_LOW ?
      1 : 0;
    this.stabilization =
      data.videoStabilizationMode === Const.VIDEO_STABILIZATION_DISABLED ?
      0 : 1;
    this.preprocMode = advanced ? data.preprocMode : 0;
    this.cropPercent = data.cropPercent;
    this.downsamplingHeight = data.downsamplingTargetHeight;
    this.secondaryHeight = data.secondaryTargetHeight;
    this.dropFrameRate = advanced && data.dropToFrameRate > 0 ? 1 : 0;
    this.dualOutput = advanced && data.enableDualOutput ? 1 : 0;
    this.videoDump = data.enableVideoDump;
    this.stopOnLowSpace = data.stopOnLowSpace;
  }

  apply(data: CameraDataModel): boolean {
    const values: string[] = [
      Const.OUTPUT_FORMAT[this.outputFormat],
      Const.VIDEO_MIMETYPE[this.codec],
      Const.VIDEO_RESOLUTION[this.resolution],
      Const.VIDEO_FRAMERATE[this.frameRate],
      Const.VIDEO_DECODER_SYNC_MODE[this.syncMode],
      Const.VIDEO_BITRATE[this.bitrate],
      Const.VIDEO_BITRATE_MODE[this.bitrateMode],
      Const.VIDEO_I_FRAME_INTERVAL[this.iFrameInterval],
      Const.AUDIO_SAMPLE_RATE[this.audioSampleRate],
      Const.AUDIO_CHANNEL_COUNT[this.audioChannelCount],
      Const.AUDIO_BITRATE[this.audioBitrate],
      Const.AUDIO_CAPTURE_LATENCY_MODE[this.audioLatency],
      Const.VIDEO_STABILIZATION_MODE[this.stabilization],
      Const.VIDEO_PREPROC_MODE[this.preprocMode],
      Const.VIDEO_DROP_FRAME_RATE[this.dropFrameRate],
      Const.DUAL_OUTPUT_MODE[this.dualOutput]
    ];
    if (!new RecorderSettingsModel().applyPickerValues(values, data)) {
      return false;
    }
    data.enableVideoDump = this.videoDump;
    data.stopOnLowSpace = this.stopOnLowSpace;
    data.cropPercent = this.cropPercent;
    data.downsamplingTargetHeight = this.downsamplingHeight;
    data.secondaryTargetHeight = this.secondaryHeight;
    RecorderPreprocessModel.apply(data);
    return true;
  }

  toCamera(codecName: string): CameraDataModel {
    const data = new CameraDataModel();
    data.videoCodecName = codecName;
    this.apply(data);
    return data;
  }
}
