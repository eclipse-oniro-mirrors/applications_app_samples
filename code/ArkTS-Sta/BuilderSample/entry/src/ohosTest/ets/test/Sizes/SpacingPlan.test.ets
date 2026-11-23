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
import { hexChannel, channelSum, toHex, round4, relativeLuminance } from '../Shared/ColorMath';
import { logSuite } from '../Shared/Copy';

export default function SpacingPlanTest(): void {
  describe('SpacingPlanTest', () => {
    beforeAll(() => {
      logSuite('SpacingPlanTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('SpacingPlanTest', 'end');
    });

    /**
     * @tc.name SpacingPlanTest_case_001
     * @tc.desc spacing-plan: PageHorizontalInset = SIZES.padding * 2, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_001', 0, () => {
      const band: number = SIZES.padding * 2;
      expect(band).assertEqual(40);
      expect(band >= 0).assertTrue();
      expect(band <= 120).assertTrue();
      expect(Math.round((band / 2) * 10000) / 10000).assertEqual(20.0000);
      expect(Math.round(band * 10000) / 10000).assertEqual(40.0000);
      expect(band - band).assertEqual(0);
      expect(band + band).assertEqual(80);
    });

    /**
     * @tc.name SpacingPlanTest_case_002
     * @tc.desc spacing-plan: PageHorizontalInset = SIZES.padding * 2, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_002', 0, () => {
      const band: number = SIZES.padding * 2;
      expect(band).assertEqual(40);
      expect(band >= 0).assertTrue();
      expect(band <= 120).assertTrue();
      expect(band * 2).assertEqual(80);
      expect(Math.max(band, 0)).assertEqual(40);
      expect(Math.min(band, 0)).assertEqual(0);
      expect(Number.isFinite(band)).assertTrue();
      expect(band > -1).assertTrue();
    });

    /**
     * @tc.name SpacingPlanTest_case_003
     * @tc.desc spacing-plan: HeaderVerticalBand = 40 + SIZES.spacing, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_003', 0, () => {
      const band: number = 40 + SIZES.spacing;
      expect(band).assertEqual(56);
      expect(band >= 0).assertTrue();
      expect(band <= 168).assertTrue();
      expect(Math.round((band / 2) * 10000) / 10000).assertEqual(28.0000);
      expect(Math.round(band * 10000) / 10000).assertEqual(56.0000);
      expect(band - band).assertEqual(0);
      expect(band + band).assertEqual(112);
    });

    /**
     * @tc.name SpacingPlanTest_case_004
     * @tc.desc spacing-plan: HeaderVerticalBand = 40 + SIZES.spacing, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_004', 0, () => {
      const band: number = 40 + SIZES.spacing;
      expect(band).assertEqual(56);
      expect(band >= 0).assertTrue();
      expect(band <= 168).assertTrue();
      expect(band * 2).assertEqual(112);
      expect(Math.max(band, 0)).assertEqual(56);
      expect(Math.min(band, 0)).assertEqual(0);
      expect(Number.isFinite(band)).assertTrue();
      expect(band > -1).assertTrue();
    });

    /**
     * @tc.name SpacingPlanTest_case_005
     * @tc.desc spacing-plan: DividerBottomBand = SIZES.spacing * 1.5, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_005', 0, () => {
      const band: number = SIZES.spacing * 1.5;
      expect(band).assertEqual(24);
      expect(band >= 0).assertTrue();
      expect(band <= 100).assertTrue();
      expect(Math.round((band / 2) * 10000) / 10000).assertEqual(12.0000);
      expect(Math.round(band * 10000) / 10000).assertEqual(24.0000);
      expect(band - band).assertEqual(0);
      expect(band + band).assertEqual(48);
    });

    /**
     * @tc.name SpacingPlanTest_case_006
     * @tc.desc spacing-plan: DividerBottomBand = SIZES.spacing * 1.5, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_006', 0, () => {
      const band: number = SIZES.spacing * 1.5;
      expect(band).assertEqual(24);
      expect(band >= 0).assertTrue();
      expect(band <= 100).assertTrue();
      expect(band * 2).assertEqual(48);
      expect(Math.max(band, 0)).assertEqual(24);
      expect(Math.min(band, 0)).assertEqual(0);
      expect(Number.isFinite(band)).assertTrue();
      expect(band > -1).assertTrue();
    });

    /**
     * @tc.name SpacingPlanTest_case_007
     * @tc.desc spacing-plan: MainTitleBand = SIZES.fontSizeNormal + 2 + 12, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_007', 0, () => {
      const band: number = SIZES.fontSizeNormal + 2 + 12;
      expect(band).assertEqual(30);
      expect(band >= 0).assertTrue();
      expect(band <= 100).assertTrue();
      expect(Math.round((band / 2) * 10000) / 10000).assertEqual(15.0000);
      expect(Math.round(band * 10000) / 10000).assertEqual(30.0000);
      expect(band - band).assertEqual(0);
      expect(band + band).assertEqual(60);
    });

    /**
     * @tc.name SpacingPlanTest_case_008
     * @tc.desc spacing-plan: MainTitleBand = SIZES.fontSizeNormal + 2 + 12, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_008', 0, () => {
      const band: number = SIZES.fontSizeNormal + 2 + 12;
      expect(band).assertEqual(30);
      expect(band >= 0).assertTrue();
      expect(band <= 100).assertTrue();
      expect(band * 2).assertEqual(60);
      expect(Math.max(band, 0)).assertEqual(30);
      expect(Math.min(band, 0)).assertEqual(0);
      expect(Number.isFinite(band)).assertTrue();
      expect(band > -1).assertTrue();
    });

    /**
     * @tc.name SpacingPlanTest_case_009
     * @tc.desc spacing-plan: ButtonTopGap = SIZES.fontSizeNormal + 2 - 12, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_009', 0, () => {
      const band: number = SIZES.fontSizeNormal + 2 - 12;
      expect(band).assertEqual(6);
      expect(band >= 0).assertTrue();
      expect(band <= 100).assertTrue();
      expect(Math.round((band / 2) * 10000) / 10000).assertEqual(3.0000);
      expect(Math.round(band * 10000) / 10000).assertEqual(6.0000);
      expect(band - band).assertEqual(0);
      expect(band + band).assertEqual(12);
    });

    /**
     * @tc.name SpacingPlanTest_case_010
     * @tc.desc spacing-plan: ButtonTopGap = SIZES.fontSizeNormal + 2 - 12, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_010', 0, () => {
      const band: number = SIZES.fontSizeNormal + 2 - 12;
      expect(band).assertEqual(6);
      expect(band >= 0).assertTrue();
      expect(band <= 100).assertTrue();
      expect(band * 2).assertEqual(12);
      expect(Math.max(band, 0)).assertEqual(6);
      expect(Math.min(band, 0)).assertEqual(0);
      expect(Number.isFinite(band)).assertTrue();
      expect(band > -1).assertTrue();
    });

    /**
     * @tc.name SpacingPlanTest_case_011
     * @tc.desc spacing-plan: InputInnerHeight = 50 - SIZES.padding, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_011', 0, () => {
      const band: number = 50 - SIZES.padding;
      expect(band).assertEqual(30);
      expect(band >= 0).assertTrue();
      expect(band <= 100).assertTrue();
      expect(Math.round((band / 2) * 10000) / 10000).assertEqual(15.0000);
      expect(Math.round(band * 10000) / 10000).assertEqual(30.0000);
      expect(band - band).assertEqual(0);
      expect(band + band).assertEqual(60);
    });

    /**
     * @tc.name SpacingPlanTest_case_012
     * @tc.desc spacing-plan: InputInnerHeight = 50 - SIZES.padding, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_012', 0, () => {
      const band: number = 50 - SIZES.padding;
      expect(band).assertEqual(30);
      expect(band >= 0).assertTrue();
      expect(band <= 100).assertTrue();
      expect(band * 2).assertEqual(60);
      expect(Math.max(band, 0)).assertEqual(30);
      expect(Math.min(band, 0)).assertEqual(0);
      expect(Number.isFinite(band)).assertTrue();
      expect(band > -1).assertTrue();
    });

    /**
     * @tc.name SpacingPlanTest_case_013
     * @tc.desc spacing-plan: InputOuterHeight = 50 + SIZES.padding * 2, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_013', 0, () => {
      const band: number = 50 + SIZES.padding * 2;
      expect(band).assertEqual(90);
      expect(band >= 0).assertTrue();
      expect(band <= 270).assertTrue();
      expect(Math.round((band / 2) * 10000) / 10000).assertEqual(45.0000);
      expect(Math.round(band * 10000) / 10000).assertEqual(90.0000);
      expect(band - band).assertEqual(0);
      expect(band + band).assertEqual(180);
    });

    /**
     * @tc.name SpacingPlanTest_case_014
     * @tc.desc spacing-plan: InputOuterHeight = 50 + SIZES.padding * 2, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_014', 0, () => {
      const band: number = 50 + SIZES.padding * 2;
      expect(band).assertEqual(90);
      expect(band >= 0).assertTrue();
      expect(band <= 270).assertTrue();
      expect(band * 2).assertEqual(180);
      expect(Math.max(band, 0)).assertEqual(90);
      expect(Math.min(band, 0)).assertEqual(0);
      expect(Number.isFinite(band)).assertTrue();
      expect(band > -1).assertTrue();
    });

    /**
     * @tc.name SpacingPlanTest_case_015
     * @tc.desc spacing-plan: CardInnerWidth = 100 - SIZES.padding, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_015', 0, () => {
      const band: number = 100 - SIZES.padding;
      expect(band).assertEqual(80);
      expect(band >= 0).assertTrue();
      expect(band <= 240).assertTrue();
      expect(Math.round((band / 2) * 10000) / 10000).assertEqual(40.0000);
      expect(Math.round(band * 10000) / 10000).assertEqual(80.0000);
      expect(band - band).assertEqual(0);
      expect(band + band).assertEqual(160);
    });

    /**
     * @tc.name SpacingPlanTest_case_016
     * @tc.desc spacing-plan: CardInnerWidth = 100 - SIZES.padding, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_016', 0, () => {
      const band: number = 100 - SIZES.padding;
      expect(band).assertEqual(80);
      expect(band >= 0).assertTrue();
      expect(band <= 240).assertTrue();
      expect(band * 2).assertEqual(160);
      expect(Math.max(band, 0)).assertEqual(80);
      expect(Math.min(band, 0)).assertEqual(0);
      expect(Number.isFinite(band)).assertTrue();
      expect(band > -1).assertTrue();
    });

    /**
     * @tc.name SpacingPlanTest_case_017
     * @tc.desc spacing-plan: BottomLabelBand = 20 + 8, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_017', 0, () => {
      const band: number = 20 + 8;
      expect(band).assertEqual(28);
      expect(band >= 0).assertTrue();
      expect(band <= 100).assertTrue();
      expect(Math.round((band / 2) * 10000) / 10000).assertEqual(14.0000);
      expect(Math.round(band * 10000) / 10000).assertEqual(28.0000);
      expect(band - band).assertEqual(0);
      expect(band + band).assertEqual(56);
    });

    /**
     * @tc.name SpacingPlanTest_case_018
     * @tc.desc spacing-plan: BottomLabelBand = 20 + 8, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_018', 0, () => {
      const band: number = 20 + 8;
      expect(band).assertEqual(28);
      expect(band >= 0).assertTrue();
      expect(band <= 100).assertTrue();
      expect(band * 2).assertEqual(56);
      expect(Math.max(band, 0)).assertEqual(28);
      expect(Math.min(band, 0)).assertEqual(0);
      expect(Number.isFinite(band)).assertTrue();
      expect(band > -1).assertTrue();
    });

    /**
     * @tc.name SpacingPlanTest_case_019
     * @tc.desc spacing-plan: EchoVerticalBand = 10 + 10, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_019', 0, () => {
      const band: number = 10 + 10;
      expect(band).assertEqual(20);
      expect(band >= 0).assertTrue();
      expect(band <= 100).assertTrue();
      expect(Math.round((band / 2) * 10000) / 10000).assertEqual(10.0000);
      expect(Math.round(band * 10000) / 10000).assertEqual(20.0000);
      expect(band - band).assertEqual(0);
      expect(band + band).assertEqual(40);
    });

    /**
     * @tc.name SpacingPlanTest_case_020
     * @tc.desc spacing-plan: EchoVerticalBand = 10 + 10, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_020', 0, () => {
      const band: number = 10 + 10;
      expect(band).assertEqual(20);
      expect(band >= 0).assertTrue();
      expect(band <= 100).assertTrue();
      expect(band * 2).assertEqual(40);
      expect(Math.max(band, 0)).assertEqual(20);
      expect(Math.min(band, 0)).assertEqual(0);
      expect(Number.isFinite(band)).assertTrue();
      expect(band > -1).assertTrue();
    });

    /**
     * @tc.name SpacingPlanTest_case_021
     * @tc.desc spacing-plan: EchoHorizontalBand = 12 + 12, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_021', 0, () => {
      const band: number = 12 + 12;
      expect(band).assertEqual(24);
      expect(band >= 0).assertTrue();
      expect(band <= 100).assertTrue();
      expect(Math.round((band / 2) * 10000) / 10000).assertEqual(12.0000);
      expect(Math.round(band * 10000) / 10000).assertEqual(24.0000);
      expect(band - band).assertEqual(0);
      expect(band + band).assertEqual(48);
    });

    /**
     * @tc.name SpacingPlanTest_case_022
     * @tc.desc spacing-plan: EchoHorizontalBand = 12 + 12, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_022', 0, () => {
      const band: number = 12 + 12;
      expect(band).assertEqual(24);
      expect(band >= 0).assertTrue();
      expect(band <= 100).assertTrue();
      expect(band * 2).assertEqual(48);
      expect(Math.max(band, 0)).assertEqual(24);
      expect(Math.min(band, 0)).assertEqual(0);
      expect(Number.isFinite(band)).assertTrue();
      expect(band > -1).assertTrue();
    });

    /**
     * @tc.name SpacingPlanTest_case_023
     * @tc.desc spacing-plan: FooterVerticalBand = 40 + 30, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_023', 0, () => {
      const band: number = 40 + 30;
      expect(band).assertEqual(70);
      expect(band >= 0).assertTrue();
      expect(band <= 210).assertTrue();
      expect(Math.round((band / 2) * 10000) / 10000).assertEqual(35.0000);
      expect(Math.round(band * 10000) / 10000).assertEqual(70.0000);
      expect(band - band).assertEqual(0);
      expect(band + band).assertEqual(140);
    });

    /**
     * @tc.name SpacingPlanTest_case_024
     * @tc.desc spacing-plan: FooterVerticalBand = 40 + 30, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_024', 0, () => {
      const band: number = 40 + 30;
      expect(band).assertEqual(70);
      expect(band >= 0).assertTrue();
      expect(band <= 210).assertTrue();
      expect(band * 2).assertEqual(140);
      expect(Math.max(band, 0)).assertEqual(70);
      expect(Math.min(band, 0)).assertEqual(0);
      expect(Number.isFinite(band)).assertTrue();
      expect(band > -1).assertTrue();
    });

    /**
     * @tc.name SpacingPlanTest_case_025
     * @tc.desc spacing-plan: TitleSubtitleGap = SIZES.fontSizeTitle - SIZES.fontSizeNormal, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_025', 0, () => {
      const band: number = SIZES.fontSizeTitle - SIZES.fontSizeNormal;
      expect(band).assertEqual(6);
      expect(band >= 0).assertTrue();
      expect(band <= 100).assertTrue();
      expect(Math.round((band / 2) * 10000) / 10000).assertEqual(3.0000);
      expect(Math.round(band * 10000) / 10000).assertEqual(6.0000);
      expect(band - band).assertEqual(0);
      expect(band + band).assertEqual(12);
    });

    /**
     * @tc.name SpacingPlanTest_case_026
     * @tc.desc spacing-plan: TitleSubtitleGap = SIZES.fontSizeTitle - SIZES.fontSizeNormal, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_026', 0, () => {
      const band: number = SIZES.fontSizeTitle - SIZES.fontSizeNormal;
      expect(band).assertEqual(6);
      expect(band >= 0).assertTrue();
      expect(band <= 100).assertTrue();
      expect(band * 2).assertEqual(12);
      expect(Math.max(band, 0)).assertEqual(6);
      expect(Math.min(band, 0)).assertEqual(0);
      expect(Number.isFinite(band)).assertTrue();
      expect(band > -1).assertTrue();
    });

    /**
     * @tc.name SpacingPlanTest_case_027
     * @tc.desc spacing-plan: BodyCaptionGap = SIZES.fontSizeNormal - SIZES.fontSizeSmall, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_027', 0, () => {
      const band: number = SIZES.fontSizeNormal - SIZES.fontSizeSmall;
      expect(band).assertEqual(2);
      expect(band >= 0).assertTrue();
      expect(band <= 100).assertTrue();
      expect(Math.round((band / 2) * 10000) / 10000).assertEqual(1.0000);
      expect(Math.round(band * 10000) / 10000).assertEqual(2.0000);
      expect(band - band).assertEqual(0);
      expect(band + band).assertEqual(4);
    });

    /**
     * @tc.name SpacingPlanTest_case_028
     * @tc.desc spacing-plan: BodyCaptionGap = SIZES.fontSizeNormal - SIZES.fontSizeSmall, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_028', 0, () => {
      const band: number = SIZES.fontSizeNormal - SIZES.fontSizeSmall;
      expect(band).assertEqual(2);
      expect(band >= 0).assertTrue();
      expect(band <= 100).assertTrue();
      expect(band * 2).assertEqual(4);
      expect(Math.max(band, 0)).assertEqual(2);
      expect(Math.min(band, 0)).assertEqual(0);
      expect(Number.isFinite(band)).assertTrue();
      expect(band > -1).assertTrue();
    });

    /**
     * @tc.name SpacingPlanTest_case_029
     * @tc.desc spacing-plan: RadiusPaddingGap = SIZES.padding - SIZES.radius, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_029', 0, () => {
      const band: number = SIZES.padding - SIZES.radius;
      expect(band).assertEqual(8);
      expect(band >= 0).assertTrue();
      expect(band <= 100).assertTrue();
      expect(Math.round((band / 2) * 10000) / 10000).assertEqual(4.0000);
      expect(Math.round(band * 10000) / 10000).assertEqual(8.0000);
      expect(band - band).assertEqual(0);
      expect(band + band).assertEqual(16);
    });

    /**
     * @tc.name SpacingPlanTest_case_030
     * @tc.desc spacing-plan: RadiusPaddingGap = SIZES.padding - SIZES.radius, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_030', 0, () => {
      const band: number = SIZES.padding - SIZES.radius;
      expect(band).assertEqual(8);
      expect(band >= 0).assertTrue();
      expect(band <= 100).assertTrue();
      expect(band * 2).assertEqual(16);
      expect(Math.max(band, 0)).assertEqual(8);
      expect(Math.min(band, 0)).assertEqual(0);
      expect(Number.isFinite(band)).assertTrue();
      expect(band > -1).assertTrue();
    });

    /**
     * @tc.name SpacingPlanTest_case_031
     * @tc.desc spacing-plan: SpacingRadiusGap = SIZES.spacing - SIZES.radius, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_031', 0, () => {
      const band: number = SIZES.spacing - SIZES.radius;
      expect(band).assertEqual(4);
      expect(band >= 0).assertTrue();
      expect(band <= 100).assertTrue();
      expect(Math.round((band / 2) * 10000) / 10000).assertEqual(2.0000);
      expect(Math.round(band * 10000) / 10000).assertEqual(4.0000);
      expect(band - band).assertEqual(0);
      expect(band + band).assertEqual(8);
    });

    /**
     * @tc.name SpacingPlanTest_case_032
     * @tc.desc spacing-plan: SpacingRadiusGap = SIZES.spacing - SIZES.radius, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_032', 0, () => {
      const band: number = SIZES.spacing - SIZES.radius;
      expect(band).assertEqual(4);
      expect(band >= 0).assertTrue();
      expect(band <= 100).assertTrue();
      expect(band * 2).assertEqual(8);
      expect(Math.max(band, 0)).assertEqual(4);
      expect(Math.min(band, 0)).assertEqual(0);
      expect(Number.isFinite(band)).assertTrue();
      expect(band > -1).assertTrue();
    });

    /**
     * @tc.name SpacingPlanTest_case_033
     * @tc.desc spacing-plan: DoublePaddingBand = SIZES.padding * 2, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_033', 0, () => {
      const band: number = SIZES.padding * 2;
      expect(band).assertEqual(40);
      expect(band >= 0).assertTrue();
      expect(band <= 120).assertTrue();
      expect(Math.round((band / 2) * 10000) / 10000).assertEqual(20.0000);
      expect(Math.round(band * 10000) / 10000).assertEqual(40.0000);
      expect(band - band).assertEqual(0);
      expect(band + band).assertEqual(80);
    });

    /**
     * @tc.name SpacingPlanTest_case_034
     * @tc.desc spacing-plan: DoublePaddingBand = SIZES.padding * 2, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_034', 0, () => {
      const band: number = SIZES.padding * 2;
      expect(band).assertEqual(40);
      expect(band >= 0).assertTrue();
      expect(band <= 120).assertTrue();
      expect(band * 2).assertEqual(80);
      expect(Math.max(band, 0)).assertEqual(40);
      expect(Math.min(band, 0)).assertEqual(0);
      expect(Number.isFinite(band)).assertTrue();
      expect(band > -1).assertTrue();
    });

    /**
     * @tc.name SpacingPlanTest_case_035
     * @tc.desc spacing-plan: HalfSpacing = SIZES.spacing / 2, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_035', 0, () => {
      const band: number = SIZES.spacing / 2;
      expect(band).assertEqual(8);
      expect(band >= 0).assertTrue();
      expect(band <= 100).assertTrue();
      expect(Math.round((band / 2) * 10000) / 10000).assertEqual(4.0000);
      expect(Math.round(band * 10000) / 10000).assertEqual(8.0000);
      expect(band - band).assertEqual(0);
      expect(band + band).assertEqual(16);
    });

    /**
     * @tc.name SpacingPlanTest_case_036
     * @tc.desc spacing-plan: HalfSpacing = SIZES.spacing / 2, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_036', 0, () => {
      const band: number = SIZES.spacing / 2;
      expect(band).assertEqual(8);
      expect(band >= 0).assertTrue();
      expect(band <= 100).assertTrue();
      expect(band * 2).assertEqual(16);
      expect(Math.max(band, 0)).assertEqual(8);
      expect(Math.min(band, 0)).assertEqual(0);
      expect(Number.isFinite(band)).assertTrue();
      expect(band > -1).assertTrue();
    });

    /**
     * @tc.name SpacingPlanTest_case_037
     * @tc.desc spacing-plan: TitlePlusSmall = SIZES.fontSizeTitle + SIZES.fontSizeSmall, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_037', 0, () => {
      const band: number = SIZES.fontSizeTitle + SIZES.fontSizeSmall;
      expect(band).assertEqual(36);
      expect(band >= 0).assertTrue();
      expect(band <= 108).assertTrue();
      expect(Math.round((band / 2) * 10000) / 10000).assertEqual(18.0000);
      expect(Math.round(band * 10000) / 10000).assertEqual(36.0000);
      expect(band - band).assertEqual(0);
      expect(band + band).assertEqual(72);
    });

    /**
     * @tc.name SpacingPlanTest_case_038
     * @tc.desc spacing-plan: TitlePlusSmall = SIZES.fontSizeTitle + SIZES.fontSizeSmall, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_038', 0, () => {
      const band: number = SIZES.fontSizeTitle + SIZES.fontSizeSmall;
      expect(band).assertEqual(36);
      expect(band >= 0).assertTrue();
      expect(band <= 108).assertTrue();
      expect(band * 2).assertEqual(72);
      expect(Math.max(band, 0)).assertEqual(36);
      expect(Math.min(band, 0)).assertEqual(0);
      expect(Number.isFinite(band)).assertTrue();
      expect(band > -1).assertTrue();
    });

    /**
     * @tc.name SpacingPlanTest_case_039
     * @tc.desc spacing-plan: AllFonts = SIZES.fontSizeTitle + SIZES.fontSizeNormal + SIZES.fontSizeSmall, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_039', 0, () => {
      const band: number = SIZES.fontSizeTitle + SIZES.fontSizeNormal + SIZES.fontSizeSmall;
      expect(band).assertEqual(52);
      expect(band >= 0).assertTrue();
      expect(band <= 156).assertTrue();
      expect(Math.round((band / 2) * 10000) / 10000).assertEqual(26.0000);
      expect(Math.round(band * 10000) / 10000).assertEqual(52.0000);
      expect(band - band).assertEqual(0);
      expect(band + band).assertEqual(104);
    });

    /**
     * @tc.name SpacingPlanTest_case_040
     * @tc.desc spacing-plan: AllFonts = SIZES.fontSizeTitle + SIZES.fontSizeNormal + SIZES.fontSizeSmall, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_040', 0, () => {
      const band: number = SIZES.fontSizeTitle + SIZES.fontSizeNormal + SIZES.fontSizeSmall;
      expect(band).assertEqual(52);
      expect(band >= 0).assertTrue();
      expect(band <= 156).assertTrue();
      expect(band * 2).assertEqual(104);
      expect(Math.max(band, 0)).assertEqual(52);
      expect(Math.min(band, 0)).assertEqual(0);
      expect(Number.isFinite(band)).assertTrue();
      expect(band > -1).assertTrue();
    });

    /**
     * @tc.name SpacingPlanTest_case_041
     * @tc.desc channel-plan: primary bit-level channel checks, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_041', 0, () => {
      const value: string = COLORS.primary;
      expect(hexChannel(value, 0)).assertEqual(103);
      expect(hexChannel(value, 1)).assertEqual(194);
      expect(hexChannel(value, 2)).assertEqual(58);
      expect(hexChannel(value, 0) + hexChannel(value, 1)).assertEqual(297);
      expect(hexChannel(value, 1) + hexChannel(value, 2)).assertEqual(252);
      expect(hexChannel(value, 0) ^ hexChannel(value, 0)).assertEqual(0);
      expect(channelSum(value)).assertEqual(355);
    });

    /**
     * @tc.name SpacingPlanTest_case_042
     * @tc.desc channel-plan: primary bit-level channel checks, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_042', 0, () => {
      const value: string = COLORS.primary;
      expect(toHex(hexChannel(value, 0))).assertEqual('67');
      expect(toHex(hexChannel(value, 1))).assertEqual('C2');
      expect(toHex(hexChannel(value, 2))).assertEqual('3A');
      expect(round4(relativeLuminance(value))).assertEqual(0.4177);
      expect(value.substring(1, 3)).assertEqual('67');
      expect(value.substring(3, 5)).assertEqual('C2');
      expect(value.substring(5, 7)).assertEqual('3A');
    });

    /**
     * @tc.name SpacingPlanTest_case_043
     * @tc.desc channel-plan: bgPage bit-level channel checks, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_043', 0, () => {
      const value: string = COLORS.bgPage;
      expect(hexChannel(value, 0)).assertEqual(245);
      expect(hexChannel(value, 1)).assertEqual(247);
      expect(hexChannel(value, 2)).assertEqual(250);
      expect(hexChannel(value, 0) + hexChannel(value, 1)).assertEqual(492);
      expect(hexChannel(value, 1) + hexChannel(value, 2)).assertEqual(497);
      expect(hexChannel(value, 0) ^ hexChannel(value, 0)).assertEqual(0);
      expect(channelSum(value)).assertEqual(742);
    });

    /**
     * @tc.name SpacingPlanTest_case_044
     * @tc.desc channel-plan: bgPage bit-level channel checks, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_044', 0, () => {
      const value: string = COLORS.bgPage;
      expect(toHex(hexChannel(value, 0))).assertEqual('F5');
      expect(toHex(hexChannel(value, 1))).assertEqual('F7');
      expect(toHex(hexChannel(value, 2))).assertEqual('FA');
      expect(round4(relativeLuminance(value))).assertEqual(0.9284);
      expect(value.substring(1, 3)).assertEqual('F5');
      expect(value.substring(3, 5)).assertEqual('F7');
      expect(value.substring(5, 7)).assertEqual('FA');
    });

    /**
     * @tc.name SpacingPlanTest_case_045
     * @tc.desc channel-plan: bgCard bit-level channel checks, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_045', 0, () => {
      const value: string = COLORS.bgCard;
      expect(hexChannel(value, 0)).assertEqual(255);
      expect(hexChannel(value, 1)).assertEqual(255);
      expect(hexChannel(value, 2)).assertEqual(255);
      expect(hexChannel(value, 0) + hexChannel(value, 1)).assertEqual(510);
      expect(hexChannel(value, 1) + hexChannel(value, 2)).assertEqual(510);
      expect(hexChannel(value, 0) ^ hexChannel(value, 0)).assertEqual(0);
      expect(channelSum(value)).assertEqual(765);
    });

    /**
     * @tc.name SpacingPlanTest_case_046
     * @tc.desc channel-plan: bgCard bit-level channel checks, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_046', 0, () => {
      const value: string = COLORS.bgCard;
      expect(toHex(hexChannel(value, 0))).assertEqual('FF');
      expect(toHex(hexChannel(value, 1))).assertEqual('FF');
      expect(toHex(hexChannel(value, 2))).assertEqual('FF');
      expect(round4(relativeLuminance(value))).assertEqual(1.0000);
      expect(value.substring(1, 3)).assertEqual('FF');
      expect(value.substring(3, 5)).assertEqual('FF');
      expect(value.substring(5, 7)).assertEqual('FF');
    });

    /**
     * @tc.name SpacingPlanTest_case_047
     * @tc.desc channel-plan: textMain bit-level channel checks, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_047', 0, () => {
      const value: string = COLORS.textMain;
      expect(hexChannel(value, 0)).assertEqual(48);
      expect(hexChannel(value, 1)).assertEqual(49);
      expect(hexChannel(value, 2)).assertEqual(51);
      expect(hexChannel(value, 0) + hexChannel(value, 1)).assertEqual(97);
      expect(hexChannel(value, 1) + hexChannel(value, 2)).assertEqual(100);
      expect(hexChannel(value, 0) ^ hexChannel(value, 0)).assertEqual(0);
      expect(channelSum(value)).assertEqual(148);
    });

    /**
     * @tc.name SpacingPlanTest_case_048
     * @tc.desc channel-plan: textMain bit-level channel checks, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_048', 0, () => {
      const value: string = COLORS.textMain;
      expect(toHex(hexChannel(value, 0))).assertEqual('30');
      expect(toHex(hexChannel(value, 1))).assertEqual('31');
      expect(toHex(hexChannel(value, 2))).assertEqual('33');
      expect(round4(relativeLuminance(value))).assertEqual(0.0306);
      expect(value.substring(1, 3)).assertEqual('30');
      expect(value.substring(3, 5)).assertEqual('31');
      expect(value.substring(5, 7)).assertEqual('33');
    });

    /**
     * @tc.name SpacingPlanTest_case_049
     * @tc.desc channel-plan: textSub bit-level channel checks, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_049', 0, () => {
      const value: string = COLORS.textSub;
      expect(hexChannel(value, 0)).assertEqual(144);
      expect(hexChannel(value, 1)).assertEqual(147);
      expect(hexChannel(value, 2)).assertEqual(153);
      expect(hexChannel(value, 0) + hexChannel(value, 1)).assertEqual(291);
      expect(hexChannel(value, 1) + hexChannel(value, 2)).assertEqual(300);
      expect(hexChannel(value, 0) ^ hexChannel(value, 0)).assertEqual(0);
      expect(channelSum(value)).assertEqual(444);
    });

    /**
     * @tc.name SpacingPlanTest_case_050
     * @tc.desc channel-plan: textSub bit-level channel checks, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_050', 0, () => {
      const value: string = COLORS.textSub;
      expect(toHex(hexChannel(value, 0))).assertEqual('90');
      expect(toHex(hexChannel(value, 1))).assertEqual('93');
      expect(toHex(hexChannel(value, 2))).assertEqual('99');
      expect(round4(relativeLuminance(value))).assertEqual(0.2910);
      expect(value.substring(1, 3)).assertEqual('90');
      expect(value.substring(3, 5)).assertEqual('93');
      expect(value.substring(5, 7)).assertEqual('99');
    });

    /**
     * @tc.name SpacingPlanTest_case_051
     * @tc.desc channel-plan: border bit-level channel checks, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_051', 0, () => {
      const value: string = COLORS.border;
      expect(hexChannel(value, 0)).assertEqual(229);
      expect(hexChannel(value, 1)).assertEqual(230);
      expect(hexChannel(value, 2)).assertEqual(235);
      expect(hexChannel(value, 0) + hexChannel(value, 1)).assertEqual(459);
      expect(hexChannel(value, 1) + hexChannel(value, 2)).assertEqual(465);
      expect(hexChannel(value, 0) ^ hexChannel(value, 0)).assertEqual(0);
      expect(channelSum(value)).assertEqual(694);
    });

    /**
     * @tc.name SpacingPlanTest_case_052
     * @tc.desc channel-plan: border bit-level channel checks, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_052', 0, () => {
      const value: string = COLORS.border;
      expect(toHex(hexChannel(value, 0))).assertEqual('E5');
      expect(toHex(hexChannel(value, 1))).assertEqual('E6');
      expect(toHex(hexChannel(value, 2))).assertEqual('EB');
      expect(round4(relativeLuminance(value))).assertEqual(0.7925);
      expect(value.substring(1, 3)).assertEqual('E5');
      expect(value.substring(3, 5)).assertEqual('E6');
      expect(value.substring(5, 7)).assertEqual('EB');
    });

    /**
     * @tc.name SpacingPlanTest_case_053
     * @tc.desc channel-plan: btnText bit-level channel checks, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_053', 0, () => {
      const value: string = COLORS.btnText;
      expect(hexChannel(value, 0)).assertEqual(255);
      expect(hexChannel(value, 1)).assertEqual(255);
      expect(hexChannel(value, 2)).assertEqual(255);
      expect(hexChannel(value, 0) + hexChannel(value, 1)).assertEqual(510);
      expect(hexChannel(value, 1) + hexChannel(value, 2)).assertEqual(510);
      expect(hexChannel(value, 0) ^ hexChannel(value, 0)).assertEqual(0);
      expect(channelSum(value)).assertEqual(765);
    });

    /**
     * @tc.name SpacingPlanTest_case_054
     * @tc.desc channel-plan: btnText bit-level channel checks, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('SpacingPlanTest_case_054', 0, () => {
      const value: string = COLORS.btnText;
      expect(toHex(hexChannel(value, 0))).assertEqual('FF');
      expect(toHex(hexChannel(value, 1))).assertEqual('FF');
      expect(toHex(hexChannel(value, 2))).assertEqual('FF');
      expect(round4(relativeLuminance(value))).assertEqual(1.0000);
      expect(value.substring(1, 3)).assertEqual('FF');
      expect(value.substring(3, 5)).assertEqual('FF');
      expect(value.substring(5, 7)).assertEqual('FF');
    });

  });
}
