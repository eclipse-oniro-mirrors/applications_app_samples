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

import { display } from '@kit.ArkUI';

/**
 * Computes the screen diagonal in inches from the given display information.
 *
 * Diagonal pixels = sqrt(width^2 + height^2), effective dpi =
 * densityDPI / densityPixels, and the result is rounded to the nearest
 * integer. Any invalid input yields 0.
 *
 * @param info Display information providing width, height, densityDPI and densityPixels.
 * @returns Screen diagonal in inches, or 0 when the input is invalid.
 */
export function calculateScreenDiagonalInches(info: display.Display): number {
  const width: number = info.width;
  const height: number = info.height;
  const densityDPI: number = info.densityDPI;
  const densityPixels: number = info.densityPixels;

  if (width <= 0 || height <= 0 || densityDPI <= 0 || densityPixels <= 0) {
    return 0;
  }

  const dpi: number = densityDPI / densityPixels;
  if (dpi <= 0) {
    return 0;
  }

  const diagonalPixels: number = Math.sqrt(width * width + height * height);
  const inches: number = diagonalPixels / dpi;
  return parseFloat(inches.toFixed(0));
}
