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

// Expanded production-formula matrix. Expected inches are literal values derived
// independently as round(sqrt(width^2 + height^2) / (densityDPI / densityPixels)).

function buildDiagonalDisplay(width: number, height: number, densityDPI: number,
  densityPixels: number): display.Display {
  return {
    id: 1,
    name: 'diagonal-matrix-display',
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
      return 'diagonal-matrix';
    },
    hasImmersiveWindow(callback?: AsyncCallback<boolean>): Promise<boolean> {
      return Promise.resolve(false);
    }
  } as display.Display;
}

export default function productSpecDiagonalExpandedMatrixTest(): void {
  describe('ProductSpecDiagonalExpandedMatrixTest', () => {
    // Pace the pure-logic matrix; see MainThreadYield.ets.
    beforeEach(keepMainThreadResponsive);
    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_1000
     * @tc.name diagonalExpandedCase000
     * @tc.desc Verify 1920x1080 at 160.0 dpi and 1.0 scaled density resolves to 14 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase000', 0, (): void => {
      // width=1920, height=1080, densityDPI=160.0, densityPixels=1.0, expected=14.
      const stub: display.Display = buildDiagonalDisplay(1920, 1080, 160.0, 1.0);
      expect(stub.width).assertEqual(1920);
      expect(stub.height).assertEqual(1080);
      expect(stub.densityDPI).assertEqual(160.0);
      expect(stub.densityPixels).assertEqual(1.0);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(14);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_1100
     * @tc.name diagonalExpandedCase001
     * @tc.desc Verify 1280x1080 at 160.0 dpi and 1.0 scaled density resolves to 10 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase001', 0, (): void => {
      // width=1280, height=1080, densityDPI=160.0, densityPixels=1.0, expected=10.
      const stub: display.Display = buildDiagonalDisplay(1280, 1080, 160.0, 1.0);
      expect(stub.width).assertEqual(1280);
      expect(stub.height).assertEqual(1080);
      expect(stub.densityDPI).assertEqual(160.0);
      expect(stub.densityPixels).assertEqual(1.0);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(10);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_1200
     * @tc.name diagonalExpandedCase002
     * @tc.desc Verify 3840x1080 at 160.0 dpi and 1.0 scaled density resolves to 25 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase002', 0, (): void => {
      // width=3840, height=1080, densityDPI=160.0, densityPixels=1.0, expected=25.
      const stub: display.Display = buildDiagonalDisplay(3840, 1080, 160.0, 1.0);
      expect(stub.width).assertEqual(3840);
      expect(stub.height).assertEqual(1080);
      expect(stub.densityDPI).assertEqual(160.0);
      expect(stub.densityPixels).assertEqual(1.0);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(25);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_1300
     * @tc.name diagonalExpandedCase003
     * @tc.desc Verify 2560x720 at 160.0 dpi and 1.0 scaled density resolves to 17 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase003', 0, (): void => {
      // width=2560, height=720, densityDPI=160.0, densityPixels=1.0, expected=17.
      const stub: display.Display = buildDiagonalDisplay(2560, 720, 160.0, 1.0);
      expect(stub.width).assertEqual(2560);
      expect(stub.height).assertEqual(720);
      expect(stub.densityDPI).assertEqual(160.0);
      expect(stub.densityPixels).assertEqual(1.0);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(17);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_1400
     * @tc.name diagonalExpandedCase004
     * @tc.desc Verify 1080x720 at 160.0 dpi and 1.0 scaled density resolves to 8 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase004', 0, (): void => {
      // width=1080, height=720, densityDPI=160.0, densityPixels=1.0, expected=8.
      const stub: display.Display = buildDiagonalDisplay(1080, 720, 160.0, 1.0);
      expect(stub.width).assertEqual(1080);
      expect(stub.height).assertEqual(720);
      expect(stub.densityDPI).assertEqual(160.0);
      expect(stub.densityPixels).assertEqual(1.0);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(8);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_1500
     * @tc.name diagonalExpandedCase005
     * @tc.desc Verify 720x720 at 160.0 dpi and 1.5 scaled density resolves to 10 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase005', 0, (): void => {
      // width=720, height=720, densityDPI=160.0, densityPixels=1.5, expected=10.
      const stub: display.Display = buildDiagonalDisplay(720, 720, 160.0, 1.5);
      expect(stub.width).assertEqual(720);
      expect(stub.height).assertEqual(720);
      expect(stub.densityDPI).assertEqual(160.0);
      expect(stub.densityPixels).assertEqual(1.5);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(10);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_1600
     * @tc.name diagonalExpandedCase006
     * @tc.desc Verify 1440x2160 at 160.0 dpi and 1.5 scaled density resolves to 24 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase006', 0, (): void => {
      // width=1440, height=2160, densityDPI=160.0, densityPixels=1.5, expected=24.
      const stub: display.Display = buildDiagonalDisplay(1440, 2160, 160.0, 1.5);
      expect(stub.width).assertEqual(1440);
      expect(stub.height).assertEqual(2160);
      expect(stub.densityDPI).assertEqual(160.0);
      expect(stub.densityPixels).assertEqual(1.5);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(24);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_1700
     * @tc.name diagonalExpandedCase007
     * @tc.desc Verify 7680x2160 at 240.0 dpi and 1.5 scaled density resolves to 50 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase007', 0, (): void => {
      // width=7680, height=2160, densityDPI=240.0, densityPixels=1.5, expected=50.
      const stub: display.Display = buildDiagonalDisplay(7680, 2160, 240.0, 1.5);
      expect(stub.width).assertEqual(7680);
      expect(stub.height).assertEqual(2160);
      expect(stub.densityDPI).assertEqual(240.0);
      expect(stub.densityPixels).assertEqual(1.5);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(50);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_1800
     * @tc.name diagonalExpandedCase008
     * @tc.desc Verify 320x2160 at 240.0 dpi and 1.5 scaled density resolves to 14 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase008', 0, (): void => {
      // width=320, height=2160, densityDPI=240.0, densityPixels=1.5, expected=14.
      const stub: display.Display = buildDiagonalDisplay(320, 2160, 240.0, 1.5);
      expect(stub.width).assertEqual(320);
      expect(stub.height).assertEqual(2160);
      expect(stub.densityDPI).assertEqual(240.0);
      expect(stub.densityPixels).assertEqual(1.5);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(14);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_1900
     * @tc.name diagonalExpandedCase009
     * @tc.desc Verify 640x1440 at 240.0 dpi and 1.5 scaled density resolves to 10 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase009', 0, (): void => {
      // width=640, height=1440, densityDPI=240.0, densityPixels=1.5, expected=10.
      const stub: display.Display = buildDiagonalDisplay(640, 1440, 240.0, 1.5);
      expect(stub.width).assertEqual(640);
      expect(stub.height).assertEqual(1440);
      expect(stub.densityDPI).assertEqual(240.0);
      expect(stub.densityPixels).assertEqual(1.5);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(10);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_2000
     * @tc.name diagonalExpandedCase010
     * @tc.desc Verify 1920x1440 at 240.0 dpi and 2.0 scaled density resolves to 20 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase010', 0, (): void => {
      // width=1920, height=1440, densityDPI=240.0, densityPixels=2.0, expected=20.
      const stub: display.Display = buildDiagonalDisplay(1920, 1440, 240.0, 2.0);
      expect(stub.width).assertEqual(1920);
      expect(stub.height).assertEqual(1440);
      expect(stub.densityDPI).assertEqual(240.0);
      expect(stub.densityPixels).assertEqual(2.0);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(20);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_2100
     * @tc.name diagonalExpandedCase011
     * @tc.desc Verify 1280x1440 at 240.0 dpi and 2.0 scaled density resolves to 16 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase011', 0, (): void => {
      // width=1280, height=1440, densityDPI=240.0, densityPixels=2.0, expected=16.
      const stub: display.Display = buildDiagonalDisplay(1280, 1440, 240.0, 2.0);
      expect(stub.width).assertEqual(1280);
      expect(stub.height).assertEqual(1440);
      expect(stub.densityDPI).assertEqual(240.0);
      expect(stub.densityPixels).assertEqual(2.0);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(16);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_2200
     * @tc.name diagonalExpandedCase012
     * @tc.desc Verify 3840x1920 at 240.0 dpi and 2.0 scaled density resolves to 36 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase012', 0, (): void => {
      // width=3840, height=1920, densityDPI=240.0, densityPixels=2.0, expected=36.
      const stub: display.Display = buildDiagonalDisplay(3840, 1920, 240.0, 2.0);
      expect(stub.width).assertEqual(3840);
      expect(stub.height).assertEqual(1920);
      expect(stub.densityDPI).assertEqual(240.0);
      expect(stub.densityPixels).assertEqual(2.0);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(36);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_2300
     * @tc.name diagonalExpandedCase013
     * @tc.desc Verify 2560x1920 at 240.0 dpi and 2.0 scaled density resolves to 27 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase013', 0, (): void => {
      // width=2560, height=1920, densityDPI=240.0, densityPixels=2.0, expected=27.
      const stub: display.Display = buildDiagonalDisplay(2560, 1920, 240.0, 2.0);
      expect(stub.width).assertEqual(2560);
      expect(stub.height).assertEqual(1920);
      expect(stub.densityDPI).assertEqual(240.0);
      expect(stub.densityPixels).assertEqual(2.0);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(27);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_2400
     * @tc.name diagonalExpandedCase014
     * @tc.desc Verify 1080x1920 at 320.0 dpi and 2.0 scaled density resolves to 14 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase014', 0, (): void => {
      // width=1080, height=1920, densityDPI=320.0, densityPixels=2.0, expected=14.
      const stub: display.Display = buildDiagonalDisplay(1080, 1920, 320.0, 2.0);
      expect(stub.width).assertEqual(1080);
      expect(stub.height).assertEqual(1920);
      expect(stub.densityDPI).assertEqual(320.0);
      expect(stub.densityPixels).assertEqual(2.0);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(14);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_2500
     * @tc.name diagonalExpandedCase015
     * @tc.desc Verify 720x1280 at 320.0 dpi and 2.5 scaled density resolves to 11 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase015', 0, (): void => {
      // width=720, height=1280, densityDPI=320.0, densityPixels=2.5, expected=11.
      const stub: display.Display = buildDiagonalDisplay(720, 1280, 320.0, 2.5);
      expect(stub.width).assertEqual(720);
      expect(stub.height).assertEqual(1280);
      expect(stub.densityDPI).assertEqual(320.0);
      expect(stub.densityPixels).assertEqual(2.5);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(11);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_2600
     * @tc.name diagonalExpandedCase016
     * @tc.desc Verify 1440x1280 at 320.0 dpi and 2.5 scaled density resolves to 15 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase016', 0, (): void => {
      // width=1440, height=1280, densityDPI=320.0, densityPixels=2.5, expected=15.
      const stub: display.Display = buildDiagonalDisplay(1440, 1280, 320.0, 2.5);
      expect(stub.width).assertEqual(1440);
      expect(stub.height).assertEqual(1280);
      expect(stub.densityDPI).assertEqual(320.0);
      expect(stub.densityPixels).assertEqual(2.5);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(15);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_2700
     * @tc.name diagonalExpandedCase017
     * @tc.desc Verify 7680x1280 at 320.0 dpi and 2.5 scaled density resolves to 61 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase017', 0, (): void => {
      // width=7680, height=1280, densityDPI=320.0, densityPixels=2.5, expected=61.
      const stub: display.Display = buildDiagonalDisplay(7680, 1280, 320.0, 2.5);
      expect(stub.width).assertEqual(7680);
      expect(stub.height).assertEqual(1280);
      expect(stub.densityDPI).assertEqual(320.0);
      expect(stub.densityPixels).assertEqual(2.5);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(61);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_2800
     * @tc.name diagonalExpandedCase018
     * @tc.desc Verify 320x2560 at 320.0 dpi and 2.5 scaled density resolves to 20 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase018', 0, (): void => {
      // width=320, height=2560, densityDPI=320.0, densityPixels=2.5, expected=20.
      const stub: display.Display = buildDiagonalDisplay(320, 2560, 320.0, 2.5);
      expect(stub.width).assertEqual(320);
      expect(stub.height).assertEqual(2560);
      expect(stub.densityDPI).assertEqual(320.0);
      expect(stub.densityPixels).assertEqual(2.5);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(20);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_2900
     * @tc.name diagonalExpandedCase019
     * @tc.desc Verify 640x2560 at 320.0 dpi and 2.5 scaled density resolves to 21 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase019', 0, (): void => {
      // width=640, height=2560, densityDPI=320.0, densityPixels=2.5, expected=21.
      const stub: display.Display = buildDiagonalDisplay(640, 2560, 320.0, 2.5);
      expect(stub.width).assertEqual(640);
      expect(stub.height).assertEqual(2560);
      expect(stub.densityDPI).assertEqual(320.0);
      expect(stub.densityPixels).assertEqual(2.5);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(21);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_3000
     * @tc.name diagonalExpandedCase020
     * @tc.desc Verify 1920x2560 at 320.0 dpi and 3.125 scaled density resolves to 31 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase020', 0, (): void => {
      // width=1920, height=2560, densityDPI=320.0, densityPixels=3.125, expected=31.
      const stub: display.Display = buildDiagonalDisplay(1920, 2560, 320.0, 3.125);
      expect(stub.width).assertEqual(1920);
      expect(stub.height).assertEqual(2560);
      expect(stub.densityDPI).assertEqual(320.0);
      expect(stub.densityPixels).assertEqual(3.125);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(31);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_3100
     * @tc.name diagonalExpandedCase021
     * @tc.desc Verify 1280x4320 at 213.0 dpi and 3.125 scaled density resolves to 66 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase021', 0, (): void => {
      // width=1280, height=4320, densityDPI=213.0, densityPixels=3.125, expected=66.
      const stub: display.Display = buildDiagonalDisplay(1280, 4320, 213.0, 3.125);
      expect(stub.width).assertEqual(1280);
      expect(stub.height).assertEqual(4320);
      expect(stub.densityDPI).assertEqual(213.0);
      expect(stub.densityPixels).assertEqual(3.125);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(66);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_3200
     * @tc.name diagonalExpandedCase022
     * @tc.desc Verify 3840x4320 at 213.0 dpi and 3.125 scaled density resolves to 85 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase022', 0, (): void => {
      // width=3840, height=4320, densityDPI=213.0, densityPixels=3.125, expected=85.
      const stub: display.Display = buildDiagonalDisplay(3840, 4320, 213.0, 3.125);
      expect(stub.width).assertEqual(3840);
      expect(stub.height).assertEqual(4320);
      expect(stub.densityDPI).assertEqual(213.0);
      expect(stub.densityPixels).assertEqual(3.125);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(85);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_3300
     * @tc.name diagonalExpandedCase023
     * @tc.desc Verify 2560x4320 at 213.0 dpi and 3.125 scaled density resolves to 74 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase023', 0, (): void => {
      // width=2560, height=4320, densityDPI=213.0, densityPixels=3.125, expected=74.
      const stub: display.Display = buildDiagonalDisplay(2560, 4320, 213.0, 3.125);
      expect(stub.width).assertEqual(2560);
      expect(stub.height).assertEqual(4320);
      expect(stub.densityDPI).assertEqual(213.0);
      expect(stub.densityPixels).assertEqual(3.125);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(74);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_3400
     * @tc.name diagonalExpandedCase024
     * @tc.desc Verify 1080x240 at 213.0 dpi and 3.125 scaled density resolves to 16 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase024', 0, (): void => {
      // width=1080, height=240, densityDPI=213.0, densityPixels=3.125, expected=16.
      const stub: display.Display = buildDiagonalDisplay(1080, 240, 213.0, 3.125);
      expect(stub.width).assertEqual(1080);
      expect(stub.height).assertEqual(240);
      expect(stub.densityDPI).assertEqual(213.0);
      expect(stub.densityPixels).assertEqual(3.125);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(16);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_3500
     * @tc.name diagonalExpandedCase025
     * @tc.desc Verify 720x240 at 213.0 dpi and 1.3333 scaled density resolves to 5 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase025', 0, (): void => {
      // width=720, height=240, densityDPI=213.0, densityPixels=1.3333, expected=5.
      const stub: display.Display = buildDiagonalDisplay(720, 240, 213.0, 1.3333);
      expect(stub.width).assertEqual(720);
      expect(stub.height).assertEqual(240);
      expect(stub.densityDPI).assertEqual(213.0);
      expect(stub.densityPixels).assertEqual(1.3333);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(5);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_3600
     * @tc.name diagonalExpandedCase026
     * @tc.desc Verify 1440x240 at 213.0 dpi and 1.3333 scaled density resolves to 9 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase026', 0, (): void => {
      // width=1440, height=240, densityDPI=213.0, densityPixels=1.3333, expected=9.
      const stub: display.Display = buildDiagonalDisplay(1440, 240, 213.0, 1.3333);
      expect(stub.width).assertEqual(1440);
      expect(stub.height).assertEqual(240);
      expect(stub.densityDPI).assertEqual(213.0);
      expect(stub.densityPixels).assertEqual(1.3333);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(9);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_3700
     * @tc.name diagonalExpandedCase027
     * @tc.desc Verify 7680x360 at 213.0 dpi and 1.3333 scaled density resolves to 48 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase027', 0, (): void => {
      // width=7680, height=360, densityDPI=213.0, densityPixels=1.3333, expected=48.
      const stub: display.Display = buildDiagonalDisplay(7680, 360, 213.0, 1.3333);
      expect(stub.width).assertEqual(7680);
      expect(stub.height).assertEqual(360);
      expect(stub.densityDPI).assertEqual(213.0);
      expect(stub.densityPixels).assertEqual(1.3333);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(48);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_3800
     * @tc.name diagonalExpandedCase028
     * @tc.desc Verify 320x360 at 400.0 dpi and 1.3333 scaled density resolves to 2 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase028', 0, (): void => {
      // width=320, height=360, densityDPI=400.0, densityPixels=1.3333, expected=2.
      const stub: display.Display = buildDiagonalDisplay(320, 360, 400.0, 1.3333);
      expect(stub.width).assertEqual(320);
      expect(stub.height).assertEqual(360);
      expect(stub.densityDPI).assertEqual(400.0);
      expect(stub.densityPixels).assertEqual(1.3333);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(2);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_3900
     * @tc.name diagonalExpandedCase029
     * @tc.desc Verify 640x360 at 400.0 dpi and 1.3333 scaled density resolves to 2 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase029', 0, (): void => {
      // width=640, height=360, densityDPI=400.0, densityPixels=1.3333, expected=2.
      const stub: display.Display = buildDiagonalDisplay(640, 360, 400.0, 1.3333);
      expect(stub.width).assertEqual(640);
      expect(stub.height).assertEqual(360);
      expect(stub.densityDPI).assertEqual(400.0);
      expect(stub.densityPixels).assertEqual(1.3333);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(2);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_4000
     * @tc.name diagonalExpandedCase030
     * @tc.desc Verify 1920x1080 at 400.0 dpi and 1.6667 scaled density resolves to 9 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase030', 0, (): void => {
      // width=1920, height=1080, densityDPI=400.0, densityPixels=1.6667, expected=9.
      const stub: display.Display = buildDiagonalDisplay(1920, 1080, 400.0, 1.6667);
      expect(stub.width).assertEqual(1920);
      expect(stub.height).assertEqual(1080);
      expect(stub.densityDPI).assertEqual(400.0);
      expect(stub.densityPixels).assertEqual(1.6667);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(9);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_4100
     * @tc.name diagonalExpandedCase031
     * @tc.desc Verify 1280x1080 at 400.0 dpi and 1.6667 scaled density resolves to 7 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase031', 0, (): void => {
      // width=1280, height=1080, densityDPI=400.0, densityPixels=1.6667, expected=7.
      const stub: display.Display = buildDiagonalDisplay(1280, 1080, 400.0, 1.6667);
      expect(stub.width).assertEqual(1280);
      expect(stub.height).assertEqual(1080);
      expect(stub.densityDPI).assertEqual(400.0);
      expect(stub.densityPixels).assertEqual(1.6667);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(7);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_4200
     * @tc.name diagonalExpandedCase032
     * @tc.desc Verify 3840x1080 at 400.0 dpi and 1.6667 scaled density resolves to 17 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase032', 0, (): void => {
      // width=3840, height=1080, densityDPI=400.0, densityPixels=1.6667, expected=17.
      const stub: display.Display = buildDiagonalDisplay(3840, 1080, 400.0, 1.6667);
      expect(stub.width).assertEqual(3840);
      expect(stub.height).assertEqual(1080);
      expect(stub.densityDPI).assertEqual(400.0);
      expect(stub.densityPixels).assertEqual(1.6667);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(17);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_4300
     * @tc.name diagonalExpandedCase033
     * @tc.desc Verify 2560x720 at 400.0 dpi and 1.6667 scaled density resolves to 11 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase033', 0, (): void => {
      // width=2560, height=720, densityDPI=400.0, densityPixels=1.6667, expected=11.
      const stub: display.Display = buildDiagonalDisplay(2560, 720, 400.0, 1.6667);
      expect(stub.width).assertEqual(2560);
      expect(stub.height).assertEqual(720);
      expect(stub.densityDPI).assertEqual(400.0);
      expect(stub.densityPixels).assertEqual(1.6667);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(11);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_4400
     * @tc.name diagonalExpandedCase034
     * @tc.desc Verify 1080x720 at 400.0 dpi and 1.6667 scaled density resolves to 5 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase034', 0, (): void => {
      // width=1080, height=720, densityDPI=400.0, densityPixels=1.6667, expected=5.
      const stub: display.Display = buildDiagonalDisplay(1080, 720, 400.0, 1.6667);
      expect(stub.width).assertEqual(1080);
      expect(stub.height).assertEqual(720);
      expect(stub.densityDPI).assertEqual(400.0);
      expect(stub.densityPixels).assertEqual(1.6667);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(5);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_4500
     * @tc.name diagonalExpandedCase035
     * @tc.desc Verify 720x720 at 266.667 dpi and 1.75 scaled density resolves to 7 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase035', 0, (): void => {
      // width=720, height=720, densityDPI=266.667, densityPixels=1.75, expected=7.
      const stub: display.Display = buildDiagonalDisplay(720, 720, 266.667, 1.75);
      expect(stub.width).assertEqual(720);
      expect(stub.height).assertEqual(720);
      expect(stub.densityDPI).assertEqual(266.667);
      expect(stub.densityPixels).assertEqual(1.75);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(7);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_4600
     * @tc.name diagonalExpandedCase036
     * @tc.desc Verify 1440x2160 at 266.667 dpi and 1.75 scaled density resolves to 17 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase036', 0, (): void => {
      // width=1440, height=2160, densityDPI=266.667, densityPixels=1.75, expected=17.
      const stub: display.Display = buildDiagonalDisplay(1440, 2160, 266.667, 1.75);
      expect(stub.width).assertEqual(1440);
      expect(stub.height).assertEqual(2160);
      expect(stub.densityDPI).assertEqual(266.667);
      expect(stub.densityPixels).assertEqual(1.75);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(17);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_4700
     * @tc.name diagonalExpandedCase037
     * @tc.desc Verify 7680x2160 at 266.667 dpi and 1.75 scaled density resolves to 52 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase037', 0, (): void => {
      // width=7680, height=2160, densityDPI=266.667, densityPixels=1.75, expected=52.
      const stub: display.Display = buildDiagonalDisplay(7680, 2160, 266.667, 1.75);
      expect(stub.width).assertEqual(7680);
      expect(stub.height).assertEqual(2160);
      expect(stub.densityDPI).assertEqual(266.667);
      expect(stub.densityPixels).assertEqual(1.75);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(52);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_4800
     * @tc.name diagonalExpandedCase038
     * @tc.desc Verify 320x2160 at 266.667 dpi and 1.75 scaled density resolves to 14 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase038', 0, (): void => {
      // width=320, height=2160, densityDPI=266.667, densityPixels=1.75, expected=14.
      const stub: display.Display = buildDiagonalDisplay(320, 2160, 266.667, 1.75);
      expect(stub.width).assertEqual(320);
      expect(stub.height).assertEqual(2160);
      expect(stub.densityDPI).assertEqual(266.667);
      expect(stub.densityPixels).assertEqual(1.75);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(14);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_4900
     * @tc.name diagonalExpandedCase039
     * @tc.desc Verify 640x1440 at 266.667 dpi and 1.75 scaled density resolves to 10 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase039', 0, (): void => {
      // width=640, height=1440, densityDPI=266.667, densityPixels=1.75, expected=10.
      const stub: display.Display = buildDiagonalDisplay(640, 1440, 266.667, 1.75);
      expect(stub.width).assertEqual(640);
      expect(stub.height).assertEqual(1440);
      expect(stub.densityDPI).assertEqual(266.667);
      expect(stub.densityPixels).assertEqual(1.75);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(10);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_5000
     * @tc.name diagonalExpandedCase040
     * @tc.desc Verify 1920x1440 at 266.667 dpi and 1.6 scaled density resolves to 14 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase040', 0, (): void => {
      // width=1920, height=1440, densityDPI=266.667, densityPixels=1.6, expected=14.
      const stub: display.Display = buildDiagonalDisplay(1920, 1440, 266.667, 1.6);
      expect(stub.width).assertEqual(1920);
      expect(stub.height).assertEqual(1440);
      expect(stub.densityDPI).assertEqual(266.667);
      expect(stub.densityPixels).assertEqual(1.6);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(14);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_5100
     * @tc.name diagonalExpandedCase041
     * @tc.desc Verify 1280x1440 at 266.667 dpi and 1.6 scaled density resolves to 12 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase041', 0, (): void => {
      // width=1280, height=1440, densityDPI=266.667, densityPixels=1.6, expected=12.
      const stub: display.Display = buildDiagonalDisplay(1280, 1440, 266.667, 1.6);
      expect(stub.width).assertEqual(1280);
      expect(stub.height).assertEqual(1440);
      expect(stub.densityDPI).assertEqual(266.667);
      expect(stub.densityPixels).assertEqual(1.6);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(12);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_5200
     * @tc.name diagonalExpandedCase042
     * @tc.desc Verify 3840x1920 at 280.0 dpi and 1.6 scaled density resolves to 25 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase042', 0, (): void => {
      // width=3840, height=1920, densityDPI=280.0, densityPixels=1.6, expected=25.
      const stub: display.Display = buildDiagonalDisplay(3840, 1920, 280.0, 1.6);
      expect(stub.width).assertEqual(3840);
      expect(stub.height).assertEqual(1920);
      expect(stub.densityDPI).assertEqual(280.0);
      expect(stub.densityPixels).assertEqual(1.6);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(25);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_5300
     * @tc.name diagonalExpandedCase043
     * @tc.desc Verify 2560x1920 at 280.0 dpi and 1.6 scaled density resolves to 18 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase043', 0, (): void => {
      // width=2560, height=1920, densityDPI=280.0, densityPixels=1.6, expected=18.
      const stub: display.Display = buildDiagonalDisplay(2560, 1920, 280.0, 1.6);
      expect(stub.width).assertEqual(2560);
      expect(stub.height).assertEqual(1920);
      expect(stub.densityDPI).assertEqual(280.0);
      expect(stub.densityPixels).assertEqual(1.6);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(18);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_5400
     * @tc.name diagonalExpandedCase044
     * @tc.desc Verify 1080x1920 at 280.0 dpi and 1.6 scaled density resolves to 13 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase044', 0, (): void => {
      // width=1080, height=1920, densityDPI=280.0, densityPixels=1.6, expected=13.
      const stub: display.Display = buildDiagonalDisplay(1080, 1920, 280.0, 1.6);
      expect(stub.width).assertEqual(1080);
      expect(stub.height).assertEqual(1920);
      expect(stub.densityDPI).assertEqual(280.0);
      expect(stub.densityPixels).assertEqual(1.6);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(13);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_5500
     * @tc.name diagonalExpandedCase045
     * @tc.desc Verify 720x1280 at 280.0 dpi and 1.8 scaled density resolves to 9 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase045', 0, (): void => {
      // width=720, height=1280, densityDPI=280.0, densityPixels=1.8, expected=9.
      const stub: display.Display = buildDiagonalDisplay(720, 1280, 280.0, 1.8);
      expect(stub.width).assertEqual(720);
      expect(stub.height).assertEqual(1280);
      expect(stub.densityDPI).assertEqual(280.0);
      expect(stub.densityPixels).assertEqual(1.8);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(9);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_5600
     * @tc.name diagonalExpandedCase046
     * @tc.desc Verify 1440x1280 at 280.0 dpi and 1.8 scaled density resolves to 12 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase046', 0, (): void => {
      // width=1440, height=1280, densityDPI=280.0, densityPixels=1.8, expected=12.
      const stub: display.Display = buildDiagonalDisplay(1440, 1280, 280.0, 1.8);
      expect(stub.width).assertEqual(1440);
      expect(stub.height).assertEqual(1280);
      expect(stub.densityDPI).assertEqual(280.0);
      expect(stub.densityPixels).assertEqual(1.8);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(12);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_5700
     * @tc.name diagonalExpandedCase047
     * @tc.desc Verify 7680x1280 at 280.0 dpi and 1.8 scaled density resolves to 50 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase047', 0, (): void => {
      // width=7680, height=1280, densityDPI=280.0, densityPixels=1.8, expected=50.
      const stub: display.Display = buildDiagonalDisplay(7680, 1280, 280.0, 1.8);
      expect(stub.width).assertEqual(7680);
      expect(stub.height).assertEqual(1280);
      expect(stub.densityDPI).assertEqual(280.0);
      expect(stub.densityPixels).assertEqual(1.8);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(50);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_5800
     * @tc.name diagonalExpandedCase048
     * @tc.desc Verify 320x2560 at 280.0 dpi and 1.8 scaled density resolves to 17 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase048', 0, (): void => {
      // width=320, height=2560, densityDPI=280.0, densityPixels=1.8, expected=17.
      const stub: display.Display = buildDiagonalDisplay(320, 2560, 280.0, 1.8);
      expect(stub.width).assertEqual(320);
      expect(stub.height).assertEqual(2560);
      expect(stub.densityDPI).assertEqual(280.0);
      expect(stub.densityPixels).assertEqual(1.8);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(17);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_5900
     * @tc.name diagonalExpandedCase049
     * @tc.desc Verify 640x2560 at 500.0 dpi and 1.8 scaled density resolves to 9 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase049', 0, (): void => {
      // width=640, height=2560, densityDPI=500.0, densityPixels=1.8, expected=9.
      const stub: display.Display = buildDiagonalDisplay(640, 2560, 500.0, 1.8);
      expect(stub.width).assertEqual(640);
      expect(stub.height).assertEqual(2560);
      expect(stub.densityDPI).assertEqual(500.0);
      expect(stub.densityPixels).assertEqual(1.8);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(9);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_6000
     * @tc.name diagonalExpandedCase050
     * @tc.desc Verify 1920x2560 at 500.0 dpi and 1.0 scaled density resolves to 6 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase050', 0, (): void => {
      // width=1920, height=2560, densityDPI=500.0, densityPixels=1.0, expected=6.
      const stub: display.Display = buildDiagonalDisplay(1920, 2560, 500.0, 1.0);
      expect(stub.width).assertEqual(1920);
      expect(stub.height).assertEqual(2560);
      expect(stub.densityDPI).assertEqual(500.0);
      expect(stub.densityPixels).assertEqual(1.0);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(6);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_6100
     * @tc.name diagonalExpandedCase051
     * @tc.desc Verify 1280x4320 at 500.0 dpi and 1.0 scaled density resolves to 9 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase051', 0, (): void => {
      // width=1280, height=4320, densityDPI=500.0, densityPixels=1.0, expected=9.
      const stub: display.Display = buildDiagonalDisplay(1280, 4320, 500.0, 1.0);
      expect(stub.width).assertEqual(1280);
      expect(stub.height).assertEqual(4320);
      expect(stub.densityDPI).assertEqual(500.0);
      expect(stub.densityPixels).assertEqual(1.0);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(9);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_6200
     * @tc.name diagonalExpandedCase052
     * @tc.desc Verify 3840x4320 at 500.0 dpi and 1.0 scaled density resolves to 12 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase052', 0, (): void => {
      // width=3840, height=4320, densityDPI=500.0, densityPixels=1.0, expected=12.
      const stub: display.Display = buildDiagonalDisplay(3840, 4320, 500.0, 1.0);
      expect(stub.width).assertEqual(3840);
      expect(stub.height).assertEqual(4320);
      expect(stub.densityDPI).assertEqual(500.0);
      expect(stub.densityPixels).assertEqual(1.0);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(12);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_6300
     * @tc.name diagonalExpandedCase053
     * @tc.desc Verify 2560x4320 at 500.0 dpi and 1.0 scaled density resolves to 10 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase053', 0, (): void => {
      // width=2560, height=4320, densityDPI=500.0, densityPixels=1.0, expected=10.
      const stub: display.Display = buildDiagonalDisplay(2560, 4320, 500.0, 1.0);
      expect(stub.width).assertEqual(2560);
      expect(stub.height).assertEqual(4320);
      expect(stub.densityDPI).assertEqual(500.0);
      expect(stub.densityPixels).assertEqual(1.0);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(10);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_6400
     * @tc.name diagonalExpandedCase054
     * @tc.desc Verify 1080x240 at 500.0 dpi and 1.0 scaled density resolves to 2 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase054', 0, (): void => {
      // width=1080, height=240, densityDPI=500.0, densityPixels=1.0, expected=2.
      const stub: display.Display = buildDiagonalDisplay(1080, 240, 500.0, 1.0);
      expect(stub.width).assertEqual(1080);
      expect(stub.height).assertEqual(240);
      expect(stub.densityDPI).assertEqual(500.0);
      expect(stub.densityPixels).assertEqual(1.0);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(2);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_6500
     * @tc.name diagonalExpandedCase055
     * @tc.desc Verify 720x240 at 500.0 dpi and 1.5 scaled density resolves to 2 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase055', 0, (): void => {
      // width=720, height=240, densityDPI=500.0, densityPixels=1.5, expected=2.
      const stub: display.Display = buildDiagonalDisplay(720, 240, 500.0, 1.5);
      expect(stub.width).assertEqual(720);
      expect(stub.height).assertEqual(240);
      expect(stub.densityDPI).assertEqual(500.0);
      expect(stub.densityPixels).assertEqual(1.5);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(2);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_6600
     * @tc.name diagonalExpandedCase056
     * @tc.desc Verify 1440x240 at 96.0 dpi and 1.5 scaled density resolves to 23 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase056', 0, (): void => {
      // width=1440, height=240, densityDPI=96.0, densityPixels=1.5, expected=23.
      const stub: display.Display = buildDiagonalDisplay(1440, 240, 96.0, 1.5);
      expect(stub.width).assertEqual(1440);
      expect(stub.height).assertEqual(240);
      expect(stub.densityDPI).assertEqual(96.0);
      expect(stub.densityPixels).assertEqual(1.5);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(23);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_6700
     * @tc.name diagonalExpandedCase057
     * @tc.desc Verify 7680x360 at 96.0 dpi and 1.5 scaled density resolves to 120 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase057', 0, (): void => {
      // width=7680, height=360, densityDPI=96.0, densityPixels=1.5, expected=120.
      const stub: display.Display = buildDiagonalDisplay(7680, 360, 96.0, 1.5);
      expect(stub.width).assertEqual(7680);
      expect(stub.height).assertEqual(360);
      expect(stub.densityDPI).assertEqual(96.0);
      expect(stub.densityPixels).assertEqual(1.5);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(120);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_6800
     * @tc.name diagonalExpandedCase058
     * @tc.desc Verify 320x360 at 96.0 dpi and 1.5 scaled density resolves to 8 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase058', 0, (): void => {
      // width=320, height=360, densityDPI=96.0, densityPixels=1.5, expected=8.
      const stub: display.Display = buildDiagonalDisplay(320, 360, 96.0, 1.5);
      expect(stub.width).assertEqual(320);
      expect(stub.height).assertEqual(360);
      expect(stub.densityDPI).assertEqual(96.0);
      expect(stub.densityPixels).assertEqual(1.5);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(8);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_6900
     * @tc.name diagonalExpandedCase059
     * @tc.desc Verify 640x360 at 96.0 dpi and 1.5 scaled density resolves to 11 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase059', 0, (): void => {
      // width=640, height=360, densityDPI=96.0, densityPixels=1.5, expected=11.
      const stub: display.Display = buildDiagonalDisplay(640, 360, 96.0, 1.5);
      expect(stub.width).assertEqual(640);
      expect(stub.height).assertEqual(360);
      expect(stub.densityDPI).assertEqual(96.0);
      expect(stub.densityPixels).assertEqual(1.5);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(11);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_7000
     * @tc.name diagonalExpandedCase060
     * @tc.desc Verify 1920x1080 at 96.0 dpi and 2.0 scaled density resolves to 46 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase060', 0, (): void => {
      // width=1920, height=1080, densityDPI=96.0, densityPixels=2.0, expected=46.
      const stub: display.Display = buildDiagonalDisplay(1920, 1080, 96.0, 2.0);
      expect(stub.width).assertEqual(1920);
      expect(stub.height).assertEqual(1080);
      expect(stub.densityDPI).assertEqual(96.0);
      expect(stub.densityPixels).assertEqual(2.0);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(46);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_7100
     * @tc.name diagonalExpandedCase061
     * @tc.desc Verify 1280x1080 at 96.0 dpi and 2.0 scaled density resolves to 35 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase061', 0, (): void => {
      // width=1280, height=1080, densityDPI=96.0, densityPixels=2.0, expected=35.
      const stub: display.Display = buildDiagonalDisplay(1280, 1080, 96.0, 2.0);
      expect(stub.width).assertEqual(1280);
      expect(stub.height).assertEqual(1080);
      expect(stub.densityDPI).assertEqual(96.0);
      expect(stub.densityPixels).assertEqual(2.0);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(35);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_7200
     * @tc.name diagonalExpandedCase062
     * @tc.desc Verify 3840x1080 at 96.0 dpi and 2.0 scaled density resolves to 83 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase062', 0, (): void => {
      // width=3840, height=1080, densityDPI=96.0, densityPixels=2.0, expected=83.
      const stub: display.Display = buildDiagonalDisplay(3840, 1080, 96.0, 2.0);
      expect(stub.width).assertEqual(3840);
      expect(stub.height).assertEqual(1080);
      expect(stub.densityDPI).assertEqual(96.0);
      expect(stub.densityPixels).assertEqual(2.0);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(83);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_7300
     * @tc.name diagonalExpandedCase063
     * @tc.desc Verify 2560x720 at 120.0 dpi and 2.0 scaled density resolves to 44 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase063', 0, (): void => {
      // width=2560, height=720, densityDPI=120.0, densityPixels=2.0, expected=44.
      const stub: display.Display = buildDiagonalDisplay(2560, 720, 120.0, 2.0);
      expect(stub.width).assertEqual(2560);
      expect(stub.height).assertEqual(720);
      expect(stub.densityDPI).assertEqual(120.0);
      expect(stub.densityPixels).assertEqual(2.0);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(44);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_7400
     * @tc.name diagonalExpandedCase064
     * @tc.desc Verify 1080x720 at 120.0 dpi and 2.0 scaled density resolves to 22 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase064', 0, (): void => {
      // width=1080, height=720, densityDPI=120.0, densityPixels=2.0, expected=22.
      const stub: display.Display = buildDiagonalDisplay(1080, 720, 120.0, 2.0);
      expect(stub.width).assertEqual(1080);
      expect(stub.height).assertEqual(720);
      expect(stub.densityDPI).assertEqual(120.0);
      expect(stub.densityPixels).assertEqual(2.0);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(22);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_7500
     * @tc.name diagonalExpandedCase065
     * @tc.desc Verify 720x720 at 120.0 dpi and 2.5 scaled density resolves to 21 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase065', 0, (): void => {
      // width=720, height=720, densityDPI=120.0, densityPixels=2.5, expected=21.
      const stub: display.Display = buildDiagonalDisplay(720, 720, 120.0, 2.5);
      expect(stub.width).assertEqual(720);
      expect(stub.height).assertEqual(720);
      expect(stub.densityDPI).assertEqual(120.0);
      expect(stub.densityPixels).assertEqual(2.5);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(21);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_7600
     * @tc.name diagonalExpandedCase066
     * @tc.desc Verify 1440x2160 at 120.0 dpi and 2.5 scaled density resolves to 54 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase066', 0, (): void => {
      // width=1440, height=2160, densityDPI=120.0, densityPixels=2.5, expected=54.
      const stub: display.Display = buildDiagonalDisplay(1440, 2160, 120.0, 2.5);
      expect(stub.width).assertEqual(1440);
      expect(stub.height).assertEqual(2160);
      expect(stub.densityDPI).assertEqual(120.0);
      expect(stub.densityPixels).assertEqual(2.5);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(54);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_7700
     * @tc.name diagonalExpandedCase067
     * @tc.desc Verify 7680x2160 at 120.0 dpi and 2.5 scaled density resolves to 166 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase067', 0, (): void => {
      // width=7680, height=2160, densityDPI=120.0, densityPixels=2.5, expected=166.
      const stub: display.Display = buildDiagonalDisplay(7680, 2160, 120.0, 2.5);
      expect(stub.width).assertEqual(7680);
      expect(stub.height).assertEqual(2160);
      expect(stub.densityDPI).assertEqual(120.0);
      expect(stub.densityPixels).assertEqual(2.5);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(166);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_7800
     * @tc.name diagonalExpandedCase068
     * @tc.desc Verify 320x2160 at 120.0 dpi and 2.5 scaled density resolves to 45 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase068', 0, (): void => {
      // width=320, height=2160, densityDPI=120.0, densityPixels=2.5, expected=45.
      const stub: display.Display = buildDiagonalDisplay(320, 2160, 120.0, 2.5);
      expect(stub.width).assertEqual(320);
      expect(stub.height).assertEqual(2160);
      expect(stub.densityDPI).assertEqual(120.0);
      expect(stub.densityPixels).assertEqual(2.5);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(45);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_7900
     * @tc.name diagonalExpandedCase069
     * @tc.desc Verify 640x1440 at 120.0 dpi and 2.5 scaled density resolves to 33 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase069', 0, (): void => {
      // width=640, height=1440, densityDPI=120.0, densityPixels=2.5, expected=33.
      const stub: display.Display = buildDiagonalDisplay(640, 1440, 120.0, 2.5);
      expect(stub.width).assertEqual(640);
      expect(stub.height).assertEqual(1440);
      expect(stub.densityDPI).assertEqual(120.0);
      expect(stub.densityPixels).assertEqual(2.5);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(33);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_8000
     * @tc.name diagonalExpandedCase070
     * @tc.desc Verify 1920x1440 at 160.0 dpi and 3.125 scaled density resolves to 47 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase070', 0, (): void => {
      // width=1920, height=1440, densityDPI=160.0, densityPixels=3.125, expected=47.
      const stub: display.Display = buildDiagonalDisplay(1920, 1440, 160.0, 3.125);
      expect(stub.width).assertEqual(1920);
      expect(stub.height).assertEqual(1440);
      expect(stub.densityDPI).assertEqual(160.0);
      expect(stub.densityPixels).assertEqual(3.125);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(47);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_8100
     * @tc.name diagonalExpandedCase071
     * @tc.desc Verify 1280x1440 at 160.0 dpi and 3.125 scaled density resolves to 38 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase071', 0, (): void => {
      // width=1280, height=1440, densityDPI=160.0, densityPixels=3.125, expected=38.
      const stub: display.Display = buildDiagonalDisplay(1280, 1440, 160.0, 3.125);
      expect(stub.width).assertEqual(1280);
      expect(stub.height).assertEqual(1440);
      expect(stub.densityDPI).assertEqual(160.0);
      expect(stub.densityPixels).assertEqual(3.125);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(38);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_8200
     * @tc.name diagonalExpandedCase072
     * @tc.desc Verify 3840x1920 at 160.0 dpi and 3.125 scaled density resolves to 84 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase072', 0, (): void => {
      // width=3840, height=1920, densityDPI=160.0, densityPixels=3.125, expected=84.
      const stub: display.Display = buildDiagonalDisplay(3840, 1920, 160.0, 3.125);
      expect(stub.width).assertEqual(3840);
      expect(stub.height).assertEqual(1920);
      expect(stub.densityDPI).assertEqual(160.0);
      expect(stub.densityPixels).assertEqual(3.125);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(84);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_8300
     * @tc.name diagonalExpandedCase073
     * @tc.desc Verify 2560x1920 at 160.0 dpi and 3.125 scaled density resolves to 63 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase073', 0, (): void => {
      // width=2560, height=1920, densityDPI=160.0, densityPixels=3.125, expected=63.
      const stub: display.Display = buildDiagonalDisplay(2560, 1920, 160.0, 3.125);
      expect(stub.width).assertEqual(2560);
      expect(stub.height).assertEqual(1920);
      expect(stub.densityDPI).assertEqual(160.0);
      expect(stub.densityPixels).assertEqual(3.125);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(63);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_8400
     * @tc.name diagonalExpandedCase074
     * @tc.desc Verify 1080x1920 at 160.0 dpi and 3.125 scaled density resolves to 43 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase074', 0, (): void => {
      // width=1080, height=1920, densityDPI=160.0, densityPixels=3.125, expected=43.
      const stub: display.Display = buildDiagonalDisplay(1080, 1920, 160.0, 3.125);
      expect(stub.width).assertEqual(1080);
      expect(stub.height).assertEqual(1920);
      expect(stub.densityDPI).assertEqual(160.0);
      expect(stub.densityPixels).assertEqual(3.125);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(43);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_8500
     * @tc.name diagonalExpandedCase075
     * @tc.desc Verify 720x1280 at 160.0 dpi and 1.3333 scaled density resolves to 12 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase075', 0, (): void => {
      // width=720, height=1280, densityDPI=160.0, densityPixels=1.3333, expected=12.
      const stub: display.Display = buildDiagonalDisplay(720, 1280, 160.0, 1.3333);
      expect(stub.width).assertEqual(720);
      expect(stub.height).assertEqual(1280);
      expect(stub.densityDPI).assertEqual(160.0);
      expect(stub.densityPixels).assertEqual(1.3333);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(12);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_8600
     * @tc.name diagonalExpandedCase076
     * @tc.desc Verify 1440x1280 at 160.0 dpi and 1.3333 scaled density resolves to 16 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase076', 0, (): void => {
      // width=1440, height=1280, densityDPI=160.0, densityPixels=1.3333, expected=16.
      const stub: display.Display = buildDiagonalDisplay(1440, 1280, 160.0, 1.3333);
      expect(stub.width).assertEqual(1440);
      expect(stub.height).assertEqual(1280);
      expect(stub.densityDPI).assertEqual(160.0);
      expect(stub.densityPixels).assertEqual(1.3333);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(16);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_8700
     * @tc.name diagonalExpandedCase077
     * @tc.desc Verify 7680x1280 at 240.0 dpi and 1.3333 scaled density resolves to 43 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase077', 0, (): void => {
      // width=7680, height=1280, densityDPI=240.0, densityPixels=1.3333, expected=43.
      const stub: display.Display = buildDiagonalDisplay(7680, 1280, 240.0, 1.3333);
      expect(stub.width).assertEqual(7680);
      expect(stub.height).assertEqual(1280);
      expect(stub.densityDPI).assertEqual(240.0);
      expect(stub.densityPixels).assertEqual(1.3333);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(43);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_8800
     * @tc.name diagonalExpandedCase078
     * @tc.desc Verify 320x2560 at 240.0 dpi and 1.3333 scaled density resolves to 14 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase078', 0, (): void => {
      // width=320, height=2560, densityDPI=240.0, densityPixels=1.3333, expected=14.
      const stub: display.Display = buildDiagonalDisplay(320, 2560, 240.0, 1.3333);
      expect(stub.width).assertEqual(320);
      expect(stub.height).assertEqual(2560);
      expect(stub.densityDPI).assertEqual(240.0);
      expect(stub.densityPixels).assertEqual(1.3333);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(14);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_8900
     * @tc.name diagonalExpandedCase079
     * @tc.desc Verify 640x2560 at 240.0 dpi and 1.3333 scaled density resolves to 15 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase079', 0, (): void => {
      // width=640, height=2560, densityDPI=240.0, densityPixels=1.3333, expected=15.
      const stub: display.Display = buildDiagonalDisplay(640, 2560, 240.0, 1.3333);
      expect(stub.width).assertEqual(640);
      expect(stub.height).assertEqual(2560);
      expect(stub.densityDPI).assertEqual(240.0);
      expect(stub.densityPixels).assertEqual(1.3333);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(15);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_9000
     * @tc.name diagonalExpandedCase080
     * @tc.desc Verify 1920x2560 at 240.0 dpi and 1.6667 scaled density resolves to 22 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase080', 0, (): void => {
      // width=1920, height=2560, densityDPI=240.0, densityPixels=1.6667, expected=22.
      const stub: display.Display = buildDiagonalDisplay(1920, 2560, 240.0, 1.6667);
      expect(stub.width).assertEqual(1920);
      expect(stub.height).assertEqual(2560);
      expect(stub.densityDPI).assertEqual(240.0);
      expect(stub.densityPixels).assertEqual(1.6667);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(22);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_9100
     * @tc.name diagonalExpandedCase081
     * @tc.desc Verify 1280x4320 at 240.0 dpi and 1.6667 scaled density resolves to 31 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase081', 0, (): void => {
      // width=1280, height=4320, densityDPI=240.0, densityPixels=1.6667, expected=31.
      const stub: display.Display = buildDiagonalDisplay(1280, 4320, 240.0, 1.6667);
      expect(stub.width).assertEqual(1280);
      expect(stub.height).assertEqual(4320);
      expect(stub.densityDPI).assertEqual(240.0);
      expect(stub.densityPixels).assertEqual(1.6667);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(31);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_9200
     * @tc.name diagonalExpandedCase082
     * @tc.desc Verify 3840x4320 at 240.0 dpi and 1.6667 scaled density resolves to 40 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase082', 0, (): void => {
      // width=3840, height=4320, densityDPI=240.0, densityPixels=1.6667, expected=40.
      const stub: display.Display = buildDiagonalDisplay(3840, 4320, 240.0, 1.6667);
      expect(stub.width).assertEqual(3840);
      expect(stub.height).assertEqual(4320);
      expect(stub.densityDPI).assertEqual(240.0);
      expect(stub.densityPixels).assertEqual(1.6667);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(40);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_9300
     * @tc.name diagonalExpandedCase083
     * @tc.desc Verify 2560x4320 at 240.0 dpi and 1.6667 scaled density resolves to 35 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase083', 0, (): void => {
      // width=2560, height=4320, densityDPI=240.0, densityPixels=1.6667, expected=35.
      const stub: display.Display = buildDiagonalDisplay(2560, 4320, 240.0, 1.6667);
      expect(stub.width).assertEqual(2560);
      expect(stub.height).assertEqual(4320);
      expect(stub.densityDPI).assertEqual(240.0);
      expect(stub.densityPixels).assertEqual(1.6667);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(35);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_9400
     * @tc.name diagonalExpandedCase084
     * @tc.desc Verify 1080x240 at 320.0 dpi and 1.6667 scaled density resolves to 6 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase084', 0, (): void => {
      // width=1080, height=240, densityDPI=320.0, densityPixels=1.6667, expected=6.
      const stub: display.Display = buildDiagonalDisplay(1080, 240, 320.0, 1.6667);
      expect(stub.width).assertEqual(1080);
      expect(stub.height).assertEqual(240);
      expect(stub.densityDPI).assertEqual(320.0);
      expect(stub.densityPixels).assertEqual(1.6667);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(6);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_9500
     * @tc.name diagonalExpandedCase085
     * @tc.desc Verify 720x240 at 320.0 dpi and 1.75 scaled density resolves to 4 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase085', 0, (): void => {
      // width=720, height=240, densityDPI=320.0, densityPixels=1.75, expected=4.
      const stub: display.Display = buildDiagonalDisplay(720, 240, 320.0, 1.75);
      expect(stub.width).assertEqual(720);
      expect(stub.height).assertEqual(240);
      expect(stub.densityDPI).assertEqual(320.0);
      expect(stub.densityPixels).assertEqual(1.75);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(4);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_9600
     * @tc.name diagonalExpandedCase086
     * @tc.desc Verify 1440x240 at 320.0 dpi and 1.75 scaled density resolves to 8 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase086', 0, (): void => {
      // width=1440, height=240, densityDPI=320.0, densityPixels=1.75, expected=8.
      const stub: display.Display = buildDiagonalDisplay(1440, 240, 320.0, 1.75);
      expect(stub.width).assertEqual(1440);
      expect(stub.height).assertEqual(240);
      expect(stub.densityDPI).assertEqual(320.0);
      expect(stub.densityPixels).assertEqual(1.75);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(8);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_9700
     * @tc.name diagonalExpandedCase087
     * @tc.desc Verify 7680x360 at 320.0 dpi and 1.75 scaled density resolves to 42 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase087', 0, (): void => {
      // width=7680, height=360, densityDPI=320.0, densityPixels=1.75, expected=42.
      const stub: display.Display = buildDiagonalDisplay(7680, 360, 320.0, 1.75);
      expect(stub.width).assertEqual(7680);
      expect(stub.height).assertEqual(360);
      expect(stub.densityDPI).assertEqual(320.0);
      expect(stub.densityPixels).assertEqual(1.75);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(42);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_9800
     * @tc.name diagonalExpandedCase088
     * @tc.desc Verify 320x360 at 320.0 dpi and 1.75 scaled density resolves to 3 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase088', 0, (): void => {
      // width=320, height=360, densityDPI=320.0, densityPixels=1.75, expected=3.
      const stub: display.Display = buildDiagonalDisplay(320, 360, 320.0, 1.75);
      expect(stub.width).assertEqual(320);
      expect(stub.height).assertEqual(360);
      expect(stub.densityDPI).assertEqual(320.0);
      expect(stub.densityPixels).assertEqual(1.75);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(3);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_9900
     * @tc.name diagonalExpandedCase089
     * @tc.desc Verify 640x360 at 320.0 dpi and 1.75 scaled density resolves to 4 inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalExpandedCase089', 0, (): void => {
      // width=640, height=360, densityDPI=320.0, densityPixels=1.75, expected=4.
      const stub: display.Display = buildDiagonalDisplay(640, 360, 320.0, 1.75);
      expect(stub.width).assertEqual(640);
      expect(stub.height).assertEqual(360);
      expect(stub.densityDPI).assertEqual(320.0);
      expect(stub.densityPixels).assertEqual(1.75);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(4);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_10000
     * @tc.name diagonalInvalidExpandedCase090
     * @tc.desc Verify invalid geometry 0x1080, dpi 320.0, density 2.0 collapses to zero inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalInvalidExpandedCase090', 0, (): void => {
      const stub: display.Display = buildDiagonalDisplay(0, 1080, 320.0, 2.0);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_10100
     * @tc.name diagonalInvalidExpandedCase091
     * @tc.desc Verify invalid geometry 1920x0, dpi 320.0, density 2.0 collapses to zero inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalInvalidExpandedCase091', 0, (): void => {
      const stub: display.Display = buildDiagonalDisplay(1920, 0, 320.0, 2.0);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_10200
     * @tc.name diagonalInvalidExpandedCase092
     * @tc.desc Verify invalid geometry -1x1080, dpi 320.0, density 2.0 collapses to zero inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalInvalidExpandedCase092', 0, (): void => {
      const stub: display.Display = buildDiagonalDisplay(-1, 1080, 320.0, 2.0);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_10300
     * @tc.name diagonalInvalidExpandedCase093
     * @tc.desc Verify invalid geometry 1920x-1080, dpi 320.0, density 2.0 collapses to zero inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalInvalidExpandedCase093', 0, (): void => {
      const stub: display.Display = buildDiagonalDisplay(1920, -1080, 320.0, 2.0);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_10400
     * @tc.name diagonalInvalidExpandedCase094
     * @tc.desc Verify invalid geometry 1920x1080, dpi 0.0, density 2.0 collapses to zero inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalInvalidExpandedCase094', 0, (): void => {
      const stub: display.Display = buildDiagonalDisplay(1920, 1080, 0.0, 2.0);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_10500
     * @tc.name diagonalInvalidExpandedCase095
     * @tc.desc Verify invalid geometry 1920x1080, dpi 320.0, density 0.0 collapses to zero inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalInvalidExpandedCase095', 0, (): void => {
      const stub: display.Display = buildDiagonalDisplay(1920, 1080, 320.0, 0.0);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_10600
     * @tc.name diagonalInvalidExpandedCase096
     * @tc.desc Verify invalid geometry 1920x1080, dpi -160.0, density 2.0 collapses to zero inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalInvalidExpandedCase096', 0, (): void => {
      const stub: display.Display = buildDiagonalDisplay(1920, 1080, -160.0, 2.0);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_10700
     * @tc.name diagonalInvalidExpandedCase097
     * @tc.desc Verify invalid geometry 1920x1080, dpi 320.0, density -1.0 collapses to zero inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalInvalidExpandedCase097', 0, (): void => {
      const stub: display.Display = buildDiagonalDisplay(1920, 1080, 320.0, -1.0);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_10800
     * @tc.name diagonalInvalidExpandedCase098
     * @tc.desc Verify invalid geometry 0x0, dpi 0.0, density 0.0 collapses to zero inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalInvalidExpandedCase098', 0, (): void => {
      const stub: display.Display = buildDiagonalDisplay(0, 0, 0.0, 0.0);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DIAGONAL_EXPANDED_10900
     * @tc.name diagonalInvalidExpandedCase099
     * @tc.desc Verify invalid geometry -1920x-1080, dpi -320.0, density -2.0 collapses to zero inches
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('diagonalInvalidExpandedCase099', 0, (): void => {
      const stub: display.Display = buildDiagonalDisplay(-1920, -1080, -320.0, -2.0);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(0);
    });

  });
}
