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

// Import the display module for screen metrics and density conversion.
import { display } from '@kit.ArkUI';
// Import the in-house logger so display lookup failures are observable.
import { Logger } from './Logger';

// The module tag used for every log line emitted by this utility.
const TAG: string = 'DisplayUtils';
// The fallback density applied when the primary display cannot be resolved.
const FALLBACK_DENSITY: number = 3.0;

// Screen metric helpers: resolution, density and px <-> vp / fp conversions.
export class DisplayUtils {
  // Returns the default display object synchronously, or null when unavailable.
  private static primaryDisplay(): display.Display | null {
    try {
      // Ask the display service for the default display synchronously.
      return display.getDefaultDisplaySync();
    } catch (error) {
      // Log the failure so layout fallbacks are traceable.
      Logger.warn(TAG, 'getDefaultDisplaySync failed');
      // Report the absence to the caller.
      return null;
    }
  }

  // Returns the physical pixel width of the primary display.
  static widthPx(): number {
    // Resolve the display first.
    const d: display.Display | null = DisplayUtils.primaryDisplay();
    // Return the width when the display is available.
    return d === null ? 0 : d.width;
  }

  // Returns the physical pixel height of the primary display.
  static heightPx(): number {
    // Resolve the display first.
    const d: display.Display | null = DisplayUtils.primaryDisplay();
    // Return the height when the display is available.
    return d === null ? 0 : d.height;
  }

  // Returns the density factor used to convert vp into px.
  static densityPixels(): number {
    // Resolve the display first.
    const d: display.Display | null = DisplayUtils.primaryDisplay();
    // Return the real density when available, otherwise the phone-like fallback.
    return d === null ? FALLBACK_DENSITY : d.densityPixels;
  }

  // Returns the font scaling factor; the platform has no separate font density, so the screen density is used.
  static densityFontPixels(): number {
    // Resolve the display first.
    const d: display.Display | null = DisplayUtils.primaryDisplay();
    // Reuse the screen density because Display exposes no dedicated font density field.
    return d === null ? FALLBACK_DENSITY : d.densityPixels;
  }

  // Converts virtual pixels into physical pixels.
  static vpToPx(vp: number): number {
    // Scale the vp value by the screen density.
    return vp * DisplayUtils.densityPixels();
  }

  // Converts physical pixels into virtual pixels.
  static pxToVp(px: number): number {
    // Divide the px value by the screen density.
    return px / DisplayUtils.densityPixels();
  }

  // Converts font pixels into physical pixels.
  static fpToPx(fp: number): number {
    // Scale the fp value by the font density.
    return fp * DisplayUtils.densityFontPixels();
  }

  // Converts physical pixels into font pixels.
  static pxToFp(px: number): number {
    // Divide the px value by the font density.
    return px / DisplayUtils.densityFontPixels();
  }

  // Returns the screen refresh rate in Hz when the display reports it.
  static refreshRate(): number {
    // Resolve the display first.
    const d: display.Display | null = DisplayUtils.primaryDisplay();
    // Return the reported refresh rate when available.
    return d === null ? 0 : d.refreshRate;
  }

  // Returns the display rotation in degrees (0, 90, 180 or 270).
  static rotation(): number {
    // Resolve the display first.
    const d: display.Display | null = DisplayUtils.primaryDisplay();
    // Return the reported rotation when available.
    return d === null ? 0 : d.rotation;
  }

  // Returns true when the display is currently wider than it is tall.
  static isLandscape(): boolean {
    // Compare width and height of the primary display.
    return DisplayUtils.widthPx() >= DisplayUtils.heightPx();
  }
}
