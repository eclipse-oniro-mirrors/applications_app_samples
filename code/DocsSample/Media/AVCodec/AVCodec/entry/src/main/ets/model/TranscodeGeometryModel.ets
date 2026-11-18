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

export interface TranscodeGeometryPlan {
  width: number; height: number; left: number; top: number; cropWidth: number; cropHeight: number;
  contentLeft: number; contentTop: number; contentWidth: number; contentHeight: number;
}

export class TranscodeGeometryModel {
  static even(amount: number): number { return Math.max(2, Math.floor(amount / 2) * 2); }
  static plan(sourceWidth: number, sourceHeight: number, longEdge: number, mode: number): TranscodeGeometryPlan {
    const empty: TranscodeGeometryPlan = {
      width: 0,
      height: 0,
      left: 0,
      top: 0,
      cropWidth: 0,
      cropHeight: 0,
      contentLeft: 0,
      contentTop: 0,
      contentWidth: 0,
      contentHeight: 0
    };
    if (sourceWidth < 2 || sourceHeight < 2 || sourceWidth > 16384 || sourceHeight > 16384 ||
      !Number.isInteger(sourceWidth) || !Number.isInteger(sourceHeight) ||
      sourceWidth % 2 !== 0 || sourceHeight % 2 !== 0 || !Number.isInteger(longEdge) ||
      longEdge < 0 || !Number.isInteger(mode) || mode < 0 || mode > 2) { return empty; }
    const edge: number = Math.max(sourceWidth, sourceHeight);
    const targetEdge: number = longEdge === 0 ? edge : Math.min(edge, longEdge);
    let outputWidth: number = TranscodeGeometryModel.even(sourceWidth * targetEdge / edge);
    let outputHeight: number = TranscodeGeometryModel.even(sourceHeight * targetEdge / edge);
    if (mode !== 0) {
      outputWidth = Math.max(outputWidth, outputHeight);
      outputHeight = TranscodeGeometryModel.even(outputWidth * 9 / 16);
    }
    const plan: TranscodeGeometryPlan = {
      width: outputWidth,
      height: outputHeight,
      left: 0,
      top: 0,
      cropWidth: sourceWidth,
      cropHeight: sourceHeight,
      contentLeft: 0,
      contentTop: 0,
      contentWidth: outputWidth,
      contentHeight: outputHeight
    };
    const wider: boolean = sourceWidth * outputHeight > sourceHeight * outputWidth;
    if (mode === 1) {
      if (wider) {
        plan.cropWidth = TranscodeGeometryModel.even(sourceHeight * outputWidth / outputHeight);
      } else {
        plan.cropHeight = TranscodeGeometryModel.even(sourceWidth * outputHeight / outputWidth);
      }
      plan.left = Math.floor((sourceWidth - plan.cropWidth) / 4) * 2;
      plan.top = Math.floor((sourceHeight - plan.cropHeight) / 4) * 2;
    } else if (mode === 2) {
      if (wider) {
        plan.contentHeight = TranscodeGeometryModel.even(sourceHeight * outputWidth / sourceWidth);
      } else {
        plan.contentWidth = TranscodeGeometryModel.even(sourceWidth * outputHeight / sourceHeight);
      }
      plan.contentLeft = Math.floor((outputWidth - plan.contentWidth) / 4) * 2;
      plan.contentTop = Math.floor((outputHeight - plan.contentHeight) / 4) * 2;
    }
    return plan;
  }
}
