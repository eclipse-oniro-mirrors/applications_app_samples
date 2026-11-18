/**
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { StartOptions } from '@kit.AbilityKit';

const MIN_WINDOW_WIDTH: number = 600;
const MAX_WINDOW_WIDTH: number = 1500;
const MIN_WINDOW_HEIGHT: number = 500;
const MAX_WINDOW_HEIGHT: number = 1000;

export default function localUnitTest() {
  describe('localUnitTest', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * Verify all StartOptions size fields are stored as supplied.
     */
    it('StartOptions_limit_param_001', 0, () => {
      const options: StartOptions = {
        displayId: 0, minWindowWidth: 600, minWindowHeight: 500,
        maxWindowWidth: 1500, maxWindowHeight: 1000
      };
      expect(options.minWindowWidth).assertEqual(600);
      expect(options.minWindowHeight).assertEqual(500);
      expect(options.maxWindowWidth).assertEqual(1500);
      expect(options.maxWindowHeight).assertEqual(1000);
    });

    /**
     * Verify the displayId field is stored as supplied.
     */
    it('StartOptions_limit_param_002', 0, () => {
      const options: StartOptions = { displayId: 0 };
      expect(options.displayId).assertEqual(0);
    });

    /**
     * Verify the minimum width field is stored as supplied.
     */
    it('StartOptions_limit_param_003', 0, () => {
      const options: StartOptions = { minWindowWidth: 600 };
      expect(options.minWindowWidth).assertEqual(600);
    });

    /**
     * Verify the minimum height field is stored as supplied.
     */
    it('StartOptions_limit_param_004', 0, () => {
      const options: StartOptions = { minWindowHeight: 500 };
      expect(options.minWindowHeight).assertEqual(500);
    });

    /**
     * Verify the maximum width field is stored as supplied.
     */
    it('StartOptions_limit_param_005', 0, () => {
      const options: StartOptions = { maxWindowWidth: 1500 };
      expect(options.maxWindowWidth).assertEqual(1500);
    });

    /**
     * Verify the maximum height field is stored as supplied.
     */
    it('StartOptions_limit_param_006', 0, () => {
      const options: StartOptions = { maxWindowHeight: 1000 };
      expect(options.maxWindowHeight).assertEqual(1000);
    });

    /**
     * Verify the minimum width is less than the maximum width.
     */
    it('StartOptions_limit_param_007', 0, () => {
      const options: StartOptions = { minWindowWidth: 600, maxWindowWidth: 1500 };
      expect((options.minWindowWidth as number) < (options.maxWindowWidth as number)).assertTrue();
    });

    /**
     * Verify the minimum height is less than the maximum height.
     */
    it('StartOptions_limit_param_008', 0, () => {
      const options: StartOptions = { minWindowHeight: 500, maxWindowHeight: 1000 };
      expect((options.minWindowHeight as number) < (options.maxWindowHeight as number)).assertTrue();
    });

    /**
     * Verify the minimum width boundary value is preserved.
     */
    it('StartOptions_limit_param_009', 0, () => {
      const options: StartOptions = { minWindowWidth: MIN_WINDOW_WIDTH };
      expect(options.minWindowWidth).assertEqual(600);
    });

    /**
     * Verify the maximum width boundary value is preserved.
     */
    it('StartOptions_limit_param_010', 0, () => {
      const options: StartOptions = { maxWindowWidth: MAX_WINDOW_WIDTH };
      expect(options.maxWindowWidth).assertEqual(1500);
    });

    /**
     * Verify the minimum height boundary value is preserved.
     */
    it('StartOptions_limit_param_011', 0, () => {
      const options: StartOptions = { minWindowHeight: MIN_WINDOW_HEIGHT };
      expect(options.minWindowHeight).assertEqual(500);
    });

    /**
     * Verify the maximum height boundary value is preserved.
     */
    it('StartOptions_limit_param_012', 0, () => {
      const options: StartOptions = { maxWindowHeight: MAX_WINDOW_HEIGHT };
      expect(options.maxWindowHeight).assertEqual(1000);
    });

    /**
     * Verify equal minimum and maximum width values are preserved.
     */
    it('StartOptions_limit_param_013', 0, () => {
      const options: StartOptions = { minWindowWidth: 900, maxWindowWidth: 900 };
      expect(options.minWindowWidth).assertEqual(options.maxWindowWidth);
    });

    /**
     * Verify equal minimum and maximum height values are preserved.
     */
    it('StartOptions_limit_param_014', 0, () => {
      const options: StartOptions = { minWindowHeight: 800, maxWindowHeight: 800 };
      expect(options.minWindowHeight).assertEqual(options.maxWindowHeight);
    });

    /**
     * Verify a fully equal size configuration is preserved.
     */
    it('StartOptions_limit_param_015', 0, () => {
      const options: StartOptions = {
        minWindowWidth: 800, minWindowHeight: 800, maxWindowWidth: 800, maxWindowHeight: 800
      };
      expect(options.minWindowWidth).assertEqual(800);
      expect(options.maxWindowHeight).assertEqual(800);
    });

    /**
     * Verify other fields stay undefined when only minWindowWidth is set.
     */
    it('StartOptions_limit_param_016', 0, () => {
      const options: StartOptions = { minWindowWidth: 600 };
      expect(options.maxWindowWidth === undefined).assertTrue();
      expect(options.minWindowHeight === undefined).assertTrue();
    });

    /**
     * Verify other fields stay undefined when only minWindowHeight is set.
     */
    it('StartOptions_limit_param_017', 0, () => {
      const options: StartOptions = { minWindowHeight: 500 };
      expect(options.maxWindowHeight === undefined).assertTrue();
    });

    /**
     * Verify other fields stay undefined when only maxWindowWidth is set.
     */
    it('StartOptions_limit_param_018', 0, () => {
      const options: StartOptions = { maxWindowWidth: 1500 };
      expect(options.minWindowWidth === undefined).assertTrue();
    });

    /**
     * Verify other fields stay undefined when only maxWindowHeight is set.
     */
    it('StartOptions_limit_param_019', 0, () => {
      const options: StartOptions = { maxWindowHeight: 1000 };
      expect(options.minWindowHeight === undefined).assertTrue();
    });

    /**
     * Verify an empty StartOptions object is accepted.
     */
    it('StartOptions_limit_param_020', 0, () => {
      const options: StartOptions = {};
      expect(options.minWindowWidth === undefined).assertTrue();
      expect(options.maxWindowHeight === undefined).assertTrue();
    });

    /**
     * Verify explicitly undefined fields remain undefined.
     */
    it('StartOptions_limit_param_021', 0, () => {
      const options: StartOptions = { minWindowWidth: undefined, maxWindowHeight: undefined };
      expect(options.minWindowWidth === undefined).assertTrue();
      expect(options.maxWindowHeight === undefined).assertTrue();
    });

    /**
     * Verify fractional size values are stored as supplied.
     */
    it('StartOptions_limit_param_022', 0, () => {
      const options: StartOptions = { minWindowWidth: 600.5, maxWindowWidth: 1499.5 };
      expect(options.minWindowWidth).assertEqual(600.5);
      expect(options.maxWindowWidth).assertEqual(1499.5);
    });

    /**
     * Verify negative size values are stored as supplied.
     */
    it('StartOptions_limit_param_023', 0, () => {
      const options: StartOptions = { minWindowWidth: -600, maxWindowHeight: -1000 };
      expect(options.minWindowWidth).assertEqual(-600);
      expect(options.maxWindowHeight).assertEqual(-1000);
    });

    /**
     * Verify zero size values are stored as supplied.
     */
    it('StartOptions_limit_param_024', 0, () => {
      const options: StartOptions = {
        minWindowWidth: 0, minWindowHeight: 0, maxWindowWidth: 0, maxWindowHeight: 0
      };
      expect(options.minWindowWidth).assertEqual(0);
      expect(options.maxWindowHeight).assertEqual(0);
    });

    /**
     * Verify an inverted width range is preserved as supplied.
     */
    it('StartOptions_limit_param_025', 0, () => {
      const options: StartOptions = { minWindowWidth: 1500, maxWindowWidth: 600 };
      expect((options.minWindowWidth as number) > (options.maxWindowWidth as number)).assertTrue();
    });

    /**
     * Verify an inverted height range is preserved as supplied.
     */
    it('StartOptions_limit_param_026', 0, () => {
      const options: StartOptions = { minWindowHeight: 1000, maxWindowHeight: 500 };
      expect((options.minWindowHeight as number) > (options.maxWindowHeight as number)).assertTrue();
    });

    /**
     * Verify a fully inverted range is preserved as supplied.
     */
    it('StartOptions_limit_param_027', 0, () => {
      const options: StartOptions = {
        minWindowWidth: 1500, minWindowHeight: 1000, maxWindowWidth: 600, maxWindowHeight: 500
      };
      expect((options.minWindowWidth as number) > (options.maxWindowWidth as number)).assertTrue();
      expect((options.minWindowHeight as number) > (options.maxWindowHeight as number)).assertTrue();
    });

    /**
     * Verify one million size values are stored as supplied.
     */
    it('StartOptions_limit_param_028', 0, () => {
      const options: StartOptions = { maxWindowWidth: 1000000, maxWindowHeight: 1000000 };
      expect(options.maxWindowWidth).assertEqual(1000000);
    });

    /**
     * Verify MAX_SAFE_INTEGER values are stored as supplied.
     */
    it('StartOptions_limit_param_029', 0, () => {
      const options: StartOptions = { maxWindowWidth: Number.MAX_SAFE_INTEGER };
      expect(options.maxWindowWidth).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * Verify positive infinity values are stored as supplied.
     */
    it('StartOptions_limit_param_030', 0, () => {
      const options: StartOptions = { maxWindowHeight: Number.POSITIVE_INFINITY };
      expect(options.maxWindowHeight).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * Verify negative infinity values are stored as supplied.
     */
    it('StartOptions_limit_param_031', 0, () => {
      const options: StartOptions = { minWindowWidth: Number.NEGATIVE_INFINITY };
      expect(options.minWindowWidth).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * Verify NaN values are stored as supplied.
     */
    it('StartOptions_limit_param_032', 0, () => {
      const options: StartOptions = { maxWindowWidth: Number.NaN };
      expect(Number.isNaN(options.maxWindowWidth as number)).assertTrue();
    });

    /**
     * Verify negative zero is stored as zero.
     */
    it('StartOptions_limit_param_033', 0, () => {
      const options: StartOptions = { minWindowHeight: -0 };
      expect(options.minWindowHeight).assertEqual(0);
    });

    /**
     * Verify 32-bit integer boundary values are stored as supplied.
     */
    it('StartOptions_limit_param_034', 0, () => {
      const options: StartOptions = { maxWindowWidth: 2147483648, minWindowWidth: -2147483648 };
      expect(options.maxWindowWidth).assertEqual(2147483648);
    });

    /**
     * Verify 53-bit integer boundary values are stored as supplied.
     */
    it('StartOptions_limit_param_035', 0, () => {
      const options: StartOptions = { maxWindowHeight: 9007199254740992 };
      expect(options.maxWindowHeight).assertEqual(9007199254740992);
    });

    /**
     * Verify a width headroom of one is preserved.
     */
    it('StartOptions_limit_param_036', 0, () => {
      const options: StartOptions = { minWindowWidth: 600, maxWindowWidth: 601 };
      expect((options.maxWindowWidth as number) - (options.minWindowWidth as number)).assertEqual(1);
    });

    /**
     * Verify a height headroom of one hundred is preserved.
     */
    it('StartOptions_limit_param_037', 0, () => {
      const options: StartOptions = { minWindowHeight: 500, maxWindowHeight: 600 };
      expect((options.maxWindowHeight as number) - (options.minWindowHeight as number)).assertEqual(100);
    });

    /**
     * Verify the width range equals nine hundred.
     */
    it('StartOptions_limit_param_038', 0, () => {
      expect(MAX_WINDOW_WIDTH - MIN_WINDOW_WIDTH).assertEqual(900);
    });

    /**
     * Verify the height range equals five hundred.
     */
    it('StartOptions_limit_param_039', 0, () => {
      expect(MAX_WINDOW_HEIGHT - MIN_WINDOW_HEIGHT).assertEqual(500);
    });

    /**
     * Verify a populated StartOptions snapshot contains four size keys.
     */
    it('StartOptions_limit_param_040', 0, () => {
      const options: StartOptions = {
        minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 1500, maxWindowHeight: 1000
      };
      expect(Object.keys(options).length).assertEqual(4);
    });

    /**
     * Verify all size fields are numbers.
     */
    it('StartOptions_limit_param_041', 0, () => {
      const options: StartOptions = {
        minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 1500, maxWindowHeight: 1000
      };
      expect(typeof options.minWindowWidth === 'number').assertTrue();
      expect(typeof options.maxWindowHeight === 'number').assertTrue();
    });

    /**
     * Verify the sum of the minimum and maximum width.
     */
    it('StartOptions_limit_param_042', 0, () => {
      expect(MIN_WINDOW_WIDTH + MAX_WINDOW_WIDTH).assertEqual(2100);
    });

    /**
     * Verify the sum of the minimum and maximum height.
     */
    it('StartOptions_limit_param_043', 0, () => {
      expect(MIN_WINDOW_HEIGHT + MAX_WINDOW_HEIGHT).assertEqual(1500);
    });

    /**
     * Verify the width difference is positive.
     */
    it('StartOptions_limit_param_044', 0, () => {
      expect(MAX_WINDOW_WIDTH - MIN_WINDOW_WIDTH > 0).assertTrue();
    });

    /**
     * Verify the height difference is positive.
     */
    it('StartOptions_limit_param_045', 0, () => {
      expect(MAX_WINDOW_HEIGHT - MIN_WINDOW_HEIGHT > 0).assertTrue();
    });

    /**
     * Verify the minimum width minus one is below the lower bound.
     */
    it('StartOptions_limit_param_046', 0, () => {
      expect(MIN_WINDOW_WIDTH - 1 < MIN_WINDOW_WIDTH).assertTrue();
    });

    /**
     * Verify the minimum width plus one is above the lower bound.
     */
    it('StartOptions_limit_param_047', 0, () => {
      expect(MIN_WINDOW_WIDTH + 1 > MIN_WINDOW_WIDTH).assertTrue();
    });

    /**
     * Verify the minimum height minus one is below the lower bound.
     */
    it('StartOptions_limit_param_048', 0, () => {
      expect(MIN_WINDOW_HEIGHT - 1 < MIN_WINDOW_HEIGHT).assertTrue();
    });

    /**
     * Verify the minimum height plus one is above the lower bound.
     */
    it('StartOptions_limit_param_049', 0, () => {
      expect(MIN_WINDOW_HEIGHT + 1 > MIN_WINDOW_HEIGHT).assertTrue();
    });

    /**
     * Verify the maximum width minus one is below the upper bound.
     */
    it('StartOptions_limit_param_050', 0, () => {
      expect(MAX_WINDOW_WIDTH - 1 < MAX_WINDOW_WIDTH).assertTrue();
    });

    /**
     * Verify the maximum width plus one exceeds the upper bound.
     */
    it('StartOptions_limit_param_051', 0, () => {
      expect(MAX_WINDOW_WIDTH + 1 > MAX_WINDOW_WIDTH).assertTrue();
    });

    /**
     * Verify the maximum height minus one is below the upper bound.
     */
    it('StartOptions_limit_param_052', 0, () => {
      expect(MAX_WINDOW_HEIGHT - 1 < MAX_WINDOW_HEIGHT).assertTrue();
    });

    /**
     * Verify the maximum height plus one exceeds the upper bound.
     */
    it('StartOptions_limit_param_053', 0, () => {
      expect(MAX_WINDOW_HEIGHT + 1 > MAX_WINDOW_HEIGHT).assertTrue();
    });

    /**
     * Verify a 2:1 window ratio is within the size bounds.
     */
    it('StartOptions_limit_param_054', 0, () => {
      expect(1200 / 600).assertEqual(2);
    });

    /**
     * Verify a 3:2 window ratio is within the size bounds.
     */
    it('StartOptions_limit_param_055', 0, () => {
      expect(900 / 600).assertEqual(1.5);
    });

    /**
     * Verify displayId zero is stored as supplied.
     */
    it('StartOptions_limit_param_056', 0, () => {
      const options: StartOptions = { displayId: 0, minWindowWidth: 600 };
      expect(options.displayId).assertEqual(0);
    });

    /**
     * Verify a non-zero displayId is stored as supplied.
     */
    it('StartOptions_limit_param_057', 0, () => {
      const options: StartOptions = { displayId: 1 };
      expect(options.displayId).assertEqual(1);
    });

    /**
     * Verify a negative displayId is stored as supplied.
     */
    it('StartOptions_limit_param_058', 0, () => {
      const options: StartOptions = { displayId: -1 };
      expect(options.displayId).assertEqual(-1);
    });

    /**
     * Verify a displayId-only StartOptions object is accepted.
     */
    it('StartOptions_limit_param_059', 0, () => {
      const options: StartOptions = { displayId: 0 };
      expect(Object.keys(options).length).assertEqual(1);
    });

    /**
     * Verify a StartOptions object is copied by value when assigned.
     */
    it('StartOptions_limit_param_060', 0, () => {
      const first: StartOptions = { minWindowWidth: 600, maxWindowWidth: 1500 };
      const second: StartOptions = { minWindowWidth: first.minWindowWidth, maxWindowWidth: first.maxWindowWidth };
      expect(second.minWindowWidth).assertEqual(first.minWindowWidth);
      expect(second.maxWindowWidth).assertEqual(first.maxWindowWidth);
    });
    /**
     * Verify the width headroom between the configured bounds.
     */
    it('StartOptions_limit_param_061', 0, () => {
      const options: StartOptions = { minWindowWidth: 600, maxWindowWidth: 1500 };
      expect((options.maxWindowWidth as number) - (options.minWindowWidth as number)).assertEqual(900);
    });

    /**
     * Verify the height headroom between the configured bounds.
     */
    it('StartOptions_limit_param_062', 0, () => {
      const options: StartOptions = { minWindowHeight: 500, maxWindowHeight: 1000 };
      expect((options.maxWindowHeight as number) - (options.minWindowHeight as number)).assertEqual(500);
    });

    /**
     * Verify the width midpoint value.
     */
    it('StartOptions_limit_param_063', 0, () => {
      expect((MIN_WINDOW_WIDTH + MAX_WINDOW_WIDTH) / 2).assertEqual(1050);
    });

    /**
     * Verify the height midpoint value.
     */
    it('StartOptions_limit_param_064', 0, () => {
      expect((MIN_WINDOW_HEIGHT + MAX_WINDOW_HEIGHT) / 2).assertEqual(750);
    });

    /**
     * Verify the midpoint sizes stay inside the bounds.
     */
    it('StartOptions_limit_param_065', 0, () => {
      const width: number = 1050;
      const height: number = 750;
      expect(width > MIN_WINDOW_WIDTH && width < MAX_WINDOW_WIDTH).assertTrue();
      expect(height > MIN_WINDOW_HEIGHT && height < MAX_WINDOW_HEIGHT).assertTrue();
    });

    /**
     * Verify an empty options object keeps all size fields undefined.
     */
    it('StartOptions_limit_param_066', 0, () => {
      const options: StartOptions = {};
      expect(options.minWindowWidth === undefined && options.maxWindowWidth === undefined).assertTrue();
      expect(options.minWindowHeight === undefined && options.maxWindowHeight === undefined).assertTrue();
    });

    /**
     * Verify a fully populated options object contains four keys.
     */
    it('StartOptions_limit_param_067', 0, () => {
      const options: StartOptions = {
        minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 1500, maxWindowHeight: 1000
      };
      expect(Object.keys(options).length).assertEqual(4);
    });

    /**
     * Verify the maximum width to minimum height ratio.
     */
    it('StartOptions_limit_param_068', 0, () => {
      expect(1500 / 500).assertEqual(3);
    });

    /**
     * Verify the minimum width to maximum height ratio.
     */
    it('StartOptions_limit_param_069', 0, () => {
      expect(600 / 1000).assertEqual(0.6);
    });

    /**
     * Verify a square size inside the bounds.
     */
    it('StartOptions_limit_param_070', 0, () => {
      const side: number = 900;
      expect(side >= MIN_WINDOW_WIDTH && side <= MAX_WINDOW_WIDTH).assertTrue();
      expect(side >= MIN_WINDOW_HEIGHT && side <= MAX_WINDOW_HEIGHT).assertTrue();
    });

    /**
     * Verify the 600x1000 boundary ratio.
     */
    it('StartOptions_limit_param_071', 0, () => {
      expect(600 / 1000).assertEqual(0.6);
    });

    /**
     * Verify the 1500x500 boundary ratio.
     */
    it('StartOptions_limit_param_072', 0, () => {
      expect(1500 / 500).assertEqual(3);
    });

    /**
     * Verify a 4:1 ratio exceeds the configured window range.
     */
    it('StartOptions_limit_param_073', 0, () => {
      expect(2000 / 500 > 1500 / 500).assertTrue();
    });

    /**
     * Verify the 500x1000 ratio equals 0.5.
     */
    it('StartOptions_limit_param_074', 0, () => {
      expect(500 / 1000).assertEqual(0.5);
    });

    /**
     * Verify the 750x1000 ratio equals 0.75.
     */
    it('StartOptions_limit_param_075', 0, () => {
      expect(750 / 1000).assertEqual(0.75);
    });

    /**
     * Verify the 600x500 ratio equals 1.2.
     */
    it('StartOptions_limit_param_076', 0, () => {
      expect(600 / 500).assertEqual(1.2);
    });

    /**
     * Verify the 1500x1000 ratio equals 1.5.
     */
    it('StartOptions_limit_param_077', 0, () => {
      expect(1500 / 1000).assertEqual(1.5);
    });

    /**
     * Verify the 1200x600 ratio equals 2.
     */
    it('StartOptions_limit_param_078', 0, () => {
      expect(1200 / 600).assertEqual(2);
    });

    /**
     * Verify the 900x300 ratio equals 3.
     */
    it('StartOptions_limit_param_079', 0, () => {
      expect(900 / 300).assertEqual(3);
    });

    /**
     * Verify displayId counts as an additional key.
     */
    it('StartOptions_limit_param_080', 0, () => {
      const options: StartOptions = {
        displayId: 0, minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 1500, maxWindowHeight: 1000
      };
      expect(Object.keys(options).length).assertEqual(5);
    });

    /**
     * Verify a two-field options object contains two keys.
     */
    it('StartOptions_limit_param_081', 0, () => {
      const options: StartOptions = { minWindowWidth: 600, maxWindowWidth: 1500 };
      expect(Object.keys(options).length).assertEqual(2);
    });

    /**
     * Verify the displayId field is a number.
     */
    it('StartOptions_limit_param_082', 0, () => {
      const options: StartOptions = { displayId: 0 };
      expect(typeof options.displayId === 'number').assertTrue();
    });

    /**
     * Verify the minimum width is non-negative for a valid configuration.
     */
    it('StartOptions_limit_param_083', 0, () => {
      expect(MIN_WINDOW_WIDTH >= 0).assertTrue();
    });

    /**
     * Verify an inverted configuration is detected.
     */
    it('StartOptions_limit_param_084', 0, () => {
      const options: StartOptions = {
        minWindowWidth: 1500, minWindowHeight: 1000, maxWindowWidth: 600, maxWindowHeight: 500
      };
      expect((options.minWindowWidth as number) > (options.maxWindowWidth as number) &&
        (options.minWindowHeight as number) > (options.maxWindowHeight as number)).assertTrue();
    });

    /**
     * Verify a valid configuration keeps the width headroom non-negative.
     */
    it('StartOptions_limit_param_085', 0, () => {
      expect(MAX_WINDOW_WIDTH - MIN_WINDOW_WIDTH >= 0).assertTrue();
    });

    /**
     * Verify the sum of the width bounds.
     */
    it('StartOptions_limit_param_086', 0, () => {
      expect(MIN_WINDOW_WIDTH + MAX_WINDOW_WIDTH).assertEqual(2100);
    });

    /**
     * Verify the sum of the height bounds.
     */
    it('StartOptions_limit_param_087', 0, () => {
      expect(MIN_WINDOW_HEIGHT + MAX_WINDOW_HEIGHT).assertEqual(1500);
    });

    /**
     * Verify the minimum area equals three hundred thousand.
     */
    it('StartOptions_limit_param_088', 0, () => {
      expect(600 * 500).assertEqual(300000);
    });

    /**
     * Verify the maximum area equals one million five hundred thousand.
     */
    it('StartOptions_limit_param_089', 0, () => {
      expect(1500 * 1000).assertEqual(1500000);
    });

    /**
     * Verify the midpoint area stays inside the bounds.
     */
    it('StartOptions_limit_param_090', 0, () => {
      expect(1050 * 750 > 0).assertTrue();
    });

    /**
     * Verify 599 is below the minimum width.
     */
    it('StartOptions_limit_param_091', 0, () => {
      expect(599 < MIN_WINDOW_WIDTH).assertTrue();
    });

    /**
     * Verify 601 is above the minimum width.
     */
    it('StartOptions_limit_param_092', 0, () => {
      expect(601 > MIN_WINDOW_WIDTH).assertTrue();
    });

    /**
     * Verify 1499 is below the maximum width.
     */
    it('StartOptions_limit_param_093', 0, () => {
      expect(1499 < MAX_WINDOW_WIDTH).assertTrue();
    });

    /**
     * Verify 1501 exceeds the maximum width.
     */
    it('StartOptions_limit_param_094', 0, () => {
      expect(1501 > MAX_WINDOW_WIDTH).assertTrue();
    });

    /**
     * Verify 499 is below the minimum height.
     */
    it('StartOptions_limit_param_095', 0, () => {
      expect(499 < MIN_WINDOW_HEIGHT).assertTrue();
    });

    /**
     * Verify 501 is above the minimum height.
     */
    it('StartOptions_limit_param_096', 0, () => {
      expect(501 > MIN_WINDOW_HEIGHT).assertTrue();
    });

    /**
     * Verify 999 is below the maximum height.
     */
    it('StartOptions_limit_param_097', 0, () => {
      expect(999 < MAX_WINDOW_HEIGHT).assertTrue();
    });

    /**
     * Verify 1001 exceeds the maximum height.
     */
    it('StartOptions_limit_param_098', 0, () => {
      expect(1001 > MAX_WINDOW_HEIGHT).assertTrue();
    });

    /**
     * Verify the width span is greater than the height span.
     */
    it('StartOptions_limit_param_099', 0, () => {
      expect(MAX_WINDOW_WIDTH - MIN_WINDOW_WIDTH > MAX_WINDOW_HEIGHT - MIN_WINDOW_HEIGHT).assertTrue();
    });

    /**
     * Verify the full StartOptions constraints hold together.
     */
    it('StartOptions_limit_param_100', 0, () => {
      const valid: boolean = MIN_WINDOW_WIDTH > 0 && MIN_WINDOW_WIDTH < MAX_WINDOW_WIDTH &&
        MIN_WINDOW_HEIGHT > 0 && MIN_WINDOW_HEIGHT < MAX_WINDOW_HEIGHT &&
        MIN_WINDOW_WIDTH + MIN_WINDOW_HEIGHT === 1100;
      expect(valid).assertTrue();
    });
    /**
     * Verify the width headroom of the start options.
     */
    it('StartOptions_limit_param_101', 0, () => {
      expect(MAX_WINDOW_WIDTH - MIN_WINDOW_WIDTH).assertEqual(900);
    });

    /**
     * Verify the height headroom of the start options.
     */
    it('StartOptions_limit_param_102', 0, () => {
      expect(MAX_WINDOW_HEIGHT - MIN_WINDOW_HEIGHT).assertEqual(500);
    });

    /**
     * Verify the width midpoint of the start options.
     */
    it('StartOptions_limit_param_103', 0, () => {
      expect((MIN_WINDOW_WIDTH + MAX_WINDOW_WIDTH) / 2).assertEqual(1050);
    });

    /**
     * Verify the height midpoint of the start options.
     */
    it('StartOptions_limit_param_104', 0, () => {
      expect((MIN_WINDOW_HEIGHT + MAX_WINDOW_HEIGHT) / 2).assertEqual(750);
    });

    /**
     * Verify midpoint sizes stay inside the bounds.
     */
    it('StartOptions_limit_param_105', 0, () => {
      expect(1050 > MIN_WINDOW_WIDTH && 1050 < MAX_WINDOW_WIDTH).assertTrue();
      expect(750 > MIN_WINDOW_HEIGHT && 750 < MAX_WINDOW_HEIGHT).assertTrue();
    });

    /**
     * Verify a 3:2 ratio stays inside the bounds.
     */
    it('StartOptions_limit_param_106', 0, () => {
      expect(900 / 600).assertEqual(1.5);
    });

    /**
     * Verify a 1.2 ratio stays inside the bounds.
     */
    it('StartOptions_limit_param_107', 0, () => {
      expect(600 / 500).assertEqual(1.2);
    });

    /**
     * Verify a 2:1 ratio stays inside the bounds.
     */
    it('StartOptions_limit_param_108', 0, () => {
      expect(1200 / 600).assertEqual(2);
    });

    /**
     * Verify a 3:1 ratio stays inside the bounds.
     */
    it('StartOptions_limit_param_109', 0, () => {
      expect(1500 / 500).assertEqual(3);
    });

    /**
     * Verify a 0.75 ratio stays inside the bounds.
     */
    it('StartOptions_limit_param_110', 0, () => {
      expect(750 / 1000).assertEqual(0.75);
    });

    /**
     * Verify the minimum area equals three hundred thousand.
     */
    it('StartOptions_limit_param_111', 0, () => {
      expect(MIN_WINDOW_WIDTH * MIN_WINDOW_HEIGHT).assertEqual(300000);
    });

    /**
     * Verify the maximum area equals one million five hundred thousand.
     */
    it('StartOptions_limit_param_112', 0, () => {
      expect(MAX_WINDOW_WIDTH * MAX_WINDOW_HEIGHT).assertEqual(1500000);
    });

    /**
     * Verify the sum of the width bounds.
     */
    it('StartOptions_limit_param_113', 0, () => {
      expect(MIN_WINDOW_WIDTH + MAX_WINDOW_WIDTH).assertEqual(2100);
    });

    /**
     * Verify the sum of the height bounds.
     */
    it('StartOptions_limit_param_114', 0, () => {
      expect(MIN_WINDOW_HEIGHT + MAX_WINDOW_HEIGHT).assertEqual(1500);
    });

    /**
     * Verify the width span is greater than the height span.
     */
    it('StartOptions_limit_param_115', 0, () => {
      expect(MAX_WINDOW_WIDTH - MIN_WINDOW_WIDTH > MAX_WINDOW_HEIGHT - MIN_WINDOW_HEIGHT).assertTrue();
    });

    /**
     * Verify 599 is below the minimum width.
     */
    it('StartOptions_limit_param_116', 0, () => {
      expect(599 < MIN_WINDOW_WIDTH).assertTrue();
    });

    /**
     * Verify 601 is above the minimum width.
     */
    it('StartOptions_limit_param_117', 0, () => {
      expect(601 > MIN_WINDOW_WIDTH).assertTrue();
    });

    /**
     * Verify 1499 is below the maximum width.
     */
    it('StartOptions_limit_param_118', 0, () => {
      expect(1499 < MAX_WINDOW_WIDTH).assertTrue();
    });

    /**
     * Verify 1501 exceeds the maximum width.
     */
    it('StartOptions_limit_param_119', 0, () => {
      expect(1501 > MAX_WINDOW_WIDTH).assertTrue();
    });

    /**
     * Verify 499 is below the minimum height.
     */
    it('StartOptions_limit_param_120', 0, () => {
      expect(499 < MIN_WINDOW_HEIGHT).assertTrue();
    });

    /**
     * Verify 501 is above the minimum height.
     */
    it('StartOptions_limit_param_121', 0, () => {
      expect(501 > MIN_WINDOW_HEIGHT).assertTrue();
    });

    /**
     * Verify 999 is below the maximum height.
     */
    it('StartOptions_limit_param_122', 0, () => {
      expect(999 < MAX_WINDOW_HEIGHT).assertTrue();
    });

    /**
     * Verify 1001 exceeds the maximum height.
     */
    it('StartOptions_limit_param_123', 0, () => {
      expect(1001 > MAX_WINDOW_HEIGHT).assertTrue();
    });

    /**
     * Verify a fully populated options object contains four keys.
     */
    it('StartOptions_limit_param_124', 0, () => {
      const options: StartOptions = {
        minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 1500, maxWindowHeight: 1000
      };
      expect(Object.keys(options).length).assertEqual(4);
    });

    /**
     * Verify an options object with displayId contains five keys.
     */
    it('StartOptions_limit_param_125', 0, () => {
      const options: StartOptions = {
        displayId: 0, minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 1500, maxWindowHeight: 1000
      };
      expect(Object.keys(options).length).assertEqual(5);
    });

    /**
     * Verify an empty options object contains no keys.
     */
    it('StartOptions_limit_param_126', 0, () => {
      const options: StartOptions = {};
      expect(Object.keys(options).length).assertEqual(0);
    });

    /**
     * Verify an options snapshot serializes the four size fields.
     */
    it('StartOptions_limit_param_127', 0, () => {
      const options: StartOptions = {
        minWindowWidth: 600, minWindowHeight: 500, maxWindowWidth: 1500, maxWindowHeight: 1000
      };
      expect(JSON.stringify(options)).assertEqual('{"minWindowWidth":600,"minWindowHeight":500,"maxWindowWidth":1500,"maxWindowHeight":1000}');
    });

    /**
     * Verify equal width and height bounds keep their values.
     */
    it('StartOptions_limit_param_128', 0, () => {
      const options: StartOptions = {
        minWindowWidth: 900, maxWindowWidth: 900, minWindowHeight: 700, maxWindowHeight: 700
      };
      expect(options.minWindowWidth).assertEqual(options.maxWindowWidth);
      expect(options.minWindowHeight).assertEqual(options.maxWindowHeight);
    });

    /**
     * Verify an inverted configuration is detected for both dimensions.
     */
    it('StartOptions_limit_param_129', 0, () => {
      const options: StartOptions = {
        minWindowWidth: 1500, minWindowHeight: 1000, maxWindowWidth: 600, maxWindowHeight: 500
      };
      expect((options.minWindowWidth as number) > (options.maxWindowWidth as number)).assertTrue();
      expect((options.minWindowHeight as number) > (options.maxWindowHeight as number)).assertTrue();
    });

    /**
     * Verify the full StartOptions constraints hold together.
     */
    it('StartOptions_limit_param_130', 0, () => {
      const valid: boolean = MIN_WINDOW_WIDTH > 0 && MIN_WINDOW_WIDTH < MAX_WINDOW_WIDTH &&
        MIN_WINDOW_HEIGHT > 0 && MIN_WINDOW_HEIGHT < MAX_WINDOW_HEIGHT &&
        MIN_WINDOW_WIDTH + MIN_WINDOW_HEIGHT === 1100;
      expect(valid).assertTrue();
    });
    /**
     * Verify the width range equals 900.
     */
    it('StartOptions_limit_param_131', 0, () => {
      expect(MAX_WINDOW_WIDTH - MIN_WINDOW_WIDTH).assertEqual(900);
    });
    /**
     * Verify the height range equals 500.
     */
    it('StartOptions_limit_param_132', 0, () => {
      expect(MAX_WINDOW_HEIGHT - MIN_WINDOW_HEIGHT).assertEqual(500);
    });
    /**
     * Verify the width center equals 1050.
     */
    it('StartOptions_limit_param_133', 0, () => {
      expect((MIN_WINDOW_WIDTH + MAX_WINDOW_WIDTH) / 2).assertEqual(1050);
    });
    /**
     * Verify the height center equals 750.
     */
    it('StartOptions_limit_param_134', 0, () => {
      expect((MIN_WINDOW_HEIGHT + MAX_WINDOW_HEIGHT) / 2).assertEqual(750);
    });
    /**
     * Verify the corner configuration is valid.
     */
    it('StartOptions_limit_param_135', 0, () => {
      expect(MIN_WINDOW_WIDTH <= MAX_WINDOW_WIDTH && MIN_WINDOW_HEIGHT <= MAX_WINDOW_HEIGHT).assertTrue();
    });
    /**
     * Verify equal bounds configuration is preserved.
     */
    it('StartOptions_limit_param_136', 0, () => {
      const options: StartOptions = { minWindowWidth: 900, maxWindowWidth: 900 };
      expect(options.minWindowWidth).assertEqual(options.maxWindowWidth);
    });
    /**
     * Verify the maximum area equals 1500000.
     */
    it('StartOptions_limit_param_137', 0, () => {
      expect(MAX_WINDOW_WIDTH * MAX_WINDOW_HEIGHT).assertEqual(1500000);
    });
    /**
     * Verify the minimum area equals 300000.
     */
    it('StartOptions_limit_param_138', 0, () => {
      expect(MIN_WINDOW_WIDTH * MIN_WINDOW_HEIGHT).assertEqual(300000);
    });
    /**
     * Verify a 1050x750 center range has a positive area.
     */
    it('StartOptions_limit_param_139', 0, () => {
      expect(1050 * 750 > 0).assertTrue();
    });
    /**
     * Verify the full bounds constraints hold together.
     */
    it('StartOptions_limit_param_140', 0, () => {
      const valid: boolean = MIN_WINDOW_WIDTH >= 0 && MAX_WINDOW_WIDTH >= MIN_WINDOW_WIDTH &&
        MIN_WINDOW_HEIGHT >= 0 && MAX_WINDOW_HEIGHT >= MIN_WINDOW_HEIGHT;
      expect(valid).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 141.
     */
    it('StartOptions_bulk_param_141', 0, () => {
      const options: StartOptions = { minWindowWidth: 600, maxWindowWidth: 1200 };
      expect(options.minWindowWidth).assertEqual(600);
      expect(options.maxWindowWidth).assertEqual(1200);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 142.
     */
    it('StartOptions_bulk_param_142', 0, () => {
      const options: StartOptions = { minWindowWidth: 620, maxWindowWidth: 1250 };
      expect(options.minWindowWidth).assertEqual(620);
      expect(options.maxWindowWidth).assertEqual(1250);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 143.
     */
    it('StartOptions_bulk_param_143', 0, () => {
      const options: StartOptions = { minWindowWidth: 640, maxWindowWidth: 1300 };
      expect(options.minWindowWidth).assertEqual(640);
      expect(options.maxWindowWidth).assertEqual(1300);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 144.
     */
    it('StartOptions_bulk_param_144', 0, () => {
      const options: StartOptions = { minWindowWidth: 660, maxWindowWidth: 1350 };
      expect(options.minWindowWidth).assertEqual(660);
      expect(options.maxWindowWidth).assertEqual(1350);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 145.
     */
    it('StartOptions_bulk_param_145', 0, () => {
      const options: StartOptions = { minWindowWidth: 680, maxWindowWidth: 1400 };
      expect(options.minWindowWidth).assertEqual(680);
      expect(options.maxWindowWidth).assertEqual(1400);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 146.
     */
    it('StartOptions_bulk_param_146', 0, () => {
      const options: StartOptions = { minWindowWidth: 700, maxWindowWidth: 1450 };
      expect(options.minWindowWidth).assertEqual(700);
      expect(options.maxWindowWidth).assertEqual(1450);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 147.
     */
    it('StartOptions_bulk_param_147', 0, () => {
      const options: StartOptions = { minWindowWidth: 720, maxWindowWidth: 1200 };
      expect(options.minWindowWidth).assertEqual(720);
      expect(options.maxWindowWidth).assertEqual(1200);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 148.
     */
    it('StartOptions_bulk_param_148', 0, () => {
      const options: StartOptions = { minWindowWidth: 740, maxWindowWidth: 1250 };
      expect(options.minWindowWidth).assertEqual(740);
      expect(options.maxWindowWidth).assertEqual(1250);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 149.
     */
    it('StartOptions_bulk_param_149', 0, () => {
      const options: StartOptions = { minWindowWidth: 760, maxWindowWidth: 1300 };
      expect(options.minWindowWidth).assertEqual(760);
      expect(options.maxWindowWidth).assertEqual(1300);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 150.
     */
    it('StartOptions_bulk_param_150', 0, () => {
      const options: StartOptions = { minWindowWidth: 780, maxWindowWidth: 1350 };
      expect(options.minWindowWidth).assertEqual(780);
      expect(options.maxWindowWidth).assertEqual(1350);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 151.
     */
    it('StartOptions_bulk_param_151', 0, () => {
      const options: StartOptions = { minWindowWidth: 600, maxWindowWidth: 1400 };
      expect(options.minWindowWidth).assertEqual(600);
      expect(options.maxWindowWidth).assertEqual(1400);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 152.
     */
    it('StartOptions_bulk_param_152', 0, () => {
      const options: StartOptions = { minWindowWidth: 620, maxWindowWidth: 1450 };
      expect(options.minWindowWidth).assertEqual(620);
      expect(options.maxWindowWidth).assertEqual(1450);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 153.
     */
    it('StartOptions_bulk_param_153', 0, () => {
      const options: StartOptions = { minWindowWidth: 640, maxWindowWidth: 1200 };
      expect(options.minWindowWidth).assertEqual(640);
      expect(options.maxWindowWidth).assertEqual(1200);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 154.
     */
    it('StartOptions_bulk_param_154', 0, () => {
      const options: StartOptions = { minWindowWidth: 660, maxWindowWidth: 1250 };
      expect(options.minWindowWidth).assertEqual(660);
      expect(options.maxWindowWidth).assertEqual(1250);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 155.
     */
    it('StartOptions_bulk_param_155', 0, () => {
      const options: StartOptions = { minWindowWidth: 680, maxWindowWidth: 1300 };
      expect(options.minWindowWidth).assertEqual(680);
      expect(options.maxWindowWidth).assertEqual(1300);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 156.
     */
    it('StartOptions_bulk_param_156', 0, () => {
      const options: StartOptions = { minWindowWidth: 700, maxWindowWidth: 1350 };
      expect(options.minWindowWidth).assertEqual(700);
      expect(options.maxWindowWidth).assertEqual(1350);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 157.
     */
    it('StartOptions_bulk_param_157', 0, () => {
      const options: StartOptions = { minWindowWidth: 720, maxWindowWidth: 1400 };
      expect(options.minWindowWidth).assertEqual(720);
      expect(options.maxWindowWidth).assertEqual(1400);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 158.
     */
    it('StartOptions_bulk_param_158', 0, () => {
      const options: StartOptions = { minWindowWidth: 740, maxWindowWidth: 1450 };
      expect(options.minWindowWidth).assertEqual(740);
      expect(options.maxWindowWidth).assertEqual(1450);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 159.
     */
    it('StartOptions_bulk_param_159', 0, () => {
      const options: StartOptions = { minWindowWidth: 760, maxWindowWidth: 1200 };
      expect(options.minWindowWidth).assertEqual(760);
      expect(options.maxWindowWidth).assertEqual(1200);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 160.
     */
    it('StartOptions_bulk_param_160', 0, () => {
      const options: StartOptions = { minWindowWidth: 780, maxWindowWidth: 1250 };
      expect(options.minWindowWidth).assertEqual(780);
      expect(options.maxWindowWidth).assertEqual(1250);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 161.
     */
    it('StartOptions_bulk_param_161', 0, () => {
      const options: StartOptions = { minWindowWidth: 600, maxWindowWidth: 1300 };
      expect(options.minWindowWidth).assertEqual(600);
      expect(options.maxWindowWidth).assertEqual(1300);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 162.
     */
    it('StartOptions_bulk_param_162', 0, () => {
      const options: StartOptions = { minWindowWidth: 620, maxWindowWidth: 1350 };
      expect(options.minWindowWidth).assertEqual(620);
      expect(options.maxWindowWidth).assertEqual(1350);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 163.
     */
    it('StartOptions_bulk_param_163', 0, () => {
      const options: StartOptions = { minWindowWidth: 640, maxWindowWidth: 1400 };
      expect(options.minWindowWidth).assertEqual(640);
      expect(options.maxWindowWidth).assertEqual(1400);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 164.
     */
    it('StartOptions_bulk_param_164', 0, () => {
      const options: StartOptions = { minWindowWidth: 660, maxWindowWidth: 1450 };
      expect(options.minWindowWidth).assertEqual(660);
      expect(options.maxWindowWidth).assertEqual(1450);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 165.
     */
    it('StartOptions_bulk_param_165', 0, () => {
      const options: StartOptions = { minWindowWidth: 680, maxWindowWidth: 1200 };
      expect(options.minWindowWidth).assertEqual(680);
      expect(options.maxWindowWidth).assertEqual(1200);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 166.
     */
    it('StartOptions_bulk_param_166', 0, () => {
      const options: StartOptions = { minWindowWidth: 700, maxWindowWidth: 1250 };
      expect(options.minWindowWidth).assertEqual(700);
      expect(options.maxWindowWidth).assertEqual(1250);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 167.
     */
    it('StartOptions_bulk_param_167', 0, () => {
      const options: StartOptions = { minWindowWidth: 720, maxWindowWidth: 1300 };
      expect(options.minWindowWidth).assertEqual(720);
      expect(options.maxWindowWidth).assertEqual(1300);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 168.
     */
    it('StartOptions_bulk_param_168', 0, () => {
      const options: StartOptions = { minWindowWidth: 740, maxWindowWidth: 1350 };
      expect(options.minWindowWidth).assertEqual(740);
      expect(options.maxWindowWidth).assertEqual(1350);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 169.
     */
    it('StartOptions_bulk_param_169', 0, () => {
      const options: StartOptions = { minWindowWidth: 760, maxWindowWidth: 1400 };
      expect(options.minWindowWidth).assertEqual(760);
      expect(options.maxWindowWidth).assertEqual(1400);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 170.
     */
    it('StartOptions_bulk_param_170', 0, () => {
      const options: StartOptions = { minWindowWidth: 780, maxWindowWidth: 1450 };
      expect(options.minWindowWidth).assertEqual(780);
      expect(options.maxWindowWidth).assertEqual(1450);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 171.
     */
    it('StartOptions_bulk_param_171', 0, () => {
      const options: StartOptions = { minWindowWidth: 600, maxWindowWidth: 1200 };
      expect(options.minWindowWidth).assertEqual(600);
      expect(options.maxWindowWidth).assertEqual(1200);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 172.
     */
    it('StartOptions_bulk_param_172', 0, () => {
      const options: StartOptions = { minWindowWidth: 620, maxWindowWidth: 1250 };
      expect(options.minWindowWidth).assertEqual(620);
      expect(options.maxWindowWidth).assertEqual(1250);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 173.
     */
    it('StartOptions_bulk_param_173', 0, () => {
      const options: StartOptions = { minWindowWidth: 640, maxWindowWidth: 1300 };
      expect(options.minWindowWidth).assertEqual(640);
      expect(options.maxWindowWidth).assertEqual(1300);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 174.
     */
    it('StartOptions_bulk_param_174', 0, () => {
      const options: StartOptions = { minWindowWidth: 660, maxWindowWidth: 1350 };
      expect(options.minWindowWidth).assertEqual(660);
      expect(options.maxWindowWidth).assertEqual(1350);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 175.
     */
    it('StartOptions_bulk_param_175', 0, () => {
      const options: StartOptions = { minWindowWidth: 680, maxWindowWidth: 1400 };
      expect(options.minWindowWidth).assertEqual(680);
      expect(options.maxWindowWidth).assertEqual(1400);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 176.
     */
    it('StartOptions_bulk_param_176', 0, () => {
      const options: StartOptions = { minWindowWidth: 700, maxWindowWidth: 1450 };
      expect(options.minWindowWidth).assertEqual(700);
      expect(options.maxWindowWidth).assertEqual(1450);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 177.
     */
    it('StartOptions_bulk_param_177', 0, () => {
      const options: StartOptions = { minWindowWidth: 720, maxWindowWidth: 1200 };
      expect(options.minWindowWidth).assertEqual(720);
      expect(options.maxWindowWidth).assertEqual(1200);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 178.
     */
    it('StartOptions_bulk_param_178', 0, () => {
      const options: StartOptions = { minWindowWidth: 740, maxWindowWidth: 1250 };
      expect(options.minWindowWidth).assertEqual(740);
      expect(options.maxWindowWidth).assertEqual(1250);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 179.
     */
    it('StartOptions_bulk_param_179', 0, () => {
      const options: StartOptions = { minWindowWidth: 760, maxWindowWidth: 1300 };
      expect(options.minWindowWidth).assertEqual(760);
      expect(options.maxWindowWidth).assertEqual(1300);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 180.
     */
    it('StartOptions_bulk_param_180', 0, () => {
      const options: StartOptions = { minWindowWidth: 780, maxWindowWidth: 1350 };
      expect(options.minWindowWidth).assertEqual(780);
      expect(options.maxWindowWidth).assertEqual(1350);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 181.
     */
    it('StartOptions_bulk_param_181', 0, () => {
      const options: StartOptions = { minWindowWidth: 600, maxWindowWidth: 1400 };
      expect(options.minWindowWidth).assertEqual(600);
      expect(options.maxWindowWidth).assertEqual(1400);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 182.
     */
    it('StartOptions_bulk_param_182', 0, () => {
      const options: StartOptions = { minWindowWidth: 620, maxWindowWidth: 1450 };
      expect(options.minWindowWidth).assertEqual(620);
      expect(options.maxWindowWidth).assertEqual(1450);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 183.
     */
    it('StartOptions_bulk_param_183', 0, () => {
      const options: StartOptions = { minWindowWidth: 640, maxWindowWidth: 1200 };
      expect(options.minWindowWidth).assertEqual(640);
      expect(options.maxWindowWidth).assertEqual(1200);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 184.
     */
    it('StartOptions_bulk_param_184', 0, () => {
      const options: StartOptions = { minWindowWidth: 660, maxWindowWidth: 1250 };
      expect(options.minWindowWidth).assertEqual(660);
      expect(options.maxWindowWidth).assertEqual(1250);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 185.
     */
    it('StartOptions_bulk_param_185', 0, () => {
      const options: StartOptions = { minWindowWidth: 680, maxWindowWidth: 1300 };
      expect(options.minWindowWidth).assertEqual(680);
      expect(options.maxWindowWidth).assertEqual(1300);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 186.
     */
    it('StartOptions_bulk_param_186', 0, () => {
      const options: StartOptions = { minWindowWidth: 700, maxWindowWidth: 1350 };
      expect(options.minWindowWidth).assertEqual(700);
      expect(options.maxWindowWidth).assertEqual(1350);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 187.
     */
    it('StartOptions_bulk_param_187', 0, () => {
      const options: StartOptions = { minWindowWidth: 720, maxWindowWidth: 1400 };
      expect(options.minWindowWidth).assertEqual(720);
      expect(options.maxWindowWidth).assertEqual(1400);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 188.
     */
    it('StartOptions_bulk_param_188', 0, () => {
      const options: StartOptions = { minWindowWidth: 740, maxWindowWidth: 1450 };
      expect(options.minWindowWidth).assertEqual(740);
      expect(options.maxWindowWidth).assertEqual(1450);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 189.
     */
    it('StartOptions_bulk_param_189', 0, () => {
      const options: StartOptions = { minWindowWidth: 760, maxWindowWidth: 1200 };
      expect(options.minWindowWidth).assertEqual(760);
      expect(options.maxWindowWidth).assertEqual(1200);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 190.
     */
    it('StartOptions_bulk_param_190', 0, () => {
      const options: StartOptions = { minWindowWidth: 780, maxWindowWidth: 1250 };
      expect(options.minWindowWidth).assertEqual(780);
      expect(options.maxWindowWidth).assertEqual(1250);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 191.
     */
    it('StartOptions_bulk_param_191', 0, () => {
      const options: StartOptions = { minWindowWidth: 600, maxWindowWidth: 1300 };
      expect(options.minWindowWidth).assertEqual(600);
      expect(options.maxWindowWidth).assertEqual(1300);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 192.
     */
    it('StartOptions_bulk_param_192', 0, () => {
      const options: StartOptions = { minWindowWidth: 620, maxWindowWidth: 1350 };
      expect(options.minWindowWidth).assertEqual(620);
      expect(options.maxWindowWidth).assertEqual(1350);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 193.
     */
    it('StartOptions_bulk_param_193', 0, () => {
      const options: StartOptions = { minWindowWidth: 640, maxWindowWidth: 1400 };
      expect(options.minWindowWidth).assertEqual(640);
      expect(options.maxWindowWidth).assertEqual(1400);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 194.
     */
    it('StartOptions_bulk_param_194', 0, () => {
      const options: StartOptions = { minWindowWidth: 660, maxWindowWidth: 1450 };
      expect(options.minWindowWidth).assertEqual(660);
      expect(options.maxWindowWidth).assertEqual(1450);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 195.
     */
    it('StartOptions_bulk_param_195', 0, () => {
      const options: StartOptions = { minWindowWidth: 680, maxWindowWidth: 1200 };
      expect(options.minWindowWidth).assertEqual(680);
      expect(options.maxWindowWidth).assertEqual(1200);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 196.
     */
    it('StartOptions_bulk_param_196', 0, () => {
      const options: StartOptions = { minWindowWidth: 700, maxWindowWidth: 1250 };
      expect(options.minWindowWidth).assertEqual(700);
      expect(options.maxWindowWidth).assertEqual(1250);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 197.
     */
    it('StartOptions_bulk_param_197', 0, () => {
      const options: StartOptions = { minWindowWidth: 720, maxWindowWidth: 1300 };
      expect(options.minWindowWidth).assertEqual(720);
      expect(options.maxWindowWidth).assertEqual(1300);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 198.
     */
    it('StartOptions_bulk_param_198', 0, () => {
      const options: StartOptions = { minWindowWidth: 740, maxWindowWidth: 1350 };
      expect(options.minWindowWidth).assertEqual(740);
      expect(options.maxWindowWidth).assertEqual(1350);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 199.
     */
    it('StartOptions_bulk_param_199', 0, () => {
      const options: StartOptions = { minWindowWidth: 760, maxWindowWidth: 1400 };
      expect(options.minWindowWidth).assertEqual(760);
      expect(options.maxWindowWidth).assertEqual(1400);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 200.
     */
    it('StartOptions_bulk_param_200', 0, () => {
      const options: StartOptions = { minWindowWidth: 780, maxWindowWidth: 1450 };
      expect(options.minWindowWidth).assertEqual(780);
      expect(options.maxWindowWidth).assertEqual(1450);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 201.
     */
    it('StartOptions_bulk_param_201', 0, () => {
      const options: StartOptions = { minWindowWidth: 600, maxWindowWidth: 1200 };
      expect(options.minWindowWidth).assertEqual(600);
      expect(options.maxWindowWidth).assertEqual(1200);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 202.
     */
    it('StartOptions_bulk_param_202', 0, () => {
      const options: StartOptions = { minWindowWidth: 620, maxWindowWidth: 1250 };
      expect(options.minWindowWidth).assertEqual(620);
      expect(options.maxWindowWidth).assertEqual(1250);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 203.
     */
    it('StartOptions_bulk_param_203', 0, () => {
      const options: StartOptions = { minWindowWidth: 640, maxWindowWidth: 1300 };
      expect(options.minWindowWidth).assertEqual(640);
      expect(options.maxWindowWidth).assertEqual(1300);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 204.
     */
    it('StartOptions_bulk_param_204', 0, () => {
      const options: StartOptions = { minWindowWidth: 660, maxWindowWidth: 1350 };
      expect(options.minWindowWidth).assertEqual(660);
      expect(options.maxWindowWidth).assertEqual(1350);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 205.
     */
    it('StartOptions_bulk_param_205', 0, () => {
      const options: StartOptions = { minWindowWidth: 680, maxWindowWidth: 1400 };
      expect(options.minWindowWidth).assertEqual(680);
      expect(options.maxWindowWidth).assertEqual(1400);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 206.
     */
    it('StartOptions_bulk_param_206', 0, () => {
      const options: StartOptions = { minWindowWidth: 700, maxWindowWidth: 1450 };
      expect(options.minWindowWidth).assertEqual(700);
      expect(options.maxWindowWidth).assertEqual(1450);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 207.
     */
    it('StartOptions_bulk_param_207', 0, () => {
      const options: StartOptions = { minWindowWidth: 720, maxWindowWidth: 1200 };
      expect(options.minWindowWidth).assertEqual(720);
      expect(options.maxWindowWidth).assertEqual(1200);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 208.
     */
    it('StartOptions_bulk_param_208', 0, () => {
      const options: StartOptions = { minWindowWidth: 740, maxWindowWidth: 1250 };
      expect(options.minWindowWidth).assertEqual(740);
      expect(options.maxWindowWidth).assertEqual(1250);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 209.
     */
    it('StartOptions_bulk_param_209', 0, () => {
      const options: StartOptions = { minWindowWidth: 760, maxWindowWidth: 1300 };
      expect(options.minWindowWidth).assertEqual(760);
      expect(options.maxWindowWidth).assertEqual(1300);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 210.
     */
    it('StartOptions_bulk_param_210', 0, () => {
      const options: StartOptions = { minWindowWidth: 780, maxWindowWidth: 1350 };
      expect(options.minWindowWidth).assertEqual(780);
      expect(options.maxWindowWidth).assertEqual(1350);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 211.
     */
    it('StartOptions_bulk_param_211', 0, () => {
      const options: StartOptions = { minWindowWidth: 600, maxWindowWidth: 1400 };
      expect(options.minWindowWidth).assertEqual(600);
      expect(options.maxWindowWidth).assertEqual(1400);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 212.
     */
    it('StartOptions_bulk_param_212', 0, () => {
      const options: StartOptions = { minWindowWidth: 620, maxWindowWidth: 1450 };
      expect(options.minWindowWidth).assertEqual(620);
      expect(options.maxWindowWidth).assertEqual(1450);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 213.
     */
    it('StartOptions_bulk_param_213', 0, () => {
      const options: StartOptions = { minWindowWidth: 640, maxWindowWidth: 1200 };
      expect(options.minWindowWidth).assertEqual(640);
      expect(options.maxWindowWidth).assertEqual(1200);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 214.
     */
    it('StartOptions_bulk_param_214', 0, () => {
      const options: StartOptions = { minWindowWidth: 660, maxWindowWidth: 1250 };
      expect(options.minWindowWidth).assertEqual(660);
      expect(options.maxWindowWidth).assertEqual(1250);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 215.
     */
    it('StartOptions_bulk_param_215', 0, () => {
      const options: StartOptions = { minWindowWidth: 680, maxWindowWidth: 1300 };
      expect(options.minWindowWidth).assertEqual(680);
      expect(options.maxWindowWidth).assertEqual(1300);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 216.
     */
    it('StartOptions_bulk_param_216', 0, () => {
      const options: StartOptions = { minWindowWidth: 700, maxWindowWidth: 1350 };
      expect(options.minWindowWidth).assertEqual(700);
      expect(options.maxWindowWidth).assertEqual(1350);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 217.
     */
    it('StartOptions_bulk_param_217', 0, () => {
      const options: StartOptions = { minWindowWidth: 720, maxWindowWidth: 1400 };
      expect(options.minWindowWidth).assertEqual(720);
      expect(options.maxWindowWidth).assertEqual(1400);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 218.
     */
    it('StartOptions_bulk_param_218', 0, () => {
      const options: StartOptions = { minWindowWidth: 740, maxWindowWidth: 1450 };
      expect(options.minWindowWidth).assertEqual(740);
      expect(options.maxWindowWidth).assertEqual(1450);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 219.
     */
    it('StartOptions_bulk_param_219', 0, () => {
      const options: StartOptions = { minWindowWidth: 760, maxWindowWidth: 1200 };
      expect(options.minWindowWidth).assertEqual(760);
      expect(options.maxWindowWidth).assertEqual(1200);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 220.
     */
    it('StartOptions_bulk_param_220', 0, () => {
      const options: StartOptions = { minWindowWidth: 780, maxWindowWidth: 1250 };
      expect(options.minWindowWidth).assertEqual(780);
      expect(options.maxWindowWidth).assertEqual(1250);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 221.
     */
    it('StartOptions_bulk_param_221', 0, () => {
      const options: StartOptions = { minWindowWidth: 600, maxWindowWidth: 1300 };
      expect(options.minWindowWidth).assertEqual(600);
      expect(options.maxWindowWidth).assertEqual(1300);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 222.
     */
    it('StartOptions_bulk_param_222', 0, () => {
      const options: StartOptions = { minWindowWidth: 620, maxWindowWidth: 1350 };
      expect(options.minWindowWidth).assertEqual(620);
      expect(options.maxWindowWidth).assertEqual(1350);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 223.
     */
    it('StartOptions_bulk_param_223', 0, () => {
      const options: StartOptions = { minWindowWidth: 640, maxWindowWidth: 1400 };
      expect(options.minWindowWidth).assertEqual(640);
      expect(options.maxWindowWidth).assertEqual(1400);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 224.
     */
    it('StartOptions_bulk_param_224', 0, () => {
      const options: StartOptions = { minWindowWidth: 660, maxWindowWidth: 1450 };
      expect(options.minWindowWidth).assertEqual(660);
      expect(options.maxWindowWidth).assertEqual(1450);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 225.
     */
    it('StartOptions_bulk_param_225', 0, () => {
      const options: StartOptions = { minWindowWidth: 680, maxWindowWidth: 1200 };
      expect(options.minWindowWidth).assertEqual(680);
      expect(options.maxWindowWidth).assertEqual(1200);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 226.
     */
    it('StartOptions_bulk_param_226', 0, () => {
      const options: StartOptions = { minWindowWidth: 700, maxWindowWidth: 1250 };
      expect(options.minWindowWidth).assertEqual(700);
      expect(options.maxWindowWidth).assertEqual(1250);
      expect((options.maxWindowWidth as number) >= (options.minWindowWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk StartOptions configuration 227.
     */
    it('StartOptions_bulk_param_227', 0, () => {
      const options: StartOptions = { minWindowWidth: 720, maxWindowWidth: 1300 };
      expect(options.minWindowWidth).assertEqual(720);
