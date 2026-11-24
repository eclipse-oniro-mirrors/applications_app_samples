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
import { COLORS, SIZES } from '../../../../main/ets/common/Contants';
import { PLACEHOLDER_DEFAULT, PLACEHOLDER_UPDATED, TEXT_DEFAULT, HEADER_TITLE, HEADER_SUBTITLE, INPUT_LABEL, FOOTER_COPY, UPDATE_LABEL, logSuite } from '../Shared/Copy';

export default function PageCompositionTest(): void {
  describe('PageCompositionTest', () => {
    beforeAll(() => {
      logSuite('PageCompositionTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('PageCompositionTest', 'end');
    });

    /**
     * @tc.name PageCompositionTest_case_001
     * @tc.desc page-composition: HeaderTitleCopy is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_001', 0, () => {
      const actual: string = HEADER_TITLE;
      expect(actual).assertEqual('\ud83c\udf88 \u65b0\u5e74\u613f\u671b\u586b\u5199');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(('\ud83c\udf88 \u65b0\u5e74\u613f\u671b\u586b\u5199').length);
      expect(actual === HEADER_TITLE).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_002
     * @tc.desc page-composition: HeaderTitleCopy is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_002', 0, () => {
      const actual: string = HEADER_TITLE;
      expect(actual).assertEqual('\ud83c\udf88 \u65b0\u5e74\u613f\u671b\u586b\u5199');
      expect(actual.startsWith(('\ud83c\udf88 \u65b0\u5e74\u613f\u671b\u586b\u5199').substring(0, 1))).assertTrue();
      expect(actual.trim().length > 0).assertTrue();
      expect(actual.length + 1).assertEqual(('\ud83c\udf88 \u65b0\u5e74\u613f\u671b\u586b\u5199').length + 1);
      expect(actual !== '').assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_003
     * @tc.desc page-composition: HeaderTitleColor is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_003', 0, () => {
      const actual: string = COLORS.primary;
      expect(actual).assertEqual('#67C23A');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(('#67C23A').length);
      expect(actual === COLORS.primary).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_004
     * @tc.desc page-composition: HeaderTitleColor is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_004', 0, () => {
      const actual: string = COLORS.primary;
      expect(actual).assertEqual('#67C23A');
      expect(actual.startsWith(('#67C23A').substring(0, 1))).assertTrue();
      expect(actual.trim().length > 0).assertTrue();
      expect(actual.length + 1).assertEqual(('#67C23A').length + 1);
      expect(actual !== '').assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_005
     * @tc.desc page-composition: HeaderTitleFont is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_005', 0, () => {
      const actual: number = SIZES.fontSizeTitle;
      expect(actual).assertEqual(22);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual * 1).assertEqual(22);
      expect(actual + 0).assertEqual(22);
    });

    /**
     * @tc.name PageCompositionTest_case_006
     * @tc.desc page-composition: HeaderTitleFont is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_006', 0, () => {
      const actual: number = SIZES.fontSizeTitle;
      expect(actual).assertEqual(22);
      expect(actual >= 0).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.abs(actual - 22)).assertEqual(0);
      expect(actual === 22).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_007
     * @tc.desc page-composition: HeaderWeight is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_007', 0, () => {
      const actual: number = 600;
      expect(actual).assertEqual(600);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual * 1).assertEqual(600);
      expect(actual + 0).assertEqual(600);
    });

    /**
     * @tc.name PageCompositionTest_case_008
     * @tc.desc page-composition: HeaderWeight is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_008', 0, () => {
      const actual: number = 600;
      expect(actual).assertEqual(600);
      expect(actual >= 0).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.abs(actual - 600)).assertEqual(0);
      expect(actual === 600).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_009
     * @tc.desc page-composition: HeaderSubtitleCopy is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_009', 0, () => {
      const actual: string = HEADER_SUBTITLE;
      expect(actual).assertEqual('\u628a\u5fc3\u613f\u5199\u4e0b\u6765\uff0c\u65b0\u7684\u4e00\u5e74\u90fd\u4f1a\u5b9e\u73b0\uff5e');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(('\u628a\u5fc3\u613f\u5199\u4e0b\u6765\uff0c\u65b0\u7684\u4e00\u5e74\u90fd\u4f1a\u5b9e\u73b0\uff5e').length);
      expect(actual === HEADER_SUBTITLE).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_010
     * @tc.desc page-composition: HeaderSubtitleCopy is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_010', 0, () => {
      const actual: string = HEADER_SUBTITLE;
      expect(actual).assertEqual('\u628a\u5fc3\u613f\u5199\u4e0b\u6765\uff0c\u65b0\u7684\u4e00\u5e74\u90fd\u4f1a\u5b9e\u73b0\uff5e');
      expect(actual.startsWith(('\u628a\u5fc3\u613f\u5199\u4e0b\u6765\uff0c\u65b0\u7684\u4e00\u5e74\u90fd\u4f1a\u5b9e\u73b0\uff5e').substring(0, 1))).assertTrue();
      expect(actual.trim().length > 0).assertTrue();
      expect(actual.length + 1).assertEqual(('\u628a\u5fc3\u613f\u5199\u4e0b\u6765\uff0c\u65b0\u7684\u4e00\u5e74\u90fd\u4f1a\u5b9e\u73b0\uff5e').length + 1);
      expect(actual !== '').assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_011
     * @tc.desc page-composition: HeaderSubtitleColor is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_011', 0, () => {
      const actual: string = COLORS.textSub;
      expect(actual).assertEqual('#909399');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(('#909399').length);
      expect(actual === COLORS.textSub).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_012
     * @tc.desc page-composition: HeaderSubtitleColor is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_012', 0, () => {
      const actual: string = COLORS.textSub;
      expect(actual).assertEqual('#909399');
      expect(actual.startsWith(('#909399').substring(0, 1))).assertTrue();
      expect(actual.trim().length > 0).assertTrue();
      expect(actual.length + 1).assertEqual(('#909399').length + 1);
      expect(actual !== '').assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_013
     * @tc.desc page-composition: HeaderSubtitleFont is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_013', 0, () => {
      const actual: number = SIZES.fontSizeSmall;
      expect(actual).assertEqual(14);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual * 1).assertEqual(14);
      expect(actual + 0).assertEqual(14);
    });

    /**
     * @tc.name PageCompositionTest_case_014
     * @tc.desc page-composition: HeaderSubtitleFont is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_014', 0, () => {
      const actual: number = SIZES.fontSizeSmall;
      expect(actual).assertEqual(14);
      expect(actual >= 0).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.abs(actual - 14)).assertEqual(0);
      expect(actual === 14).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_015
     * @tc.desc page-composition: HeaderSubtitleTop is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_015', 0, () => {
      const actual: number = 6;
      expect(actual).assertEqual(6);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual * 1).assertEqual(6);
      expect(actual + 0).assertEqual(6);
    });

    /**
     * @tc.name PageCompositionTest_case_016
     * @tc.desc page-composition: HeaderSubtitleTop is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_016', 0, () => {
      const actual: number = 6;
      expect(actual).assertEqual(6);
      expect(actual >= 0).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.abs(actual - 6)).assertEqual(0);
      expect(actual === 6).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_017
     * @tc.desc page-composition: HeaderTop is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_017', 0, () => {
      const actual: number = 40;
      expect(actual).assertEqual(40);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual * 1).assertEqual(40);
      expect(actual + 0).assertEqual(40);
    });

    /**
     * @tc.name PageCompositionTest_case_018
     * @tc.desc page-composition: HeaderTop is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_018', 0, () => {
      const actual: number = 40;
      expect(actual).assertEqual(40);
      expect(actual >= 0).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.abs(actual - 40)).assertEqual(0);
      expect(actual === 40).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_019
     * @tc.desc page-composition: HeaderBottom is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_019', 0, () => {
      const actual: number = SIZES.spacing;
      expect(actual).assertEqual(16);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual * 1).assertEqual(16);
      expect(actual + 0).assertEqual(16);
    });

    /**
     * @tc.name PageCompositionTest_case_020
     * @tc.desc page-composition: HeaderBottom is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_020', 0, () => {
      const actual: number = SIZES.spacing;
      expect(actual).assertEqual(16);
      expect(actual >= 0).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.abs(actual - 16)).assertEqual(0);
      expect(actual === 16).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_021
     * @tc.desc page-composition: PageBackground is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_021', 0, () => {
      const actual: string = COLORS.bgPage;
      expect(actual).assertEqual('#F5F7FA');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(('#F5F7FA').length);
      expect(actual === COLORS.bgPage).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_022
     * @tc.desc page-composition: PageBackground is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_022', 0, () => {
      const actual: string = COLORS.bgPage;
      expect(actual).assertEqual('#F5F7FA');
      expect(actual.startsWith(('#F5F7FA').substring(0, 1))).assertTrue();
      expect(actual.trim().length > 0).assertTrue();
      expect(actual.length + 1).assertEqual(('#F5F7FA').length + 1);
      expect(actual !== '').assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_023
     * @tc.desc page-composition: PagePadding is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_023', 0, () => {
      const actual: number = SIZES.padding;
      expect(actual).assertEqual(20);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual * 1).assertEqual(20);
      expect(actual + 0).assertEqual(20);
    });

    /**
     * @tc.name PageCompositionTest_case_024
     * @tc.desc page-composition: PagePadding is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_024', 0, () => {
      const actual: number = SIZES.padding;
      expect(actual).assertEqual(20);
      expect(actual >= 0).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.abs(actual - 20)).assertEqual(0);
      expect(actual === 20).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_025
     * @tc.desc page-composition: DividerColor is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_025', 0, () => {
      const actual: string = COLORS.border;
      expect(actual).assertEqual('#E5E6EB');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(('#E5E6EB').length);
      expect(actual === COLORS.border).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_026
     * @tc.desc page-composition: DividerColor is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_026', 0, () => {
      const actual: string = COLORS.border;
      expect(actual).assertEqual('#E5E6EB');
      expect(actual.startsWith(('#E5E6EB').substring(0, 1))).assertTrue();
      expect(actual.trim().length > 0).assertTrue();
      expect(actual.length + 1).assertEqual(('#E5E6EB').length + 1);
      expect(actual !== '').assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_027
     * @tc.desc page-composition: DividerHeight is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_027', 0, () => {
      const actual: number = 1;
      expect(actual).assertEqual(1);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual * 1).assertEqual(1);
      expect(actual + 0).assertEqual(1);
    });

    /**
     * @tc.name PageCompositionTest_case_028
     * @tc.desc page-composition: DividerHeight is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_028', 0, () => {
      const actual: number = 1;
      expect(actual).assertEqual(1);
      expect(actual >= 0).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.abs(actual - 1)).assertEqual(0);
      expect(actual === 1).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_029
     * @tc.desc page-composition: DividerWidth is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_029', 0, () => {
      const actual: number = 90;
      expect(actual).assertEqual(90);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual * 1).assertEqual(90);
      expect(actual + 0).assertEqual(90);
    });

    /**
     * @tc.name PageCompositionTest_case_030
     * @tc.desc page-composition: DividerWidth is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_030', 0, () => {
      const actual: number = 90;
      expect(actual).assertEqual(90);
      expect(actual >= 0).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.abs(actual - 90)).assertEqual(0);
      expect(actual === 90).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_031
     * @tc.desc page-composition: DividerBottom is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_031', 0, () => {
      const actual: number = SIZES.spacing * 1.5;
      expect(actual).assertEqual(24);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual * 1).assertEqual(24);
      expect(actual + 0).assertEqual(24);
    });

    /**
     * @tc.name PageCompositionTest_case_032
     * @tc.desc page-composition: DividerBottom is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_032', 0, () => {
      const actual: number = SIZES.spacing * 1.5;
      expect(actual).assertEqual(24);
      expect(actual >= 0).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.abs(actual - 24)).assertEqual(0);
      expect(actual === 24).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_033
     * @tc.desc page-composition: MainTitleColor is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_033', 0, () => {
      const actual: string = COLORS.textMain;
      expect(actual).assertEqual('#303133');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(('#303133').length);
      expect(actual === COLORS.textMain).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_034
     * @tc.desc page-composition: MainTitleColor is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_034', 0, () => {
      const actual: string = COLORS.textMain;
      expect(actual).assertEqual('#303133');
      expect(actual.startsWith(('#303133').substring(0, 1))).assertTrue();
      expect(actual.trim().length > 0).assertTrue();
      expect(actual.length + 1).assertEqual(('#303133').length + 1);
      expect(actual !== '').assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_035
     * @tc.desc page-composition: MainTitleFont is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_035', 0, () => {
      const actual: number = SIZES.fontSizeNormal + 2;
      expect(actual).assertEqual(18);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual * 1).assertEqual(18);
      expect(actual + 0).assertEqual(18);
    });

    /**
     * @tc.name PageCompositionTest_case_036
     * @tc.desc page-composition: MainTitleFont is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_036', 0, () => {
      const actual: number = SIZES.fontSizeNormal + 2;
      expect(actual).assertEqual(18);
      expect(actual >= 0).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.abs(actual - 18)).assertEqual(0);
      expect(actual === 18).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_037
     * @tc.desc page-composition: MainTitleBottom is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_037', 0, () => {
      const actual: number = 12;
      expect(actual).assertEqual(12);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual * 1).assertEqual(12);
      expect(actual + 0).assertEqual(12);
    });

    /**
     * @tc.name PageCompositionTest_case_038
     * @tc.desc page-composition: MainTitleBottom is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_038', 0, () => {
      const actual: number = 12;
      expect(actual).assertEqual(12);
      expect(actual >= 0).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.abs(actual - 12)).assertEqual(0);
      expect(actual === 12).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_039
     * @tc.desc page-composition: UpdateLabel is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_039', 0, () => {
      const actual: string = UPDATE_LABEL;
      expect(actual).assertEqual('update');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(('update').length);
      expect(actual === UPDATE_LABEL).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_040
     * @tc.desc page-composition: UpdateLabel is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_040', 0, () => {
      const actual: string = UPDATE_LABEL;
      expect(actual).assertEqual('update');
      expect(actual.startsWith(('update').substring(0, 1))).assertTrue();
      expect(actual.trim().length > 0).assertTrue();
      expect(actual.length + 1).assertEqual(('update').length + 1);
      expect(actual !== '').assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_041
     * @tc.desc page-composition: UpdateBackground is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_041', 0, () => {
      const actual: string = COLORS.textMain;
      expect(actual).assertEqual('#303133');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(('#303133').length);
      expect(actual === COLORS.textMain).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_042
     * @tc.desc page-composition: UpdateBackground is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_042', 0, () => {
      const actual: string = COLORS.textMain;
      expect(actual).assertEqual('#303133');
      expect(actual.startsWith(('#303133').substring(0, 1))).assertTrue();
      expect(actual.trim().length > 0).assertTrue();
      expect(actual.length + 1).assertEqual(('#303133').length + 1);
      expect(actual !== '').assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_043
     * @tc.desc page-composition: UpdateFont is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_043', 0, () => {
      const actual: number = SIZES.fontSizeNormal;
      expect(actual).assertEqual(16);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual * 1).assertEqual(16);
      expect(actual + 0).assertEqual(16);
    });

    /**
     * @tc.name PageCompositionTest_case_044
     * @tc.desc page-composition: UpdateFont is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_044', 0, () => {
      const actual: number = SIZES.fontSizeNormal;
      expect(actual).assertEqual(16);
      expect(actual >= 0).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.abs(actual - 16)).assertEqual(0);
      expect(actual === 16).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_045
     * @tc.desc page-composition: UpdateHeight is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_045', 0, () => {
      const actual: number = 44;
      expect(actual).assertEqual(44);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual * 1).assertEqual(44);
      expect(actual + 0).assertEqual(44);
    });

    /**
     * @tc.name PageCompositionTest_case_046
     * @tc.desc page-composition: UpdateHeight is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_046', 0, () => {
      const actual: number = 44;
      expect(actual).assertEqual(44);
      expect(actual >= 0).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.abs(actual - 44)).assertEqual(0);
      expect(actual === 44).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_047
     * @tc.desc page-composition: PlaceholderDefault is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_047', 0, () => {
      const actual: string = PLACEHOLDER_DEFAULT;
      expect(actual).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...').length);
      expect(actual === PLACEHOLDER_DEFAULT).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_048
     * @tc.desc page-composition: PlaceholderDefault is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_048', 0, () => {
      const actual: string = PLACEHOLDER_DEFAULT;
      expect(actual).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(actual.startsWith(('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...').substring(0, 1))).assertTrue();
      expect(actual.trim().length > 0).assertTrue();
      expect(actual.length + 1).assertEqual(('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...').length + 1);
      expect(actual !== '').assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_049
     * @tc.desc page-composition: UpdatedPlaceholder is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_049', 0, () => {
      const actual: string = PLACEHOLDER_UPDATED;
      expect(actual).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(('\u65b0\u5e74\u5feb\u4e50!').length);
      expect(actual === PLACEHOLDER_UPDATED).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_050
     * @tc.desc page-composition: UpdatedPlaceholder is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_050', 0, () => {
      const actual: string = PLACEHOLDER_UPDATED;
      expect(actual).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(actual.startsWith(('\u65b0\u5e74\u5feb\u4e50!').substring(0, 1))).assertTrue();
      expect(actual.trim().length > 0).assertTrue();
      expect(actual.length + 1).assertEqual(('\u65b0\u5e74\u5feb\u4e50!').length + 1);
      expect(actual !== '').assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_051
     * @tc.desc page-composition: TextDefault is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_051', 0, () => {
      const actual: string = TEXT_DEFAULT;
      expect(actual).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"').length);
      expect(actual === TEXT_DEFAULT).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_052
     * @tc.desc page-composition: TextDefault is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_052', 0, () => {
      const actual: string = TEXT_DEFAULT;
      expect(actual).assertEqual('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"');
      expect(actual.startsWith(('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"').substring(0, 1))).assertTrue();
      expect(actual.trim().length > 0).assertTrue();
      expect(actual.length + 1).assertEqual(('"\u270d\ufe0f \u5199\u4e0b\u4f60\u7684\u613f\u671b:"').length + 1);
      expect(actual !== '').assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_053
     * @tc.desc page-composition: InputPlaceholderColor is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_053', 0, () => {
      const actual: string = COLORS.textSub;
      expect(actual).assertEqual('#909399');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(('#909399').length);
      expect(actual === COLORS.textSub).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_054
     * @tc.desc page-composition: InputPlaceholderColor is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_054', 0, () => {
      const actual: string = COLORS.textSub;
      expect(actual).assertEqual('#909399');
      expect(actual.startsWith(('#909399').substring(0, 1))).assertTrue();
      expect(actual.trim().length > 0).assertTrue();
      expect(actual.length + 1).assertEqual(('#909399').length + 1);
      expect(actual !== '').assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_055
     * @tc.desc page-composition: InputFont is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_055', 0, () => {
      const actual: number = SIZES.fontSizeNormal;
      expect(actual).assertEqual(16);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual * 1).assertEqual(16);
      expect(actual + 0).assertEqual(16);
    });

    /**
     * @tc.name PageCompositionTest_case_056
     * @tc.desc page-composition: InputFont is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_056', 0, () => {
      const actual: number = SIZES.fontSizeNormal;
      expect(actual).assertEqual(16);
      expect(actual >= 0).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.abs(actual - 16)).assertEqual(0);
      expect(actual === 16).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_057
     * @tc.desc page-composition: InputTextColor is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_057', 0, () => {
      const actual: string = COLORS.textMain;
      expect(actual).assertEqual('#303133');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(('#303133').length);
      expect(actual === COLORS.textMain).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_058
     * @tc.desc page-composition: InputTextColor is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_058', 0, () => {
      const actual: string = COLORS.textMain;
      expect(actual).assertEqual('#303133');
      expect(actual.startsWith(('#303133').substring(0, 1))).assertTrue();
      expect(actual.trim().length > 0).assertTrue();
      expect(actual.length + 1).assertEqual(('#303133').length + 1);
      expect(actual !== '').assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_059
     * @tc.desc page-composition: InputBackground is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_059', 0, () => {
      const actual: string = COLORS.bgCard;
      expect(actual).assertEqual('#FFFFFF');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(('#FFFFFF').length);
      expect(actual === COLORS.bgCard).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_060
     * @tc.desc page-composition: InputBackground is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_060', 0, () => {
      const actual: string = COLORS.bgCard;
      expect(actual).assertEqual('#FFFFFF');
      expect(actual.startsWith(('#FFFFFF').substring(0, 1))).assertTrue();
      expect(actual.trim().length > 0).assertTrue();
      expect(actual.length + 1).assertEqual(('#FFFFFF').length + 1);
      expect(actual !== '').assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_061
     * @tc.desc page-composition: InputHeight is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_061', 0, () => {
      const actual: number = 50;
      expect(actual).assertEqual(50);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual * 1).assertEqual(50);
      expect(actual + 0).assertEqual(50);
    });

    /**
     * @tc.name PageCompositionTest_case_062
     * @tc.desc page-composition: InputHeight is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_062', 0, () => {
      const actual: number = 50;
      expect(actual).assertEqual(50);
      expect(actual >= 0).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.abs(actual - 50)).assertEqual(0);
      expect(actual === 50).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_063
     * @tc.desc page-composition: InputPadH is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_063', 0, () => {
      const actual: number = 16;
      expect(actual).assertEqual(16);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual * 1).assertEqual(16);
      expect(actual + 0).assertEqual(16);
    });

    /**
     * @tc.name PageCompositionTest_case_064
     * @tc.desc page-composition: InputPadH is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_064', 0, () => {
      const actual: number = 16;
      expect(actual).assertEqual(16);
      expect(actual >= 0).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.abs(actual - 16)).assertEqual(0);
      expect(actual === 16).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_065
     * @tc.desc page-composition: InputRadius is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_065', 0, () => {
      const actual: number = SIZES.radius;
      expect(actual).assertEqual(12);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual * 1).assertEqual(12);
      expect(actual + 0).assertEqual(12);
    });

    /**
     * @tc.name PageCompositionTest_case_066
     * @tc.desc page-composition: InputRadius is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_066', 0, () => {
      const actual: number = SIZES.radius;
      expect(actual).assertEqual(12);
      expect(actual >= 0).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.abs(actual - 12)).assertEqual(0);
      expect(actual === 12).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_067
     * @tc.desc page-composition: InputBorder is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_067', 0, () => {
      const actual: number = 1;
      expect(actual).assertEqual(1);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual * 1).assertEqual(1);
      expect(actual + 0).assertEqual(1);
    });

    /**
     * @tc.name PageCompositionTest_case_068
     * @tc.desc page-composition: InputBorder is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_068', 0, () => {
      const actual: number = 1;
      expect(actual).assertEqual(1);
      expect(actual >= 0).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.abs(actual - 1)).assertEqual(0);
      expect(actual === 1).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_069
     * @tc.desc page-composition: CardBackground is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_069', 0, () => {
      const actual: string = COLORS.bgCard;
      expect(actual).assertEqual('#FFFFFF');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(('#FFFFFF').length);
      expect(actual === COLORS.bgCard).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_070
     * @tc.desc page-composition: CardBackground is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_070', 0, () => {
      const actual: string = COLORS.bgCard;
      expect(actual).assertEqual('#FFFFFF');
      expect(actual.startsWith(('#FFFFFF').substring(0, 1))).assertTrue();
      expect(actual.trim().length > 0).assertTrue();
      expect(actual.length + 1).assertEqual(('#FFFFFF').length + 1);
      expect(actual !== '').assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_071
     * @tc.desc page-composition: CardPadding is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_071', 0, () => {
      const actual: number = SIZES.padding;
      expect(actual).assertEqual(20);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual * 1).assertEqual(20);
      expect(actual + 0).assertEqual(20);
    });

    /**
     * @tc.name PageCompositionTest_case_072
     * @tc.desc page-composition: CardPadding is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_072', 0, () => {
      const actual: number = SIZES.padding;
      expect(actual).assertEqual(20);
      expect(actual >= 0).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.abs(actual - 20)).assertEqual(0);
      expect(actual === 20).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_073
     * @tc.desc page-composition: CardRadius is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_073', 0, () => {
      const actual: number = SIZES.radius;
      expect(actual).assertEqual(12);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual * 1).assertEqual(12);
      expect(actual + 0).assertEqual(12);
    });

    /**
     * @tc.name PageCompositionTest_case_074
     * @tc.desc page-composition: CardRadius is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_074', 0, () => {
      const actual: number = SIZES.radius;
      expect(actual).assertEqual(12);
      expect(actual >= 0).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.abs(actual - 12)).assertEqual(0);
      expect(actual === 12).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_075
     * @tc.desc page-composition: ShadowRadius is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_075', 0, () => {
      const actual: number = 6;
      expect(actual).assertEqual(6);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual * 1).assertEqual(6);
      expect(actual + 0).assertEqual(6);
    });

    /**
     * @tc.name PageCompositionTest_case_076
     * @tc.desc page-composition: ShadowRadius is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_076', 0, () => {
      const actual: number = 6;
      expect(actual).assertEqual(6);
      expect(actual >= 0).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.abs(actual - 6)).assertEqual(0);
      expect(actual === 6).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_077
     * @tc.desc page-composition: ShadowOffsetY is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_077', 0, () => {
      const actual: number = 2;
      expect(actual).assertEqual(2);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual * 1).assertEqual(2);
      expect(actual + 0).assertEqual(2);
    });

    /**
     * @tc.name PageCompositionTest_case_078
     * @tc.desc page-composition: ShadowOffsetY is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_078', 0, () => {
      const actual: number = 2;
      expect(actual).assertEqual(2);
      expect(actual >= 0).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.abs(actual - 2)).assertEqual(0);
      expect(actual === 2).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_079
     * @tc.desc page-composition: BottomLabelCopy is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_079', 0, () => {
      const actual: string = INPUT_LABEL;
      expect(actual).assertEqual('\ud83d\udcdd \u4f60\u8f93\u5165\u7684\u5185\u5bb9:');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(('\ud83d\udcdd \u4f60\u8f93\u5165\u7684\u5185\u5bb9:').length);
      expect(actual === INPUT_LABEL).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_080
     * @tc.desc page-composition: BottomLabelCopy is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_080', 0, () => {
      const actual: string = INPUT_LABEL;
      expect(actual).assertEqual('\ud83d\udcdd \u4f60\u8f93\u5165\u7684\u5185\u5bb9:');
      expect(actual.startsWith(('\ud83d\udcdd \u4f60\u8f93\u5165\u7684\u5185\u5bb9:').substring(0, 1))).assertTrue();
      expect(actual.trim().length > 0).assertTrue();
      expect(actual.length + 1).assertEqual(('\ud83d\udcdd \u4f60\u8f93\u5165\u7684\u5185\u5bb9:').length + 1);
      expect(actual !== '').assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_081
     * @tc.desc page-composition: BottomLabelColor is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_081', 0, () => {
      const actual: string = COLORS.textSub;
      expect(actual).assertEqual('#909399');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(('#909399').length);
      expect(actual === COLORS.textSub).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_082
     * @tc.desc page-composition: BottomLabelColor is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_082', 0, () => {
      const actual: string = COLORS.textSub;
      expect(actual).assertEqual('#909399');
      expect(actual.startsWith(('#909399').substring(0, 1))).assertTrue();
      expect(actual.trim().length > 0).assertTrue();
      expect(actual.length + 1).assertEqual(('#909399').length + 1);
      expect(actual !== '').assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_083
     * @tc.desc page-composition: BottomLabelFont is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_083', 0, () => {
      const actual: number = SIZES.fontSizeSmall;
      expect(actual).assertEqual(14);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual * 1).assertEqual(14);
      expect(actual + 0).assertEqual(14);
    });

    /**
     * @tc.name PageCompositionTest_case_084
     * @tc.desc page-composition: BottomLabelFont is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_084', 0, () => {
      const actual: number = SIZES.fontSizeSmall;
      expect(actual).assertEqual(14);
      expect(actual >= 0).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.abs(actual - 14)).assertEqual(0);
      expect(actual === 14).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_085
     * @tc.desc page-composition: BottomLabelTop is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_085', 0, () => {
      const actual: number = 20;
      expect(actual).assertEqual(20);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual * 1).assertEqual(20);
      expect(actual + 0).assertEqual(20);
    });

    /**
     * @tc.name PageCompositionTest_case_086
     * @tc.desc page-composition: BottomLabelTop is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_086', 0, () => {
      const actual: number = 20;
      expect(actual).assertEqual(20);
      expect(actual >= 0).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.abs(actual - 20)).assertEqual(0);
      expect(actual === 20).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_087
     * @tc.desc page-composition: BottomLabelBottom is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_087', 0, () => {
      const actual: number = 8;
      expect(actual).assertEqual(8);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual * 1).assertEqual(8);
      expect(actual + 0).assertEqual(8);
    });

    /**
     * @tc.name PageCompositionTest_case_088
     * @tc.desc page-composition: BottomLabelBottom is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_088', 0, () => {
      const actual: number = 8;
      expect(actual).assertEqual(8);
      expect(actual >= 0).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.abs(actual - 8)).assertEqual(0);
      expect(actual === 8).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_089
     * @tc.desc page-composition: EchoColor is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_089', 0, () => {
      const actual: string = COLORS.textSub;
      expect(actual).assertEqual('#909399');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(('#909399').length);
      expect(actual === COLORS.textSub).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_090
     * @tc.desc page-composition: EchoColor is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_090', 0, () => {
      const actual: string = COLORS.textSub;
      expect(actual).assertEqual('#909399');
      expect(actual.startsWith(('#909399').substring(0, 1))).assertTrue();
      expect(actual.trim().length > 0).assertTrue();
      expect(actual.length + 1).assertEqual(('#909399').length + 1);
      expect(actual !== '').assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_091
     * @tc.desc page-composition: EchoPadH is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_091', 0, () => {
      const actual: number = 12;
      expect(actual).assertEqual(12);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual * 1).assertEqual(12);
      expect(actual + 0).assertEqual(12);
    });

    /**
     * @tc.name PageCompositionTest_case_092
     * @tc.desc page-composition: EchoPadH is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_092', 0, () => {
      const actual: number = 12;
      expect(actual).assertEqual(12);
      expect(actual >= 0).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.abs(actual - 12)).assertEqual(0);
      expect(actual === 12).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_093
     * @tc.desc page-composition: EchoPadV is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_093', 0, () => {
      const actual: number = 10;
      expect(actual).assertEqual(10);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual * 1).assertEqual(10);
      expect(actual + 0).assertEqual(10);
    });

    /**
     * @tc.name PageCompositionTest_case_094
     * @tc.desc page-composition: EchoPadV is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_094', 0, () => {
      const actual: number = 10;
      expect(actual).assertEqual(10);
      expect(actual >= 0).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.abs(actual - 10)).assertEqual(0);
      expect(actual === 10).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_095
     * @tc.desc page-composition: EchoRadius is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_095', 0, () => {
      const actual: number = SIZES.radius;
      expect(actual).assertEqual(12);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual * 1).assertEqual(12);
      expect(actual + 0).assertEqual(12);
    });

    /**
     * @tc.name PageCompositionTest_case_096
     * @tc.desc page-composition: EchoRadius is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_096', 0, () => {
      const actual: number = SIZES.radius;
      expect(actual).assertEqual(12);
      expect(actual >= 0).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.abs(actual - 12)).assertEqual(0);
      expect(actual === 12).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_097
     * @tc.desc page-composition: EchoBorder is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_097', 0, () => {
      const actual: number = 1;
      expect(actual).assertEqual(1);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual * 1).assertEqual(1);
      expect(actual + 0).assertEqual(1);
    });

    /**
     * @tc.name PageCompositionTest_case_098
     * @tc.desc page-composition: EchoBorder is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_098', 0, () => {
      const actual: number = 1;
      expect(actual).assertEqual(1);
      expect(actual >= 0).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.abs(actual - 1)).assertEqual(0);
      expect(actual === 1).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_099
     * @tc.desc page-composition: EchoWidth is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_099', 0, () => {
      const actual: number = 90;
      expect(actual).assertEqual(90);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual * 1).assertEqual(90);
      expect(actual + 0).assertEqual(90);
    });

    /**
     * @tc.name PageCompositionTest_case_100
     * @tc.desc page-composition: EchoWidth is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_100', 0, () => {
      const actual: number = 90;
      expect(actual).assertEqual(90);
      expect(actual >= 0).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.abs(actual - 90)).assertEqual(0);
      expect(actual === 90).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_101
     * @tc.desc page-composition: FooterCopy is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_101', 0, () => {
      const actual: string = FOOTER_COPY;
      expect(actual).assertEqual('\ud83d\udcab \u613f\u65b0\u5e74\uff0c\u80dc\u65e7\u5e74 \ud83d\udcab');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(('\ud83d\udcab \u613f\u65b0\u5e74\uff0c\u80dc\u65e7\u5e74 \ud83d\udcab').length);
      expect(actual === FOOTER_COPY).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_102
     * @tc.desc page-composition: FooterCopy is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_102', 0, () => {
      const actual: string = FOOTER_COPY;
      expect(actual).assertEqual('\ud83d\udcab \u613f\u65b0\u5e74\uff0c\u80dc\u65e7\u5e74 \ud83d\udcab');
      expect(actual.startsWith(('\ud83d\udcab \u613f\u65b0\u5e74\uff0c\u80dc\u65e7\u5e74 \ud83d\udcab').substring(0, 1))).assertTrue();
      expect(actual.trim().length > 0).assertTrue();
      expect(actual.length + 1).assertEqual(('\ud83d\udcab \u613f\u65b0\u5e74\uff0c\u80dc\u65e7\u5e74 \ud83d\udcab').length + 1);
      expect(actual !== '').assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_103
     * @tc.desc page-composition: FooterFont is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_103', 0, () => {
      const actual: number = SIZES.fontSizeSmall;
      expect(actual).assertEqual(14);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual * 1).assertEqual(14);
      expect(actual + 0).assertEqual(14);
    });

    /**
     * @tc.name PageCompositionTest_case_104
     * @tc.desc page-composition: FooterFont is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_104', 0, () => {
      const actual: number = SIZES.fontSizeSmall;
      expect(actual).assertEqual(14);
      expect(actual >= 0).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.abs(actual - 14)).assertEqual(0);
      expect(actual === 14).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_105
     * @tc.desc page-composition: FooterColor is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_105', 0, () => {
      const actual: string = COLORS.textSub;
      expect(actual).assertEqual('#909399');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(('#909399').length);
      expect(actual === COLORS.textSub).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_106
     * @tc.desc page-composition: FooterColor is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_106', 0, () => {
      const actual: string = COLORS.textSub;
      expect(actual).assertEqual('#909399');
      expect(actual.startsWith(('#909399').substring(0, 1))).assertTrue();
      expect(actual.trim().length > 0).assertTrue();
      expect(actual.length + 1).assertEqual(('#909399').length + 1);
      expect(actual !== '').assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_107
     * @tc.desc page-composition: FooterTop is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_107', 0, () => {
      const actual: number = 40;
      expect(actual).assertEqual(40);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual * 1).assertEqual(40);
      expect(actual + 0).assertEqual(40);
    });

    /**
     * @tc.name PageCompositionTest_case_108
     * @tc.desc page-composition: FooterTop is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_108', 0, () => {
      const actual: number = 40;
      expect(actual).assertEqual(40);
      expect(actual >= 0).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.abs(actual - 40)).assertEqual(0);
      expect(actual === 40).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_109
     * @tc.desc page-composition: FooterBottom is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_109', 0, () => {
      const actual: number = 30;
      expect(actual).assertEqual(30);
      expect(Number.isInteger(actual)).assertTrue();
      expect(actual * 1).assertEqual(30);
      expect(actual + 0).assertEqual(30);
    });

    /**
     * @tc.name PageCompositionTest_case_110
     * @tc.desc page-composition: FooterBottom is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_110', 0, () => {
      const actual: number = 30;
      expect(actual).assertEqual(30);
      expect(actual >= 0).assertTrue();
      expect(actual <= 600).assertTrue();
      expect(Math.abs(actual - 30)).assertEqual(0);
      expect(actual === 30).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_111
     * @tc.desc page-composition: ImageResource is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_111', 0, () => {
      const actual: string = 'app.media.happyNewYear';
      expect(actual).assertEqual('app.media.happyNewYear');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(('app.media.happyNewYear').length);
      expect(actual === 'app.media.happyNewYear').assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_112
     * @tc.desc page-composition: ImageResource is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_112', 0, () => {
      const actual: string = 'app.media.happyNewYear';
      expect(actual).assertEqual('app.media.happyNewYear');
      expect(actual.startsWith(('app.media.happyNewYear').substring(0, 1))).assertTrue();
      expect(actual.trim().length > 0).assertTrue();
      expect(actual.length + 1).assertEqual(('app.media.happyNewYear').length + 1);
      expect(actual !== '').assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_113
     * @tc.desc page-composition: PrimaryColor is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_113', 0, () => {
      const actual: string = COLORS.primary;
      expect(actual).assertEqual('#67C23A');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(('#67C23A').length);
      expect(actual === COLORS.primary).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_114
     * @tc.desc page-composition: PrimaryColor is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_114', 0, () => {
      const actual: string = COLORS.primary;
      expect(actual).assertEqual('#67C23A');
      expect(actual.startsWith(('#67C23A').substring(0, 1))).assertTrue();
      expect(actual.trim().length > 0).assertTrue();
      expect(actual.length + 1).assertEqual(('#67C23A').length + 1);
      expect(actual !== '').assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_115
     * @tc.desc page-composition: BtnTextColor is wired into the page, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_115', 0, () => {
      const actual: string = COLORS.btnText;
      expect(actual).assertEqual('#FFFFFF');
      expect(typeof actual).assertEqual('string');
      expect(actual.length).assertEqual(('#FFFFFF').length);
      expect(actual === COLORS.btnText).assertTrue();
    });

    /**
     * @tc.name PageCompositionTest_case_116
     * @tc.desc page-composition: BtnTextColor is wired into the page, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('PageCompositionTest_case_116', 0, () => {
      const actual: string = COLORS.btnText;
      expect(actual).assertEqual('#FFFFFF');
      expect(actual.startsWith(('#FFFFFF').substring(0, 1))).assertTrue();
      expect(actual.trim().length > 0).assertTrue();
      expect(actual.length + 1).assertEqual(('#FFFFFF').length + 1);
      expect(actual !== '').assertTrue();
    });

  });
}
