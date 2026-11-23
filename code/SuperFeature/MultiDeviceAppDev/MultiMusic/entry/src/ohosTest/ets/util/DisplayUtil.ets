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

// The global vp2px() helper is deprecated since API 18 (use UIContext.vp2px instead), and a
// UIContext is not reachable from a plain Hypium case. The display density gives the same
// conversion without binding the tests to a UI instance, and it is read only once.

import { display } from '@kit.ArkUI';

const DEFAULT_DENSITY: number = 1;
let cachedDensity: number = 0;

/**
 * Converts a length in vp to the matching length in px on the default display.
 *
 * @param value length in vp.
 * @returns length in px.
 */
export function vpToPx(value: number): number {
  if (cachedDensity === 0) {
    cachedDensity = display.getDefaultDisplaySync().densityPixels;
  }
  const density: number = cachedDensity > 0 ? cachedDensity : DEFAULT_DENSITY;
  return value * density;
}
