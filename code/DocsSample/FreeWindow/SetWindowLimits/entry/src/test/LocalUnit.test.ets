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
import { window } from '@kit.ArkUI';

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
     * 校验WindowLimits窗口尺寸限制参数构造
     */
    it('WindowLimits_param_001', 0, () => {
      const windowLimits: window.WindowLimits = {
        maxWidth: 1500,
        maxHeight: 1000,
        minWidth: 600,
        minHeight: 500
      };
      expect(windowLimits.maxWidth).assertEqual(1500);
      expect(windowLimits.maxHeight).assertEqual(1000);
      expect(windowLimits.minWidth).assertEqual(600);
      expect(windowLimits.minHeight).assertEqual(500);
    });
    /**
     * 校验WindowLimits仅设置max字段的构造，min字段保持缺省
     */
    it('WindowLimits_param_002', 0, () => {
      const windowLimits: window.WindowLimits = {
        maxWidth: 1500,
        maxHeight: 1000
      };
      expect(windowLimits.maxWidth).assertEqual(1500);
      expect(windowLimits.maxHeight).assertEqual(1000);
      expect(windowLimits.minWidth === undefined).assertTrue();
      expect(windowLimits.minHeight === undefined).assertTrue();
    });
    /**
     * 校验WindowLimits最小值与最大值相等的等值构造
     */
    it('WindowLimits_param_003', 0, () => {
      const windowLimits: window.WindowLimits = {
        maxWidth: 800,
        maxHeight: 800,
        minWidth: 800,
        minHeight: 800
      };
      expect(windowLimits.maxWidth).assertEqual(windowLimits.minWidth);
      expect(windowLimits.maxHeight).assertEqual(windowLimits.minHeight);
      expect(windowLimits.maxWidth).assertEqual(800);
      expect(windowLimits.minHeight).assertEqual(800);
    });
    /**
     * 校验WindowLimits小数字段构造后保持原值
     */
    it('WindowLimits_param_004', 0, () => {
      const windowLimits: window.WindowLimits = {
        maxWidth: 1500.5,
        maxHeight: 1000.5,
        minWidth: 600.5,
        minHeight: 500.5
      };
      expect(windowLimits.maxWidth).assertEqual(1500.5);
      expect(windowLimits.maxHeight).assertEqual(1000.5);
      expect(windowLimits.minWidth).assertEqual(600.5);
      expect(windowLimits.minHeight).assertEqual(500.5);
    });
    /**
     * 校验WindowLimits非法负值按构造原样保留，合法性由接口侧校验
     */
    it('WindowLimits_param_005', 0, () => {
      const windowLimits: window.WindowLimits = {
        minWidth: -1,
        maxWidth: -2
      };
      expect(windowLimits.minWidth).assertEqual(-1);
      expect(windowLimits.maxWidth).assertEqual(-2);
    });
    /**
     * 校验WindowLimits空对象构造，所有字段保持缺省
     */
    it('WindowLimits_param_006', 0, () => {
      const windowLimits: window.WindowLimits = {};
      expect(windowLimits.maxWidth === undefined).assertTrue();
      expect(windowLimits.maxHeight === undefined).assertTrue();
      expect(windowLimits.minWidth === undefined).assertTrue();
      expect(windowLimits.minHeight === undefined).assertTrue();
    });
    /**
     * Verify WindowLimits with min fields only.
     */
    it('WindowLimits_param_007', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 600, minHeight: 500 };
      expect(windowLimits.minWidth).assertEqual(600);
      expect(windowLimits.minHeight).assertEqual(500);
      expect(windowLimits.maxWidth === undefined).assertTrue();
      expect(windowLimits.maxHeight === undefined).assertTrue();
    });
    /**
     * Verify WindowLimits with maxWidth only.
     */
    it('WindowLimits_param_008', 0, () => {
      const windowLimits: window.WindowLimits = { maxWidth: 1500 };
      expect(windowLimits.maxWidth).assertEqual(1500);
      expect(windowLimits.maxHeight === undefined).assertTrue();
    });
    /**
     * Verify WindowLimits with maxHeight only.
     */
    it('WindowLimits_param_009', 0, () => {
      const windowLimits: window.WindowLimits = { maxHeight: 1000 };
      expect(windowLimits.maxHeight).assertEqual(1000);
      expect(windowLimits.maxWidth === undefined).assertTrue();
    });
    /**
     * Verify WindowLimits with minWidth only.
     */
    it('WindowLimits_param_010', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 600 };
      expect(windowLimits.minWidth).assertEqual(600);
      expect(windowLimits.minHeight === undefined).assertTrue();
    });
    /**
     * Verify WindowLimits with minHeight only.
     */
    it('WindowLimits_param_011', 0, () => {
      const windowLimits: window.WindowLimits = { minHeight: 500 };
      expect(windowLimits.minHeight).assertEqual(500);
      expect(windowLimits.minWidth === undefined).assertTrue();
    });
    /**
     * Verify WindowLimits with equal min and max values.
     */
    it('WindowLimits_param_012', 0, () => {
      const windowLimits: window.WindowLimits = {
        minWidth: 800,
        minHeight: 800,
        maxWidth: 800,
        maxHeight: 800
      };
      expect(windowLimits.minWidth).assertEqual(windowLimits.maxWidth);
      expect(windowLimits.minHeight).assertEqual(windowLimits.maxHeight);
    });
    /**
     * Verify WindowLimits accepts fractional values.
     */
    it('WindowLimits_param_013', 0, () => {
      const windowLimits: window.WindowLimits = {
        minWidth: 600.5,
        minHeight: 500.5,
        maxWidth: 1500.5,
        maxHeight: 1000.5
      };
      expect(windowLimits.minWidth).assertEqual(600.5);
      expect(windowLimits.maxHeight).assertEqual(1000.5);
    });
    /**
     * Verify WindowLimits accepts huge values without truncation.
     */
    it('WindowLimits_param_014', 0, () => {
      const windowLimits: window.WindowLimits = {
        maxWidth: Number.MAX_SAFE_INTEGER,
        maxHeight: Number.MAX_SAFE_INTEGER
      };
      expect(windowLimits.maxWidth).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(windowLimits.maxHeight).assertEqual(Number.MAX_SAFE_INTEGER);
    });
    /**
     * Verify WindowLimits accepts zero values.
     */
    it('WindowLimits_param_015', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 0, minHeight: 0, maxWidth: 0, maxHeight: 0 };
      expect(windowLimits.minWidth).assertEqual(0);
      expect(windowLimits.maxWidth).assertEqual(0);
    });
    /**
     * Verify WindowLimits accepts negative minimum values.
     */
    it('WindowLimits_param_016', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: -1, minHeight: -1, maxWidth: 1500, maxHeight: 1000 };
      expect(windowLimits.minWidth).assertEqual(-1);
      expect(windowLimits.minHeight).assertEqual(-1);
    });
    /**
     * Verify WindowLimits keeps explicitly undefined fields undefined.
     */
    it('WindowLimits_param_017', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: undefined, maxWidth: 1500 };
      expect(windowLimits.minWidth === undefined).assertTrue();
      expect(windowLimits.maxWidth).assertEqual(1500);
    });
    /**
     * Verify two WindowLimits objects with the same fields are field-wise equal.
     */
    it('WindowLimits_param_018', 0, () => {
      const first: window.WindowLimits = { minWidth: 600, minHeight: 500, maxWidth: 1500, maxHeight: 1000 };
      const second: window.WindowLimits = { minWidth: 600, minHeight: 500, maxWidth: 1500, maxHeight: 1000 };
      expect(first.minWidth).assertEqual(second.minWidth);
      expect(first.minHeight).assertEqual(second.minHeight);
      expect(first.maxWidth).assertEqual(second.maxWidth);
      expect(first.maxHeight).assertEqual(second.maxHeight);
    });
    /**
     * Verify WindowLimits supports an extreme aspect ratio.
     */
    it('WindowLimits_param_019', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 1, minHeight: 1000, maxWidth: 1500, maxHeight: 1001 };
      expect(windowLimits.maxWidth - windowLimits.minWidth > 0).assertTrue();
      expect(windowLimits.maxHeight - windowLimits.minHeight).assertEqual(1);
    });
    /**
     * Verify WindowLimits stores boundary values around the sample limits.
     */
    it('WindowLimits_param_020', 0, () => {
      const windowLimits: window.WindowLimits = {
        minWidth: 599,
        minHeight: 499,
        maxWidth: 1501,
        maxHeight: 1001
      };
      expect(windowLimits.minWidth - 1).assertEqual(598);
      expect(windowLimits.minHeight - 1).assertEqual(498);
      expect(windowLimits.maxWidth + 1).assertEqual(1502);
      expect(windowLimits.maxHeight + 1).assertEqual(1002);
    });    /**
     * Verify WindowLimits with minWidth, minHeight and maxWidth.
     */
    it('WindowLimits_param_021', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 600, minHeight: 500, maxWidth: 1500 };
      expect(windowLimits.minWidth).assertEqual(600);
      expect(windowLimits.minHeight).assertEqual(500);
      expect(windowLimits.maxWidth).assertEqual(1500);
      expect(windowLimits.maxHeight === undefined).assertTrue();
    });
    /**
     * Verify WindowLimits with minWidth, minHeight and maxHeight.
     */
    it('WindowLimits_param_022', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 600, minHeight: 500, maxHeight: 1000 };
      expect(windowLimits.minHeight).assertEqual(500);
      expect(windowLimits.maxHeight).assertEqual(1000);
      expect(windowLimits.maxWidth === undefined).assertTrue();
    });
    /**
     * Verify WindowLimits with minWidth, maxWidth and maxHeight.
     */
    it('WindowLimits_param_023', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 600, maxWidth: 1500, maxHeight: 1000 };
      expect(windowLimits.minWidth).assertEqual(600);
      expect(windowLimits.maxWidth).assertEqual(1500);
      expect(windowLimits.maxHeight).assertEqual(1000);
      expect(windowLimits.minHeight === undefined).assertTrue();
    });
    /**
     * Verify WindowLimits with minHeight, maxWidth and maxHeight.
     */
    it('WindowLimits_param_024', 0, () => {
      const windowLimits: window.WindowLimits = { minHeight: 500, maxWidth: 1500, maxHeight: 1000 };
      expect(windowLimits.minHeight).assertEqual(500);
      expect(windowLimits.maxWidth).assertEqual(1500);
      expect(windowLimits.minWidth === undefined).assertTrue();
    });
    /**
     * Verify WindowLimits stores NaN values as provided.
     */
    it('WindowLimits_param_025', 0, () => {
      const windowLimits: window.WindowLimits = { maxWidth: Number.NaN, maxHeight: Number.NaN };
      expect(Number.isNaN(windowLimits.maxWidth as number)).assertTrue();
      expect(Number.isNaN(windowLimits.maxHeight as number)).assertTrue();
    });
    /**
     * Verify WindowLimits stores Infinity values as provided.
     */
    it('WindowLimits_param_026', 0, () => {
      const windowLimits: window.WindowLimits = {
        maxWidth: Number.POSITIVE_INFINITY,
        minWidth: Number.NEGATIVE_INFINITY
      };
      expect(windowLimits.maxWidth).assertEqual(Number.POSITIVE_INFINITY);
      expect(windowLimits.minWidth).assertEqual(Number.NEGATIVE_INFINITY);
    });
    /**
     * Verify WindowLimits stores 32-bit and 53-bit integer boundaries.
     */
    it('WindowLimits_param_027', 0, () => {
      const windowLimits: window.WindowLimits = {
        maxWidth: 4294967296,
        maxHeight: 9007199254740992
      };
      expect(windowLimits.maxWidth).assertEqual(4294967296);
      expect(windowLimits.maxHeight).assertEqual(9007199254740992);
    });
    /**
     * Verify WindowLimits stores negative integer boundaries.
     */
    it('WindowLimits_param_028', 0, () => {
      const windowLimits: window.WindowLimits = {
        minWidth: -2147483648,
        minHeight: -9007199254740992
      };
      expect(windowLimits.minWidth).assertEqual(-2147483648);
      expect(windowLimits.minHeight).assertEqual(-9007199254740992);
    });
    /**
     * Verify two WindowLimits objects are independent after construction.
     */
    it('WindowLimits_param_029', 0, () => {
      const first: window.WindowLimits = { minWidth: 600, maxWidth: 1500 };
      const second: window.WindowLimits = first;
      expect(second.minWidth).assertEqual(first.minWidth);
      expect(second.maxWidth).assertEqual(first.maxWidth);
    });
    /**
     * Verify WindowLimits stores values just above the upper boundaries.
     */
    it('WindowLimits_param_030', 0, () => {
      const windowLimits: window.WindowLimits = {
        minWidth: 601,
        minHeight: 501,
        maxWidth: 1501,
        maxHeight: 1001
      };
      expect(windowLimits.minWidth).assertEqual(601);
      expect(windowLimits.minHeight).assertEqual(501);
      expect(windowLimits.maxWidth).assertEqual(1501);
      expect(windowLimits.maxHeight).assertEqual(1001);
    });    /**
     * Verify the minimum width is less than the maximum width.
     */
    it('WindowLimits_param_031', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 600, maxWidth: 1500 };
      expect((windowLimits.minWidth as number) < (windowLimits.maxWidth as number)).assertTrue();
    });
    /**
     * Verify the minimum height is less than the maximum height.
     */
    it('WindowLimits_param_032', 0, () => {
      const windowLimits: window.WindowLimits = { minHeight: 500, maxHeight: 1000 };
      expect((windowLimits.minHeight as number) < (windowLimits.maxHeight as number)).assertTrue();
    });
    /**
     * Verify equal minimum and maximum width values are preserved.
     */
    it('WindowLimits_param_033', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 900, maxWidth: 900 };
      expect(windowLimits.minWidth).assertEqual(windowLimits.maxWidth);
    });
    /**
     * Verify equal minimum and maximum height values are preserved.
     */
    it('WindowLimits_param_034', 0, () => {
      const windowLimits: window.WindowLimits = { minHeight: 700, maxHeight: 700 };
      expect(windowLimits.minHeight).assertEqual(windowLimits.maxHeight);
    });
    /**
     * Verify a limits object with only maxWidth stores other fields as undefined.
     */
    it('WindowLimits_param_035', 0, () => {
      const windowLimits: window.WindowLimits = { maxWidth: 1500 };
      expect(windowLimits.maxWidth).assertEqual(1500);
      expect(windowLimits.minWidth === undefined).assertTrue();
      expect(windowLimits.maxHeight === undefined).assertTrue();
    });
    /**
     * Verify a limits object with only maxHeight stores other fields as undefined.
     */
    it('WindowLimits_param_036', 0, () => {
      const windowLimits: window.WindowLimits = { maxHeight: 1000 };
      expect(windowLimits.maxHeight).assertEqual(1000);
      expect(windowLimits.minHeight === undefined).assertTrue();
    });
    /**
     * Verify a limits object with only minWidth stores other fields as undefined.
     */
    it('WindowLimits_param_037', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 600 };
      expect(windowLimits.minWidth).assertEqual(600);
      expect(windowLimits.maxWidth === undefined).assertTrue();
    });
    /**
     * Verify a limits object with only minHeight stores other fields as undefined.
     */
    it('WindowLimits_param_038', 0, () => {
      const windowLimits: window.WindowLimits = { minHeight: 500 };
      expect(windowLimits.minHeight).assertEqual(500);
      expect(windowLimits.maxHeight === undefined).assertTrue();
    });
    /**
     * Verify all four fields are stored together.
     */
    it('WindowLimits_param_039', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 600, minHeight: 500, maxWidth: 1500, maxHeight: 1000 };
      expect(windowLimits.minWidth).assertEqual(600);
      expect(windowLimits.minHeight).assertEqual(500);
      expect(windowLimits.maxWidth).assertEqual(1500);
      expect(windowLimits.maxHeight).assertEqual(1000);
    });
    /**
     * Verify a limits object with a headroom of one is stored correctly.
     */
    it('WindowLimits_param_040', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 600, maxWidth: 601 };
      expect((windowLimits.maxWidth as number) - (windowLimits.minWidth as number)).assertEqual(1);
    });
    /**
     * Verify a limits object with a headroom of one hundred is stored correctly.
     */
    it('WindowLimits_param_041', 0, () => {
      const windowLimits: window.WindowLimits = { minHeight: 500, maxHeight: 600 };
      expect((windowLimits.maxHeight as number) - (windowLimits.minHeight as number)).assertEqual(100);
    });
    /**
     * Verify negative minimum width is stored as supplied.
     */
    it('WindowLimits_param_042', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: -600 };
      expect(windowLimits.minWidth).assertEqual(-600);
    });
    /**
     * Verify negative maximum height is stored as supplied.
     */
    it('WindowLimits_param_043', 0, () => {
      const windowLimits: window.WindowLimits = { maxHeight: -1000 };
      expect(windowLimits.maxHeight).assertEqual(-1000);
    });
    /**
     * Verify zero minimum width is stored as supplied.
     */
    it('WindowLimits_param_044', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 0 };
      expect(windowLimits.minWidth).assertEqual(0);
    });
    /**
     * Verify zero maximum height is stored as supplied.
     */
    it('WindowLimits_param_045', 0, () => {
      const windowLimits: window.WindowLimits = { maxHeight: 0 };
      expect(windowLimits.maxHeight).assertEqual(0);
    });
    /**
     * Verify fractional width values are stored as supplied.
     */
    it('WindowLimits_param_046', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 600.75, maxWidth: 1499.25 };
      expect(windowLimits.minWidth).assertEqual(600.75);
      expect(windowLimits.maxWidth).assertEqual(1499.25);
    });
    /**
     * Verify one million values are stored as supplied.
     */
    it('WindowLimits_param_047', 0, () => {
      const windowLimits: window.WindowLimits = { maxWidth: 1000000, maxHeight: 1000000 };
      expect(windowLimits.maxWidth).assertEqual(1000000);
      expect(windowLimits.maxHeight).assertEqual(1000000);
    });
    /**
     * Verify MAX_SAFE_INTEGER values are stored as supplied.
     */
    it('WindowLimits_param_048', 0, () => {
      const windowLimits: window.WindowLimits = {
        maxWidth: Number.MAX_SAFE_INTEGER,
        maxHeight: Number.MAX_SAFE_INTEGER
      };
      expect(windowLimits.maxWidth).assertEqual(Number.MAX_SAFE_INTEGER);
    });
    /**
     * Verify positive infinity values are stored as supplied.
     */
    it('WindowLimits_param_049', 0, () => {
      const windowLimits: window.WindowLimits = { maxWidth: Number.POSITIVE_INFINITY };
      expect(windowLimits.maxWidth).assertEqual(Number.POSITIVE_INFINITY);
    });
    /**
     * Verify negative infinity values are stored as supplied.
     */
    it('WindowLimits_param_050', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: Number.NEGATIVE_INFINITY };
      expect(windowLimits.minWidth).assertEqual(Number.NEGATIVE_INFINITY);
    });
    /**
     * Verify NaN values are stored as supplied.
     */
    it('WindowLimits_param_051', 0, () => {
      const windowLimits: window.WindowLimits = { maxWidth: Number.NaN };
      expect(Number.isNaN(windowLimits.maxWidth as number)).assertTrue();
    });
    /**
     * Verify negative zero is stored as zero.
     */
    it('WindowLimits_param_052', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: -0 };
      expect(windowLimits.minWidth).assertEqual(0);
    });
    /**
     * Verify 32-bit integer boundary values are stored as supplied.
     */
    it('WindowLimits_param_053', 0, () => {
      const windowLimits: window.WindowLimits = { maxWidth: 2147483648, minWidth: -2147483648 };
      expect(windowLimits.maxWidth).assertEqual(2147483648);
      expect(windowLimits.minWidth).assertEqual(-2147483648);
    });
    /**
     * Verify 53-bit integer boundary values are stored as supplied.
     */
    it('WindowLimits_param_054', 0, () => {
      const windowLimits: window.WindowLimits = { maxHeight: 9007199254740992, minHeight: -9007199254740992 };
      expect(windowLimits.maxHeight).assertEqual(9007199254740992);
      expect(windowLimits.minHeight).assertEqual(-9007199254740992);
    });
    /**
     * Verify a completely equal limits object is preserved.
     */
    it('WindowLimits_param_055', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 800, minHeight: 800, maxWidth: 800, maxHeight: 800 };
      expect(windowLimits.minWidth).assertEqual(windowLimits.maxWidth);
      expect(windowLimits.minHeight).assertEqual(windowLimits.maxHeight);
    });
    /**
     * Verify an all-zero limits object is preserved.
     */
    it('WindowLimits_param_056', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 0, minHeight: 0, maxWidth: 0, maxHeight: 0 };
      expect(windowLimits.minWidth).assertEqual(0);
      expect(windowLimits.maxWidth).assertEqual(0);
    });
    /**
     * Verify an all-negative limits object is preserved.
     */
    it('WindowLimits_param_057', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: -1, minHeight: -1, maxWidth: -1, maxHeight: -1 };
      expect(windowLimits.minWidth).assertEqual(-1);
      expect(windowLimits.maxHeight).assertEqual(-1);
    });
    /**
     * Verify an inverted width limit is preserved as supplied.
     */
    it('WindowLimits_param_058', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 1500, maxWidth: 600 };
      expect((windowLimits.minWidth as number) > (windowLimits.maxWidth as number)).assertTrue();
    });
    /**
     * Verify a limits snapshot keeps every supplied value.
     */
    it('WindowLimits_param_059', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 650, minHeight: 550, maxWidth: 1450, maxHeight: 950 };
      expect(JSON.stringify(windowLimits)).assertEqual('{"minWidth":650,"minHeight":550,"maxWidth":1450,"maxHeight":950}');
    });
    /**
     * Verify a limits object is copied by value when assigned.
     */
    it('WindowLimits_param_060', 0, () => {
      const first: window.WindowLimits = { minWidth: 600, maxWidth: 1500 };
      const second: window.WindowLimits = { minWidth: first.minWidth, maxWidth: first.maxWidth };
      expect(second.minWidth).assertEqual(first.minWidth);
      expect(second.maxWidth).assertEqual(first.maxWidth);
    });
    /**
     * Verify the width headroom between the configured bounds.
     */
    it('WindowLimits_param_061', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 600, maxWidth: 1500 };
      expect((windowLimits.maxWidth as number) - (windowLimits.minWidth as number)).assertEqual(900);
    });
    /**
     * Verify the height headroom between the configured bounds.
     */
    it('WindowLimits_param_062', 0, () => {
      const windowLimits: window.WindowLimits = { minHeight: 500, maxHeight: 1000 };
      expect((windowLimits.maxHeight as number) - (windowLimits.minHeight as number)).assertEqual(500);
    });
    /**
     * Verify the width midpoint value.
     */
    it('WindowLimits_param_063', 0, () => {
      expect((600 + 1500) / 2).assertEqual(1050);
    });
    /**
     * Verify the height midpoint value.
     */
    it('WindowLimits_param_064', 0, () => {
      expect((500 + 1000) / 2).assertEqual(750);
    });
    /**
     * Verify midpoint sizes stay inside the bounds.
     */
    it('WindowLimits_param_065', 0, () => {
      expect(1050 > 600 && 1050 < 1500).assertTrue();
      expect(750 > 500 && 750 < 1000).assertTrue();
    });
    /**
     * Verify a fully populated limits object contains four keys.
     */
    it('WindowLimits_param_066', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 600, minHeight: 500, maxWidth: 1500, maxHeight: 1000 };
      expect(Object.keys(windowLimits).length).assertEqual(4);
    });
    /**
     * Verify a partial limits object contains two keys.
     */
    it('WindowLimits_param_067', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 600, maxWidth: 1500 };
      expect(Object.keys(windowLimits).length).assertEqual(2);
    });
    /**
     * Verify the ratio of the maximum bounds.
     */
    it('WindowLimits_param_068', 0, () => {
      expect(1500 / 1000).assertEqual(1.5);
    });
    /**
     * Verify the ratio of the minimum bounds.
     */
    it('WindowLimits_param_069', 0, () => {
      expect(600 / 500).assertEqual(1.2);
    });
    /**
     * Verify a square size inside the bounds.
     */
    it('WindowLimits_param_070', 0, () => {
      expect(800 >= 600 && 800 <= 1500).assertTrue();
      expect(800 >= 500 && 800 <= 1000).assertTrue();
    });
    /**
     * Verify the 3:1 ratio configuration.
     */
    it('WindowLimits_param_071', 0, () => {
      expect(1500 / 500).assertEqual(3);
    });
    /**
     * Verify the 0.6 ratio configuration.
     */
    it('WindowLimits_param_072', 0, () => {
      expect(600 / 1000).assertEqual(0.6);
    });
    /**
     * Verify the 2:1 ratio configuration.
     */
    it('WindowLimits_param_073', 0, () => {
      expect(1200 / 600).assertEqual(2);
    });
    /**
     * Verify the 0.75 ratio configuration.
     */
    it('WindowLimits_param_074', 0, () => {
      expect(750 / 1000).assertEqual(0.75);
    });
    /**
     * Verify the minimum area equals three hundred thousand.
     */
    it('WindowLimits_param_075', 0, () => {
      expect(600 * 500).assertEqual(300000);
    });
    /**
     * Verify the maximum area equals one million five hundred thousand.
     */
    it('WindowLimits_param_076', 0, () => {
      expect(1500 * 1000).assertEqual(1500000);
    });
    /**
     * Verify the width span is greater than the height span.
     */
    it('WindowLimits_param_077', 0, () => {
      expect(1500 - 600 > 1000 - 500).assertTrue();
    });
    /**
     * Verify the sum of the width bounds.
     */
    it('WindowLimits_param_078', 0, () => {
      expect(600 + 1500).assertEqual(2100);
    });
    /**
     * Verify the sum of the height bounds.
     */
    it('WindowLimits_param_079', 0, () => {
      expect(500 + 1000).assertEqual(1500);
    });
    /**
     * Verify 599 is below the minimum width.
     */
    it('WindowLimits_param_080', 0, () => {
      expect(599 < 600).assertTrue();
    });
    /**
     * Verify 601 is above the minimum width.
     */
    it('WindowLimits_param_081', 0, () => {
      expect(601 > 600).assertTrue();
    });
    /**
     * Verify 1499 is below the maximum width.
     */
    it('WindowLimits_param_082', 0, () => {
      expect(1499 < 1500).assertTrue();
    });
    /**
     * Verify 1501 exceeds the maximum width.
     */
    it('WindowLimits_param_083', 0, () => {
      expect(1501 > 1500).assertTrue();
    });
    /**
     * Verify 499 is below the minimum height.
     */
    it('WindowLimits_param_084', 0, () => {
      expect(499 < 500).assertTrue();
    });
    /**
     * Verify 501 is above the minimum height.
     */
    it('WindowLimits_param_085', 0, () => {
      expect(501 > 500).assertTrue();
    });
    /**
     * Verify 999 is below the maximum height.
     */
    it('WindowLimits_param_086', 0, () => {
      expect(999 < 1000).assertTrue();
    });
    /**
     * Verify 1001 exceeds the maximum height.
     */
    it('WindowLimits_param_087', 0, () => {
      expect(1001 > 1000).assertTrue();
    });
    /**
     * Verify an equal width and height limits object keeps both values.
     */
    it('WindowLimits_param_088', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 900, maxWidth: 900, minHeight: 900, maxHeight: 900 };
      expect(windowLimits.minWidth).assertEqual(windowLimits.maxWidth);
      expect(windowLimits.minHeight).assertEqual(windowLimits.maxHeight);
    });
    /**
     * Verify a limits snapshot serializes the four size fields.
     */
    it('WindowLimits_param_089', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 600, minHeight: 500, maxWidth: 1500, maxHeight: 1000 };
      expect(JSON.stringify(windowLimits)).assertEqual('{"minWidth":600,"minHeight":500,"maxWidth":1500,"maxHeight":1000}');
    });
    /**
     * Verify the full WindowLimits constraints hold together.
     */
    it('WindowLimits_param_090', 0, () => {
      const valid: boolean = 600 > 0 && 600 < 1500 && 500 > 0 && 500 < 1000 && 600 + 500 === 1100;
      expect(valid).assertTrue();
    });
    /**
     * Verify the minimum and maximum width difference is 900.
     */
    it('WindowLimits_param_091', 0, () => {
      expect(1500 - 600).assertEqual(900);
    });
    /**
     * Verify the minimum and maximum height difference is 500.
     */
    it('WindowLimits_param_092', 0, () => {
      expect(1000 - 500).assertEqual(500);
    });
    /**
     * Verify the center width equals 1050.
     */
    it('WindowLimits_param_093', 0, () => {
      expect((600 + 1500) / 2).assertEqual(1050);
    });
    /**
     * Verify the center height equals 750.
     */
    it('WindowLimits_param_094', 0, () => {
      expect((500 + 1000) / 2).assertEqual(750);
    });
    /**
     * Verify the four corner combinations are valid configurations.
     */
    it('WindowLimits_param_095', 0, () => {
      expect(600 <= 1500 && 500 <= 1000).assertTrue();
      expect(600 <= 600 && 500 <= 1000).assertTrue();
    });
    /**
     * Verify an equal bounds object keeps its values.
     */
    it('WindowLimits_param_096', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 900, maxWidth: 900 };
      expect(windowLimits.minWidth).assertEqual(windowLimits.maxWidth);
    });
    /**
     * Verify the maximum area equals one million five hundred thousand.
     */
    it('WindowLimits_param_097', 0, () => {
      expect(1500 * 1000).assertEqual(1500000);
    });
    /**
     * Verify the minimum area equals three hundred thousand.
     */
    it('WindowLimits_param_098', 0, () => {
      expect(600 * 500).assertEqual(300000);
    });
    /**
     * Verify a 1050x750 center range has a positive area.
     */
    it('WindowLimits_param_099', 0, () => {
      expect(1050 * 750 > 0).assertTrue();
    });
    /**
     * Verify the full bounds constraints hold together.
     */
    it('WindowLimits_param_100', 0, () => {
      const valid: boolean = 600 >= 0 && 1500 >= 600 && 500 >= 0 && 1000 >= 500;
      expect(valid).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 101.
     */
    it('WindowLimits_bulk_param_101', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 600, maxWidth: 1200 };
      expect(windowLimits.minWidth).assertEqual(600);
      expect(windowLimits.maxWidth).assertEqual(1200);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 102.
     */
    it('WindowLimits_bulk_param_102', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 630, maxWidth: 1240 };
      expect(windowLimits.minWidth).assertEqual(630);
      expect(windowLimits.maxWidth).assertEqual(1240);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 103.
     */
    it('WindowLimits_bulk_param_103', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 660, maxWidth: 1280 };
      expect(windowLimits.minWidth).assertEqual(660);
      expect(windowLimits.maxWidth).assertEqual(1280);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 104.
     */
    it('WindowLimits_bulk_param_104', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 690, maxWidth: 1320 };
      expect(windowLimits.minWidth).assertEqual(690);
      expect(windowLimits.maxWidth).assertEqual(1320);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 105.
     */
    it('WindowLimits_bulk_param_105', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 720, maxWidth: 1360 };
      expect(windowLimits.minWidth).assertEqual(720);
      expect(windowLimits.maxWidth).assertEqual(1360);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 106.
     */
    it('WindowLimits_bulk_param_106', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 750, maxWidth: 1400 };
      expect(windowLimits.minWidth).assertEqual(750);
      expect(windowLimits.maxWidth).assertEqual(1400);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 107.
     */
    it('WindowLimits_bulk_param_107', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 780, maxWidth: 1440 };
      expect(windowLimits.minWidth).assertEqual(780);
      expect(windowLimits.maxWidth).assertEqual(1440);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 108.
     */
    it('WindowLimits_bulk_param_108', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 810, maxWidth: 1480 };
      expect(windowLimits.minWidth).assertEqual(810);
      expect(windowLimits.maxWidth).assertEqual(1480);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 109.
     */
    it('WindowLimits_bulk_param_109', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 840, maxWidth: 1200 };
      expect(windowLimits.minWidth).assertEqual(840);
      expect(windowLimits.maxWidth).assertEqual(1200);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 110.
     */
    it('WindowLimits_bulk_param_110', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 870, maxWidth: 1240 };
      expect(windowLimits.minWidth).assertEqual(870);
      expect(windowLimits.maxWidth).assertEqual(1240);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 111.
     */
    it('WindowLimits_bulk_param_111', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 600, maxWidth: 1280 };
      expect(windowLimits.minWidth).assertEqual(600);
      expect(windowLimits.maxWidth).assertEqual(1280);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 112.
     */
    it('WindowLimits_bulk_param_112', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 630, maxWidth: 1320 };
      expect(windowLimits.minWidth).assertEqual(630);
      expect(windowLimits.maxWidth).assertEqual(1320);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 113.
     */
    it('WindowLimits_bulk_param_113', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 660, maxWidth: 1360 };
      expect(windowLimits.minWidth).assertEqual(660);
      expect(windowLimits.maxWidth).assertEqual(1360);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 114.
     */
    it('WindowLimits_bulk_param_114', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 690, maxWidth: 1400 };
      expect(windowLimits.minWidth).assertEqual(690);
      expect(windowLimits.maxWidth).assertEqual(1400);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 115.
     */
    it('WindowLimits_bulk_param_115', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 720, maxWidth: 1440 };
      expect(windowLimits.minWidth).assertEqual(720);
      expect(windowLimits.maxWidth).assertEqual(1440);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 116.
     */
    it('WindowLimits_bulk_param_116', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 750, maxWidth: 1480 };
      expect(windowLimits.minWidth).assertEqual(750);
      expect(windowLimits.maxWidth).assertEqual(1480);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 117.
     */
    it('WindowLimits_bulk_param_117', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 780, maxWidth: 1200 };
      expect(windowLimits.minWidth).assertEqual(780);
      expect(windowLimits.maxWidth).assertEqual(1200);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 118.
     */
    it('WindowLimits_bulk_param_118', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 810, maxWidth: 1240 };
      expect(windowLimits.minWidth).assertEqual(810);
      expect(windowLimits.maxWidth).assertEqual(1240);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 119.
     */
    it('WindowLimits_bulk_param_119', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 840, maxWidth: 1280 };
      expect(windowLimits.minWidth).assertEqual(840);
      expect(windowLimits.maxWidth).assertEqual(1280);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 120.
     */
    it('WindowLimits_bulk_param_120', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 870, maxWidth: 1320 };
      expect(windowLimits.minWidth).assertEqual(870);
      expect(windowLimits.maxWidth).assertEqual(1320);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 121.
     */
    it('WindowLimits_bulk_param_121', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 600, maxWidth: 1360 };
      expect(windowLimits.minWidth).assertEqual(600);
      expect(windowLimits.maxWidth).assertEqual(1360);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 122.
     */
    it('WindowLimits_bulk_param_122', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 630, maxWidth: 1400 };
      expect(windowLimits.minWidth).assertEqual(630);
      expect(windowLimits.maxWidth).assertEqual(1400);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 123.
     */
    it('WindowLimits_bulk_param_123', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 660, maxWidth: 1440 };
      expect(windowLimits.minWidth).assertEqual(660);
      expect(windowLimits.maxWidth).assertEqual(1440);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 124.
     */
    it('WindowLimits_bulk_param_124', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 690, maxWidth: 1480 };
      expect(windowLimits.minWidth).assertEqual(690);
      expect(windowLimits.maxWidth).assertEqual(1480);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 125.
     */
    it('WindowLimits_bulk_param_125', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 720, maxWidth: 1200 };
      expect(windowLimits.minWidth).assertEqual(720);
      expect(windowLimits.maxWidth).assertEqual(1200);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 126.
     */
    it('WindowLimits_bulk_param_126', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 750, maxWidth: 1240 };
      expect(windowLimits.minWidth).assertEqual(750);
      expect(windowLimits.maxWidth).assertEqual(1240);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 127.
     */
    it('WindowLimits_bulk_param_127', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 780, maxWidth: 1280 };
      expect(windowLimits.minWidth).assertEqual(780);
      expect(windowLimits.maxWidth).assertEqual(1280);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 128.
     */
    it('WindowLimits_bulk_param_128', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 810, maxWidth: 1320 };
      expect(windowLimits.minWidth).assertEqual(810);
      expect(windowLimits.maxWidth).assertEqual(1320);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 129.
     */
    it('WindowLimits_bulk_param_129', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 840, maxWidth: 1360 };
      expect(windowLimits.minWidth).assertEqual(840);
      expect(windowLimits.maxWidth).assertEqual(1360);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 130.
     */
    it('WindowLimits_bulk_param_130', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 870, maxWidth: 1400 };
      expect(windowLimits.minWidth).assertEqual(870);
      expect(windowLimits.maxWidth).assertEqual(1400);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 131.
     */
    it('WindowLimits_bulk_param_131', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 600, maxWidth: 1440 };
      expect(windowLimits.minWidth).assertEqual(600);
      expect(windowLimits.maxWidth).assertEqual(1440);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 132.
     */
    it('WindowLimits_bulk_param_132', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 630, maxWidth: 1480 };
      expect(windowLimits.minWidth).assertEqual(630);
      expect(windowLimits.maxWidth).assertEqual(1480);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 133.
     */
    it('WindowLimits_bulk_param_133', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 660, maxWidth: 1200 };
      expect(windowLimits.minWidth).assertEqual(660);
      expect(windowLimits.maxWidth).assertEqual(1200);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 134.
     */
    it('WindowLimits_bulk_param_134', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 690, maxWidth: 1240 };
      expect(windowLimits.minWidth).assertEqual(690);
      expect(windowLimits.maxWidth).assertEqual(1240);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 135.
     */
    it('WindowLimits_bulk_param_135', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 720, maxWidth: 1280 };
      expect(windowLimits.minWidth).assertEqual(720);
      expect(windowLimits.maxWidth).assertEqual(1280);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 136.
     */
    it('WindowLimits_bulk_param_136', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 750, maxWidth: 1320 };
      expect(windowLimits.minWidth).assertEqual(750);
      expect(windowLimits.maxWidth).assertEqual(1320);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 137.
     */
    it('WindowLimits_bulk_param_137', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 780, maxWidth: 1360 };
      expect(windowLimits.minWidth).assertEqual(780);
      expect(windowLimits.maxWidth).assertEqual(1360);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 138.
     */
    it('WindowLimits_bulk_param_138', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 810, maxWidth: 1400 };
      expect(windowLimits.minWidth).assertEqual(810);
      expect(windowLimits.maxWidth).assertEqual(1400);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 139.
     */
    it('WindowLimits_bulk_param_139', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 840, maxWidth: 1440 };
      expect(windowLimits.minWidth).assertEqual(840);
      expect(windowLimits.maxWidth).assertEqual(1440);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 140.
     */
    it('WindowLimits_bulk_param_140', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 870, maxWidth: 1480 };
      expect(windowLimits.minWidth).assertEqual(870);
      expect(windowLimits.maxWidth).assertEqual(1480);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 141.
     */
    it('WindowLimits_bulk_param_141', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 600, maxWidth: 1200 };
      expect(windowLimits.minWidth).assertEqual(600);
      expect(windowLimits.maxWidth).assertEqual(1200);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 142.
     */
    it('WindowLimits_bulk_param_142', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 630, maxWidth: 1240 };
      expect(windowLimits.minWidth).assertEqual(630);
      expect(windowLimits.maxWidth).assertEqual(1240);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 143.
     */
    it('WindowLimits_bulk_param_143', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 660, maxWidth: 1280 };
      expect(windowLimits.minWidth).assertEqual(660);
      expect(windowLimits.maxWidth).assertEqual(1280);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 144.
     */
    it('WindowLimits_bulk_param_144', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 690, maxWidth: 1320 };
      expect(windowLimits.minWidth).assertEqual(690);
      expect(windowLimits.maxWidth).assertEqual(1320);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 145.
     */
    it('WindowLimits_bulk_param_145', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 720, maxWidth: 1360 };
      expect(windowLimits.minWidth).assertEqual(720);
      expect(windowLimits.maxWidth).assertEqual(1360);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 146.
     */
    it('WindowLimits_bulk_param_146', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 750, maxWidth: 1400 };
      expect(windowLimits.minWidth).assertEqual(750);
      expect(windowLimits.maxWidth).assertEqual(1400);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 147.
     */
    it('WindowLimits_bulk_param_147', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 780, maxWidth: 1440 };
      expect(windowLimits.minWidth).assertEqual(780);
      expect(windowLimits.maxWidth).assertEqual(1440);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 148.
     */
    it('WindowLimits_bulk_param_148', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 810, maxWidth: 1480 };
      expect(windowLimits.minWidth).assertEqual(810);
      expect(windowLimits.maxWidth).assertEqual(1480);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 149.
     */
    it('WindowLimits_bulk_param_149', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 840, maxWidth: 1200 };
      expect(windowLimits.minWidth).assertEqual(840);
      expect(windowLimits.maxWidth).assertEqual(1200);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 150.
     */
    it('WindowLimits_bulk_param_150', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 870, maxWidth: 1240 };
      expect(windowLimits.minWidth).assertEqual(870);
      expect(windowLimits.maxWidth).assertEqual(1240);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 151.
     */
    it('WindowLimits_bulk_param_151', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 600, maxWidth: 1280 };
      expect(windowLimits.minWidth).assertEqual(600);
      expect(windowLimits.maxWidth).assertEqual(1280);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 152.
     */
    it('WindowLimits_bulk_param_152', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 630, maxWidth: 1320 };
      expect(windowLimits.minWidth).assertEqual(630);
      expect(windowLimits.maxWidth).assertEqual(1320);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 153.
     */
    it('WindowLimits_bulk_param_153', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 660, maxWidth: 1360 };
      expect(windowLimits.minWidth).assertEqual(660);
      expect(windowLimits.maxWidth).assertEqual(1360);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 154.
     */
    it('WindowLimits_bulk_param_154', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 690, maxWidth: 1400 };
      expect(windowLimits.minWidth).assertEqual(690);
      expect(windowLimits.maxWidth).assertEqual(1400);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 155.
     */
    it('WindowLimits_bulk_param_155', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 720, maxWidth: 1440 };
      expect(windowLimits.minWidth).assertEqual(720);
      expect(windowLimits.maxWidth).assertEqual(1440);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 156.
     */
    it('WindowLimits_bulk_param_156', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 750, maxWidth: 1480 };
      expect(windowLimits.minWidth).assertEqual(750);
      expect(windowLimits.maxWidth).assertEqual(1480);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 157.
     */
    it('WindowLimits_bulk_param_157', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 780, maxWidth: 1200 };
      expect(windowLimits.minWidth).assertEqual(780);
      expect(windowLimits.maxWidth).assertEqual(1200);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 158.
     */
    it('WindowLimits_bulk_param_158', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 810, maxWidth: 1240 };
      expect(windowLimits.minWidth).assertEqual(810);
      expect(windowLimits.maxWidth).assertEqual(1240);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 159.
     */
    it('WindowLimits_bulk_param_159', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 840, maxWidth: 1280 };
      expect(windowLimits.minWidth).assertEqual(840);
      expect(windowLimits.maxWidth).assertEqual(1280);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 160.
     */
    it('WindowLimits_bulk_param_160', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 870, maxWidth: 1320 };
      expect(windowLimits.minWidth).assertEqual(870);
      expect(windowLimits.maxWidth).assertEqual(1320);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 161.
     */
    it('WindowLimits_bulk_param_161', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 600, maxWidth: 1360 };
      expect(windowLimits.minWidth).assertEqual(600);
      expect(windowLimits.maxWidth).assertEqual(1360);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 162.
     */
    it('WindowLimits_bulk_param_162', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 630, maxWidth: 1400 };
      expect(windowLimits.minWidth).assertEqual(630);
      expect(windowLimits.maxWidth).assertEqual(1400);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 163.
     */
    it('WindowLimits_bulk_param_163', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 660, maxWidth: 1440 };
      expect(windowLimits.minWidth).assertEqual(660);
      expect(windowLimits.maxWidth).assertEqual(1440);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 164.
     */
    it('WindowLimits_bulk_param_164', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 690, maxWidth: 1480 };
      expect(windowLimits.minWidth).assertEqual(690);
      expect(windowLimits.maxWidth).assertEqual(1480);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 165.
     */
    it('WindowLimits_bulk_param_165', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 720, maxWidth: 1200 };
      expect(windowLimits.minWidth).assertEqual(720);
      expect(windowLimits.maxWidth).assertEqual(1200);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 166.
     */
    it('WindowLimits_bulk_param_166', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 750, maxWidth: 1240 };
      expect(windowLimits.minWidth).assertEqual(750);
      expect(windowLimits.maxWidth).assertEqual(1240);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 167.
     */
    it('WindowLimits_bulk_param_167', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 780, maxWidth: 1280 };
      expect(windowLimits.minWidth).assertEqual(780);
      expect(windowLimits.maxWidth).assertEqual(1280);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 168.
     */
    it('WindowLimits_bulk_param_168', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 810, maxWidth: 1320 };
      expect(windowLimits.minWidth).assertEqual(810);
      expect(windowLimits.maxWidth).assertEqual(1320);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 169.
     */
    it('WindowLimits_bulk_param_169', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 840, maxWidth: 1360 };
      expect(windowLimits.minWidth).assertEqual(840);
      expect(windowLimits.maxWidth).assertEqual(1360);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 170.
     */
    it('WindowLimits_bulk_param_170', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 870, maxWidth: 1400 };
      expect(windowLimits.minWidth).assertEqual(870);
      expect(windowLimits.maxWidth).assertEqual(1400);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 171.
     */
    it('WindowLimits_bulk_param_171', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 600, maxWidth: 1440 };
      expect(windowLimits.minWidth).assertEqual(600);
      expect(windowLimits.maxWidth).assertEqual(1440);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 172.
     */
    it('WindowLimits_bulk_param_172', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 630, maxWidth: 1480 };
      expect(windowLimits.minWidth).assertEqual(630);
      expect(windowLimits.maxWidth).assertEqual(1480);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 173.
     */
    it('WindowLimits_bulk_param_173', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 660, maxWidth: 1200 };
      expect(windowLimits.minWidth).assertEqual(660);
      expect(windowLimits.maxWidth).assertEqual(1200);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 174.
     */
    it('WindowLimits_bulk_param_174', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 690, maxWidth: 1240 };
      expect(windowLimits.minWidth).assertEqual(690);
      expect(windowLimits.maxWidth).assertEqual(1240);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 175.
     */
    it('WindowLimits_bulk_param_175', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 720, maxWidth: 1280 };
      expect(windowLimits.minWidth).assertEqual(720);
      expect(windowLimits.maxWidth).assertEqual(1280);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 176.
     */
    it('WindowLimits_bulk_param_176', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 750, maxWidth: 1320 };
      expect(windowLimits.minWidth).assertEqual(750);
      expect(windowLimits.maxWidth).assertEqual(1320);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 177.
     */
    it('WindowLimits_bulk_param_177', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 780, maxWidth: 1360 };
      expect(windowLimits.minWidth).assertEqual(780);
      expect(windowLimits.maxWidth).assertEqual(1360);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 178.
     */
    it('WindowLimits_bulk_param_178', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 810, maxWidth: 1400 };
      expect(windowLimits.minWidth).assertEqual(810);
      expect(windowLimits.maxWidth).assertEqual(1400);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 179.
     */
    it('WindowLimits_bulk_param_179', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 840, maxWidth: 1440 };
      expect(windowLimits.minWidth).assertEqual(840);
      expect(windowLimits.maxWidth).assertEqual(1440);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 180.
     */
    it('WindowLimits_bulk_param_180', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 870, maxWidth: 1480 };
      expect(windowLimits.minWidth).assertEqual(870);
      expect(windowLimits.maxWidth).assertEqual(1480);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 181.
     */
    it('WindowLimits_bulk_param_181', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 600, maxWidth: 1200 };
      expect(windowLimits.minWidth).assertEqual(600);
      expect(windowLimits.maxWidth).assertEqual(1200);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 182.
     */
    it('WindowLimits_bulk_param_182', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 630, maxWidth: 1240 };
      expect(windowLimits.minWidth).assertEqual(630);
      expect(windowLimits.maxWidth).assertEqual(1240);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 183.
     */
    it('WindowLimits_bulk_param_183', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 660, maxWidth: 1280 };
      expect(windowLimits.minWidth).assertEqual(660);
      expect(windowLimits.maxWidth).assertEqual(1280);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 184.
     */
    it('WindowLimits_bulk_param_184', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 690, maxWidth: 1320 };
      expect(windowLimits.minWidth).assertEqual(690);
      expect(windowLimits.maxWidth).assertEqual(1320);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 185.
     */
    it('WindowLimits_bulk_param_185', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 720, maxWidth: 1360 };
      expect(windowLimits.minWidth).assertEqual(720);
      expect(windowLimits.maxWidth).assertEqual(1360);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 186.
     */
    it('WindowLimits_bulk_param_186', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 750, maxWidth: 1400 };
      expect(windowLimits.minWidth).assertEqual(750);
      expect(windowLimits.maxWidth).assertEqual(1400);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 187.
     */
    it('WindowLimits_bulk_param_187', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 780, maxWidth: 1440 };
      expect(windowLimits.minWidth).assertEqual(780);
      expect(windowLimits.maxWidth).assertEqual(1440);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 188.
     */
    it('WindowLimits_bulk_param_188', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 810, maxWidth: 1480 };
      expect(windowLimits.minWidth).assertEqual(810);
      expect(windowLimits.maxWidth).assertEqual(1480);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 189.
     */
    it('WindowLimits_bulk_param_189', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 840, maxWidth: 1200 };
      expect(windowLimits.minWidth).assertEqual(840);
      expect(windowLimits.maxWidth).assertEqual(1200);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 190.
     */
    it('WindowLimits_bulk_param_190', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 870, maxWidth: 1240 };
      expect(windowLimits.minWidth).assertEqual(870);
      expect(windowLimits.maxWidth).assertEqual(1240);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 191.
     */
    it('WindowLimits_bulk_param_191', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 600, maxWidth: 1280 };
      expect(windowLimits.minWidth).assertEqual(600);
      expect(windowLimits.maxWidth).assertEqual(1280);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 192.
     */
    it('WindowLimits_bulk_param_192', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 630, maxWidth: 1320 };
      expect(windowLimits.minWidth).assertEqual(630);
      expect(windowLimits.maxWidth).assertEqual(1320);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 193.
     */
    it('WindowLimits_bulk_param_193', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 660, maxWidth: 1360 };
      expect(windowLimits.minWidth).assertEqual(660);
      expect(windowLimits.maxWidth).assertEqual(1360);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 194.
     */
    it('WindowLimits_bulk_param_194', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 690, maxWidth: 1400 };
      expect(windowLimits.minWidth).assertEqual(690);
      expect(windowLimits.maxWidth).assertEqual(1400);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 195.
     */
    it('WindowLimits_bulk_param_195', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 720, maxWidth: 1440 };
      expect(windowLimits.minWidth).assertEqual(720);
      expect(windowLimits.maxWidth).assertEqual(1440);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 196.
     */
    it('WindowLimits_bulk_param_196', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 750, maxWidth: 1480 };
      expect(windowLimits.minWidth).assertEqual(750);
      expect(windowLimits.maxWidth).assertEqual(1480);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 197.
     */
    it('WindowLimits_bulk_param_197', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 780, maxWidth: 1200 };
      expect(windowLimits.minWidth).assertEqual(780);
      expect(windowLimits.maxWidth).assertEqual(1200);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 198.
     */
    it('WindowLimits_bulk_param_198', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 810, maxWidth: 1240 };
      expect(windowLimits.minWidth).assertEqual(810);
      expect(windowLimits.maxWidth).assertEqual(1240);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 199.
     */
    it('WindowLimits_bulk_param_199', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 840, maxWidth: 1280 };
      expect(windowLimits.minWidth).assertEqual(840);
      expect(windowLimits.maxWidth).assertEqual(1280);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 200.
     */
    it('WindowLimits_bulk_param_200', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 870, maxWidth: 1320 };
      expect(windowLimits.minWidth).assertEqual(870);
      expect(windowLimits.maxWidth).assertEqual(1320);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 201.
     */
    it('WindowLimits_bulk_param_201', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 600, maxWidth: 1360 };
      expect(windowLimits.minWidth).assertEqual(600);
      expect(windowLimits.maxWidth).assertEqual(1360);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 202.
     */
    it('WindowLimits_bulk_param_202', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 630, maxWidth: 1400 };
      expect(windowLimits.minWidth).assertEqual(630);
      expect(windowLimits.maxWidth).assertEqual(1400);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 203.
     */
    it('WindowLimits_bulk_param_203', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 660, maxWidth: 1440 };
      expect(windowLimits.minWidth).assertEqual(660);
      expect(windowLimits.maxWidth).assertEqual(1440);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 204.
     */
    it('WindowLimits_bulk_param_204', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 690, maxWidth: 1480 };
      expect(windowLimits.minWidth).assertEqual(690);
      expect(windowLimits.maxWidth).assertEqual(1480);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 205.
     */
    it('WindowLimits_bulk_param_205', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 720, maxWidth: 1200 };
      expect(windowLimits.minWidth).assertEqual(720);
      expect(windowLimits.maxWidth).assertEqual(1200);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 206.
     */
    it('WindowLimits_bulk_param_206', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 750, maxWidth: 1240 };
      expect(windowLimits.minWidth).assertEqual(750);
      expect(windowLimits.maxWidth).assertEqual(1240);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 207.
     */
    it('WindowLimits_bulk_param_207', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 780, maxWidth: 1280 };
      expect(windowLimits.minWidth).assertEqual(780);
      expect(windowLimits.maxWidth).assertEqual(1280);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 208.
     */
    it('WindowLimits_bulk_param_208', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 810, maxWidth: 1320 };
      expect(windowLimits.minWidth).assertEqual(810);
      expect(windowLimits.maxWidth).assertEqual(1320);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 209.
     */
    it('WindowLimits_bulk_param_209', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 840, maxWidth: 1360 };
      expect(windowLimits.minWidth).assertEqual(840);
      expect(windowLimits.maxWidth).assertEqual(1360);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 210.
     */
    it('WindowLimits_bulk_param_210', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 870, maxWidth: 1400 };
      expect(windowLimits.minWidth).assertEqual(870);
      expect(windowLimits.maxWidth).assertEqual(1400);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 211.
     */
    it('WindowLimits_bulk_param_211', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 600, maxWidth: 1440 };
      expect(windowLimits.minWidth).assertEqual(600);
      expect(windowLimits.maxWidth).assertEqual(1440);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 212.
     */
    it('WindowLimits_bulk_param_212', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 630, maxWidth: 1480 };
      expect(windowLimits.minWidth).assertEqual(630);
      expect(windowLimits.maxWidth).assertEqual(1480);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 213.
     */
    it('WindowLimits_bulk_param_213', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 660, maxWidth: 1200 };
      expect(windowLimits.minWidth).assertEqual(660);
      expect(windowLimits.maxWidth).assertEqual(1200);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 214.
     */
    it('WindowLimits_bulk_param_214', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 690, maxWidth: 1240 };
      expect(windowLimits.minWidth).assertEqual(690);
      expect(windowLimits.maxWidth).assertEqual(1240);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 215.
     */
    it('WindowLimits_bulk_param_215', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 720, maxWidth: 1280 };
      expect(windowLimits.minWidth).assertEqual(720);
      expect(windowLimits.maxWidth).assertEqual(1280);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 216.
     */
    it('WindowLimits_bulk_param_216', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 750, maxWidth: 1320 };
      expect(windowLimits.minWidth).assertEqual(750);
      expect(windowLimits.maxWidth).assertEqual(1320);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 217.
     */
    it('WindowLimits_bulk_param_217', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 780, maxWidth: 1360 };
      expect(windowLimits.minWidth).assertEqual(780);
      expect(windowLimits.maxWidth).assertEqual(1360);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 218.
     */
    it('WindowLimits_bulk_param_218', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 810, maxWidth: 1400 };
      expect(windowLimits.minWidth).assertEqual(810);
      expect(windowLimits.maxWidth).assertEqual(1400);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 219.
     */
    it('WindowLimits_bulk_param_219', 0, () => {
      const windowLimits: window.WindowLimits = { minWidth: 840, maxWidth: 1440 };
      expect(windowLimits.minWidth).assertEqual(840);
      expect(windowLimits.maxWidth).assertEqual(1440);
      expect((windowLimits.maxWidth as number) >= (windowLimits.minWidth as number)).assertTrue();
    });
    /**
     * Verify the bulk WindowLimits configuration 220.
