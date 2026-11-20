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

import { afterAll, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import { display } from '@kit.ArkUI';
import { AsyncCallback } from '@kit.BasicServicesKit';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { calculateScreenDiagonalInches } from './DisplayDiagonalPolicy';
import { startAppWithRetry } from './TestScenarioUtils';
import { keepMainThreadResponsive } from './MainThreadYield';

const DISPLAY_STUB_WANT: Want = {
  bundleName: 'com.sample.demonstration',
  abilityName: 'EntryAbility'
};

// Production dpi = densityDPI / densityPixels. All expected values below are
// derived independently (diagonalPixels / dpi rounded to an integer) so the
// stub matrix can detect a regression in the production formula itself.

/**
 * Builds a hand-written mock implementing the display.Display interface.
 * Only the fields the production function actually reads are varied; the rest
 * carry stable neutral values so the object still satisfies the interface.
 */
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

export default function displayDiagonalStubContractTest(): void {
  describe('DisplayDiagonalStubContractTest', () => {
    // Pace the pure-logic matrix; see MainThreadYield.ets.
    beforeEach(keepMainThreadResponsive);
    beforeAll(async (): Promise<void> => {
      await startAppWithRetry(DISPLAY_STUB_WANT, 'com.sample.demonstration');
    });

    afterAll(async (): Promise<void> => {
      const delegator = abilityDelegatorRegistry.getAbilityDelegator();
      await startAppWithRetry(DISPLAY_STUB_WANT, 'com.sample.demonstration');
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_STUB_0100
     * @tc.name displayStubValid1080pDiagonal001
     * @tc.desc Verify the production formula yields 14 inches for a 1920x1080 160-dpi stub
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayStubValid1080pDiagonal001', 0, (): void => {
      // 1920x1080 -> sqrt(1920^2 + 1080^2) ~= 2202.9 px; 320/2 = 160 dpi;
      // 2202.9 / 160 = 13.77 -> integer 14.
      const stub: display.Display = buildMockDisplay(1920, 1080, 320, 2);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(14);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_STUB_0200
     * @tc.name displayStubZeroWidthGuard002
     * @tc.desc Verify a zero-width stub hits the guard and returns zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayStubZeroWidthGuard002', 0, (): void => {
      const stub: display.Display = buildMockDisplay(0, 1080, 320, 2);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_STUB_0300
     * @tc.name displayStubZeroHeightGuard003
     * @tc.desc Verify a zero-height stub hits the guard and returns zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayStubZeroHeightGuard003', 0, (): void => {
      const stub: display.Display = buildMockDisplay(1920, 0, 320, 2);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_STUB_0400
     * @tc.name displayStubNegativeWidthGuard004
     * @tc.desc Verify a negative-width stub hits the guard and returns zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayStubNegativeWidthGuard004', 0, (): void => {
      const stub: display.Display = buildMockDisplay(-1, 1080, 320, 2);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_STUB_0500
     * @tc.name displayStubNegativeHeightGuard005
     * @tc.desc Verify a negative-height stub hits the guard and returns zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayStubNegativeHeightGuard005', 0, (): void => {
      const stub: display.Display = buildMockDisplay(1920, -1080, 320, 2);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_STUB_0600
     * @tc.name displayStubZeroDensityGuard006
     * @tc.desc Verify a zero-density stub returns zero through the dpi guard
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayStubZeroDensityGuard006', 0, (): void => {
      const stub: display.Display = buildMockDisplay(1920, 1080, 0, 2);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_STUB_0700
     * @tc.name displayStubZeroDensityPixelsGuard007
     * @tc.desc Verify a zero densityPixels stub cannot produce a positive inch count
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayStubZeroDensityPixelsGuard007', 0, (): void => {
      const stub: display.Display = buildMockDisplay(1920, 1080, 320, 0);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_STUB_0800
     * @tc.name displayStubNegativeDensityGuard008
     * @tc.desc Verify a negative-density stub returns zero through the dpi guard
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayStubNegativeDensityGuard008', 0, (): void => {
      const stub: display.Display = buildMockDisplay(1920, 1080, -160, 2);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_STUB_0900
     * @tc.name displayStub27Inch1080p009
     * @tc.desc Verify the production 27-inch 1080p geometry maps to exactly 27
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayStub27Inch1080p009', 0, (): void => {
      // 1920x1080 at 81.6 dpi -> 2202.9 / 81.6 = 27.0 inches.
      const stub: display.Display = buildMockDisplay(1920, 1080, 163.2, 2);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(27);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_STUB_1000
     * @tc.name displayStub75Inch4k010
     * @tc.desc Verify the production 75-inch 4K geometry maps to exactly 75
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayStub75Inch4k010', 0, (): void => {
      // 3840x2160 -> 4405.8 px; 58.74 dpi -> 4405.8 / 58.74 = 75.0 inches.
      const stub: display.Display = buildMockDisplay(3840, 2160, 117.48, 2);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(75);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_STUB_1100
     * @tc.name displayStubTinyDisplayRound011
     * @tc.desc Verify a tiny display rounds to the nearest integer inch
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayStubTinyDisplayRound011', 0, (): void => {
      // 320x240 -> 400 px at 160 dpi -> 2.5 -> rounds to 3.
      const stub: display.Display = buildMockDisplay(320, 240, 320, 2);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(3);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_STUB_1200
     * @tc.name displayStubUltraWideRound012
     * @tc.desc Verify an ultra-wide stub rounds to the expected integer inch
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayStubUltraWideRound012', 0, (): void => {
      // 2560x1080 -> 2778 px at 160 dpi -> 17.36 -> 17.
      const stub: display.Display = buildMockDisplay(2560, 1080, 320, 2);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(17);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_STUB_1300
     * @tc.name displayStubAspectInvariance013
     * @tc.desc Verify equal physical diagonals stay equal across aspect ratios
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayStubAspectInvariance013', 0, (): void => {
      // 1920x1080 (16:9) and 1792x1344 (4:3) share the same 2240 px diagonal
      // at the same 160 dpi, so both must report 14 inches.
      const wide: display.Display = buildMockDisplay(1920, 1080, 320, 2);
      const narrower: display.Display = buildMockDisplay(1792, 1344, 320, 2);
      expect(calculateScreenDiagonalInches(wide)).assertEqual(calculateScreenDiagonalInches(narrower));
      expect(calculateScreenDiagonalInches(wide)).assertEqual(14);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_STUB_1400
     * @tc.name displayStubResolutionScalingInvariant014
     * @tc.desc Verify doubling both resolution and dpi leaves the inch result unchanged
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayStubResolutionScalingInvariant014', 0, (): void => {
      // 1080p at 160 dpi equals 4K at 320 dpi: pixels double with dpi.
      const fullHd: display.Display = buildMockDisplay(1920, 1080, 320, 2);
      const ultraHd: display.Display = buildMockDisplay(3840, 2160, 640, 2);
      expect(calculateScreenDiagonalInches(fullHd)).assertEqual(14);
      expect(calculateScreenDiagonalInches(ultraHd)).assertEqual(14);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_STUB_1500
     * @tc.name displayStubNegativeDensityPixels015
     * @tc.desc Verify a negative densityPixels stub cannot yield a positive inch count
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayStubNegativeDensityPixels015', 0, (): void => {
      const stub: display.Display = buildMockDisplay(1920, 1080, 320, -1);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_STUB_1600
     * @tc.name displayStubFractionalDensityRound016
     * @tc.desc Verify a fractional density ratio rounds to the expected integer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayStubFractionalDensityRound016', 0, (): void => {
      // 213/1.5 = 142 dpi; 2202.9 / 142 = 15.51 -> 16.
      const stub: display.Display = buildMockDisplay(1920, 1080, 213, 1.5);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(16);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_STUB_1700
     * @tc.name displayStubSquareDisplayRound017
     * @tc.desc Verify a square display computes its diagonal correctly
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayStubSquareDisplayRound017', 0, (): void => {
      // 1080x1080 -> 1527 px at 160 dpi -> 9.54 -> 10.
      const stub: display.Display = buildMockDisplay(1080, 1080, 320, 2);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(10);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_STUB_1800
     * @tc.name displayStubFourThreeAspect018
     * @tc.desc Verify a 4:3 display computes its diagonal correctly
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayStubFourThreeAspect018', 0, (): void => {
      // 1440x1080 -> 1800 px at 160 dpi -> 11.25 -> 11.
      const stub: display.Display = buildMockDisplay(1440, 1080, 320, 2);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(11);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_STUB_1900
     * @tc.name displayStubPortraitSameDiagonal019
     * @tc.desc Verify a portrait stub yields the same diagonal as its landscape twin
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayStubPortraitSameDiagonal019', 0, (): void => {
      const landscape: display.Display = buildMockDisplay(1920, 1080, 320, 2);
      const portrait: display.Display = buildMockDisplay(1080, 1920, 320, 2);
      expect(calculateScreenDiagonalInches(portrait)).assertEqual(14);
      expect(calculateScreenDiagonalInches(portrait)).assertEqual(calculateScreenDiagonalInches(landscape));
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_STUB_2000
     * @tc.name displayStubEightKScaling020
     * @tc.desc Verify an 8K stub at doubled dpi keeps the expected inch count
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayStubEightKScaling020', 0, (): void => {
      // 7680x4320 -> 8811 px at 160 dpi -> 55.07 -> 55.
      const stub: display.Display = buildMockDisplay(7680, 4320, 320, 2);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(55);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_DISPLAY_STUB_2100
     * @tc.name displayStubZeroBothDimensions021
     * @tc.desc Verify a fully zero stub returns zero through both guards
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('displayStubZeroBothDimensions021', 0, (): void => {
      const stub: display.Display = buildMockDisplay(0, 0, 320, 2);
      expect(calculateScreenDiagonalInches(stub)).assertEqual(0);
    });
  });
}
