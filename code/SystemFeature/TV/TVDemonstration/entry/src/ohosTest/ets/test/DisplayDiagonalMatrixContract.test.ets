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

import { beforeEach, describe, expect, it } from '@ohos/hypium';
import { display } from '@kit.ArkUI';
import { AsyncCallback } from '@kit.BasicServicesKit';
import { calculateScreenDiagonalInches } from './DisplayDiagonalPolicy';
import { keepMainThreadResponsive } from './MainThreadYield';


/** Builds a hand-written mock implementing display.Display for the stub. */
function buildMockDisplay(width: number, height: number, densityDPI: number, densityPixels: number): display.Display {
  return {
    id: 1,
    name: 'stub-display',
    alive: true,
    state: display.DisplayState.STATE_ON,
    refreshRate: 60,
    rotation: 0,
    width: width,
    height: height,
    availableWidth: width,
    availableHeight: height,
    densityDPI: densityDPI,
    orientation: display.Orientation.LANDSCAPE,
    densityPixels: densityPixels,
    scaledDensity: densityPixels,
    xDPI: densityDPI,
    yDPI: densityDPI,
    screenShape: display.ScreenShape.RECTANGLE,
    colorSpaces: [],
    hdrFormats: [],
    getCutoutInfo(): Promise<display.CutoutInfo> {
      return Promise.resolve({
        boundingRects: [],
        waterfallDisplayAreaRects: {
          left: {
            left: 0,
            top: 0,
            width: 0,
            height: 0
          } as display.Rect,
          top: {
            left: 0,
            top: 0,
            width: 0,
            height: 0
          } as display.Rect,
          right: {
            left: 0,
            top: 0,
            width: 0,
            height: 0
          } as display.Rect,
          bottom: {
            left: 0,
            top: 0,
            width: 0,
            height: 0
          } as display.Rect
        } as display.WaterfallDisplayAreaRects
      } as display.CutoutInfo);
    },
    getAvailableArea(): Promise<display.Rect> {
      return Promise.resolve({
        left: 0,
        top: 0,
        width: width,
        height: height
      } as display.Rect);
    },
    on(type: 'availableAreaChange', callback: Callback<display.Rect>): void {
    },
    off(type: 'availableAreaChange', callback?: Callback<display.Rect>): void {
    },
    getDisplayCapability(): string {
      return '';
    },
    hasImmersiveWindow(callback?: AsyncCallback<boolean>): Promise<boolean> {
      return Promise.resolve(false);
    }
  } as display.Display;
}

/** Tuple shape: [width, height, densityDPI, densityPixels, expectedInches]. */
const DIAGONAL_MATRIX: number[][] = [

  [1920, 1080, 160.0000, 1.0000, 14], // FHD 1920x1080 @ 160.00 dpi
  [1920, 1080, 240.0000, 1.0000, 9], // FHD 1920x1080 @ 240.00 dpi
  [1920, 1080, 320.0000, 2.0000, 14], // FHD 1920x1080 @ 160.00 dpi
  [1920, 1080, 213.0000, 1.5000, 16], // FHD 1920x1080 @ 142.00 dpi
  [1920, 1080, 240.0000, 1.5000, 14], // FHD 1920x1080 @ 160.00 dpi
  [1920, 1080, 400.0000, 2.5000, 14], // FHD 1920x1080 @ 160.00 dpi
  [1920, 1080, 266.6670, 1.6667, 14], // FHD 1920x1080 @ 160.00 dpi
  [1920, 1080, 280.0000, 1.7500, 14], // FHD 1920x1080 @ 160.00 dpi
  [1920, 1080, 500.0000, 3.1250, 14], // FHD 1920x1080 @ 160.00 dpi
  [1920, 1080, 213.3330, 1.3333, 14], // FHD 1920x1080 @ 160.00 dpi
  [1920, 1080, 96.0000, 1.0000, 23], // FHD 1920x1080 @ 96.00 dpi
  [1920, 1080, 120.0000, 1.0000, 18], // FHD 1920x1080 @ 120.00 dpi
  [1920, 1080, 160.0000, 1.3333, 18], // FHD 1920x1080 @ 120.00 dpi
  [1920, 1080, 192.0000, 1.6000, 18], // FHD 1920x1080 @ 120.00 dpi
  [1920, 1080, 288.0000, 1.8000, 14], // FHD 1920x1080 @ 160.00 dpi
  [1280, 720, 160.0000, 1.0000, 9], // HD 1280x720 @ 160.00 dpi
  [1280, 720, 240.0000, 1.0000, 6], // HD 1280x720 @ 240.00 dpi
  [1280, 720, 320.0000, 2.0000, 9], // HD 1280x720 @ 160.00 dpi
  [1280, 720, 213.0000, 1.5000, 10], // HD 1280x720 @ 142.00 dpi
  [1280, 720, 240.0000, 1.5000, 9], // HD 1280x720 @ 160.00 dpi
  [1280, 720, 400.0000, 2.5000, 9], // HD 1280x720 @ 160.00 dpi
  [1280, 720, 266.6670, 1.6667, 9], // HD 1280x720 @ 160.00 dpi
  [1280, 720, 280.0000, 1.7500, 9], // HD 1280x720 @ 160.00 dpi
  [1280, 720, 500.0000, 3.1250, 9], // HD 1280x720 @ 160.00 dpi
  [1280, 720, 213.3330, 1.3333, 9], // HD 1280x720 @ 160.00 dpi
  [1280, 720, 96.0000, 1.0000, 15], // HD 1280x720 @ 96.00 dpi
  [1280, 720, 120.0000, 1.0000, 12], // HD 1280x720 @ 120.00 dpi
  [1280, 720, 160.0000, 1.3333, 12], // HD 1280x720 @ 120.00 dpi
  [1280, 720, 192.0000, 1.6000, 12], // HD 1280x720 @ 120.00 dpi
  [1280, 720, 288.0000, 1.8000, 9], // HD 1280x720 @ 160.00 dpi
  [3840, 2160, 160.0000, 1.0000, 28], // UHD4K 3840x2160 @ 160.00 dpi
  [3840, 2160, 240.0000, 1.0000, 18], // UHD4K 3840x2160 @ 240.00 dpi
  [3840, 2160, 320.0000, 2.0000, 28], // UHD4K 3840x2160 @ 160.00 dpi
  [3840, 2160, 213.0000, 1.5000, 31], // UHD4K 3840x2160 @ 142.00 dpi
  [3840, 2160, 240.0000, 1.5000, 28], // UHD4K 3840x2160 @ 160.00 dpi
  [3840, 2160, 400.0000, 2.5000, 28], // UHD4K 3840x2160 @ 160.00 dpi
  [3840, 2160, 266.6670, 1.6667, 28], // UHD4K 3840x2160 @ 160.00 dpi
  [3840, 2160, 280.0000, 1.7500, 28], // UHD4K 3840x2160 @ 160.00 dpi
  [3840, 2160, 500.0000, 3.1250, 28], // UHD4K 3840x2160 @ 160.00 dpi
  [3840, 2160, 213.3330, 1.3333, 28], // UHD4K 3840x2160 @ 160.00 dpi
  [3840, 2160, 96.0000, 1.0000, 46], // UHD4K 3840x2160 @ 96.00 dpi
  [3840, 2160, 120.0000, 1.0000, 37], // UHD4K 3840x2160 @ 120.00 dpi
  [3840, 2160, 160.0000, 1.3333, 37], // UHD4K 3840x2160 @ 120.00 dpi
  [3840, 2160, 192.0000, 1.6000, 37], // UHD4K 3840x2160 @ 120.00 dpi
  [3840, 2160, 288.0000, 1.8000, 28], // UHD4K 3840x2160 @ 160.00 dpi
  [1366, 768, 160.0000, 1.0000, 10], // WXGA 1366x768 @ 160.00 dpi
  [1366, 768, 240.0000, 1.0000, 7], // WXGA 1366x768 @ 240.00 dpi
  [1366, 768, 320.0000, 2.0000, 10], // WXGA 1366x768 @ 160.00 dpi
  [1366, 768, 213.0000, 1.5000, 11], // WXGA 1366x768 @ 142.00 dpi
  [1366, 768, 240.0000, 1.5000, 10], // WXGA 1366x768 @ 160.00 dpi
  [1366, 768, 400.0000, 2.5000, 10], // WXGA 1366x768 @ 160.00 dpi
  [1366, 768, 266.6670, 1.6667, 10], // WXGA 1366x768 @ 160.00 dpi
  [1366, 768, 280.0000, 1.7500, 10], // WXGA 1366x768 @ 160.00 dpi
  [1366, 768, 500.0000, 3.1250, 10], // WXGA 1366x768 @ 160.00 dpi
  [1366, 768, 213.3330, 1.3333, 10], // WXGA 1366x768 @ 160.00 dpi
  [1366, 768, 96.0000, 1.0000, 16], // WXGA 1366x768 @ 96.00 dpi
  [1366, 768, 120.0000, 1.0000, 13], // WXGA 1366x768 @ 120.00 dpi
  [1366, 768, 160.0000, 1.3333, 13], // WXGA 1366x768 @ 120.00 dpi
  [1366, 768, 192.0000, 1.6000, 13], // WXGA 1366x768 @ 120.00 dpi
  [1366, 768, 288.0000, 1.8000, 10], // WXGA 1366x768 @ 160.00 dpi
  [1600, 900, 160.0000, 1.0000, 11], // HDPlus 1600x900 @ 160.00 dpi
  [1600, 900, 240.0000, 1.0000, 8], // HDPlus 1600x900 @ 240.00 dpi
  [1600, 900, 320.0000, 2.0000, 11], // HDPlus 1600x900 @ 160.00 dpi
  [1600, 900, 213.0000, 1.5000, 13], // HDPlus 1600x900 @ 142.00 dpi
  [1600, 900, 240.0000, 1.5000, 11], // HDPlus 1600x900 @ 160.00 dpi
  [1600, 900, 400.0000, 2.5000, 11], // HDPlus 1600x900 @ 160.00 dpi
  [1600, 900, 266.6670, 1.6667, 11], // HDPlus 1600x900 @ 160.00 dpi
  [1600, 900, 280.0000, 1.7500, 11], // HDPlus 1600x900 @ 160.00 dpi
  [1600, 900, 500.0000, 3.1250, 11], // HDPlus 1600x900 @ 160.00 dpi
  [1600, 900, 213.3330, 1.3333, 11], // HDPlus 1600x900 @ 160.00 dpi
  [1600, 900, 96.0000, 1.0000, 19], // HDPlus 1600x900 @ 96.00 dpi
  [1600, 900, 120.0000, 1.0000, 15], // HDPlus 1600x900 @ 120.00 dpi
  [1600, 900, 160.0000, 1.3333, 15], // HDPlus 1600x900 @ 120.00 dpi
  [1600, 900, 192.0000, 1.6000, 15], // HDPlus 1600x900 @ 120.00 dpi
  [1600, 900, 288.0000, 1.8000, 11], // HDPlus 1600x900 @ 160.00 dpi
  [2560, 1440, 160.0000, 1.0000, 18], // QHD 2560x1440 @ 160.00 dpi
  [2560, 1440, 240.0000, 1.0000, 12], // QHD 2560x1440 @ 240.00 dpi
  [2560, 1440, 320.0000, 2.0000, 18], // QHD 2560x1440 @ 160.00 dpi
  [2560, 1440, 213.0000, 1.5000, 21], // QHD 2560x1440 @ 142.00 dpi
  [2560, 1440, 240.0000, 1.5000, 18], // QHD 2560x1440 @ 160.00 dpi
  [2560, 1440, 400.0000, 2.5000, 18], // QHD 2560x1440 @ 160.00 dpi
  [2560, 1440, 266.6670, 1.6667, 18], // QHD 2560x1440 @ 160.00 dpi
  [2560, 1440, 280.0000, 1.7500, 18], // QHD 2560x1440 @ 160.00 dpi
  [2560, 1440, 500.0000, 3.1250, 18], // QHD 2560x1440 @ 160.00 dpi
  [2560, 1440, 213.3330, 1.3333, 18], // QHD 2560x1440 @ 160.00 dpi
  [2560, 1440, 96.0000, 1.0000, 31], // QHD 2560x1440 @ 96.00 dpi
  [2560, 1440, 120.0000, 1.0000, 24], // QHD 2560x1440 @ 120.00 dpi
  [2560, 1440, 160.0000, 1.3333, 24], // QHD 2560x1440 @ 120.00 dpi
  [2560, 1440, 192.0000, 1.6000, 24], // QHD 2560x1440 @ 120.00 dpi
  [2560, 1440, 288.0000, 1.8000, 18], // QHD 2560x1440 @ 160.00 dpi
  [720, 480, 160.0000, 1.0000, 5], // SD 720x480 @ 160.00 dpi
  [720, 480, 240.0000, 1.0000, 4], // SD 720x480 @ 240.00 dpi
  [720, 480, 320.0000, 2.0000, 5], // SD 720x480 @ 160.00 dpi
  [720, 480, 213.0000, 1.5000, 6], // SD 720x480 @ 142.00 dpi
  [720, 480, 240.0000, 1.5000, 5], // SD 720x480 @ 160.00 dpi
  [720, 480, 400.0000, 2.5000, 5], // SD 720x480 @ 160.00 dpi
  [720, 480, 266.6670, 1.6667, 5], // SD 720x480 @ 160.00 dpi
  [720, 480, 280.0000, 1.7500, 5], // SD 720x480 @ 160.00 dpi
  [720, 480, 500.0000, 3.1250, 5], // SD 720x480 @ 160.00 dpi
  [720, 480, 213.3330, 1.3333, 5], // SD 720x480 @ 160.00 dpi
  [720, 480, 96.0000, 1.0000, 9], // SD 720x480 @ 96.00 dpi
  [720, 480, 120.0000, 1.0000, 7], // SD 720x480 @ 120.00 dpi
  [720, 480, 160.0000, 1.3333, 7], // SD 720x480 @ 120.00 dpi
  [720, 480, 192.0000, 1.6000, 7], // SD 720x480 @ 120.00 dpi
  [720, 480, 288.0000, 1.8000, 5], // SD 720x480 @ 160.00 dpi
  [960, 540, 160.0000, 1.0000, 7], // qHD 960x540 @ 160.00 dpi
  [960, 540, 240.0000, 1.0000, 5], // qHD 960x540 @ 240.00 dpi
  [960, 540, 320.0000, 2.0000, 7], // qHD 960x540 @ 160.00 dpi
  [960, 540, 213.0000, 1.5000, 8], // qHD 960x540 @ 142.00 dpi
  [960, 540, 240.0000, 1.5000, 7], // qHD 960x540 @ 160.00 dpi
  [960, 540, 400.0000, 2.5000, 7], // qHD 960x540 @ 160.00 dpi
  [960, 540, 266.6670, 1.6667, 7], // qHD 960x540 @ 160.00 dpi
  [960, 540, 280.0000, 1.7500, 7], // qHD 960x540 @ 160.00 dpi
  [960, 540, 500.0000, 3.1250, 7], // qHD 960x540 @ 160.00 dpi
  [960, 540, 213.3330, 1.3333, 7], // qHD 960x540 @ 160.00 dpi
  [960, 540, 96.0000, 1.0000, 11], // qHD 960x540 @ 96.00 dpi
  [960, 540, 120.0000, 1.0000, 9], // qHD 960x540 @ 120.00 dpi
  [960, 540, 160.0000, 1.3333, 9], // qHD 960x540 @ 120.00 dpi
  [960, 540, 192.0000, 1.6000, 9], // qHD 960x540 @ 120.00 dpi
  [960, 540, 288.0000, 1.8000, 7], // qHD 960x540 @ 160.00 dpi
  [1024, 768, 160.0000, 1.0000, 8], // XGA 1024x768 @ 160.00 dpi
  [1024, 768, 240.0000, 1.0000, 5], // XGA 1024x768 @ 240.00 dpi
  [1024, 768, 320.0000, 2.0000, 8], // XGA 1024x768 @ 160.00 dpi
  [1024, 768, 213.0000, 1.5000, 9], // XGA 1024x768 @ 142.00 dpi
  [1024, 768, 240.0000, 1.5000, 8], // XGA 1024x768 @ 160.00 dpi
  [1024, 768, 400.0000, 2.5000, 8], // XGA 1024x768 @ 160.00 dpi
  [1024, 768, 266.6670, 1.6667, 8], // XGA 1024x768 @ 160.00 dpi
  [1024, 768, 280.0000, 1.7500, 8], // XGA 1024x768 @ 160.00 dpi
  [1024, 768, 500.0000, 3.1250, 8], // XGA 1024x768 @ 160.00 dpi
  [1024, 768, 213.3330, 1.3333, 8], // XGA 1024x768 @ 160.00 dpi
  [1024, 768, 96.0000, 1.0000, 13], // XGA 1024x768 @ 96.00 dpi
  [1024, 768, 120.0000, 1.0000, 11], // XGA 1024x768 @ 120.00 dpi
  [1024, 768, 160.0000, 1.3333, 11], // XGA 1024x768 @ 120.00 dpi
  [1024, 768, 192.0000, 1.6000, 11], // XGA 1024x768 @ 120.00 dpi
  [1024, 768, 288.0000, 1.8000, 8], // XGA 1024x768 @ 160.00 dpi
  [1280, 1024, 160.0000, 1.0000, 10], // SXGA 1280x1024 @ 160.00 dpi
  [1280, 1024, 240.0000, 1.0000, 7], // SXGA 1280x1024 @ 240.00 dpi
  [1280, 1024, 320.0000, 2.0000, 10], // SXGA 1280x1024 @ 160.00 dpi
  [1280, 1024, 213.0000, 1.5000, 12], // SXGA 1280x1024 @ 142.00 dpi
  [1280, 1024, 240.0000, 1.5000, 10], // SXGA 1280x1024 @ 160.00 dpi
  [1280, 1024, 400.0000, 2.5000, 10], // SXGA 1280x1024 @ 160.00 dpi
  [1280, 1024, 266.6670, 1.6667, 10], // SXGA 1280x1024 @ 160.00 dpi
  [1280, 1024, 280.0000, 1.7500, 10], // SXGA 1280x1024 @ 160.00 dpi
  [1280, 1024, 500.0000, 3.1250, 10], // SXGA 1280x1024 @ 160.00 dpi
  [1280, 1024, 213.3330, 1.3333, 10], // SXGA 1280x1024 @ 160.00 dpi
  [1280, 1024, 96.0000, 1.0000, 17], // SXGA 1280x1024 @ 96.00 dpi
  [1280, 1024, 120.0000, 1.0000, 14], // SXGA 1280x1024 @ 120.00 dpi
  [1280, 1024, 160.0000, 1.3333, 14], // SXGA 1280x1024 @ 120.00 dpi
  [1280, 1024, 192.0000, 1.6000, 14], // SXGA 1280x1024 @ 120.00 dpi
  [1280, 1024, 288.0000, 1.8000, 10], // SXGA 1280x1024 @ 160.00 dpi
  [1680, 1050, 160.0000, 1.0000, 12], // WSXGA 1680x1050 @ 160.00 dpi
  [1680, 1050, 240.0000, 1.0000, 8], // WSXGA 1680x1050 @ 240.00 dpi
  [1680, 1050, 320.0000, 2.0000, 12], // WSXGA 1680x1050 @ 160.00 dpi
  [1680, 1050, 213.0000, 1.5000, 14], // WSXGA 1680x1050 @ 142.00 dpi
  [1680, 1050, 240.0000, 1.5000, 12], // WSXGA 1680x1050 @ 160.00 dpi
  [1680, 1050, 400.0000, 2.5000, 12], // WSXGA 1680x1050 @ 160.00 dpi
  [1680, 1050, 266.6670, 1.6667, 12], // WSXGA 1680x1050 @ 160.00 dpi
  [1680, 1050, 280.0000, 1.7500, 12], // WSXGA 1680x1050 @ 160.00 dpi
  [1680, 1050, 500.0000, 3.1250, 12], // WSXGA 1680x1050 @ 160.00 dpi
  [1680, 1050, 213.3330, 1.3333, 12], // WSXGA 1680x1050 @ 160.00 dpi
  [1680, 1050, 96.0000, 1.0000, 21], // WSXGA 1680x1050 @ 96.00 dpi
  [1680, 1050, 120.0000, 1.0000, 17], // WSXGA 1680x1050 @ 120.00 dpi
  [1680, 1050, 160.0000, 1.3333, 17], // WSXGA 1680x1050 @ 120.00 dpi
  [1680, 1050, 192.0000, 1.6000, 17], // WSXGA 1680x1050 @ 120.00 dpi
  [1680, 1050, 288.0000, 1.8000, 12], // WSXGA 1680x1050 @ 160.00 dpi
  [3440, 1440, 160.0000, 1.0000, 23], // UltraWide 3440x1440 @ 160.00 dpi
  [3440, 1440, 240.0000, 1.0000, 16], // UltraWide 3440x1440 @ 240.00 dpi
  [3440, 1440, 320.0000, 2.0000, 23], // UltraWide 3440x1440 @ 160.00 dpi
  [3440, 1440, 213.0000, 1.5000, 26], // UltraWide 3440x1440 @ 142.00 dpi
  [3440, 1440, 240.0000, 1.5000, 23], // UltraWide 3440x1440 @ 160.00 dpi
  [3440, 1440, 400.0000, 2.5000, 23], // UltraWide 3440x1440 @ 160.00 dpi
  [3440, 1440, 266.6670, 1.6667, 23], // UltraWide 3440x1440 @ 160.00 dpi
  [3440, 1440, 280.0000, 1.7500, 23], // UltraWide 3440x1440 @ 160.00 dpi
  [3440, 1440, 500.0000, 3.1250, 23], // UltraWide 3440x1440 @ 160.00 dpi
  [3440, 1440, 213.3330, 1.3333, 23], // UltraWide 3440x1440 @ 160.00 dpi
  [3440, 1440, 96.0000, 1.0000, 39], // UltraWide 3440x1440 @ 96.00 dpi
  [3440, 1440, 120.0000, 1.0000, 31], // UltraWide 3440x1440 @ 120.00 dpi
  [3440, 1440, 160.0000, 1.3333, 31], // UltraWide 3440x1440 @ 120.00 dpi
  [3440, 1440, 192.0000, 1.6000, 31], // UltraWide 3440x1440 @ 120.00 dpi
  [3440, 1440, 288.0000, 1.8000, 23], // UltraWide 3440x1440 @ 160.00 dpi
  [4096, 2160, 160.0000, 1.0000, 29], // Cinema 4096x2160 @ 160.00 dpi
  [4096, 2160, 240.0000, 1.0000, 19], // Cinema 4096x2160 @ 240.00 dpi
  [4096, 2160, 320.0000, 2.0000, 29], // Cinema 4096x2160 @ 160.00 dpi
  [4096, 2160, 213.0000, 1.5000, 33], // Cinema 4096x2160 @ 142.00 dpi
  [4096, 2160, 240.0000, 1.5000, 29], // Cinema 4096x2160 @ 160.00 dpi
  [4096, 2160, 400.0000, 2.5000, 29], // Cinema 4096x2160 @ 160.00 dpi
  [4096, 2160, 266.6670, 1.6667, 29], // Cinema 4096x2160 @ 160.00 dpi
  [4096, 2160, 280.0000, 1.7500, 29], // Cinema 4096x2160 @ 160.00 dpi
  [4096, 2160, 500.0000, 3.1250, 29], // Cinema 4096x2160 @ 160.00 dpi
  [4096, 2160, 213.3330, 1.3333, 29], // Cinema 4096x2160 @ 160.00 dpi
  [4096, 2160, 96.0000, 1.0000, 48], // Cinema 4096x2160 @ 96.00 dpi
  [4096, 2160, 120.0000, 1.0000, 39], // Cinema 4096x2160 @ 120.00 dpi
  [4096, 2160, 160.0000, 1.3333, 39], // Cinema 4096x2160 @ 120.00 dpi
  [4096, 2160, 192.0000, 1.6000, 39], // Cinema 4096x2160 @ 120.00 dpi
  [4096, 2160, 288.0000, 1.8000, 29], // Cinema 4096x2160 @ 160.00 dpi
  [720, 1280, 160.0000, 1.0000, 9], // Mobile 720x1280 @ 160.00 dpi
  [720, 1280, 240.0000, 1.0000, 6], // Mobile 720x1280 @ 240.00 dpi
  [720, 1280, 320.0000, 2.0000, 9], // Mobile 720x1280 @ 160.00 dpi
  [720, 1280, 213.0000, 1.5000, 10], // Mobile 720x1280 @ 142.00 dpi
  [720, 1280, 240.0000, 1.5000, 9], // Mobile 720x1280 @ 160.00 dpi
  [720, 1280, 400.0000, 2.5000, 9], // Mobile 720x1280 @ 160.00 dpi
  [720, 1280, 266.6670, 1.6667, 9], // Mobile 720x1280 @ 160.00 dpi
  [720, 1280, 280.0000, 1.7500, 9], // Mobile 720x1280 @ 160.00 dpi
  [720, 1280, 500.0000, 3.1250, 9], // Mobile 720x1280 @ 160.00 dpi
  [720, 1280, 213.3330, 1.3333, 9], // Mobile 720x1280 @ 160.00 dpi
  [720, 1280, 96.0000, 1.0000, 15], // Mobile 720x1280 @ 96.00 dpi
  [720, 1280, 120.0000, 1.0000, 12], // Mobile 720x1280 @ 120.00 dpi
  [720, 1280, 160.0000, 1.3333, 12], // Mobile 720x1280 @ 120.00 dpi
  [720, 1280, 192.0000, 1.6000, 12], // Mobile 720x1280 @ 120.00 dpi
  [720, 1280, 288.0000, 1.8000, 9],// Mobile 720x1280 @ 160.00 dpi
];

const GUARD_CASES: number[][] = [

  [0, 1080, 160, 1, 0], // zeroWidth
  [1920, 0, 160, 1, 0], // zeroHeight
  [-1920, 1080, 160, 1, 0], // negativeWidth
  [1920, 1080, 0, 1, 0], // zeroDpi
  [1920, 1080, 160, 0, 0], // zeroPixels
  [1920, 1080, -160, 1, 0],// negativeDensity
];

export default function displayDiagonalMatrixContractTest(): void {
  describe('DisplayDiagonalMatrixContractTest', () => {
    // Pace the pure-logic matrix; see MainThreadYield.ets.
    beforeEach(keepMainThreadResponsive);

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAG_MATRIX_0100
     * @tc.name diagonalMatrixFHD001
     * @tc.desc Verify FHD stub family (all densities) resolves to the expected inch integer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalMatrixFHD001', 0, (): void => {
      const familyRows: number[][] = [
        [1920, 1080, 160.0000, 1.0000, 14],
        [1920, 1080, 240.0000, 1.0000, 9],
        [1920, 1080, 320.0000, 2.0000, 14],
        [1920, 1080, 213.0000, 1.5000, 16],
        [1920, 1080, 240.0000, 1.5000, 14],
        [1920, 1080, 400.0000, 2.5000, 14],
        [1920, 1080, 266.6670, 1.6667, 14],
        [1920, 1080, 280.0000, 1.7500, 14],
        [1920, 1080, 500.0000, 3.1250, 14],
        [1920, 1080, 213.3330, 1.3333, 14],
        [1920, 1080, 96.0000, 1.0000, 23],
        [1920, 1080, 120.0000, 1.0000, 18],
        [1920, 1080, 160.0000, 1.3333, 18],
        [1920, 1080, 192.0000, 1.6000, 18],
        [1920, 1080, 288.0000, 1.8000, 14],
      ];
      for (let row: number = 0; row < familyRows.length; row++) {
        const width: number = familyRows[row][0];
        const height: number = familyRows[row][1];
        const densityDPI: number = familyRows[row][2];
        const densityPixels: number = familyRows[row][3];
        const expected: number = familyRows[row][4];
        const stub: display.Display = buildMockDisplay(width, height, densityDPI, densityPixels);
        expect(calculateScreenDiagonalInches(stub)).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAG_MATRIX_0200
     * @tc.name diagonalMatrixHD001
     * @tc.desc Verify HD stub family (all densities) resolves to the expected inch integer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalMatrixHD001', 0, (): void => {
      const familyRows: number[][] = [
        [1280, 720, 160.0000, 1.0000, 9],
        [1280, 720, 240.0000, 1.0000, 6],
        [1280, 720, 320.0000, 2.0000, 9],
        [1280, 720, 213.0000, 1.5000, 10],
        [1280, 720, 240.0000, 1.5000, 9],
        [1280, 720, 400.0000, 2.5000, 9],
        [1280, 720, 266.6670, 1.6667, 9],
        [1280, 720, 280.0000, 1.7500, 9],
        [1280, 720, 500.0000, 3.1250, 9],
        [1280, 720, 213.3330, 1.3333, 9],
        [1280, 720, 96.0000, 1.0000, 15],
        [1280, 720, 120.0000, 1.0000, 12],
        [1280, 720, 160.0000, 1.3333, 12],
        [1280, 720, 192.0000, 1.6000, 12],
        [1280, 720, 288.0000, 1.8000, 9],
      ];
      for (let row: number = 0; row < familyRows.length; row++) {
        const width: number = familyRows[row][0];
        const height: number = familyRows[row][1];
        const densityDPI: number = familyRows[row][2];
        const densityPixels: number = familyRows[row][3];
        const expected: number = familyRows[row][4];
        const stub: display.Display = buildMockDisplay(width, height, densityDPI, densityPixels);
        expect(calculateScreenDiagonalInches(stub)).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAG_MATRIX_0300
     * @tc.name diagonalMatrixUHD4K001
     * @tc.desc Verify UHD4K stub family (all densities) resolves to the expected inch integer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalMatrixUHD4K001', 0, (): void => {
      const familyRows: number[][] = [
        [3840, 2160, 160.0000, 1.0000, 28],
        [3840, 2160, 240.0000, 1.0000, 18],
        [3840, 2160, 320.0000, 2.0000, 28],
        [3840, 2160, 213.0000, 1.5000, 31],
        [3840, 2160, 240.0000, 1.5000, 28],
        [3840, 2160, 400.0000, 2.5000, 28],
        [3840, 2160, 266.6670, 1.6667, 28],
        [3840, 2160, 280.0000, 1.7500, 28],
        [3840, 2160, 500.0000, 3.1250, 28],
        [3840, 2160, 213.3330, 1.3333, 28],
        [3840, 2160, 96.0000, 1.0000, 46],
        [3840, 2160, 120.0000, 1.0000, 37],
        [3840, 2160, 160.0000, 1.3333, 37],
        [3840, 2160, 192.0000, 1.6000, 37],
        [3840, 2160, 288.0000, 1.8000, 28],
      ];
      for (let row: number = 0; row < familyRows.length; row++) {
        const width: number = familyRows[row][0];
        const height: number = familyRows[row][1];
        const densityDPI: number = familyRows[row][2];
        const densityPixels: number = familyRows[row][3];
        const expected: number = familyRows[row][4];
        const stub: display.Display = buildMockDisplay(width, height, densityDPI, densityPixels);
        expect(calculateScreenDiagonalInches(stub)).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAG_MATRIX_0400
     * @tc.name diagonalMatrixWXGA001
     * @tc.desc Verify WXGA stub family (all densities) resolves to the expected inch integer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalMatrixWXGA001', 0, (): void => {
      const familyRows: number[][] = [
        [1366, 768, 160.0000, 1.0000, 10],
        [1366, 768, 240.0000, 1.0000, 7],
        [1366, 768, 320.0000, 2.0000, 10],
        [1366, 768, 213.0000, 1.5000, 11],
        [1366, 768, 240.0000, 1.5000, 10],
        [1366, 768, 400.0000, 2.5000, 10],
        [1366, 768, 266.6670, 1.6667, 10],
        [1366, 768, 280.0000, 1.7500, 10],
        [1366, 768, 500.0000, 3.1250, 10],
        [1366, 768, 213.3330, 1.3333, 10],
        [1366, 768, 96.0000, 1.0000, 16],
        [1366, 768, 120.0000, 1.0000, 13],
        [1366, 768, 160.0000, 1.3333, 13],
        [1366, 768, 192.0000, 1.6000, 13],
        [1366, 768, 288.0000, 1.8000, 10],
      ];
      for (let row: number = 0; row < familyRows.length; row++) {
        const width: number = familyRows[row][0];
        const height: number = familyRows[row][1];
        const densityDPI: number = familyRows[row][2];
        const densityPixels: number = familyRows[row][3];
        const expected: number = familyRows[row][4];
        const stub: display.Display = buildMockDisplay(width, height, densityDPI, densityPixels);
        expect(calculateScreenDiagonalInches(stub)).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAG_MATRIX_0500
     * @tc.name diagonalMatrixHDPlus001
     * @tc.desc Verify HDPlus stub family (all densities) resolves to the expected inch integer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalMatrixHDPlus001', 0, (): void => {
      const familyRows: number[][] = [
        [1600, 900, 160.0000, 1.0000, 11],
        [1600, 900, 240.0000, 1.0000, 8],
        [1600, 900, 320.0000, 2.0000, 11],
        [1600, 900, 213.0000, 1.5000, 13],
        [1600, 900, 240.0000, 1.5000, 11],
        [1600, 900, 400.0000, 2.5000, 11],
        [1600, 900, 266.6670, 1.6667, 11],
        [1600, 900, 280.0000, 1.7500, 11],
        [1600, 900, 500.0000, 3.1250, 11],
        [1600, 900, 213.3330, 1.3333, 11],
        [1600, 900, 96.0000, 1.0000, 19],
        [1600, 900, 120.0000, 1.0000, 15],
        [1600, 900, 160.0000, 1.3333, 15],
        [1600, 900, 192.0000, 1.6000, 15],
        [1600, 900, 288.0000, 1.8000, 11],
      ];
      for (let row: number = 0; row < familyRows.length; row++) {
        const width: number = familyRows[row][0];
        const height: number = familyRows[row][1];
        const densityDPI: number = familyRows[row][2];
        const densityPixels: number = familyRows[row][3];
        const expected: number = familyRows[row][4];
        const stub: display.Display = buildMockDisplay(width, height, densityDPI, densityPixels);
        expect(calculateScreenDiagonalInches(stub)).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAG_MATRIX_0600
     * @tc.name diagonalMatrixQHD001
     * @tc.desc Verify QHD stub family (all densities) resolves to the expected inch integer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalMatrixQHD001', 0, (): void => {
      const familyRows: number[][] = [
        [2560, 1440, 160.0000, 1.0000, 18],
        [2560, 1440, 240.0000, 1.0000, 12],
        [2560, 1440, 320.0000, 2.0000, 18],
        [2560, 1440, 213.0000, 1.5000, 21],
        [2560, 1440, 240.0000, 1.5000, 18],
        [2560, 1440, 400.0000, 2.5000, 18],
        [2560, 1440, 266.6670, 1.6667, 18],
        [2560, 1440, 280.0000, 1.7500, 18],
        [2560, 1440, 500.0000, 3.1250, 18],
        [2560, 1440, 213.3330, 1.3333, 18],
        [2560, 1440, 96.0000, 1.0000, 31],
        [2560, 1440, 120.0000, 1.0000, 24],
        [2560, 1440, 160.0000, 1.3333, 24],
        [2560, 1440, 192.0000, 1.6000, 24],
        [2560, 1440, 288.0000, 1.8000, 18],
      ];
      for (let row: number = 0; row < familyRows.length; row++) {
        const width: number = familyRows[row][0];
        const height: number = familyRows[row][1];
        const densityDPI: number = familyRows[row][2];
        const densityPixels: number = familyRows[row][3];
        const expected: number = familyRows[row][4];
        const stub: display.Display = buildMockDisplay(width, height, densityDPI, densityPixels);
        expect(calculateScreenDiagonalInches(stub)).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAG_MATRIX_0700
     * @tc.name diagonalMatrixSD001
     * @tc.desc Verify SD stub family (all densities) resolves to the expected inch integer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalMatrixSD001', 0, (): void => {
      const familyRows: number[][] = [
        [720, 480, 160.0000, 1.0000, 5],
        [720, 480, 240.0000, 1.0000, 4],
        [720, 480, 320.0000, 2.0000, 5],
        [720, 480, 213.0000, 1.5000, 6],
        [720, 480, 240.0000, 1.5000, 5],
        [720, 480, 400.0000, 2.5000, 5],
        [720, 480, 266.6670, 1.6667, 5],
        [720, 480, 280.0000, 1.7500, 5],
        [720, 480, 500.0000, 3.1250, 5],
        [720, 480, 213.3330, 1.3333, 5],
        [720, 480, 96.0000, 1.0000, 9],
        [720, 480, 120.0000, 1.0000, 7],
        [720, 480, 160.0000, 1.3333, 7],
        [720, 480, 192.0000, 1.6000, 7],
        [720, 480, 288.0000, 1.8000, 5],
      ];
      for (let row: number = 0; row < familyRows.length; row++) {
        const width: number = familyRows[row][0];
        const height: number = familyRows[row][1];
        const densityDPI: number = familyRows[row][2];
        const densityPixels: number = familyRows[row][3];
        const expected: number = familyRows[row][4];
        const stub: display.Display = buildMockDisplay(width, height, densityDPI, densityPixels);
        expect(calculateScreenDiagonalInches(stub)).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAG_MATRIX_0800
     * @tc.name diagonalMatrixqHD001
     * @tc.desc Verify qHD stub family (all densities) resolves to the expected inch integer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalMatrixqHD001', 0, (): void => {
      const familyRows: number[][] = [
        [960, 540, 160.0000, 1.0000, 7],
        [960, 540, 240.0000, 1.0000, 5],
        [960, 540, 320.0000, 2.0000, 7],
        [960, 540, 213.0000, 1.5000, 8],
        [960, 540, 240.0000, 1.5000, 7],
        [960, 540, 400.0000, 2.5000, 7],
        [960, 540, 266.6670, 1.6667, 7],
        [960, 540, 280.0000, 1.7500, 7],
        [960, 540, 500.0000, 3.1250, 7],
        [960, 540, 213.3330, 1.3333, 7],
        [960, 540, 96.0000, 1.0000, 11],
        [960, 540, 120.0000, 1.0000, 9],
        [960, 540, 160.0000, 1.3333, 9],
        [960, 540, 192.0000, 1.6000, 9],
        [960, 540, 288.0000, 1.8000, 7],
      ];
      for (let row: number = 0; row < familyRows.length; row++) {
        const width: number = familyRows[row][0];
        const height: number = familyRows[row][1];
        const densityDPI: number = familyRows[row][2];
        const densityPixels: number = familyRows[row][3];
        const expected: number = familyRows[row][4];
        const stub: display.Display = buildMockDisplay(width, height, densityDPI, densityPixels);
        expect(calculateScreenDiagonalInches(stub)).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAG_MATRIX_0900
     * @tc.name diagonalMatrixXGA001
     * @tc.desc Verify XGA stub family (all densities) resolves to the expected inch integer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalMatrixXGA001', 0, (): void => {
      const familyRows: number[][] = [
        [1024, 768, 160.0000, 1.0000, 8],
        [1024, 768, 240.0000, 1.0000, 5],
        [1024, 768, 320.0000, 2.0000, 8],
        [1024, 768, 213.0000, 1.5000, 9],
        [1024, 768, 240.0000, 1.5000, 8],
        [1024, 768, 400.0000, 2.5000, 8],
        [1024, 768, 266.6670, 1.6667, 8],
        [1024, 768, 280.0000, 1.7500, 8],
        [1024, 768, 500.0000, 3.1250, 8],
        [1024, 768, 213.3330, 1.3333, 8],
        [1024, 768, 96.0000, 1.0000, 13],
        [1024, 768, 120.0000, 1.0000, 11],
        [1024, 768, 160.0000, 1.3333, 11],
        [1024, 768, 192.0000, 1.6000, 11],
        [1024, 768, 288.0000, 1.8000, 8],
      ];
      for (let row: number = 0; row < familyRows.length; row++) {
        const width: number = familyRows[row][0];
        const height: number = familyRows[row][1];
        const densityDPI: number = familyRows[row][2];
        const densityPixels: number = familyRows[row][3];
        const expected: number = familyRows[row][4];
        const stub: display.Display = buildMockDisplay(width, height, densityDPI, densityPixels);
        expect(calculateScreenDiagonalInches(stub)).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAG_MATRIX_1000
     * @tc.name diagonalMatrixSXGA001
     * @tc.desc Verify SXGA stub family (all densities) resolves to the expected inch integer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalMatrixSXGA001', 0, (): void => {
      const familyRows: number[][] = [
        [1280, 1024, 160.0000, 1.0000, 10],
        [1280, 1024, 240.0000, 1.0000, 7],
        [1280, 1024, 320.0000, 2.0000, 10],
        [1280, 1024, 213.0000, 1.5000, 12],
        [1280, 1024, 240.0000, 1.5000, 10],
        [1280, 1024, 400.0000, 2.5000, 10],
        [1280, 1024, 266.6670, 1.6667, 10],
        [1280, 1024, 280.0000, 1.7500, 10],
        [1280, 1024, 500.0000, 3.1250, 10],
        [1280, 1024, 213.3330, 1.3333, 10],
        [1280, 1024, 96.0000, 1.0000, 17],
        [1280, 1024, 120.0000, 1.0000, 14],
        [1280, 1024, 160.0000, 1.3333, 14],
        [1280, 1024, 192.0000, 1.6000, 14],
        [1280, 1024, 288.0000, 1.8000, 10],
      ];
      for (let row: number = 0; row < familyRows.length; row++) {
        const width: number = familyRows[row][0];
        const height: number = familyRows[row][1];
        const densityDPI: number = familyRows[row][2];
        const densityPixels: number = familyRows[row][3];
        const expected: number = familyRows[row][4];
        const stub: display.Display = buildMockDisplay(width, height, densityDPI, densityPixels);
        expect(calculateScreenDiagonalInches(stub)).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAG_MATRIX_1100
     * @tc.name diagonalMatrixWSXGA001
     * @tc.desc Verify WSXGA stub family (all densities) resolves to the expected inch integer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalMatrixWSXGA001', 0, (): void => {
      const familyRows: number[][] = [
        [1680, 1050, 160.0000, 1.0000, 12],
        [1680, 1050, 240.0000, 1.0000, 8],
        [1680, 1050, 320.0000, 2.0000, 12],
        [1680, 1050, 213.0000, 1.5000, 14],
        [1680, 1050, 240.0000, 1.5000, 12],
        [1680, 1050, 400.0000, 2.5000, 12],
        [1680, 1050, 266.6670, 1.6667, 12],
        [1680, 1050, 280.0000, 1.7500, 12],
        [1680, 1050, 500.0000, 3.1250, 12],
        [1680, 1050, 213.3330, 1.3333, 12],
        [1680, 1050, 96.0000, 1.0000, 21],
        [1680, 1050, 120.0000, 1.0000, 17],
        [1680, 1050, 160.0000, 1.3333, 17],
        [1680, 1050, 192.0000, 1.6000, 17],
        [1680, 1050, 288.0000, 1.8000, 12],
      ];
      for (let row: number = 0; row < familyRows.length; row++) {
        const width: number = familyRows[row][0];
        const height: number = familyRows[row][1];
        const densityDPI: number = familyRows[row][2];
        const densityPixels: number = familyRows[row][3];
        const expected: number = familyRows[row][4];
        const stub: display.Display = buildMockDisplay(width, height, densityDPI, densityPixels);
        expect(calculateScreenDiagonalInches(stub)).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAG_MATRIX_1200
     * @tc.name diagonalMatrixUltraWide001
     * @tc.desc Verify UltraWide stub family (all densities) resolves to the expected inch integer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalMatrixUltraWide001', 0, (): void => {
      const familyRows: number[][] = [
        [3440, 1440, 160.0000, 1.0000, 23],
        [3440, 1440, 240.0000, 1.0000, 16],
        [3440, 1440, 320.0000, 2.0000, 23],
        [3440, 1440, 213.0000, 1.5000, 26],
        [3440, 1440, 240.0000, 1.5000, 23],
        [3440, 1440, 400.0000, 2.5000, 23],
        [3440, 1440, 266.6670, 1.6667, 23],
        [3440, 1440, 280.0000, 1.7500, 23],
        [3440, 1440, 500.0000, 3.1250, 23],
        [3440, 1440, 213.3330, 1.3333, 23],
        [3440, 1440, 96.0000, 1.0000, 39],
        [3440, 1440, 120.0000, 1.0000, 31],
        [3440, 1440, 160.0000, 1.3333, 31],
        [3440, 1440, 192.0000, 1.6000, 31],
        [3440, 1440, 288.0000, 1.8000, 23],
      ];
      for (let row: number = 0; row < familyRows.length; row++) {
        const width: number = familyRows[row][0];
        const height: number = familyRows[row][1];
        const densityDPI: number = familyRows[row][2];
        const densityPixels: number = familyRows[row][3];
        const expected: number = familyRows[row][4];
        const stub: display.Display = buildMockDisplay(width, height, densityDPI, densityPixels);
        expect(calculateScreenDiagonalInches(stub)).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAG_MATRIX_1300
     * @tc.name diagonalMatrixCinema001
     * @tc.desc Verify Cinema stub family (all densities) resolves to the expected inch integer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalMatrixCinema001', 0, (): void => {
      const familyRows: number[][] = [
        [4096, 2160, 160.0000, 1.0000, 29],
        [4096, 2160, 240.0000, 1.0000, 19],
        [4096, 2160, 320.0000, 2.0000, 29],
        [4096, 2160, 213.0000, 1.5000, 33],
        [4096, 2160, 240.0000, 1.5000, 29],
        [4096, 2160, 400.0000, 2.5000, 29],
        [4096, 2160, 266.6670, 1.6667, 29],
        [4096, 2160, 280.0000, 1.7500, 29],
        [4096, 2160, 500.0000, 3.1250, 29],
        [4096, 2160, 213.3330, 1.3333, 29],
        [4096, 2160, 96.0000, 1.0000, 48],
        [4096, 2160, 120.0000, 1.0000, 39],
        [4096, 2160, 160.0000, 1.3333, 39],
        [4096, 2160, 192.0000, 1.6000, 39],
        [4096, 2160, 288.0000, 1.8000, 29],
      ];
      for (let row: number = 0; row < familyRows.length; row++) {
        const width: number = familyRows[row][0];
        const height: number = familyRows[row][1];
        const densityDPI: number = familyRows[row][2];
        const densityPixels: number = familyRows[row][3];
        const expected: number = familyRows[row][4];
        const stub: display.Display = buildMockDisplay(width, height, densityDPI, densityPixels);
        expect(calculateScreenDiagonalInches(stub)).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAG_MATRIX_1400
     * @tc.name diagonalMatrixMobile001
     * @tc.desc Verify Mobile stub family (all densities) resolves to the expected inch integer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalMatrixMobile001', 0, (): void => {
      const familyRows: number[][] = [
        [720, 1280, 160.0000, 1.0000, 9],
        [720, 1280, 240.0000, 1.0000, 6],
        [720, 1280, 320.0000, 2.0000, 9],
        [720, 1280, 213.0000, 1.5000, 10],
        [720, 1280, 240.0000, 1.5000, 9],
        [720, 1280, 400.0000, 2.5000, 9],
        [720, 1280, 266.6670, 1.6667, 9],
        [720, 1280, 280.0000, 1.7500, 9],
        [720, 1280, 500.0000, 3.1250, 9],
        [720, 1280, 213.3330, 1.3333, 9],
        [720, 1280, 96.0000, 1.0000, 15],
        [720, 1280, 120.0000, 1.0000, 12],
        [720, 1280, 160.0000, 1.3333, 12],
        [720, 1280, 192.0000, 1.6000, 12],
        [720, 1280, 288.0000, 1.8000, 9],
      ];
      for (let row: number = 0; row < familyRows.length; row++) {
        const width: number = familyRows[row][0];
        const height: number = familyRows[row][1];
        const densityDPI: number = familyRows[row][2];
        const densityPixels: number = familyRows[row][3];
        const expected: number = familyRows[row][4];
        const stub: display.Display = buildMockDisplay(width, height, densityDPI, densityPixels);
        expect(calculateScreenDiagonalInches(stub)).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAG_MATRIX_9000
     * @tc.name diagonalMatrixGuardsReturnZero
     * @tc.desc Verify degenerate stub inputs hit the guards and return zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalMatrixGuardsReturnZero', 0, (): void => {
      for (let row: number = 0; row < GUARD_CASES.length; row++) {
        const width: number = GUARD_CASES[row][0];
        const height: number = GUARD_CASES[row][1];
        const densityDPI: number = GUARD_CASES[row][2];
        const densityPixels: number = GUARD_CASES[row][3];
        const stub: display.Display = buildMockDisplay(width, height, densityDPI, densityPixels);
        expect(calculateScreenDiagonalInches(stub)).assertEqual(GUARD_CASES[row][4]);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAG_MATRIX_9100
     * @tc.name diagonalMatrixSpanningSweep
     * @tc.desc Verify the complete generated matrix in a single spanning sweep
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalMatrixSpanningSweep', 0, (): void => {
      for (let row: number = 0; row < DIAGONAL_MATRIX.length; row++) {
        const width: number = DIAGONAL_MATRIX[row][0];
        const height: number = DIAGONAL_MATRIX[row][1];
        const densityDPI: number = DIAGONAL_MATRIX[row][2];
        const densityPixels: number = DIAGONAL_MATRIX[row][3];
        const expected: number = DIAGONAL_MATRIX[row][4];
        const stub: display.Display = buildMockDisplay(width, height, densityDPI, densityPixels);
        expect(calculateScreenDiagonalInches(stub)).assertEqual(expected);
      }
    });
  });
}
