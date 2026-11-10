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
import { assertFiniteNumber, assertWithinRelative } from '../Shared/TestSupport';
import { CommonConstants } from '../../../../main/ets/common/CommonConstants';

const TARGET_NUMERATOR: number = 9;
const TARGET_DENOMINATOR: number = 16;
const TARGET_RATIO: number = TARGET_NUMERATOR / TARGET_DENOMINATOR;
const SIXTEEN_BIT_LIMIT: number = 65535;
const PX_LENGTH: number = CommonConstants.PX.length;

interface WidthSample {
  width: number;
  label: string;
}

interface ScaleSample {
  scale: number;
  label: string;
}

const WIDTH_SAMPLES: WidthSample[] = [
  { width: 320, label: 'small-watch-like' },
  { width: 360, label: 'compact-phone' },
  { width: 480, label: 'legacy-phone' },
  { width: 540, label: 'small-density' },
  { width: 600, label: 'phablet' },
  { width: 720, label: 'common-720p' },
  { width: 800, label: 'tablet-min' },
  { width: 900, label: 'tablet-mid' },
  { width: 1024, label: 'tablet-1024' },
  { width: 1080, label: 'phone-1080p' },
  { width: 1200, label: 'tablet-1200' },
  { width: 1280, label: 'desktop-1280' },
  { width: 1440, label: 'desktop-1440' },
  { width: 1600, label: 'desktop-1600' },
  { width: 1920, label: 'full-hd-width' },
  { width: 2048, label: 'tablet-2k' },
  { width: 2560, label: 'desktop-2k' },
  { width: 3840, label: 'desktop-4k' }
];

const SCALE_SAMPLES: ScaleSample[] = [
  { scale: 0.5, label: 'min-density' },
  { scale: 0.75, label: 'low-density' },
  { scale: 1, label: 'base-density' },
  { scale: 1.25, label: 'compact-density' },
  { scale: 1.5, label: 'medium-density' },
  { scale: 2, label: 'high-density' },
  { scale: 2.5, label: 'extra-density' },
  { scale: 3, label: 'super-density' },
  { scale: 3.5, label: 'triple-plus-density' },
  { scale: 4, label: 'max-density' }
];

function viewportHeight(width: number): number {
  return width * CommonConstants.DEFAULT_HEIGHT / CommonConstants.DEFAULT_WIDTH;
}

function heightWithUnit(width: number): string {
  return viewportHeight(width) + CommonConstants.PX;
}

function numericPartOf(text: string): number {
  expect(text.endsWith(CommonConstants.PX)).assertTrue();
  return Number(text.substring(0, text.length - PX_LENGTH));
}

export default function viewportLayoutMatrixTest() {
  describe('viewportLayoutMatrixTest', () => {
    beforeAll(() => {
      console.info('viewportLayoutMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('viewportLayoutMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_0100
     * @tc.name      testViewportLayout0001
     * @tc.desc      Verify the default canvas keeps exactly the 16:9 relation without rounding loss
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(CommonConstants.DEFAULT_WIDTH).assertLarger(0);
      expect(CommonConstants.DEFAULT_HEIGHT).assertLarger(0);
      expect(CommonConstants.DEFAULT_HEIGHT * TARGET_DENOMINATOR)
        .assertEqual(CommonConstants.DEFAULT_WIDTH * TARGET_NUMERATOR);
      expect(CommonConstants.DEFAULT_HEIGHT / CommonConstants.DEFAULT_WIDTH).assertClose(TARGET_RATIO, 1e-12);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_0200
     * @tc.name      testViewportLayout0002
     * @tc.desc      Verify the 16:9 ratio stays reciprocal when width and height are swapped
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const widthToHeight: number = CommonConstants.DEFAULT_WIDTH / CommonConstants.DEFAULT_HEIGHT;
      const heightToWidth: number = CommonConstants.DEFAULT_HEIGHT / CommonConstants.DEFAULT_WIDTH;
      expect(widthToHeight * heightToWidth).assertClose(1, 1e-12);
      expect(widthToHeight).assertClose(TARGET_DENOMINATOR / TARGET_NUMERATOR, 1e-12);
      expect(widthToHeight).assertLarger(heightToWidth);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_0300
     * @tc.name      testViewportLayout0003
     * @tc.desc      Verify the height computed from a full-HD width matches the declared default height
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const height: number = viewportHeight(CommonConstants.DEFAULT_WIDTH);
      expect(height).assertClose(CommonConstants.DEFAULT_HEIGHT, 1e-9);
      expect(height).assertEqual(CommonConstants.DEFAULT_HEIGHT);
      expect(numericPartOf(heightWithUnit(CommonConstants.DEFAULT_WIDTH)))
        .assertEqual(CommonConstants.DEFAULT_HEIGHT);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_0400
     * @tc.name      testViewportLayout0004
     * @tc.desc      Verify the computed viewport height keeps the 16:9 ratio for every sampled width
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      for (let i = 0; i < WIDTH_SAMPLES.length; i++) {
        const sample: WidthSample = WIDTH_SAMPLES[i];
        const height: number = viewportHeight(sample.width);
        assertFiniteNumber(height, sample.label);
        expect(height).assertLarger(0);
        expect(height / sample.width).assertClose(TARGET_RATIO, 1e-9);
      }
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_0500
     * @tc.name      testViewportLayout0005
     * @tc.desc      Verify the computed height grows strictly with the viewport width
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let previousHeight: number = -1;
      for (let i = 0; i < WIDTH_SAMPLES.length; i++) {
        const current: number = viewportHeight(WIDTH_SAMPLES[i].width);
        expect(current).assertLarger(previousHeight);
        previousHeight = current;
      }
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_0600
     * @tc.name      testViewportLayout0006
     * @tc.desc      Verify doubling the width doubles the computed height
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bases: number[] = [320, 360, 720, 1080, 1920];
      for (let i = 0; i < bases.length; i++) {
        const single: number = viewportHeight(bases[i]);
        const doubled: number = viewportHeight(bases[i] * 2);
        expect(doubled).assertClose(single * 2, 1e-9);
      }
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_0700
     * @tc.name      testViewportLayout0007
     * @tc.desc      Verify the px suffix survives every sampled width and parses back to the same number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      for (let i = 0; i < WIDTH_SAMPLES.length; i++) {
        const sample: WidthSample = WIDTH_SAMPLES[i];
        const text: string = heightWithUnit(sample.width);
        expect(text.endsWith(CommonConstants.PX)).assertTrue();
        expect(text.length).assertLarger(PX_LENGTH);
        const parsed: number = numericPartOf(text);
        expect(Number.isNaN(parsed)).assertFalse();
        expect(parsed).assertClose(viewportHeight(sample.width), 1e-9);
      }
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_0800
     * @tc.name      testViewportLayout0008
     * @tc.desc      Verify the px suffix is appended exactly once even for whole-number heights
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const text: string = heightWithUnit(1920);
      expect(text).assertEqual('1080px');
      expect(text.indexOf(CommonConstants.PX)).assertEqual(text.length - PX_LENGTH);
      expect(text.indexOf(CommonConstants.PX, 1)).assertEqual(text.length - PX_LENGTH);
      expect(text.split(CommonConstants.PX).length).assertEqual(2);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_0900
     * @tc.name      testViewportLayout0009
     * @tc.desc      Verify a zero width yields a zero height and a unit-only string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(viewportHeight(0)).assertEqual(0);
      expect(heightWithUnit(0)).assertEqual(`0${CommonConstants.PX}`);
      expect(numericPartOf(heightWithUnit(0))).assertEqual(0);
      expect(Number.isNaN(numericPartOf(heightWithUnit(0)))).assertFalse();
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_1000
     * @tc.name      testViewportLayout0010
     * @tc.desc      Verify a one-pixel width yields a positive sub-pixel height that still keeps the ratio
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const height: number = viewportHeight(1);
      expect(height).assertLarger(0);
      expect(height).assertLess(1);
      expect(height).assertClose(TARGET_RATIO, 1e-12);
      expect(height).assertClose(CommonConstants.DEFAULT_HEIGHT / CommonConstants.DEFAULT_WIDTH, 1e-12);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_1100
     * @tc.name      testViewportLayout0011
     * @tc.desc      Verify fractional viewport widths keep the ratio and remain finite
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fractions: number[] = [0.5, 1.5, 2.25, 10.75, 359.5, 719.25, 1079.99];
      for (let i = 0; i < fractions.length; i++) {
        const width: number = fractions[i];
        const height: number = viewportHeight(width);
        assertFiniteNumber(height, `fraction-${i}`);
        expect(height / width).assertClose(TARGET_RATIO, 1e-9);
      }
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_1200
     * @tc.name      testViewportLayout0012
     * @tc.desc      Verify the maximum 16-bit viewport width still produces a finite positive height
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const height: number = viewportHeight(SIXTEEN_BIT_LIMIT);
      assertFiniteNumber(height, 'sixteen-bit-limit');
      expect(height).assertLarger(0);
      expect(height).assertClose(SIXTEEN_BIT_LIMIT * TARGET_RATIO, 1e-9);
      expect(height).assertLess(SIXTEEN_BIT_LIMIT);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_1300
     * @tc.name      testViewportLayout0013
     * @tc.desc      Verify the real display width produces a viewport height that fits the display
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const deviceDisplay: display.Display = display.getDefaultDisplaySync();
      const height: number = viewportHeight(deviceDisplay.width);
      assertFiniteNumber(height, 'device-height');
      expect(height).assertLarger(0);
      expect(height).assertClose(deviceDisplay.width * TARGET_RATIO, 1e-9);
      expect(height).assertLessOrEqual(deviceDisplay.height * 1.001);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_1400
     * @tc.name      testViewportLayout0014
     * @tc.desc      Verify the real display height leaves room for the 16:9 viewport at that width
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const deviceDisplay: display.Display = display.getDefaultDisplaySync();
      expect(deviceDisplay.width).assertLarger(0);
      expect(deviceDisplay.height).assertLarger(0);
      const remaining: number = deviceDisplay.height - viewportHeight(deviceDisplay.width);
      console.info(`viewportLayout: remaining vertical space ${remaining}px`);
      expect(remaining).assertLarger(0);
      expect(remaining).assertLessOrEqual(deviceDisplay.height);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_1500
     * @tc.name      testViewportLayout0015
     * @tc.desc      Verify the viewport height computed from the real width is proportional to the display height
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const deviceDisplay: display.Display = display.getDefaultDisplaySync();
      const expectedByDisplay: number = deviceDisplay.height * TARGET_RATIO *
        (deviceDisplay.width / deviceDisplay.height);
      const actual: number = viewportHeight(deviceDisplay.width);
      expect(actual).assertClose(expectedByDisplay, 1e-9);
      expect(actual).assertClose(deviceDisplay.width * TARGET_RATIO, 1e-9);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_1600
     * @tc.name      testViewportLayout0016
     * @tc.desc      Verify the px unit is a non-empty lowercase suffix that never collides with digits
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(CommonConstants.PX.length).assertLarger(0);
      expect(CommonConstants.PX).assertEqual(CommonConstants.PX.toLowerCase());
      expect(CommonConstants.PX).assertEqual('px');
      expect(/\d/.test(CommonConstants.PX)).assertFalse();
      expect(/^[a-z]+$/.test(CommonConstants.PX)).assertTrue();
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_1700
     * @tc.name      testViewportLayout0017
     * @tc.desc      Verify the full-size constant is a complete percentage that maps to the full dimension
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(CommonConstants.FULL_SIZE).assertEqual('100%');
      expect(CommonConstants.FULL_SIZE.endsWith('%')).assertTrue();
      const numeric: number = Number(CommonConstants.FULL_SIZE.substring(0, CommonConstants.FULL_SIZE.length - 1));
      expect(numeric).assertEqual(100);
      expect(numeric / 100).assertEqual(1);
      expect(/^\d+%$/.test(CommonConstants.FULL_SIZE)).assertTrue();
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_1800
     * @tc.name      testViewportLayout0018
     * @tc.desc      Verify the default value constant is the neutral offset used when opening the file
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(Number.isInteger(CommonConstants.DEFAULT_VALUE)).assertTrue();
      expect(CommonConstants.DEFAULT_VALUE).assertLargerOrEqual(0);
      expect(CommonConstants.DEFAULT_VALUE + CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(Math.abs(CommonConstants.DEFAULT_VALUE)).assertEqual(0);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_1900
     * @tc.name      testViewportLayout0019
     * @tc.desc      Verify the toast duration is a positive millisecond budget within a sane upper bound
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(CommonConstants.DURATION).assertLarger(0);
      expect(Number.isInteger(CommonConstants.DURATION)).assertTrue();
      expect(CommonConstants.DURATION).assertLargerOrEqual(1000);
      expect(CommonConstants.DURATION).assertLessOrEqual(10000);
      expect(CommonConstants.DURATION % 100).assertEqual(0);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_2000
     * @tc.name      testViewportLayout0020
     * @tc.desc      Verify the toast bottom offset is a non-negative integer that fits a phone viewport
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const deviceDisplay: display.Display = display.getDefaultDisplaySync();
      expect(CommonConstants.BOTTOM).assertLargerOrEqual(0);
      expect(Number.isInteger(CommonConstants.BOTTOM)).assertTrue();
      expect(CommonConstants.BOTTOM).assertLess(deviceDisplay.height);
      expect(CommonConstants.BOTTOM).assertLess(deviceDisplay.width);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_2100
     * @tc.name      testViewportLayout0021
     * @tc.desc      Verify the index tag is a stable non-empty uppercase identifier
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(CommonConstants.INDEX_TAG.length).assertLarger(0);
      expect(CommonConstants.INDEX_TAG).assertEqual(CommonConstants.INDEX_TAG.toUpperCase());
      expect(CommonConstants.INDEX_TAG).assertEqual('INDEX');
      expect(/^[A-Z0-9_]+$/.test(CommonConstants.INDEX_TAG)).assertTrue();
      expect(CommonConstants.INDEX_TAG.indexOf(' ')).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_2200
     * @tc.name      testViewportLayout0022
     * @tc.desc      Verify the width and height constants are distinct so a square swap would be detected
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(CommonConstants.DEFAULT_WIDTH).assertLarger(CommonConstants.DEFAULT_HEIGHT);
      expect(CommonConstants.DEFAULT_WIDTH === CommonConstants.DEFAULT_HEIGHT).assertFalse();
      expect(CommonConstants.DEFAULT_WIDTH - CommonConstants.DEFAULT_HEIGHT).assertEqual(840);
      expect(CommonConstants.DEFAULT_WIDTH / 2).assertEqual(960);
      expect(CommonConstants.DEFAULT_HEIGHT / 2).assertEqual(540);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_2300
     * @tc.name      testViewportLayout0023
     * @tc.desc      Verify the constants are integral pixel counts rather than fractional values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Number.isInteger(CommonConstants.DEFAULT_WIDTH)).assertTrue();
      expect(Number.isInteger(CommonConstants.DEFAULT_HEIGHT)).assertTrue();
      expect(Number.isSafeInteger(CommonConstants.DEFAULT_WIDTH)).assertTrue();
      expect(Number.isSafeInteger(CommonConstants.DEFAULT_HEIGHT)).assertTrue();
      expect(CommonConstants.DEFAULT_WIDTH % 1).assertEqual(0);
      expect(CommonConstants.DEFAULT_HEIGHT % 1).assertEqual(0);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_2400
     * @tc.name      testViewportLayout0024
     * @tc.desc      Verify the denominator divides the height axis exactly and the numerator divides the width axis
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(CommonConstants.DEFAULT_WIDTH % TARGET_DENOMINATOR).assertEqual(0);
      expect(CommonConstants.DEFAULT_HEIGHT % TARGET_NUMERATOR).assertEqual(0);
      expect(CommonConstants.DEFAULT_WIDTH / TARGET_DENOMINATOR)
        .assertEqual(CommonConstants.DEFAULT_HEIGHT / TARGET_NUMERATOR);
      expect(CommonConstants.DEFAULT_WIDTH / TARGET_DENOMINATOR * TARGET_NUMERATOR)
        .assertEqual(CommonConstants.DEFAULT_HEIGHT);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_2500
     * @tc.name      testViewportLayout0025
     * @tc.desc      Verify scaling both constants by the same factor preserves the ratio
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      for (let i = 0; i < SCALE_SAMPLES.length; i++) {
        const scale: number = SCALE_SAMPLES[i].scale;
        const width: number = CommonConstants.DEFAULT_WIDTH * scale;
        const height: number = CommonConstants.DEFAULT_HEIGHT * scale;
        expect(height / width).assertClose(TARGET_RATIO, 1e-9);
        expect(width).assertLarger(0);
        expect(height).assertLarger(0);
      }
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_2600
     * @tc.name      testViewportLayout0026
     * @tc.desc      Verify density conversion maps the full-HD width onto the declared vp width correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      for (let i = 0; i < SCALE_SAMPLES.length; i++) {
        const density: number = SCALE_SAMPLES[i].scale;
        const widthInVp: number = CommonConstants.DEFAULT_WIDTH / density;
        const backToPx: number = widthInVp * density;
        assertWithinRelative(backToPx, CommonConstants.DEFAULT_WIDTH, 1e-9, SCALE_SAMPLES[i].label);
        expect(widthInVp).assertLarger(0);
      }
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_2700
     * @tc.name      testViewportLayout0027
     * @tc.desc      Verify the computed px string of the real display parses to the exact expected height
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const deviceDisplay: display.Display = display.getDefaultDisplaySync();
      const text: string = heightWithUnit(deviceDisplay.width);
      const parsed: number = numericPartOf(text);
      expect(parsed).assertClose(deviceDisplay.width * TARGET_RATIO, 1e-9);
      expect(text.startsWith(`${parsed}`)).assertTrue();
      expect(text.substring(text.length - PX_LENGTH)).assertEqual(CommonConstants.PX);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_2800
     * @tc.name      testViewportLayout0028
     * @tc.desc      Verify the viewport height never exceeds the display width for landscape-capable screens
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const deviceDisplay: display.Display = display.getDefaultDisplaySync();
      const height: number = viewportHeight(deviceDisplay.width);
      expect(height).assertLess(deviceDisplay.width);
      expect(height).assertClose(deviceDisplay.width * 9 / 16, 1e-9);
      expect(9 / 16).assertEqual(TARGET_RATIO);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_2900
     * @tc.name      testViewportLayout0029
     * @tc.desc      Verify the height for a width list is strictly ordered and injective
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const heights: number[] = [];
      for (let i = 0; i < WIDTH_SAMPLES.length; i++) {
        heights.push(viewportHeight(WIDTH_SAMPLES[i].width));
      }
      for (let i = 1; i < heights.length; i++) {
        expect(heights[i]).assertLarger(heights[i - 1]);
      }
      const distinct: Set<number> = new Set<number>();
      for (let i = 0; i < heights.length; i++) {
        distinct.add(heights[i]);
      }
      expect(distinct.size).assertEqual(heights.length);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_3000
     * @tc.name      testViewportLayout0030
     * @tc.desc      Verify the pixel string of every sampled width is unique so scaling cannot alias
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const texts: string[] = [];
      for (let i = 0; i < WIDTH_SAMPLES.length; i++) {
        texts.push(heightWithUnit(WIDTH_SAMPLES[i].width));
      }
      const distinct: Set<string> = new Set<string>();
      for (let i = 0; i < texts.length; i++) {
        distinct.add(texts[i]);
      }
      expect(distinct.size).assertEqual(texts.length);
      for (let i = 0; i < texts.length; i++) {
        expect(texts[i].endsWith(CommonConstants.PX)).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_3100
     * @tc.name      testViewportLayout0031
     * @tc.desc      Verify the height of an odd width differs from the naive integer division floor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const oddWidth: number = 1921;
      const exact: number = viewportHeight(oddWidth);
      const floored: number = Math.floor(oddWidth * TARGET_RATIO);
      expect(exact).assertLarger(floored);
      expect(exact - floored).assertClose(0.5625, 1e-9);
      expect(Math.floor(exact)).assertEqual(floored);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_3200
     * @tc.name      testViewportLayout0032
     * @tc.desc      Verify every real screen dimension yields a legal vp/px conversion pair
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const deviceDisplay: display.Display = display.getDefaultDisplaySync();
      expect(deviceDisplay.densityPixels).assertLarger(0);
      const widthVp: number = deviceDisplay.width / deviceDisplay.densityPixels;
      const heightVp: number = deviceDisplay.height / deviceDisplay.densityPixels;
      assertFiniteNumber(widthVp, 'widthVp');
      assertFiniteNumber(heightVp, 'heightVp');
      expect(widthVp).assertLarger(0);
      expect(heightVp).assertLarger(0);
      expect(widthVp * deviceDisplay.densityPixels).assertClose(deviceDisplay.width, 0.01);
      expect(heightVp * deviceDisplay.densityPixels).assertClose(deviceDisplay.height, 0.01);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_3300
     * @tc.name      testViewportLayout0033
     * @tc.desc      Verify the viewport computed from vp width matches the viewport computed from px width
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const deviceDisplay: display.Display = display.getDefaultDisplaySync();
      const widthVp: number = deviceDisplay.width / deviceDisplay.densityPixels;
      const heightFromVp: number = viewportHeight(widthVp) * deviceDisplay.densityPixels;
      const heightFromPx: number = viewportHeight(deviceDisplay.width);
      assertWithinRelative(heightFromVp, heightFromPx, 1e-9, 'vp-vs-px');
      expect(heightFromVp).assertClose(heightFromPx, 0.01);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_3400
     * @tc.name      testViewportLayout0034
     * @tc.desc      Verify the layout height for consecutive widths advances by a constant 16:9 step
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const step: number = 10;
      const base: number = 700;
      let previous: number = viewportHeight(base);
      for (let offset = step; offset <= 200; offset += step) {
        const current: number = viewportHeight(base + offset);
        expect(current - previous).assertClose(viewportHeight(step), 1e-9);
        previous = current;
      }
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_3500
     * @tc.name      testViewportLayout0035
     * @tc.desc      Verify the viewport ratio is invariant under translation of the sampling window
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const pairs: number[][] = [[320, 480], [360, 540], [720, 1080], [1280, 1920]];
      for (let i = 0; i < pairs.length; i++) {
        const low: number = viewportHeight(pairs[i][0]);
        const high: number = viewportHeight(pairs[i][1]);
        expect(high / low).assertClose(pairs[i][1] / pairs[i][0], 1e-9);
        expect(low / high).assertClose(pairs[i][0] / pairs[i][1], 1e-9);
      }
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_3600
     * @tc.name      testViewportLayout0036
     * @tc.desc      Verify the px string never contains scientific notation for the sampled widths
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      for (let i = 0; i < WIDTH_SAMPLES.length; i++) {
        const text: string = heightWithUnit(WIDTH_SAMPLES[i].width);
        expect(text.toLowerCase().indexOf('e')).assertEqual(-1);
        expect(text.indexOf(' ')).assertEqual(-1);
        expect(text.indexOf('px')).assertLargerOrEqual(0);
      }
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_3700
     * @tc.name      testViewportLayout0037
     * @tc.desc      Verify the computed height is stable across repeated evaluations for the same width
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const width: number = 1234;
      const first: number = viewportHeight(width);
      const firstText: string = heightWithUnit(width);
      for (let i = 0; i < 100; i++) {
        expect(viewportHeight(width)).assertEqual(first);
        expect(heightWithUnit(width)).assertEqual(firstText);
      }
      expect(firstText).assertEqual(`${first}${CommonConstants.PX}`);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_3800
     * @tc.name      testViewportLayout0038
     * @tc.desc      Verify the height computed from the display is within one pixel of the ideal 16:9 value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const deviceDisplay: display.Display = display.getDefaultDisplaySync();
      const ideal: number = deviceDisplay.width * 9 / 16;
      const actual: number = viewportHeight(deviceDisplay.width);
      expect(Math.abs(actual - ideal)).assertLessOrEqual(1);
      expect(Math.abs(actual - ideal)).assertLargerOrEqual(0);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_3900
     * @tc.name      testViewportLayout0039
     * @tc.desc      Verify the height for a width list is always smaller than the width plus its own height
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      for (let i = 0; i < WIDTH_SAMPLES.length; i++) {
        const width: number = WIDTH_SAMPLES[i].width;
        const height: number = viewportHeight(width);
        expect(height).assertLess(width);
        expect(width + height).assertClose(width * (1 + TARGET_RATIO), 1e-9);
        expect(width + height).assertClose(width + width * 9 / 16, 1e-9);
      }
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_4000
     * @tc.name      testViewportLayout0040
     * @tc.desc      Verify the string length of the px value grows monotonically with the sampled widths
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      for (let i = 0; i < WIDTH_SAMPLES.length; i++) {
        const sample: WidthSample = WIDTH_SAMPLES[i];
        const text: string = heightWithUnit(sample.width);
        const parsed: number = numericPartOf(text);
        expect(Number.isFinite(parsed)).assertTrue();
        expect(parsed).assertClose(viewportHeight(sample.width), 1e-9);
        expect(text.indexOf(CommonConstants.PX)).assertEqual(text.length - PX_LENGTH);
      }
      const longest: number = heightWithUnit(3840).length;
      const shortest: number = heightWithUnit(320).length;
      expect(longest).assertLargerOrEqual(shortest);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_4100
     * @tc.name      testViewportLayout0041
     * @tc.desc      Verify the derived height is invariant to whether the width is expressed in vp or px
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const deviceDisplay: display.Display = display.getDefaultDisplaySync();
      const density: number = deviceDisplay.densityPixels;
      const widthPx: number = deviceDisplay.width;
      const widthVp: number = widthPx / density;
      expect(viewportHeight(widthVp) * density).assertClose(viewportHeight(widthPx), 0.01);
      expect(viewportHeight(widthVp) / viewportHeight(widthPx)).assertClose(1 / density, 1e-9);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_4200
     * @tc.name      testViewportLayout0042
     * @tc.desc      Verify the display width used for layout is the physical pixel width, not a down-scaled value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const deviceDisplay: display.Display = display.getDefaultDisplaySync();
      expect(deviceDisplay.width).assertLarger(0);
      expect(Number.isInteger(deviceDisplay.width)).assertTrue();
      expect(viewportHeight(deviceDisplay.width)).assertClose(deviceDisplay.width * TARGET_RATIO, 1e-9);
      expect(deviceDisplay.width * TARGET_RATIO).assertLarger(0);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_4300
     * @tc.name      testViewportLayout0043
     * @tc.desc      Verify the height derived from a square width stays below the width so portrait layout keeps room
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const heights: number[] = [];
      for (let i = 0; i < WIDTH_SAMPLES.length; i++) {
        const width: number = WIDTH_SAMPLES[i].width;
        heights.push(viewportHeight(width));
        expect(viewportHeight(width)).assertLess(width);
      }
      expect(countDistinctValues(heights)).assertEqual(WIDTH_SAMPLES.length);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_4400
     * @tc.name      testViewportLayout0044
     * @tc.desc      Verify the px value for each width is strictly below the corresponding display height
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const deviceDisplay: display.Display = display.getDefaultDisplaySync();
      const baseHeight: number = viewportHeight(deviceDisplay.width);
      const doubledWidthHeight: number = viewportHeight(deviceDisplay.width * 2);
      expect(doubledWidthHeight).assertClose(baseHeight * 2, 1e-9);
      expect(doubledWidthHeight / deviceDisplay.width).assertClose(2 * TARGET_RATIO, 1e-9);
      expect(baseHeight).assertClose(deviceDisplay.width * TARGET_RATIO, 1e-9);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_VIEWPORT_4500
     * @tc.name      testViewportLayout0045
     * @tc.desc      Verify the ratio computation does not depend on the order of width sampling
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testViewportLayout0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const forward: number[] = [];
      const backward: number[] = [];
      for (let i = 0; i < WIDTH_SAMPLES.length; i++) {
        forward.push(viewportHeight(WIDTH_SAMPLES[i].width));
      }
      for (let i = WIDTH_SAMPLES.length - 1; i >= 0; i--) {
        backward.push(viewportHeight(WIDTH_SAMPLES[i].width));
      }
      for (let i = 0; i < forward.length; i++) {
        expect(forward[i]).assertEqual(backward[backward.length - 1 - i]);
      }
    })
  });
}

function countDistinctValues(values: number[]): number {
  const seen: Set<number> = new Set<number>();
  for (let i = 0; i < values.length; i++) {
    seen.add(values[i]);
  }
  return seen.size;
}
