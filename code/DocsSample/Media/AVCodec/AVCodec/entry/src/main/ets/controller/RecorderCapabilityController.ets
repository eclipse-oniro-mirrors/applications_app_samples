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

import { common } from '@kit.AbilityKit';
import { camera } from '@kit.CameraKit';
import { CameraDataModel } from '../model/CameraDataModel';
import {
  bufferProfileCameraCheck,
  encoderProfileCameraCheck,
  setFirstCameraProfile
} from '../common/utils/CameraCheck';
import { CommonConstants as Const } from '../common/CommonConstants';

export class RecorderCapabilityController {
  static async check(context: common.Context, data: CameraDataModel): Promise<Resource> {
    const manager: camera.CameraManager = camera.getCameraManager(context);
    if (data.bufferInput) {
      return bufferProfileCameraCheck(manager, data) === undefined ?
        $r('app.string.recorder_buffer_profile_unavailable') : $r('app.string.success');
    }
    if (encoderProfileCameraCheck(manager, data) !== undefined) { return $r('app.string.success'); }
    // 回退相机规格时保留声音开关等录制选项。
    const fallback: CameraDataModel = new CameraDataModel();
    const profile = encoderProfileCameraCheck(manager, fallback) ?? setFirstCameraProfile(manager);
    if (profile !== undefined) {
      data.cameraWidth = profile.size.width;
      data.cameraHeight = profile.size.height;
      data.frameRate = profile.frameRateRange.max;
      data.bitRate = Const.BITRATE_VIDEO_2M;
      data.format = profile.format;
    }
    return $r('app.string.alert1');
  }
}
