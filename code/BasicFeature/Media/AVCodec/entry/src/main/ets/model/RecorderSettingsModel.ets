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
import { CameraDataModel } from './CameraDataModel';

export class RecorderSettingsModel {
  applyPickerValues(values: string[], cameraData: CameraDataModel): boolean {
    if (values.length < Const.RECORDER_INFO.length) {
      return false;
    }
    const outputFormatIndex = Const.OUTPUT_FORMAT.indexOf(values[0]);
    const codecIndex = Const.VIDEO_MIMETYPE.indexOf(values[1]);
    const resolutionIndex = Const.VIDEO_RESOLUTION.indexOf(values[2]);
    const frameRateIndex = Const.VIDEO_FRAMERATE.indexOf(values[3]);
    const syncModeIndex = Const.VIDEO_DECODER_SYNC_MODE.indexOf(values[4]);
    const bitrateIndex = Const.VIDEO_BITRATE.indexOf(values[5]);
    const bitrateModeIndex = Const.VIDEO_BITRATE_MODE.indexOf(values[6]);
    const iFrameIntervalIndex = Const.VIDEO_I_FRAME_INTERVAL.indexOf(values[7]);
    const audioSampleRateIndex = Const.AUDIO_SAMPLE_RATE.indexOf(values[8]);
    const audioChannelIndex = Const.AUDIO_CHANNEL_COUNT.indexOf(values[9]);
    const audioBitrateIndex = Const.AUDIO_BITRATE.indexOf(values[10]);
    const audioLatencyIndex = Const.AUDIO_CAPTURE_LATENCY_MODE.indexOf(values[11]);
    const stabilizationIndex = Const.VIDEO_STABILIZATION_MODE.indexOf(values[12]);
    if (outputFormatIndex < 0 || codecIndex < 0 || resolutionIndex < 0 || frameRateIndex < 0 || syncModeIndex < 0 ||
      bitrateIndex < 0 || bitrateModeIndex < 0 || iFrameIntervalIndex < 0 || audioSampleRateIndex < 0 ||
      audioChannelIndex < 0 || audioBitrateIndex < 0 || audioLatencyIndex < 0 || stabilizationIndex < 0) {
      return false;
    }
    cameraData.outputFormat = outputFormatIndex === 0 ? Const.FORMAT_MP4 : Const.FORMAT_FLV;
    this.applyCodec(codecIndex, cameraData);
    this.applyResolution(resolutionIndex, cameraData);
    cameraData.frameRate = frameRateIndex === 0 ?
      Const.FRAMERATE_VIDEO_30FPS : Const.FRAMERATE_VIDEO_60FPS;
    cameraData.isSync = syncModeIndex;
    cameraData.bitRate = this.getBitrate(bitrateIndex);
    cameraData.bitrateMode = bitrateModeIndex === 0 ? Const.VIDEO_BITRATE_MODE_CBR : Const.VIDEO_BITRATE_MODE_VBR;
    cameraData.iFrameInterval = this.getIFrameInterval(iFrameIntervalIndex);
    cameraData.audioSampleRate = audioSampleRateIndex === 0 ?
      Const.AUDIO_SAMPLE_RATE_44100 : Const.AUDIO_SAMPLE_RATE_48000;
    cameraData.audioChannelCount = audioChannelIndex === 0 ?
      Const.AUDIO_CHANNEL_COUNT_MONO : Const.AUDIO_CHANNEL_COUNT_STEREO;
    cameraData.audioBitRate = this.getAudioBitrate(audioBitrateIndex);
    cameraData.audioCaptureLatencyMode = audioLatencyIndex === 0 ?
      Const.AUDIO_CAPTURE_LATENCY_NORMAL : Const.AUDIO_CAPTURE_LATENCY_LOW;
    cameraData.videoStabilizationMode = stabilizationIndex === 0 ?
      Const.VIDEO_STABILIZATION_DISABLED : Const.VIDEO_STABILIZATION_AUTO;
    return true;
  }

  private getAudioBitrate(index: number): number {
    if (index === 0) {
      return Const.AUDIO_BITRATE_32K;
    }
    if (index === 1) {
      return Const.AUDIO_BITRATE_64K;
    }
    return Const.AUDIO_BITRATE_128K;
  }

  private getBitrate(index: number): number {
    if (index === 0) {
      return Const.BITRATE_VIDEO_10M;
    }
    if (index === 1) {
      return Const.BITRATE_VIDEO_20M;
    }
    return Const.BITRATE_VIDEO_30M;
  }

  private getIFrameInterval(index: number): number {
    if (index === 0) {
      return Const.I_FRAME_INTERVAL_100_MS;
    }
    if (index === 1) {
      return Const.I_FRAME_INTERVAL_1_S;
    }
    return Const.I_FRAME_INTERVAL_2_S;
  }

  private applyCodec(codecIndex: number, cameraData: CameraDataModel): void {
    if (codecIndex === 0) {
      cameraData.setCodecFormat(Const.TRUE, Const.MIME_VIDEO_HEVC);
    } else if (codecIndex === 1) {
      cameraData.setCodecFormat(Const.FALSE, Const.MIME_VIDEO_AVC);
    } else {
      cameraData.setCodecFormat(Const.FALSE, Const.MIME_VIDEO_HEVC);
    }
  }

  private applyResolution(resolutionIndex: number, cameraData: CameraDataModel): void {
    if (resolutionIndex === 0) {
      cameraData.setResolution(Const.VIDEO_WIDTH_4K, Const.VIDEO_HEIGHT_4K, Const.BITRATE_VIDEO_30M);
    } else if (resolutionIndex === 1) {
      cameraData.setResolution(Const.VIDEO_WIDTH_1080P, Const.VIDEO_HEIGHT_1080P, Const.BITRATE_VIDEO_20M);
    } else {
      cameraData.setResolution(Const.VIDEO_WIDTH_720P, Const.VIDEO_HEIGHT_720P, Const.BITRATE_VIDEO_10M);
    }
  }
}
