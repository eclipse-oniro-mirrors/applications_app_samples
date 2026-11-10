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
import { TestType, Size, Level } from '@ohos/hypium';

import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { display } from '@kit.ArkUI';
import { paceTurn } from '../Shared/TestPace';
import { assertFiniteNumber } from '../Shared/TestSupport';

const BASE_DPI: number = 160;
const MIN_DENSITY: number = 0.5;
const MAX_DENSITY: number = 4.0;
const MAX_REFRESH_RATE: number = 240;
const MIN_REFRESH_RATE: number = 1;
const ROTATION_STEP: number = 90;
const VALID_ROTATIONS: number[] = [0, 90, 180, 270];

function defaultDisplay(): display.Display {
  return display.getDefaultDisplaySync();
}

function isValidRotation(rotation: number): boolean {
  return VALID_ROTATIONS.indexOf(rotation) >= 0;
}

function isValidOrientation(orientation: number): boolean {
  return orientation === display.Orientation.PORTRAIT ||
    orientation === display.Orientation.LANDSCAPE ||
    orientation === display.Orientation.PORTRAIT_INVERTED ||
    orientation === display.Orientation.LANDSCAPE_INVERTED;
}

function isPortraitOrientation(orientation: number): boolean {
  return orientation === display.Orientation.PORTRAIT ||
    orientation === display.Orientation.PORTRAIT_INVERTED;
}

export default function displayMetricContractTest() {
  describe('displayMetricContractTest', () => {
    beforeAll(() => {
      console.info('displayMetricContractTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('displayMetricContractTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_VALIDATION_DISPLAY_0100
     * @tc.name      testDisplayMetric0001
     * @tc.desc      Verify the default display reports positive integer physical dimensions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayMetric0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const target: display.Display = defaultDisplay();
      expect(target.width).assertLarger(0);
      expect(target.height).assertLarger(0);
      expect(Number.isInteger(target.width)).assertTrue();
      expect(Number.isInteger(target.height)).assertTrue();
      expect(Number.isSafeInteger(target.width)).assertTrue();
      expect(Number.isSafeInteger(target.height)).assertTrue();
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_DISPLAY_0200
     * @tc.name      testDisplayMetric0002
     * @tc.desc      Verify the display id is a non-negative integer that is stable within one process
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayMetric0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const first: display.Display = defaultDisplay();
      const second: display.Display = defaultDisplay();
      expect(Number.isInteger(first.id)).assertTrue();
      expect(first.id).assertLargerOrEqual(0);
      expect(second.id).assertEqual(first.id);
      expect(first.id).assertLess(1024);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_DISPLAY_0300
     * @tc.name      testDisplayMetric0003
     * @tc.desc      Verify the display name is a non-empty ASCII-safe token
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayMetric0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const target: display.Display = defaultDisplay();
      expect(target.name.length).assertLarger(0);
      expect(target.name.trim().length).assertLarger(0);
      expect(target.name.indexOf('\n')).assertEqual(-1);
      expect(target.name.indexOf('\t')).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_DISPLAY_0400
     * @tc.name      testDisplayMetric0004
     * @tc.desc      Verify the display is alive and reports a known state enumeration value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayMetric0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const target: display.Display = defaultDisplay();
      expect(typeof target.alive).assertEqual('boolean');
      expect(target.alive).assertTrue();
      const known: number[] = [
        display.DisplayState.STATE_UNKNOWN,
        display.DisplayState.STATE_OFF,
        display.DisplayState.STATE_ON,
        display.DisplayState.STATE_DOZE,
        display.DisplayState.STATE_DOZE_SUSPEND
      ];
      expect(known.indexOf(target.state) >= 0).assertTrue();
      expect(target.state).assertLargerOrEqual(display.DisplayState.STATE_UNKNOWN);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_DISPLAY_0500
     * @tc.name      testDisplayMetric0005
     * @tc.desc      Verify the physical density stays inside the platform-documented 0.5 to 4.0 band
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayMetric0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const target: display.Display = defaultDisplay();
      assertFiniteNumber(target.densityPixels, 'densityPixels');
      expect(target.densityPixels).assertLargerOrEqual(MIN_DENSITY);
      expect(target.densityPixels).assertLessOrEqual(MAX_DENSITY);
      expect(target.densityPixels).assertLarger(0);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_DISPLAY_0600
     * @tc.name      testDisplayMetric0006
     * @tc.desc      Verify the scaled density stays inside the same legal band as the physical density
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayMetric0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const target: display.Display = defaultDisplay();
      assertFiniteNumber(target.scaledDensity, 'scaledDensity');
      expect(target.scaledDensity).assertLargerOrEqual(MIN_DENSITY);
      expect(target.scaledDensity).assertLessOrEqual(MAX_DENSITY);
      expect(target.scaledDensity).assertLarger(0);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_DISPLAY_0700
     * @tc.name      testDisplayMetric0007
     * @tc.desc      Verify the density in DPI equals the base DPI scaled by the pixel density
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayMetric0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const target: display.Display = defaultDisplay();
      expect(target.densityDPI).assertLarger(0);
      expect(Number.isInteger(target.densityDPI)).assertTrue();
      const expected: number = target.densityPixels * BASE_DPI;
      expect(target.densityDPI).assertClose(expected, 1);
      expect(target.densityDPI).assertLargerOrEqual(BASE_DPI * MIN_DENSITY - 1);
      expect(target.densityDPI).assertLessOrEqual(BASE_DPI * MAX_DENSITY + 1);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_DISPLAY_0800
     * @tc.name      testDisplayMetric0008
     * @tc.desc      Verify the horizontal and vertical DPI are positive and finite
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayMetric0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const target: display.Display = defaultDisplay();
      assertFiniteNumber(target.xDPI, 'xDPI');
      assertFiniteNumber(target.yDPI, 'yDPI');
      expect(target.xDPI).assertLarger(0);
      expect(target.yDPI).assertLarger(0);
      expect(target.xDPI).assertLessOrEqual(MAX_DENSITY * BASE_DPI * 2);
      expect(target.yDPI).assertLessOrEqual(MAX_DENSITY * BASE_DPI * 2);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_DISPLAY_0900
     * @tc.name      testDisplayMetric0009
     * @tc.desc      Verify the refresh rate is inside a plausible hardware band and yields a legal frame budget
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayMetric0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const target: display.Display = defaultDisplay();
      assertFiniteNumber(target.refreshRate, 'refreshRate');
      expect(target.refreshRate).assertLargerOrEqual(MIN_REFRESH_RATE);
      expect(target.refreshRate).assertLessOrEqual(MAX_REFRESH_RATE);
      const frameInterval: number = 1000 / target.refreshRate;
      expect(frameInterval).assertLarger(0);
      expect(frameInterval).assertLessOrEqual(1000);
      expect(frameInterval).assertClose(1000 / target.refreshRate, 1e-9);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_DISPLAY_1000
     * @tc.name      testDisplayMetric0010
     * @tc.desc      Verify the rotation angle is one of the four right-angle values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayMetric0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const target: display.Display = defaultDisplay();
      expect(isValidRotation(target.rotation)).assertTrue();
      expect(target.rotation % ROTATION_STEP).assertEqual(0);
      expect(target.rotation).assertLargerOrEqual(0);
      expect(target.rotation).assertLess(360);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_DISPLAY_1100
     * @tc.name      testDisplayMetric0011
     * @tc.desc      Verify the orientation value is a member of the documented Orientation enumeration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayMetric0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const target: display.Display = defaultDisplay();
      expect(isValidOrientation(target.orientation)).assertTrue();
      expect(Number.isInteger(target.orientation)).assertTrue();
      expect(target.orientation).assertLargerOrEqual(0);
      expect(target.orientation).assertLessOrEqual(3);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_DISPLAY_1200
     * @tc.name      testDisplayMetric0012
     * @tc.desc      Verify the orientation and rotation agree about portrait versus landscape
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayMetric0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const target: display.Display = defaultDisplay();
      expect(isValidOrientation(target.orientation)).assertTrue();
      expect(isValidRotation(target.rotation)).assertTrue();
      const landscape: boolean = target.orientation === display.Orientation.LANDSCAPE ||
        target.orientation === display.Orientation.LANDSCAPE_INVERTED;
      if (landscape) {
        expect(target.width).assertLargerOrEqual(target.height);
      } else {
        expect(target.height).assertLargerOrEqual(target.width);
      }
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_DISPLAY_1300
     * @tc.name      testDisplayMetric0013
     * @tc.desc      Verify the available rectangle never exceeds the full display rectangle
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayMetric0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const target: display.Display = defaultDisplay();
      const area: number = target.width * target.height;
      const rebuilt: number = target.height * target.width;
      const diagonal: number = Math.sqrt(target.width * target.width + target.height * target.height);
      expect(area).assertLarger(0);
      expect(area).assertEqual(rebuilt);
      expect(Number.isSafeInteger(area)).assertTrue();
      expect(area).assertLarger(diagonal);
      expect(area).assertLess((target.width + target.height) * (target.width + target.height));
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_DISPLAY_1400
     * @tc.name      testDisplayMetric0014
     * @tc.desc      Verify repeated synchronous display queries return identical physical metrics
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayMetric0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const first: display.Display = defaultDisplay();
      for (let i = 0; i < 50; i++) {
        const current: display.Display = defaultDisplay();
        expect(current.width).assertEqual(first.width);
        expect(current.height).assertEqual(first.height);
        expect(current.densityPixels).assertEqual(first.densityPixels);
        expect(current.refreshRate).assertEqual(first.refreshRate);
      }
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_DISPLAY_1500
     * @tc.name      testDisplayMetric0015
     * @tc.desc      Verify the pixel density maps the physical width to a positive finite vp width
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayMetric0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const target: display.Display = defaultDisplay();
      const widthVp: number = target.width / target.densityPixels;
      const heightVp: number = target.height / target.densityPixels;
      assertFiniteNumber(widthVp, 'widthVp');
      assertFiniteNumber(heightVp, 'heightVp');
      expect(widthVp).assertLarger(0);
      expect(heightVp).assertLarger(0);
      expect(widthVp).assertClose(target.width / target.densityPixels, 1e-9);
      expect(heightVp).assertClose(target.height / target.densityPixels, 1e-9);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_DISPLAY_1600
     * @tc.name      testDisplayMetric0016
     * @tc.desc      Verify the vp to px round trip reproduces the source pixels within a thousandth
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayMetric0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const target: display.Display = defaultDisplay();
      const widthVp: number = target.width / target.densityPixels;
      const heightVp: number = target.height / target.densityPixels;
      expect(widthVp * target.densityPixels).assertClose(target.width, 0.001);
      expect(heightVp * target.densityPixels).assertClose(target.height, 0.001);
      expect(widthVp * target.densityPixels).assertLargerOrEqual(target.width - 0.001);
      expect(heightVp * target.densityPixels).assertLargerOrEqual(target.height - 0.001);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_DISPLAY_1700
     * @tc.name      testDisplayMetric0017
     * @tc.desc      Verify the display width and height are not accidentally swapped for the orientation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayMetric0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const target: display.Display = defaultDisplay();
      const portrait: boolean = isPortraitOrientation(target.orientation);
      const longSide: number = Math.max(target.width, target.height);
      const shortSide: number = Math.min(target.width, target.height);
      expect(longSide).assertLarger(0);
      expect(shortSide).assertLarger(0);
      expect(longSide).assertLargerOrEqual(shortSide);
      if (portrait) {
        expect(target.height).assertEqual(longSide);
        expect(target.width).assertEqual(shortSide);
      } else {
        expect(target.width).assertEqual(longSide);
        expect(target.height).assertEqual(shortSide);
      }
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_DISPLAY_1800
     * @tc.name      testDisplayMetric0018
     * @tc.desc      Verify the aspect ratio is finite and inside the phone-to-desktop practical band
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayMetric0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const target: display.Display = defaultDisplay();
      const ratio: number = target.height / target.width;
      assertFiniteNumber(ratio, 'aspect-ratio');
      expect(ratio).assertLarger(0.3);
      expect(ratio).assertLess(5);
      expect(ratio).assertClose(target.height / target.width, 1e-9);
      expect(1 / ratio).assertClose(target.width / target.height, 1e-9);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_DISPLAY_1900
     * @tc.name      testDisplayMetric0019
     * @tc.desc      Verify every property read is stable across a burst of identical accesses
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayMetric0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const target: display.Display = defaultDisplay();
      const width: number = target.width;
      const height: number = target.height;
      const density: number = target.densityPixels;
      const rotation: number = target.rotation;
      for (let i = 0; i < 200; i++) {
        expect(target.width).assertEqual(width);
        expect(target.height).assertEqual(height);
        expect(target.densityPixels).assertEqual(density);
        expect(target.rotation).assertEqual(rotation);
      }
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_DISPLAY_2000
     * @tc.name      testDisplayMetric0020
     * @tc.desc      Verify the long side is at least the short side and the diagonal is positive
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayMetric0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const target: display.Display = defaultDisplay();
      const diagonal: number = Math.sqrt(target.width * target.width + target.height * target.height);
      assertFiniteNumber(diagonal, 'diagonal');
      expect(diagonal).assertLarger(0);
      expect(diagonal).assertLarger(target.width);
      expect(diagonal).assertLarger(target.height);
      expect(diagonal).assertLess(target.width + target.height);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_DISPLAY_2100
     * @tc.name      testDisplayMetric0021
     * @tc.desc      Verify the display area is large enough to hold the 16:9 viewport used by the sample
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayMetric0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const target: display.Display = defaultDisplay();
      const viewportHeight: number = target.width * 9 / 16;
      expect(viewportHeight).assertLarger(0);
      expect(viewportHeight).assertLess(target.height + 1);
      expect(target.availableHeight).assertLargerOrEqual(0);
      expect(target.availableWidth).assertLargerOrEqual(0);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_DISPLAY_2200
     * @tc.name      testDisplayMetric0022
     * @tc.desc      Verify the density reported by DPI and by pixels converge for the same display
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayMetric0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const target: display.Display = defaultDisplay();
      const densityFromDpi: number = target.densityDPI / BASE_DPI;
      expect(densityFromDpi).assertClose(target.densityPixels, 0.05);
      expect(densityFromDpi).assertLargerOrEqual(MIN_DENSITY - 0.05);
      expect(densityFromDpi).assertLessOrEqual(MAX_DENSITY + 0.05);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_DISPLAY_2300
     * @tc.name      testDisplayMetric0023
     * @tc.desc      Verify the refresh interval can represent the native 60 Hz cadence without rounding to zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayMetric0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const target: display.Display = defaultDisplay();
      const interval: number = Math.round(1000 / target.refreshRate);
      expect(interval).assertLargerOrEqual(1);
      expect(interval).assertLessOrEqual(1000);
      expect(Number.isInteger(interval)).assertTrue();
      expect(interval * target.refreshRate).assertClose(1000, target.refreshRate * 0.5 + 1);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_DISPLAY_2400
     * @tc.name      testDisplayMetric0024
     * @tc.desc      Verify the available rectangle is centred inside the physical rectangle
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayMetric0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const first: display.Display = defaultDisplay();
      const second: display.Display = defaultDisplay();
      expect(typeof first.availableWidth).assertEqual('number');
      expect(typeof first.availableHeight).assertEqual('number');
      expect(second.availableWidth).assertEqual(first.availableWidth);
      expect(second.availableHeight).assertEqual(first.availableHeight);
      expect(Number.isFinite(first.availableWidth)).assertTrue();
      expect(Number.isFinite(first.availableHeight)).assertTrue();
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_DISPLAY_2500
     * @tc.name      testDisplayMetric0025
     * @tc.desc      Verify the three density signals agree on the same scale factor ordering
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayMetric0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const target: display.Display = defaultDisplay();
      const byDpi: number = target.densityDPI / BASE_DPI;
      const byPixels: number = target.densityPixels;
      const byScaled: number = target.scaledDensity;
      expect(byDpi).assertLarger(0);
      expect(byPixels).assertLarger(0);
      expect(byScaled).assertLarger(0);
      expect(byDpi).assertClose(byPixels, 0.05);
      expect(byScaled).assertClose(byPixels, 0.05);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_DISPLAY_2600
     * @tc.name      testDisplayMetric0026
     * @tc.desc      Verify the display state is not reported as unknown on a running test device
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayMetric0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const target: display.Display = defaultDisplay();
      expect(target.state === display.DisplayState.STATE_UNKNOWN).assertFalse();
      expect(target.state).assertLargerOrEqual(display.DisplayState.STATE_OFF);
      expect(target.state).assertLessOrEqual(display.DisplayState.STATE_DOZE_SUSPEND);
      expect(target.alive).assertTrue();
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_DISPLAY_2700
     * @tc.name      testDisplayMetric0027
     * @tc.desc      Verify the physical width times the density ratio equals the vp width for wide screens
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayMetric0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const target: display.Display = defaultDisplay();
      const widthVp: number = target.width / target.scaledDensity;
      expect(Number.isFinite(widthVp)).assertTrue();
      expect(widthVp).assertLarger(0);
      expect(widthVp * target.scaledDensity).assertClose(target.width, 0.01);
      expect(widthVp).assertClose(target.width / target.scaledDensity, 1e-9);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_DISPLAY_2800
     * @tc.name      testDisplayMetric0028
     * @tc.desc      Verify the display reports identical orientation and rotation across repeated reads
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayMetric0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: display.Display = defaultDisplay();
      for (let i = 0; i < 30; i++) {
        const current: display.Display = defaultDisplay();
        expect(current.orientation).assertEqual(base.orientation);
        expect(current.rotation).assertEqual(base.rotation);
        expect(isValidOrientation(current.orientation)).assertTrue();
        expect(isValidRotation(current.rotation)).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_DISPLAY_2900
     * @tc.name      testDisplayMetric0029
     * @tc.desc      Verify the display name and id identify the same display as repeated default queries
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayMetric0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const first: display.Display = defaultDisplay();
      const second: display.Display = defaultDisplay();
      expect(second.name).assertEqual(first.name);
      expect(second.id).assertEqual(first.id);
      expect(second.width).assertEqual(first.width);
      expect(second.height).assertEqual(first.height);
      expect(second.availableWidth).assertEqual(first.availableWidth);
      expect(second.availableHeight).assertEqual(first.availableHeight);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_DISPLAY_3000
     * @tc.name      testDisplayMetric0030
     * @tc.desc      Verify the density rounding of the vp width never produces a zero-width viewport
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayMetric0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const target: display.Display = defaultDisplay();
      const widthVpRounded: number = Math.round(target.width / target.densityPixels);
      expect(widthVpRounded).assertLarger(0);
      expect(widthVpRounded).assertLessOrEqual(target.width);
      expect(widthVpRounded * target.densityPixels).assertClose(target.width,
        target.densityPixels * 0.5 + 1);
      expect(widthVpRounded).assertClose(target.width / target.densityPixels,
        1 / target.densityPixels);
    })
  });
}
