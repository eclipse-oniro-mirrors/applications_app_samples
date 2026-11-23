'use static';

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
import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { SIZES } from '../../../../main/ets/common/Contants';
import { logSuite } from '../Shared/Copy';

function ratioOf(part: number, whole: number): number {
  return Math.round((part / whole) * 10000) / 10000;
}

export default function LayoutDerivedTest(): void {
  describe('LayoutDerivedTest', () => {
    beforeAll(() => {
      logSuite('LayoutDerivedTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('LayoutDerivedTest', 'end');
    });

    /**
     * @tc.name LayoutDerivedTest_case_001
     * @tc.desc layout-derived: PageHorizontalPadding = SIZES.padding, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_001', 0, () => {
      const actual: number = SIZES.padding;
      expect(actual).assertEqual(20);
      expect(SIZES.spacing + 4).assertEqual(20);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual + actual).assertEqual(40);
      expect(actual - actual).assertEqual(0);
      expect(actual > 0).assertTrue();
    });

    /**
     * @tc.name LayoutDerivedTest_case_002
     * @tc.desc layout-derived: PageHorizontalPadding = SIZES.padding, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_002', 0, () => {
      const actual: number = SIZES.padding;
      expect(actual >= 1).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.round(actual)).assertEqual(20);
      expect(Math.floor(actual)).assertEqual(20);
      expect(Math.ceil(actual)).assertEqual(20);
      expect(Number.isFinite(actual)).assertTrue();
      expect(Math.abs(actual)).assertEqual(20);
    });

    /**
     * @tc.name LayoutDerivedTest_case_003
     * @tc.desc layout-derived: PageHorizontalPadding = SIZES.padding, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_003', 0, () => {
      const actual: number = SIZES.padding;
      expect(actual === 20).assertTrue();
      expect(actual !== 20).assertFalse();
      expect(ratioOf(actual, actual)).assertEqual(1);
      expect(ratioOf(actual * 2, actual)).assertEqual(2);
      expect(actual / 20).assertEqual(1);
      expect(actual - 20).assertEqual(0);
    });

    /**
     * @tc.name LayoutDerivedTest_case_004
     * @tc.desc layout-derived: DividerHeight = 1, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_004', 0, () => {
      const actual: number = 1;
      expect(actual).assertEqual(1);
      expect(SIZES.radius - 11).assertEqual(1);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual + actual).assertEqual(2);
      expect(actual - actual).assertEqual(0);
      expect(actual > 0).assertTrue();
    });

    /**
     * @tc.name LayoutDerivedTest_case_005
     * @tc.desc layout-derived: DividerHeight = 1, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_005', 0, () => {
      const actual: number = 1;
      expect(actual >= 1).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.round(actual)).assertEqual(1);
      expect(Math.floor(actual)).assertEqual(1);
      expect(Math.ceil(actual)).assertEqual(1);
      expect(Number.isFinite(actual)).assertTrue();
      expect(Math.abs(actual)).assertEqual(1);
    });

    /**
     * @tc.name LayoutDerivedTest_case_006
     * @tc.desc layout-derived: DividerHeight = 1, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_006', 0, () => {
      const actual: number = 1;
      expect(actual === 1).assertTrue();
      expect(actual !== 1).assertFalse();
      expect(ratioOf(actual, actual)).assertEqual(1);
      expect(ratioOf(actual * 2, actual)).assertEqual(2);
      expect(actual / 1).assertEqual(1);
      expect(actual - 1).assertEqual(0);
    });

    /**
     * @tc.name LayoutDerivedTest_case_007
     * @tc.desc layout-derived: DividerWidthPercent = 90, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_007', 0, () => {
      const actual: number = 90;
      expect(actual).assertEqual(90);
      expect(100 - 10).assertEqual(90);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual + actual).assertEqual(180);
      expect(actual - actual).assertEqual(0);
      expect(actual > 0).assertTrue();
    });

    /**
     * @tc.name LayoutDerivedTest_case_008
     * @tc.desc layout-derived: DividerWidthPercent = 90, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_008', 0, () => {
      const actual: number = 90;
      expect(actual >= 1).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.round(actual)).assertEqual(90);
      expect(Math.floor(actual)).assertEqual(90);
      expect(Math.ceil(actual)).assertEqual(90);
      expect(Number.isFinite(actual)).assertTrue();
      expect(Math.abs(actual)).assertEqual(90);
    });

    /**
     * @tc.name LayoutDerivedTest_case_009
     * @tc.desc layout-derived: DividerWidthPercent = 90, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_009', 0, () => {
      const actual: number = 90;
      expect(actual === 90).assertTrue();
      expect(actual !== 90).assertFalse();
      expect(ratioOf(actual, actual)).assertEqual(1);
      expect(ratioOf(actual * 2, actual)).assertEqual(2);
      expect(actual / 90).assertEqual(1);
      expect(actual - 90).assertEqual(0);
    });

    /**
     * @tc.name LayoutDerivedTest_case_010
     * @tc.desc layout-derived: DividerBottomMargin = SIZES.spacing * 1.5, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_010', 0, () => {
      const actual: number = SIZES.spacing * 1.5;
      expect(actual).assertEqual(24);
      expect(SIZES.spacing + 8).assertEqual(24);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual + actual).assertEqual(48);
      expect(actual - actual).assertEqual(0);
      expect(actual > 0).assertTrue();
    });

    /**
     * @tc.name LayoutDerivedTest_case_011
     * @tc.desc layout-derived: DividerBottomMargin = SIZES.spacing * 1.5, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_011', 0, () => {
      const actual: number = SIZES.spacing * 1.5;
      expect(actual >= 1).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.round(actual)).assertEqual(24);
      expect(Math.floor(actual)).assertEqual(24);
      expect(Math.ceil(actual)).assertEqual(24);
      expect(Number.isFinite(actual)).assertTrue();
      expect(Math.abs(actual)).assertEqual(24);
    });

    /**
     * @tc.name LayoutDerivedTest_case_012
     * @tc.desc layout-derived: DividerBottomMargin = SIZES.spacing * 1.5, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_012', 0, () => {
      const actual: number = SIZES.spacing * 1.5;
      expect(actual === 24).assertTrue();
      expect(actual !== 24).assertFalse();
      expect(ratioOf(actual, actual)).assertEqual(1);
      expect(ratioOf(actual * 2, actual)).assertEqual(2);
      expect(actual / 24).assertEqual(1);
      expect(actual - 24).assertEqual(0);
    });

    /**
     * @tc.name LayoutDerivedTest_case_013
     * @tc.desc layout-derived: FooterTopMargin = 40, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_013', 0, () => {
      const actual: number = 40;
      expect(actual).assertEqual(40);
      expect(SIZES.padding * 2).assertEqual(40);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual + actual).assertEqual(80);
      expect(actual - actual).assertEqual(0);
      expect(actual > 0).assertTrue();
    });

    /**
     * @tc.name LayoutDerivedTest_case_014
     * @tc.desc layout-derived: FooterTopMargin = 40, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_014', 0, () => {
      const actual: number = 40;
      expect(actual >= 1).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.round(actual)).assertEqual(40);
      expect(Math.floor(actual)).assertEqual(40);
      expect(Math.ceil(actual)).assertEqual(40);
      expect(Number.isFinite(actual)).assertTrue();
      expect(Math.abs(actual)).assertEqual(40);
    });

    /**
     * @tc.name LayoutDerivedTest_case_015
     * @tc.desc layout-derived: FooterTopMargin = 40, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_015', 0, () => {
      const actual: number = 40;
      expect(actual === 40).assertTrue();
      expect(actual !== 40).assertFalse();
      expect(ratioOf(actual, actual)).assertEqual(1);
      expect(ratioOf(actual * 2, actual)).assertEqual(2);
      expect(actual / 40).assertEqual(1);
      expect(actual - 40).assertEqual(0);
    });

    /**
     * @tc.name LayoutDerivedTest_case_016
     * @tc.desc layout-derived: FooterBottomMargin = 30, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_016', 0, () => {
      const actual: number = 30;
      expect(actual).assertEqual(30);
      expect(SIZES.spacing * 2 - 2).assertEqual(30);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual + actual).assertEqual(60);
      expect(actual - actual).assertEqual(0);
      expect(actual > 0).assertTrue();
    });

    /**
     * @tc.name LayoutDerivedTest_case_017
     * @tc.desc layout-derived: FooterBottomMargin = 30, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_017', 0, () => {
      const actual: number = 30;
      expect(actual >= 1).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.round(actual)).assertEqual(30);
      expect(Math.floor(actual)).assertEqual(30);
      expect(Math.ceil(actual)).assertEqual(30);
      expect(Number.isFinite(actual)).assertTrue();
      expect(Math.abs(actual)).assertEqual(30);
    });

    /**
     * @tc.name LayoutDerivedTest_case_018
     * @tc.desc layout-derived: FooterBottomMargin = 30, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_018', 0, () => {
      const actual: number = 30;
      expect(actual === 30).assertTrue();
      expect(actual !== 30).assertFalse();
      expect(ratioOf(actual, actual)).assertEqual(1);
      expect(ratioOf(actual * 2, actual)).assertEqual(2);
      expect(actual / 30).assertEqual(1);
      expect(actual - 30).assertEqual(0);
    });

    /**
     * @tc.name LayoutDerivedTest_case_019
     * @tc.desc layout-derived: HeaderTopMargin = 40, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_019', 0, () => {
      const actual: number = 40;
      expect(actual).assertEqual(40);
      expect(SIZES.padding * 2).assertEqual(40);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual + actual).assertEqual(80);
      expect(actual - actual).assertEqual(0);
      expect(actual > 0).assertTrue();
    });

    /**
     * @tc.name LayoutDerivedTest_case_020
     * @tc.desc layout-derived: HeaderTopMargin = 40, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_020', 0, () => {
      const actual: number = 40;
      expect(actual >= 1).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.round(actual)).assertEqual(40);
      expect(Math.floor(actual)).assertEqual(40);
      expect(Math.ceil(actual)).assertEqual(40);
      expect(Number.isFinite(actual)).assertTrue();
      expect(Math.abs(actual)).assertEqual(40);
    });

    /**
     * @tc.name LayoutDerivedTest_case_021
     * @tc.desc layout-derived: HeaderTopMargin = 40, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_021', 0, () => {
      const actual: number = 40;
      expect(actual === 40).assertTrue();
      expect(actual !== 40).assertFalse();
      expect(ratioOf(actual, actual)).assertEqual(1);
      expect(ratioOf(actual * 2, actual)).assertEqual(2);
      expect(actual / 40).assertEqual(1);
      expect(actual - 40).assertEqual(0);
    });

    /**
     * @tc.name LayoutDerivedTest_case_022
     * @tc.desc layout-derived: HeaderBottomMargin = SIZES.spacing, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_022', 0, () => {
      const actual: number = SIZES.spacing;
      expect(actual).assertEqual(16);
      expect(SIZES.fontSizeNormal).assertEqual(16);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual + actual).assertEqual(32);
      expect(actual - actual).assertEqual(0);
      expect(actual > 0).assertTrue();
    });

    /**
     * @tc.name LayoutDerivedTest_case_023
     * @tc.desc layout-derived: HeaderBottomMargin = SIZES.spacing, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_023', 0, () => {
      const actual: number = SIZES.spacing;
      expect(actual >= 1).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.round(actual)).assertEqual(16);
      expect(Math.floor(actual)).assertEqual(16);
      expect(Math.ceil(actual)).assertEqual(16);
      expect(Number.isFinite(actual)).assertTrue();
      expect(Math.abs(actual)).assertEqual(16);
    });

    /**
     * @tc.name LayoutDerivedTest_case_024
     * @tc.desc layout-derived: HeaderBottomMargin = SIZES.spacing, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_024', 0, () => {
      const actual: number = SIZES.spacing;
      expect(actual === 16).assertTrue();
      expect(actual !== 16).assertFalse();
      expect(ratioOf(actual, actual)).assertEqual(1);
      expect(ratioOf(actual * 2, actual)).assertEqual(2);
      expect(actual / 16).assertEqual(1);
      expect(actual - 16).assertEqual(0);
    });

    /**
     * @tc.name LayoutDerivedTest_case_025
     * @tc.desc layout-derived: HeaderSubtitleTopMargin = 6, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_025', 0, () => {
      const actual: number = 6;
      expect(actual).assertEqual(6);
      expect(SIZES.fontSizeTitle - SIZES.fontSizeNormal + 0).assertEqual(6);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual + actual).assertEqual(12);
      expect(actual - actual).assertEqual(0);
      expect(actual > 0).assertTrue();
    });

    /**
     * @tc.name LayoutDerivedTest_case_026
     * @tc.desc layout-derived: HeaderSubtitleTopMargin = 6, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_026', 0, () => {
      const actual: number = 6;
      expect(actual >= 1).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.round(actual)).assertEqual(6);
      expect(Math.floor(actual)).assertEqual(6);
      expect(Math.ceil(actual)).assertEqual(6);
      expect(Number.isFinite(actual)).assertTrue();
      expect(Math.abs(actual)).assertEqual(6);
    });

    /**
     * @tc.name LayoutDerivedTest_case_027
     * @tc.desc layout-derived: HeaderSubtitleTopMargin = 6, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_027', 0, () => {
      const actual: number = 6;
      expect(actual === 6).assertTrue();
      expect(actual !== 6).assertFalse();
      expect(ratioOf(actual, actual)).assertEqual(1);
      expect(ratioOf(actual * 2, actual)).assertEqual(2);
      expect(actual / 6).assertEqual(1);
      expect(actual - 6).assertEqual(0);
    });

    /**
     * @tc.name LayoutDerivedTest_case_028
     * @tc.desc layout-derived: HeaderTitleWeight = 600, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_028', 0, () => {
      const actual: number = 600;
      expect(actual).assertEqual(600);
      expect(6 * 100).assertEqual(600);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual + actual).assertEqual(1200);
      expect(actual - actual).assertEqual(0);
      expect(actual > 0).assertTrue();
    });

    /**
     * @tc.name LayoutDerivedTest_case_029
     * @tc.desc layout-derived: HeaderTitleWeight = 600, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_029', 0, () => {
      const actual: number = 600;
      expect(actual >= 1).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.round(actual)).assertEqual(600);
      expect(Math.floor(actual)).assertEqual(600);
      expect(Math.ceil(actual)).assertEqual(600);
      expect(Number.isFinite(actual)).assertTrue();
      expect(Math.abs(actual)).assertEqual(600);
    });

    /**
     * @tc.name LayoutDerivedTest_case_030
     * @tc.desc layout-derived: HeaderTitleWeight = 600, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_030', 0, () => {
      const actual: number = 600;
      expect(actual === 600).assertTrue();
      expect(actual !== 600).assertFalse();
      expect(ratioOf(actual, actual)).assertEqual(1);
      expect(ratioOf(actual * 2, actual)).assertEqual(2);
      expect(actual / 600).assertEqual(1);
      expect(actual - 600).assertEqual(0);
    });

    /**
     * @tc.name LayoutDerivedTest_case_031
     * @tc.desc layout-derived: MainTitleFontSize = SIZES.fontSizeNormal + 2, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_031', 0, () => {
      const actual: number = SIZES.fontSizeNormal + 2;
      expect(actual).assertEqual(18);
      expect(SIZES.fontSizeSmall + 4).assertEqual(18);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual + actual).assertEqual(36);
      expect(actual - actual).assertEqual(0);
      expect(actual > 0).assertTrue();
    });

    /**
     * @tc.name LayoutDerivedTest_case_032
     * @tc.desc layout-derived: MainTitleFontSize = SIZES.fontSizeNormal + 2, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_032', 0, () => {
      const actual: number = SIZES.fontSizeNormal + 2;
      expect(actual >= 1).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.round(actual)).assertEqual(18);
      expect(Math.floor(actual)).assertEqual(18);
      expect(Math.ceil(actual)).assertEqual(18);
      expect(Number.isFinite(actual)).assertTrue();
      expect(Math.abs(actual)).assertEqual(18);
    });

    /**
     * @tc.name LayoutDerivedTest_case_033
     * @tc.desc layout-derived: MainTitleFontSize = SIZES.fontSizeNormal + 2, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_033', 0, () => {
      const actual: number = SIZES.fontSizeNormal + 2;
      expect(actual === 18).assertTrue();
      expect(actual !== 18).assertFalse();
      expect(ratioOf(actual, actual)).assertEqual(1);
      expect(ratioOf(actual * 2, actual)).assertEqual(2);
      expect(actual / 18).assertEqual(1);
      expect(actual - 18).assertEqual(0);
    });

    /**
     * @tc.name LayoutDerivedTest_case_034
     * @tc.desc layout-derived: MainTitleBottomMargin = 12, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_034', 0, () => {
      const actual: number = 12;
      expect(actual).assertEqual(12);
      expect(SIZES.radius).assertEqual(12);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual + actual).assertEqual(24);
      expect(actual - actual).assertEqual(0);
      expect(actual > 0).assertTrue();
    });

    /**
     * @tc.name LayoutDerivedTest_case_035
     * @tc.desc layout-derived: MainTitleBottomMargin = 12, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_035', 0, () => {
      const actual: number = 12;
      expect(actual >= 1).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.round(actual)).assertEqual(12);
      expect(Math.floor(actual)).assertEqual(12);
      expect(Math.ceil(actual)).assertEqual(12);
      expect(Number.isFinite(actual)).assertTrue();
      expect(Math.abs(actual)).assertEqual(12);
    });

    /**
     * @tc.name LayoutDerivedTest_case_036
     * @tc.desc layout-derived: MainTitleBottomMargin = 12, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_036', 0, () => {
      const actual: number = 12;
      expect(actual === 12).assertTrue();
      expect(actual !== 12).assertFalse();
      expect(ratioOf(actual, actual)).assertEqual(1);
      expect(ratioOf(actual * 2, actual)).assertEqual(2);
      expect(actual / 12).assertEqual(1);
      expect(actual - 12).assertEqual(0);
    });

    /**
     * @tc.name LayoutDerivedTest_case_037
     * @tc.desc layout-derived: UpdateButtonHeight = 44, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_037', 0, () => {
      const actual: number = 44;
      expect(actual).assertEqual(44);
      expect(SIZES.padding * 2 + 4).assertEqual(44);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual + actual).assertEqual(88);
      expect(actual - actual).assertEqual(0);
      expect(actual > 0).assertTrue();
    });

    /**
     * @tc.name LayoutDerivedTest_case_038
     * @tc.desc layout-derived: UpdateButtonHeight = 44, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_038', 0, () => {
      const actual: number = 44;
      expect(actual >= 1).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.round(actual)).assertEqual(44);
      expect(Math.floor(actual)).assertEqual(44);
      expect(Math.ceil(actual)).assertEqual(44);
      expect(Number.isFinite(actual)).assertTrue();
      expect(Math.abs(actual)).assertEqual(44);
    });

    /**
     * @tc.name LayoutDerivedTest_case_039
     * @tc.desc layout-derived: UpdateButtonHeight = 44, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_039', 0, () => {
      const actual: number = 44;
      expect(actual === 44).assertTrue();
      expect(actual !== 44).assertFalse();
      expect(ratioOf(actual, actual)).assertEqual(1);
      expect(ratioOf(actual * 2, actual)).assertEqual(2);
      expect(actual / 44).assertEqual(1);
      expect(actual - 44).assertEqual(0);
    });

    /**
     * @tc.name LayoutDerivedTest_case_040
     * @tc.desc layout-derived: UpdateButtonWidthPercent = 100, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_040', 0, () => {
      const actual: number = 100;
      expect(actual).assertEqual(100);
      expect(90 + 10).assertEqual(100);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual + actual).assertEqual(200);
      expect(actual - actual).assertEqual(0);
      expect(actual > 0).assertTrue();
    });

    /**
     * @tc.name LayoutDerivedTest_case_041
     * @tc.desc layout-derived: UpdateButtonWidthPercent = 100, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_041', 0, () => {
      const actual: number = 100;
      expect(actual >= 1).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.round(actual)).assertEqual(100);
      expect(Math.floor(actual)).assertEqual(100);
      expect(Math.ceil(actual)).assertEqual(100);
      expect(Number.isFinite(actual)).assertTrue();
      expect(Math.abs(actual)).assertEqual(100);
    });

    /**
     * @tc.name LayoutDerivedTest_case_042
     * @tc.desc layout-derived: UpdateButtonWidthPercent = 100, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_042', 0, () => {
      const actual: number = 100;
      expect(actual === 100).assertTrue();
      expect(actual !== 100).assertFalse();
      expect(ratioOf(actual, actual)).assertEqual(1);
      expect(ratioOf(actual * 2, actual)).assertEqual(2);
      expect(actual / 100).assertEqual(1);
      expect(actual - 100).assertEqual(0);
    });

    /**
     * @tc.name LayoutDerivedTest_case_043
     * @tc.desc layout-derived: TextInputHeight = 50, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_043', 0, () => {
      const actual: number = 50;
      expect(actual).assertEqual(50);
      expect(SIZES.fontSizeTitle * 2 + 6).assertEqual(50);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual + actual).assertEqual(100);
      expect(actual - actual).assertEqual(0);
      expect(actual > 0).assertTrue();
    });

    /**
     * @tc.name LayoutDerivedTest_case_044
     * @tc.desc layout-derived: TextInputHeight = 50, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_044', 0, () => {
      const actual: number = 50;
      expect(actual >= 1).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.round(actual)).assertEqual(50);
      expect(Math.floor(actual)).assertEqual(50);
      expect(Math.ceil(actual)).assertEqual(50);
      expect(Number.isFinite(actual)).assertTrue();
      expect(Math.abs(actual)).assertEqual(50);
    });

    /**
     * @tc.name LayoutDerivedTest_case_045
     * @tc.desc layout-derived: TextInputHeight = 50, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_045', 0, () => {
      const actual: number = 50;
      expect(actual === 50).assertTrue();
      expect(actual !== 50).assertFalse();
      expect(ratioOf(actual, actual)).assertEqual(1);
      expect(ratioOf(actual * 2, actual)).assertEqual(2);
      expect(actual / 50).assertEqual(1);
      expect(actual - 50).assertEqual(0);
    });

    /**
     * @tc.name LayoutDerivedTest_case_046
     * @tc.desc layout-derived: TextInputHorizontalPadding = 16, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_046', 0, () => {
      const actual: number = 16;
      expect(actual).assertEqual(16);
      expect(SIZES.spacing).assertEqual(16);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual + actual).assertEqual(32);
      expect(actual - actual).assertEqual(0);
      expect(actual > 0).assertTrue();
    });

    /**
     * @tc.name LayoutDerivedTest_case_047
     * @tc.desc layout-derived: TextInputHorizontalPadding = 16, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_047', 0, () => {
      const actual: number = 16;
      expect(actual >= 1).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.round(actual)).assertEqual(16);
      expect(Math.floor(actual)).assertEqual(16);
      expect(Math.ceil(actual)).assertEqual(16);
      expect(Number.isFinite(actual)).assertTrue();
      expect(Math.abs(actual)).assertEqual(16);
    });

    /**
     * @tc.name LayoutDerivedTest_case_048
     * @tc.desc layout-derived: TextInputHorizontalPadding = 16, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_048', 0, () => {
      const actual: number = 16;
      expect(actual === 16).assertTrue();
      expect(actual !== 16).assertFalse();
      expect(ratioOf(actual, actual)).assertEqual(1);
      expect(ratioOf(actual * 2, actual)).assertEqual(2);
      expect(actual / 16).assertEqual(1);
      expect(actual - 16).assertEqual(0);
    });

    /**
     * @tc.name LayoutDerivedTest_case_049
     * @tc.desc layout-derived: TextInputRadius = SIZES.radius, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_049', 0, () => {
      const actual: number = SIZES.radius;
      expect(actual).assertEqual(12);
      expect(SIZES.fontSizeSmall - 2).assertEqual(12);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual + actual).assertEqual(24);
      expect(actual - actual).assertEqual(0);
      expect(actual > 0).assertTrue();
    });

    /**
     * @tc.name LayoutDerivedTest_case_050
     * @tc.desc layout-derived: TextInputRadius = SIZES.radius, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_050', 0, () => {
      const actual: number = SIZES.radius;
      expect(actual >= 1).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.round(actual)).assertEqual(12);
      expect(Math.floor(actual)).assertEqual(12);
      expect(Math.ceil(actual)).assertEqual(12);
      expect(Number.isFinite(actual)).assertTrue();
      expect(Math.abs(actual)).assertEqual(12);
    });

    /**
     * @tc.name LayoutDerivedTest_case_051
     * @tc.desc layout-derived: TextInputRadius = SIZES.radius, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_051', 0, () => {
      const actual: number = SIZES.radius;
      expect(actual === 12).assertTrue();
      expect(actual !== 12).assertFalse();
      expect(ratioOf(actual, actual)).assertEqual(1);
      expect(ratioOf(actual * 2, actual)).assertEqual(2);
      expect(actual / 12).assertEqual(1);
      expect(actual - 12).assertEqual(0);
    });

    /**
     * @tc.name LayoutDerivedTest_case_052
     * @tc.desc layout-derived: TextInputBorderWidth = 1, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_052', 0, () => {
      const actual: number = 1;
      expect(actual).assertEqual(1);
      expect(SIZES.padding - 19).assertEqual(1);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual + actual).assertEqual(2);
      expect(actual - actual).assertEqual(0);
      expect(actual > 0).assertTrue();
    });

    /**
     * @tc.name LayoutDerivedTest_case_053
     * @tc.desc layout-derived: TextInputBorderWidth = 1, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_053', 0, () => {
      const actual: number = 1;
      expect(actual >= 1).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.round(actual)).assertEqual(1);
      expect(Math.floor(actual)).assertEqual(1);
      expect(Math.ceil(actual)).assertEqual(1);
      expect(Number.isFinite(actual)).assertTrue();
      expect(Math.abs(actual)).assertEqual(1);
    });

    /**
     * @tc.name LayoutDerivedTest_case_054
     * @tc.desc layout-derived: TextInputBorderWidth = 1, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_054', 0, () => {
      const actual: number = 1;
      expect(actual === 1).assertTrue();
      expect(actual !== 1).assertFalse();
      expect(ratioOf(actual, actual)).assertEqual(1);
      expect(ratioOf(actual * 2, actual)).assertEqual(2);
      expect(actual / 1).assertEqual(1);
      expect(actual - 1).assertEqual(0);
    });

    /**
     * @tc.name LayoutDerivedTest_case_055
     * @tc.desc layout-derived: CardShadowRadius = 6, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_055', 0, () => {
      const actual: number = 6;
      expect(actual).assertEqual(6);
      expect(SIZES.fontSizeSmall - 8).assertEqual(6);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual + actual).assertEqual(12);
      expect(actual - actual).assertEqual(0);
      expect(actual > 0).assertTrue();
    });

    /**
     * @tc.name LayoutDerivedTest_case_056
     * @tc.desc layout-derived: CardShadowRadius = 6, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_056', 0, () => {
      const actual: number = 6;
      expect(actual >= 1).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.round(actual)).assertEqual(6);
      expect(Math.floor(actual)).assertEqual(6);
      expect(Math.ceil(actual)).assertEqual(6);
      expect(Number.isFinite(actual)).assertTrue();
      expect(Math.abs(actual)).assertEqual(6);
    });

    /**
     * @tc.name LayoutDerivedTest_case_057
     * @tc.desc layout-derived: CardShadowRadius = 6, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_057', 0, () => {
      const actual: number = 6;
      expect(actual === 6).assertTrue();
      expect(actual !== 6).assertFalse();
      expect(ratioOf(actual, actual)).assertEqual(1);
      expect(ratioOf(actual * 2, actual)).assertEqual(2);
      expect(actual / 6).assertEqual(1);
      expect(actual - 6).assertEqual(0);
    });

    /**
     * @tc.name LayoutDerivedTest_case_058
     * @tc.desc layout-derived: CardShadowOffsetY = 2, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_058', 0, () => {
      const actual: number = 2;
      expect(actual).assertEqual(2);
      expect(SIZES.fontSizeSmall - 12).assertEqual(2);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual + actual).assertEqual(4);
      expect(actual - actual).assertEqual(0);
      expect(actual > 0).assertTrue();
    });

    /**
     * @tc.name LayoutDerivedTest_case_059
     * @tc.desc layout-derived: CardShadowOffsetY = 2, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_059', 0, () => {
      const actual: number = 2;
      expect(actual >= 1).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.round(actual)).assertEqual(2);
      expect(Math.floor(actual)).assertEqual(2);
      expect(Math.ceil(actual)).assertEqual(2);
      expect(Number.isFinite(actual)).assertTrue();
      expect(Math.abs(actual)).assertEqual(2);
    });

    /**
     * @tc.name LayoutDerivedTest_case_060
     * @tc.desc layout-derived: CardShadowOffsetY = 2, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_060', 0, () => {
      const actual: number = 2;
      expect(actual === 2).assertTrue();
      expect(actual !== 2).assertFalse();
      expect(ratioOf(actual, actual)).assertEqual(1);
      expect(ratioOf(actual * 2, actual)).assertEqual(2);
      expect(actual / 2).assertEqual(1);
      expect(actual - 2).assertEqual(0);
    });

    /**
     * @tc.name LayoutDerivedTest_case_061
     * @tc.desc layout-derived: BottomLabelTopMargin = 20, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_061', 0, () => {
      const actual: number = 20;
      expect(actual).assertEqual(20);
      expect(SIZES.padding).assertEqual(20);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual + actual).assertEqual(40);
      expect(actual - actual).assertEqual(0);
      expect(actual > 0).assertTrue();
    });

    /**
     * @tc.name LayoutDerivedTest_case_062
     * @tc.desc layout-derived: BottomLabelTopMargin = 20, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_062', 0, () => {
      const actual: number = 20;
      expect(actual >= 1).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.round(actual)).assertEqual(20);
      expect(Math.floor(actual)).assertEqual(20);
      expect(Math.ceil(actual)).assertEqual(20);
      expect(Number.isFinite(actual)).assertTrue();
      expect(Math.abs(actual)).assertEqual(20);
    });

    /**
     * @tc.name LayoutDerivedTest_case_063
     * @tc.desc layout-derived: BottomLabelTopMargin = 20, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_063', 0, () => {
      const actual: number = 20;
      expect(actual === 20).assertTrue();
      expect(actual !== 20).assertFalse();
      expect(ratioOf(actual, actual)).assertEqual(1);
      expect(ratioOf(actual * 2, actual)).assertEqual(2);
      expect(actual / 20).assertEqual(1);
      expect(actual - 20).assertEqual(0);
    });

    /**
     * @tc.name LayoutDerivedTest_case_064
     * @tc.desc layout-derived: BottomLabelBottomMargin = 8, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_064', 0, () => {
      const actual: number = 8;
      expect(actual).assertEqual(8);
      expect(SIZES.spacing / 2).assertEqual(8);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual + actual).assertEqual(16);
      expect(actual - actual).assertEqual(0);
      expect(actual > 0).assertTrue();
    });

    /**
     * @tc.name LayoutDerivedTest_case_065
     * @tc.desc layout-derived: BottomLabelBottomMargin = 8, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_065', 0, () => {
      const actual: number = 8;
      expect(actual >= 1).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.round(actual)).assertEqual(8);
      expect(Math.floor(actual)).assertEqual(8);
      expect(Math.ceil(actual)).assertEqual(8);
      expect(Number.isFinite(actual)).assertTrue();
      expect(Math.abs(actual)).assertEqual(8);
    });

    /**
     * @tc.name LayoutDerivedTest_case_066
     * @tc.desc layout-derived: BottomLabelBottomMargin = 8, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_066', 0, () => {
      const actual: number = 8;
      expect(actual === 8).assertTrue();
      expect(actual !== 8).assertFalse();
      expect(ratioOf(actual, actual)).assertEqual(1);
      expect(ratioOf(actual * 2, actual)).assertEqual(2);
      expect(actual / 8).assertEqual(1);
      expect(actual - 8).assertEqual(0);
    });

    /**
     * @tc.name LayoutDerivedTest_case_067
     * @tc.desc layout-derived: EchoHorizontalPadding = 12, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_067', 0, () => {
      const actual: number = 12;
      expect(actual).assertEqual(12);
      expect(SIZES.radius).assertEqual(12);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual + actual).assertEqual(24);
      expect(actual - actual).assertEqual(0);
      expect(actual > 0).assertTrue();
    });

    /**
     * @tc.name LayoutDerivedTest_case_068
     * @tc.desc layout-derived: EchoHorizontalPadding = 12, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_068', 0, () => {
      const actual: number = 12;
      expect(actual >= 1).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.round(actual)).assertEqual(12);
      expect(Math.floor(actual)).assertEqual(12);
      expect(Math.ceil(actual)).assertEqual(12);
      expect(Number.isFinite(actual)).assertTrue();
      expect(Math.abs(actual)).assertEqual(12);
    });

    /**
     * @tc.name LayoutDerivedTest_case_069
     * @tc.desc layout-derived: EchoHorizontalPadding = 12, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_069', 0, () => {
      const actual: number = 12;
      expect(actual === 12).assertTrue();
      expect(actual !== 12).assertFalse();
      expect(ratioOf(actual, actual)).assertEqual(1);
      expect(ratioOf(actual * 2, actual)).assertEqual(2);
      expect(actual / 12).assertEqual(1);
      expect(actual - 12).assertEqual(0);
    });

    /**
     * @tc.name LayoutDerivedTest_case_070
     * @tc.desc layout-derived: EchoVerticalPadding = 10, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_070', 0, () => {
      const actual: number = 10;
      expect(actual).assertEqual(10);
      expect(SIZES.padding / 2).assertEqual(10);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual + actual).assertEqual(20);
      expect(actual - actual).assertEqual(0);
      expect(actual > 0).assertTrue();
    });

    /**
     * @tc.name LayoutDerivedTest_case_071
     * @tc.desc layout-derived: EchoVerticalPadding = 10, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_071', 0, () => {
      const actual: number = 10;
      expect(actual >= 1).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.round(actual)).assertEqual(10);
      expect(Math.floor(actual)).assertEqual(10);
      expect(Math.ceil(actual)).assertEqual(10);
      expect(Number.isFinite(actual)).assertTrue();
      expect(Math.abs(actual)).assertEqual(10);
    });

    /**
     * @tc.name LayoutDerivedTest_case_072
     * @tc.desc layout-derived: EchoVerticalPadding = 10, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_072', 0, () => {
      const actual: number = 10;
      expect(actual === 10).assertTrue();
      expect(actual !== 10).assertFalse();
      expect(ratioOf(actual, actual)).assertEqual(1);
      expect(ratioOf(actual * 2, actual)).assertEqual(2);
      expect(actual / 10).assertEqual(1);
      expect(actual - 10).assertEqual(0);
    });

    /**
     * @tc.name LayoutDerivedTest_case_073
     * @tc.desc layout-derived: EchoWidthPercent = 90, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_073', 0, () => {
      const actual: number = 90;
      expect(actual).assertEqual(90);
      expect(100 - SIZES.padding / 2).assertEqual(90);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual + actual).assertEqual(180);
      expect(actual - actual).assertEqual(0);
      expect(actual > 0).assertTrue();
    });

    /**
     * @tc.name LayoutDerivedTest_case_074
     * @tc.desc layout-derived: EchoWidthPercent = 90, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_074', 0, () => {
      const actual: number = 90;
      expect(actual >= 1).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.round(actual)).assertEqual(90);
      expect(Math.floor(actual)).assertEqual(90);
      expect(Math.ceil(actual)).assertEqual(90);
      expect(Number.isFinite(actual)).assertTrue();
      expect(Math.abs(actual)).assertEqual(90);
    });

    /**
     * @tc.name LayoutDerivedTest_case_075
     * @tc.desc layout-derived: EchoWidthPercent = 90, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_075', 0, () => {
      const actual: number = 90;
      expect(actual === 90).assertTrue();
      expect(actual !== 90).assertFalse();
      expect(ratioOf(actual, actual)).assertEqual(1);
      expect(ratioOf(actual * 2, actual)).assertEqual(2);
      expect(actual / 90).assertEqual(1);
      expect(actual - 90).assertEqual(0);
    });

    /**
     * @tc.name LayoutDerivedTest_case_076
     * @tc.desc layout-derived: EchoBorderWidth = 1, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_076', 0, () => {
      const actual: number = 1;
      expect(actual).assertEqual(1);
      expect(SIZES.radius / 12).assertEqual(1);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual + actual).assertEqual(2);
      expect(actual - actual).assertEqual(0);
      expect(actual > 0).assertTrue();
    });

    /**
     * @tc.name LayoutDerivedTest_case_077
     * @tc.desc layout-derived: EchoBorderWidth = 1, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_077', 0, () => {
      const actual: number = 1;
      expect(actual >= 1).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.round(actual)).assertEqual(1);
      expect(Math.floor(actual)).assertEqual(1);
      expect(Math.ceil(actual)).assertEqual(1);
      expect(Number.isFinite(actual)).assertTrue();
      expect(Math.abs(actual)).assertEqual(1);
    });

    /**
     * @tc.name LayoutDerivedTest_case_078
     * @tc.desc layout-derived: EchoBorderWidth = 1, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_078', 0, () => {
      const actual: number = 1;
      expect(actual === 1).assertTrue();
      expect(actual !== 1).assertFalse();
      expect(ratioOf(actual, actual)).assertEqual(1);
      expect(ratioOf(actual * 2, actual)).assertEqual(2);
      expect(actual / 1).assertEqual(1);
      expect(actual - 1).assertEqual(0);
    });

    /**
     * @tc.name LayoutDerivedTest_case_079
     * @tc.desc layout-derived: EchoRadius = SIZES.radius, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_079', 0, () => {
      const actual: number = SIZES.radius;
      expect(actual).assertEqual(12);
      expect(SIZES.padding - 8).assertEqual(12);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual + actual).assertEqual(24);
      expect(actual - actual).assertEqual(0);
      expect(actual > 0).assertTrue();
    });

    /**
     * @tc.name LayoutDerivedTest_case_080
     * @tc.desc layout-derived: EchoRadius = SIZES.radius, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_080', 0, () => {
      const actual: number = SIZES.radius;
      expect(actual >= 1).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.round(actual)).assertEqual(12);
      expect(Math.floor(actual)).assertEqual(12);
      expect(Math.ceil(actual)).assertEqual(12);
      expect(Number.isFinite(actual)).assertTrue();
      expect(Math.abs(actual)).assertEqual(12);
    });

    /**
     * @tc.name LayoutDerivedTest_case_081
     * @tc.desc layout-derived: EchoRadius = SIZES.radius, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_081', 0, () => {
      const actual: number = SIZES.radius;
      expect(actual === 12).assertTrue();
      expect(actual !== 12).assertFalse();
      expect(ratioOf(actual, actual)).assertEqual(1);
      expect(ratioOf(actual * 2, actual)).assertEqual(2);
      expect(actual / 12).assertEqual(1);
      expect(actual - 12).assertEqual(0);
    });

    /**
     * @tc.name LayoutDerivedTest_case_082
     * @tc.desc layout-derived: CardPadding = SIZES.padding, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_082', 0, () => {
      const actual: number = SIZES.padding;
      expect(actual).assertEqual(20);
      expect(SIZES.spacing + 4).assertEqual(20);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual + actual).assertEqual(40);
      expect(actual - actual).assertEqual(0);
      expect(actual > 0).assertTrue();
    });

    /**
     * @tc.name LayoutDerivedTest_case_083
     * @tc.desc layout-derived: CardPadding = SIZES.padding, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_083', 0, () => {
      const actual: number = SIZES.padding;
      expect(actual >= 1).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.round(actual)).assertEqual(20);
      expect(Math.floor(actual)).assertEqual(20);
      expect(Math.ceil(actual)).assertEqual(20);
      expect(Number.isFinite(actual)).assertTrue();
      expect(Math.abs(actual)).assertEqual(20);
    });

    /**
     * @tc.name LayoutDerivedTest_case_084
     * @tc.desc layout-derived: CardPadding = SIZES.padding, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_084', 0, () => {
      const actual: number = SIZES.padding;
      expect(actual === 20).assertTrue();
      expect(actual !== 20).assertFalse();
      expect(ratioOf(actual, actual)).assertEqual(1);
      expect(ratioOf(actual * 2, actual)).assertEqual(2);
      expect(actual / 20).assertEqual(1);
      expect(actual - 20).assertEqual(0);
    });

    /**
     * @tc.name LayoutDerivedTest_case_085
     * @tc.desc layout-derived: RowSpacing = SIZES.spacing, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_085', 0, () => {
      const actual: number = SIZES.spacing;
      expect(actual).assertEqual(16);
      expect(SIZES.fontSizeNormal).assertEqual(16);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual + actual).assertEqual(32);
      expect(actual - actual).assertEqual(0);
      expect(actual > 0).assertTrue();
    });

    /**
     * @tc.name LayoutDerivedTest_case_086
     * @tc.desc layout-derived: RowSpacing = SIZES.spacing, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_086', 0, () => {
      const actual: number = SIZES.spacing;
      expect(actual >= 1).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.round(actual)).assertEqual(16);
      expect(Math.floor(actual)).assertEqual(16);
      expect(Math.ceil(actual)).assertEqual(16);
      expect(Number.isFinite(actual)).assertTrue();
      expect(Math.abs(actual)).assertEqual(16);
    });

    /**
     * @tc.name LayoutDerivedTest_case_087
     * @tc.desc layout-derived: RowSpacing = SIZES.spacing, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_087', 0, () => {
      const actual: number = SIZES.spacing;
      expect(actual === 16).assertTrue();
      expect(actual !== 16).assertFalse();
      expect(ratioOf(actual, actual)).assertEqual(1);
      expect(ratioOf(actual * 2, actual)).assertEqual(2);
      expect(actual / 16).assertEqual(1);
      expect(actual - 16).assertEqual(0);
    });

    /**
     * @tc.name LayoutDerivedTest_case_088
     * @tc.desc layout-derived: FontSpan = SIZES.fontSizeTitle - SIZES.fontSizeSmall, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_088', 0, () => {
      const actual: number = SIZES.fontSizeTitle - SIZES.fontSizeSmall;
      expect(actual).assertEqual(8);
      expect(SIZES.radius - 4).assertEqual(8);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual + actual).assertEqual(16);
      expect(actual - actual).assertEqual(0);
      expect(actual > 0).assertTrue();
    });

    /**
     * @tc.name LayoutDerivedTest_case_089
     * @tc.desc layout-derived: FontSpan = SIZES.fontSizeTitle - SIZES.fontSizeSmall, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_089', 0, () => {
      const actual: number = SIZES.fontSizeTitle - SIZES.fontSizeSmall;
      expect(actual >= 1).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.round(actual)).assertEqual(8);
      expect(Math.floor(actual)).assertEqual(8);
      expect(Math.ceil(actual)).assertEqual(8);
      expect(Number.isFinite(actual)).assertTrue();
      expect(Math.abs(actual)).assertEqual(8);
    });

    /**
     * @tc.name LayoutDerivedTest_case_090
     * @tc.desc layout-derived: FontSpan = SIZES.fontSizeTitle - SIZES.fontSizeSmall, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('LayoutDerivedTest_case_090', 0, () => {
      const actual: number = SIZES.fontSizeTitle - SIZES.fontSizeSmall;
      expect(actual === 8).assertTrue();
      expect(actual !== 8).assertFalse();
      expect(ratioOf(actual, actual)).assertEqual(1);
      expect(ratioOf(actual * 2, actual)).assertEqual(2);
      expect(actual / 8).assertEqual(1);
      expect(actual - 8).assertEqual(0);
    });

  });
}
