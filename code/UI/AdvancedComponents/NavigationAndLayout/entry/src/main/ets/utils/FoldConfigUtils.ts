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

const RATIO_1V1: number = 1;
const RATIO_2V3: number = 0.6666666666666666;
const RATIO_3V2: number = 1.5;
const POSITION_TOP: number = 1;
const POSITION_BOTTOM: number = 2;

/** Provides Fold Config Utils helpers for the sample. */
export class FoldConfigUtils {
  static ratioName(ratio: number): string {
    if (ratio === RATIO_1V1) {
      return '1V1';
    }
    if (ratio === RATIO_2V3) {
      return '2V3';
    }
    if (ratio === RATIO_3V2) {
      return '3V2';
    }
    return 'custom';
  }

  static positionName(position: number): string {
    if (position === POSITION_TOP) {
      return 'TOP';
    }
    if (position === POSITION_BOTTOM) {
      return 'BOTTOM';
    }
    return 'UNKNOWN';
  }

  static summary(ratioName: string, positionName: string, animation: boolean, perpendicular: boolean,
    showExtra: boolean, foldedRatioName: string, extraEnabled: boolean): string {
    return `ratio=${ratioName}, position=${positionName}, animation=${animation}, ` +
      `perp=${perpendicular}, showExtra=${showExtra}, foldedRatio=${foldedRatioName}, extra=${extraEnabled}`;
  }
}
