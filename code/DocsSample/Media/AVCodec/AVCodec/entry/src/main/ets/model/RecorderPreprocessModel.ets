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

import { CameraDataModel } from './CameraDataModel';
import { CommonConstants as Const } from '../common/CommonConstants';

export interface RecorderPreprocessPlan {
  inputWidth: number;
  inputHeight: number;
  cropLeft: number;
  cropTop: number;
  cropWidth: number;
  cropHeight: number;
  primaryWidth: number;
  primaryHeight: number;
  secondaryWidth: number;
  secondaryHeight: number;
  outputFrameRate: number;
}

export class RecorderPreprocessModel {
  static plan(inputWidth: number, inputHeight: number, frameRate: number, mode: number,
    cropPercent: number, downsamplingHeight: number, secondaryHeight: number, dropFrameRate: number): RecorderPreprocessPlan {
    const percent: number = Math.max(50, Math.min(100, cropPercent));
    const cropWidth: number = Math.max(2, Math.floor(inputWidth * percent / 100 / 2) * 2);
    const cropHeight: number = Math.max(2, Math.floor(inputHeight * percent / 100 / 2) * 2);
    const left: number = Math.floor((inputWidth - cropWidth) / 2);
    const top: number = Math.floor((inputHeight - cropHeight) / 2);
    const downScale: number = Math.min(1, downsamplingHeight / Math.max(1, inputHeight));
    const secondaryScale: number = Math.min(1, secondaryHeight / Math.max(1, inputHeight));
    const scaledWidth: number = Math.max(2, Math.floor(inputWidth * downScale / 2) * 2);
    const scaledHeight: number = Math.max(2, Math.floor(inputHeight * downScale / 2) * 2);
    return {
      inputWidth: inputWidth, inputHeight: inputHeight, cropLeft: left - left % 2, cropTop: top - top % 2,
      cropWidth: cropWidth, cropHeight: cropHeight,
      primaryWidth: mode === Const.VIDEO_PREPROC_CROP ? cropWidth :
        (mode === Const.VIDEO_PREPROC_DOWNSAMPLING ? scaledWidth : inputWidth),
      primaryHeight: mode === Const.VIDEO_PREPROC_CROP ? cropHeight :
        (mode === Const.VIDEO_PREPROC_DOWNSAMPLING ? scaledHeight : inputHeight),
      secondaryWidth: Math.max(2, Math.floor(inputWidth * secondaryScale / 2) * 2),
      secondaryHeight: Math.max(2, Math.floor(inputHeight * secondaryScale / 2) * 2),
      outputFrameRate: dropFrameRate > 0 && dropFrameRate < frameRate ? dropFrameRate : frameRate
    };
  }

  static forCamera(data: CameraDataModel): RecorderPreprocessPlan {
    return RecorderPreprocessModel.plan(data.cameraWidth, data.cameraHeight, data.frameRate, data.preprocMode,
      data.cropPercent, data.downsamplingTargetHeight, data.secondaryTargetHeight, data.dropToFrameRate);
  }

  static apply(data: CameraDataModel): void {
    const plan: RecorderPreprocessPlan = RecorderPreprocessModel.forCamera(data);
    const downsample: RecorderPreprocessPlan = RecorderPreprocessModel.plan(data.cameraWidth, data.cameraHeight,
      data.frameRate, Const.VIDEO_PREPROC_DOWNSAMPLING, data.cropPercent, data.downsamplingTargetHeight,
      data.secondaryTargetHeight, data.dropToFrameRate);
    data.downsamplingWidth = downsample.primaryWidth;
    data.downsamplingHeight = downsample.primaryHeight;
    // SDK 使用包含右下边界的坐标；宽高和左上起点保持偶数，不能把 right/bottom 再强制对齐。
    data.cropLeft = plan.cropLeft;
    data.cropTop = plan.cropTop;
    data.cropRight = plan.cropLeft + plan.cropWidth - 1;
    data.cropBottom = plan.cropTop + plan.cropHeight - 1;
  }
}
