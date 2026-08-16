/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { CameraDataModel } from './CameraDateModel';

export class RecorderSettingsModel {
  applyPickerValues(values: string[], cameraData: CameraDataModel): boolean {
    if (values.length < Const.RECORDER_INFO.length) {
      return false;
    }
    const codecIndex = Const.VIDEO_MIMETYPE.indexOf(values[0]);
    const resolutionIndex = Const.VIDEO_RESOLUTION.indexOf(values[1]);
    const frameRateIndex = Const.VIDEO_FRAMERATE.indexOf(values[2]);
    const syncModeIndex = Const.VIDEO_DECODER_SYNC_MODE.indexOf(values[3]);
    if (codecIndex < 0 || resolutionIndex < 0 || frameRateIndex < 0 || syncModeIndex < 0) {
      return false;
    }
    this.applyCodec(codecIndex, cameraData);
    this.applyResolution(resolutionIndex, cameraData);
    cameraData.frameRate = frameRateIndex === 0 ?
      Const.FRAMERATE_VIDEO_30FPS : Const.FRAMERATE_VIDEO_60FPS;
    cameraData.isSync = syncModeIndex;
    return true;
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
