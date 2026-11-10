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
import { CommonConstants } from '../../../../main/ets/common/CommonConstants';

const RATIO: number = 9 / 16;
const WIDTHS: number[] = [320, 321, 359, 360, 361, 719, 720, 721, 1079, 1080, 1081, 1919, 1920, 1921];
const DENSITIES: number[] = [1, 1.25, 1.5, 2, 2.5, 3, 4];

function heightOf(width: number): number {
  return width * CommonConstants.DEFAULT_HEIGHT / CommonConstants.DEFAULT_WIDTH;
}

export default function displayRoundingMatrixTest() {
  describe('displayRoundingMatrixTest', () => {
    beforeAll(() => {
      console.info('displayRoundingMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('displayRoundingMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_VALIDATION_ROUNDING_0100
     * @tc.name      testDisplayRounding0001
     * @tc.desc      Verify the computed height lies between its floor and ceiling for every width
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayRounding0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      for (let i = 0; i < WIDTHS.length; i++) {
        const height: number = heightOf(WIDTHS[i]);
        expect(Math.floor(height)).assertLessOrEqual(height);
        expect(Math.ceil(height)).assertLargerOrEqual(height);
        expect(Math.ceil(height) - Math.floor(height)).assertLessOrEqual(1);
      }
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_ROUNDING_0200
     * @tc.name      testDisplayRounding0002
     * @tc.desc      Verify the rounded height never leaves the floor to ceiling interval
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayRounding0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      for (let i = 0; i < WIDTHS.length; i++) {
        const height: number = heightOf(WIDTHS[i]);
        const rounded: number = Math.round(height);
        expect(rounded).assertLargerOrEqual(Math.floor(height));
        expect(rounded).assertLessOrEqual(Math.ceil(height));
      }
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_ROUNDING_0300
     * @tc.name      testDisplayRounding0003
     * @tc.desc      Verify an integer height equals both its floor and ceiling
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayRounding0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const integerWidths: number[] = [320, 640, 960, 1280, 1920];
      for (let i = 0; i < integerWidths.length; i++) {
        const height: number = heightOf(integerWidths[i]);
        expect(Number.isInteger(height)).assertTrue();
        expect(Math.floor(height)).assertEqual(height);
        expect(Math.ceil(height)).assertEqual(height);
        expect(Math.round(height)).assertEqual(height);
      }
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_ROUNDING_0400
     * @tc.name      testDisplayRounding0004
     * @tc.desc      Verify a fractional height is strictly between its floor and ceiling
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayRounding0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fractionalWidths: number[] = [321, 361, 721, 1081, 1921];
      for (let i = 0; i < fractionalWidths.length; i++) {
        const height: number = heightOf(fractionalWidths[i]);
        expect(Number.isInteger(height)).assertFalse();
        expect(Math.floor(height)).assertLess(height);
        expect(Math.ceil(height)).assertLarger(height);
        expect(Math.ceil(height) - Math.floor(height)).assertEqual(1);
      }
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_ROUNDING_0500
     * @tc.name      testDisplayRounding0005
     * @tc.desc      Verify the fractional part of the height is always in the open unit interval or zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayRounding0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      for (let i = 0; i < WIDTHS.length; i++) {
        const height: number = heightOf(WIDTHS[i]);
        const fraction: number = height - Math.floor(height);
        expect(fraction).assertLargerOrEqual(0);
        expect(fraction).assertLess(1);
        if (!Number.isInteger(height)) {
          expect(fraction).assertLarger(0);
        }
      }
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_ROUNDING_0600
     * @tc.name      testDisplayRounding0006
     * @tc.desc      Verify the rounded height stays within one pixel of the exact 16:9 value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayRounding0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      for (let i = 0; i < WIDTHS.length; i++) {
        const exact: number = WIDTHS[i] * RATIO;
        const rounded: number = Math.round(heightOf(WIDTHS[i]));
        expect(Math.abs(rounded - exact)).assertLessOrEqual(1);
      }
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_ROUNDING_0700
     * @tc.name      testDisplayRounding0007
     * @tc.desc      Verify the height calculated from constants equals the direct 9:16 product for every width
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayRounding0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      for (let i = 0; i < WIDTHS.length; i++) {
        expect(heightOf(WIDTHS[i])).assertClose(WIDTHS[i] * 9 / 16, 1e-9);
      }
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_ROUNDING_0800
     * @tc.name      testDisplayRounding0008
     * @tc.desc      Verify vp to px conversion round-trips within a hundredth for every sampled density
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayRounding0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const screen: display.Display = display.getDefaultDisplaySync();
      for (let i = 0; i < DENSITIES.length; i++) {
        const widthVp: number = screen.width / DENSITIES[i];
        const backToPx: number = widthVp * DENSITIES[i];
        expect(backToPx).assertClose(screen.width, 0.01);
        expect(widthVp).assertLarger(0);
      }
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_ROUNDING_0900
     * @tc.name      testDisplayRounding0009
     * @tc.desc      Verify rounding the real display width keeps it between floor and ceiling
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayRounding0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const screen: display.Display = display.getDefaultDisplaySync();
      const height: number = heightOf(screen.width);
      expect(Math.round(height)).assertLargerOrEqual(Math.floor(height));
      expect(Math.round(height)).assertLessOrEqual(Math.ceil(height));
      expect(Math.round(height)).assertLargerOrEqual(0);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_ROUNDING_1000
     * @tc.name      testDisplayRounding0010
     * @tc.desc      Verify the fractional height for consecutive widths advances by a constant ratio step
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayRounding0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let previous: number = heightOf(320);
      for (let width = 321; width <= 340; width++) {
        const current: number = heightOf(width);
        expect(current - previous).assertClose(RATIO, 1e-9);
        previous = current;
      }
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_ROUNDING_1100
     * @tc.name      testDisplayRounding0011
     * @tc.desc      Verify the percentage full-size constant maps to exactly one viewport dimension
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayRounding0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const percent: number = Number(CommonConstants.FULL_SIZE.substring(0, CommonConstants.FULL_SIZE.length - 1));
      expect(percent).assertEqual(100);
      const screen: display.Display = display.getDefaultDisplaySync();
      expect(screen.width * percent / 100).assertEqual(screen.width);
      expect(screen.height * percent / 100).assertEqual(screen.height);
    })

    /**
     * @tc.number    SUB_AVS_VALIDATION_ROUNDING_1200
     * @tc.name      testDisplayRounding0012
     * @tc.desc      Verify the height rounding is stable across repeated evaluations for each width
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDisplayRounding0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      for (let i = 0; i < WIDTHS.length; i++) {
        const first: number = Math.round(heightOf(WIDTHS[i]));
        for (let repeat = 0; repeat < 20; repeat++) {
          expect(Math.round(heightOf(WIDTHS[i]))).assertEqual(first);
        }
      }
    })
  });
}
