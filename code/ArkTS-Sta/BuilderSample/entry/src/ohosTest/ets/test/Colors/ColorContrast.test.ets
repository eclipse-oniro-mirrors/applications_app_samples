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
import { COLORS } from '../../../../main/ets/common/Contants';
import { contrastRatio, relativeLuminance, round4, channelDistance, hexDistance, hexByteDistance } from '../Shared/ColorMath';
import { logSuite } from '../Shared/Copy';

export default function ColorContrastTest(): void {
  describe('ColorContrastTest', () => {
    beforeAll(() => {
      logSuite('ColorContrastTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('ColorContrastTest', 'end');
    });

    /**
     * @tc.name ColorContrastTest_case_001
     * @tc.desc color-contrast: primary vs bgPage, ratio form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_001', 0, () => {
      const forward: number = contrastRatio(COLORS.primary, COLORS.bgPage);
      const backward: number = contrastRatio(COLORS.bgPage, COLORS.primary);
      expect(round4(forward)).assertEqual(2.0917);
      expect(round4(backward)).assertEqual(2.0917);
      expect(forward >= 1).assertTrue();
      expect(forward >= 4.5).assertEqual(false);
      expect(forward >= 7).assertEqual(false);
      expect(forward >= 3).assertEqual(false);
      expect(round4(relativeLuminance(COLORS.primary))).assertEqual(0.4177);
      expect(round4(relativeLuminance(COLORS.bgPage))).assertEqual(0.9284);
      expect(forward === backward).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_002
     * @tc.desc color-contrast: primary vs bgPage, ratio form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_002', 0, () => {
      const first: string = COLORS.primary;
      const second: string = COLORS.bgPage;
      expect(channelDistance(first, second, 0)).assertEqual(142);
      expect(channelDistance(first, second, 1)).assertEqual(53);
      expect(channelDistance(first, second, 2)).assertEqual(192);
      expect(hexDistance(first, second)).assertEqual(387);
      expect(hexDistance(second, first)).assertEqual(387);
      expect(hexByteDistance(first, second)).assertEqual(245);
      expect(hexByteDistance(first, second) > 0).assertEqual(true);
      expect(first === second).assertEqual(false);
    });

    /**
     * @tc.name ColorContrastTest_case_003
     * @tc.desc color-contrast: primary vs bgPage, ratio form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_003', 0, () => {
      const ratio: number = contrastRatio(COLORS.primary, COLORS.bgPage);
      expect(ratio > 1).assertEqual(true);
      expect(ratio >= 21).assertEqual(false);
      expect(ratio <= 21).assertTrue();
      expect(round4(relativeLuminance(COLORS.bgPage)) >= round4(relativeLuminance(COLORS.primary))).assertTrue();
      expect(COLORS.primary === COLORS.bgPage).assertEqual(false);
      expect((COLORS.primary).length).assertEqual(7);
      expect((COLORS.bgPage).length).assertEqual(7);
      expect(ratio * contrastRatio(COLORS.bgPage, COLORS.primary) > 0).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_004
     * @tc.desc color-contrast: primary vs bgCard, ratio form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_004', 0, () => {
      const forward: number = contrastRatio(COLORS.primary, COLORS.bgCard);
      const backward: number = contrastRatio(COLORS.bgCard, COLORS.primary);
      expect(round4(forward)).assertEqual(2.2449);
      expect(round4(backward)).assertEqual(2.2449);
      expect(forward >= 1).assertTrue();
      expect(forward >= 4.5).assertEqual(false);
      expect(forward >= 7).assertEqual(false);
      expect(forward >= 3).assertEqual(false);
      expect(round4(relativeLuminance(COLORS.primary))).assertEqual(0.4177);
      expect(round4(relativeLuminance(COLORS.bgCard))).assertEqual(1.0000);
      expect(forward === backward).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_005
     * @tc.desc color-contrast: primary vs bgCard, ratio form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_005', 0, () => {
      const first: string = COLORS.primary;
      const second: string = COLORS.bgCard;
      expect(channelDistance(first, second, 0)).assertEqual(152);
      expect(channelDistance(first, second, 1)).assertEqual(61);
      expect(channelDistance(first, second, 2)).assertEqual(197);
      expect(hexDistance(first, second)).assertEqual(410);
      expect(hexDistance(second, first)).assertEqual(410);
      expect(hexByteDistance(first, second)).assertEqual(256);
      expect(hexByteDistance(first, second) > 0).assertEqual(true);
      expect(first === second).assertEqual(false);
    });

    /**
     * @tc.name ColorContrastTest_case_006
     * @tc.desc color-contrast: primary vs bgCard, ratio form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_006', 0, () => {
      const ratio: number = contrastRatio(COLORS.primary, COLORS.bgCard);
      expect(ratio > 1).assertEqual(true);
      expect(ratio >= 21).assertEqual(false);
      expect(ratio <= 21).assertTrue();
      expect(round4(relativeLuminance(COLORS.bgCard)) >= round4(relativeLuminance(COLORS.primary))).assertTrue();
      expect(COLORS.primary === COLORS.bgCard).assertEqual(false);
      expect((COLORS.primary).length).assertEqual(7);
      expect((COLORS.bgCard).length).assertEqual(7);
      expect(ratio * contrastRatio(COLORS.bgCard, COLORS.primary) > 0).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_007
     * @tc.desc color-contrast: primary vs textMain, ratio form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_007', 0, () => {
      const forward: number = contrastRatio(COLORS.primary, COLORS.textMain);
      const backward: number = contrastRatio(COLORS.textMain, COLORS.primary);
      expect(round4(forward)).assertEqual(5.8002);
      expect(round4(backward)).assertEqual(5.8002);
      expect(forward >= 1).assertTrue();
      expect(forward >= 4.5).assertEqual(true);
      expect(forward >= 7).assertEqual(false);
      expect(forward >= 3).assertEqual(true);
      expect(round4(relativeLuminance(COLORS.primary))).assertEqual(0.4177);
      expect(round4(relativeLuminance(COLORS.textMain))).assertEqual(0.0306);
      expect(forward === backward).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_008
     * @tc.desc color-contrast: primary vs textMain, ratio form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_008', 0, () => {
      const first: string = COLORS.primary;
      const second: string = COLORS.textMain;
      expect(channelDistance(first, second, 0)).assertEqual(55);
      expect(channelDistance(first, second, 1)).assertEqual(145);
      expect(channelDistance(first, second, 2)).assertEqual(7);
      expect(hexDistance(first, second)).assertEqual(207);
      expect(hexDistance(second, first)).assertEqual(207);
      expect(hexByteDistance(first, second)).assertEqual(155);
      expect(hexByteDistance(first, second) > 0).assertEqual(true);
      expect(first === second).assertEqual(false);
    });

    /**
     * @tc.name ColorContrastTest_case_009
     * @tc.desc color-contrast: primary vs textMain, ratio form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_009', 0, () => {
      const ratio: number = contrastRatio(COLORS.primary, COLORS.textMain);
      expect(ratio > 1).assertEqual(true);
      expect(ratio >= 21).assertEqual(false);
      expect(ratio <= 21).assertTrue();
      expect(round4(relativeLuminance(COLORS.primary)) >= round4(relativeLuminance(COLORS.textMain))).assertTrue();
      expect(COLORS.primary === COLORS.textMain).assertEqual(false);
      expect((COLORS.primary).length).assertEqual(7);
      expect((COLORS.textMain).length).assertEqual(7);
      expect(ratio * contrastRatio(COLORS.textMain, COLORS.primary) > 0).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_010
     * @tc.desc color-contrast: primary vs textSub, ratio form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_010', 0, () => {
      const forward: number = contrastRatio(COLORS.primary, COLORS.textSub);
      const backward: number = contrastRatio(COLORS.textSub, COLORS.primary);
      expect(round4(forward)).assertEqual(1.3718);
      expect(round4(backward)).assertEqual(1.3718);
      expect(forward >= 1).assertTrue();
      expect(forward >= 4.5).assertEqual(false);
      expect(forward >= 7).assertEqual(false);
      expect(forward >= 3).assertEqual(false);
      expect(round4(relativeLuminance(COLORS.primary))).assertEqual(0.4177);
      expect(round4(relativeLuminance(COLORS.textSub))).assertEqual(0.2910);
      expect(forward === backward).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_011
     * @tc.desc color-contrast: primary vs textSub, ratio form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_011', 0, () => {
      const first: string = COLORS.primary;
      const second: string = COLORS.textSub;
      expect(channelDistance(first, second, 0)).assertEqual(41);
      expect(channelDistance(first, second, 1)).assertEqual(47);
      expect(channelDistance(first, second, 2)).assertEqual(95);
      expect(hexDistance(first, second)).assertEqual(183);
      expect(hexDistance(second, first)).assertEqual(183);
      expect(hexByteDistance(first, second)).assertEqual(114);
      expect(hexByteDistance(first, second) > 0).assertEqual(true);
      expect(first === second).assertEqual(false);
    });

    /**
     * @tc.name ColorContrastTest_case_012
     * @tc.desc color-contrast: primary vs textSub, ratio form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_012', 0, () => {
      const ratio: number = contrastRatio(COLORS.primary, COLORS.textSub);
      expect(ratio > 1).assertEqual(true);
      expect(ratio >= 21).assertEqual(false);
      expect(ratio <= 21).assertTrue();
      expect(round4(relativeLuminance(COLORS.primary)) >= round4(relativeLuminance(COLORS.textSub))).assertTrue();
      expect(COLORS.primary === COLORS.textSub).assertEqual(false);
      expect((COLORS.primary).length).assertEqual(7);
      expect((COLORS.textSub).length).assertEqual(7);
      expect(ratio * contrastRatio(COLORS.textSub, COLORS.primary) > 0).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_013
     * @tc.desc color-contrast: primary vs border, ratio form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_013', 0, () => {
      const forward: number = contrastRatio(COLORS.primary, COLORS.border);
      const backward: number = contrastRatio(COLORS.border, COLORS.primary);
      expect(round4(forward)).assertEqual(1.8013);
      expect(round4(backward)).assertEqual(1.8013);
      expect(forward >= 1).assertTrue();
      expect(forward >= 4.5).assertEqual(false);
      expect(forward >= 7).assertEqual(false);
      expect(forward >= 3).assertEqual(false);
      expect(round4(relativeLuminance(COLORS.primary))).assertEqual(0.4177);
      expect(round4(relativeLuminance(COLORS.border))).assertEqual(0.7925);
      expect(forward === backward).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_014
     * @tc.desc color-contrast: primary vs border, ratio form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_014', 0, () => {
      const first: string = COLORS.primary;
      const second: string = COLORS.border;
      expect(channelDistance(first, second, 0)).assertEqual(126);
      expect(channelDistance(first, second, 1)).assertEqual(36);
      expect(channelDistance(first, second, 2)).assertEqual(177);
      expect(hexDistance(first, second)).assertEqual(339);
      expect(hexDistance(second, first)).assertEqual(339);
      expect(hexByteDistance(first, second)).assertEqual(220);
      expect(hexByteDistance(first, second) > 0).assertEqual(true);
      expect(first === second).assertEqual(false);
    });

    /**
     * @tc.name ColorContrastTest_case_015
     * @tc.desc color-contrast: primary vs border, ratio form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_015', 0, () => {
      const ratio: number = contrastRatio(COLORS.primary, COLORS.border);
      expect(ratio > 1).assertEqual(true);
      expect(ratio >= 21).assertEqual(false);
      expect(ratio <= 21).assertTrue();
      expect(round4(relativeLuminance(COLORS.border)) >= round4(relativeLuminance(COLORS.primary))).assertTrue();
      expect(COLORS.primary === COLORS.border).assertEqual(false);
      expect((COLORS.primary).length).assertEqual(7);
      expect((COLORS.border).length).assertEqual(7);
      expect(ratio * contrastRatio(COLORS.border, COLORS.primary) > 0).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_016
     * @tc.desc color-contrast: primary vs btnText, ratio form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_016', 0, () => {
      const forward: number = contrastRatio(COLORS.primary, COLORS.btnText);
      const backward: number = contrastRatio(COLORS.btnText, COLORS.primary);
      expect(round4(forward)).assertEqual(2.2449);
      expect(round4(backward)).assertEqual(2.2449);
      expect(forward >= 1).assertTrue();
      expect(forward >= 4.5).assertEqual(false);
      expect(forward >= 7).assertEqual(false);
      expect(forward >= 3).assertEqual(false);
      expect(round4(relativeLuminance(COLORS.primary))).assertEqual(0.4177);
      expect(round4(relativeLuminance(COLORS.btnText))).assertEqual(1.0000);
      expect(forward === backward).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_017
     * @tc.desc color-contrast: primary vs btnText, ratio form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_017', 0, () => {
      const first: string = COLORS.primary;
      const second: string = COLORS.btnText;
      expect(channelDistance(first, second, 0)).assertEqual(152);
      expect(channelDistance(first, second, 1)).assertEqual(61);
      expect(channelDistance(first, second, 2)).assertEqual(197);
      expect(hexDistance(first, second)).assertEqual(410);
      expect(hexDistance(second, first)).assertEqual(410);
      expect(hexByteDistance(first, second)).assertEqual(256);
      expect(hexByteDistance(first, second) > 0).assertEqual(true);
      expect(first === second).assertEqual(false);
    });

    /**
     * @tc.name ColorContrastTest_case_018
     * @tc.desc color-contrast: primary vs btnText, ratio form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_018', 0, () => {
      const ratio: number = contrastRatio(COLORS.primary, COLORS.btnText);
      expect(ratio > 1).assertEqual(true);
      expect(ratio >= 21).assertEqual(false);
      expect(ratio <= 21).assertTrue();
      expect(round4(relativeLuminance(COLORS.btnText)) >= round4(relativeLuminance(COLORS.primary))).assertTrue();
      expect(COLORS.primary === COLORS.btnText).assertEqual(false);
      expect((COLORS.primary).length).assertEqual(7);
      expect((COLORS.btnText).length).assertEqual(7);
      expect(ratio * contrastRatio(COLORS.btnText, COLORS.primary) > 0).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_019
     * @tc.desc color-contrast: bgPage vs bgCard, ratio form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_019', 0, () => {
      const forward: number = contrastRatio(COLORS.bgPage, COLORS.bgCard);
      const backward: number = contrastRatio(COLORS.bgCard, COLORS.bgPage);
      expect(round4(forward)).assertEqual(1.0732);
      expect(round4(backward)).assertEqual(1.0732);
      expect(forward >= 1).assertTrue();
      expect(forward >= 4.5).assertEqual(false);
      expect(forward >= 7).assertEqual(false);
      expect(forward >= 3).assertEqual(false);
      expect(round4(relativeLuminance(COLORS.bgPage))).assertEqual(0.9284);
      expect(round4(relativeLuminance(COLORS.bgCard))).assertEqual(1.0000);
      expect(forward === backward).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_020
     * @tc.desc color-contrast: bgPage vs bgCard, ratio form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_020', 0, () => {
      const first: string = COLORS.bgPage;
      const second: string = COLORS.bgCard;
      expect(channelDistance(first, second, 0)).assertEqual(10);
      expect(channelDistance(first, second, 1)).assertEqual(8);
      expect(channelDistance(first, second, 2)).assertEqual(5);
      expect(hexDistance(first, second)).assertEqual(23);
      expect(hexDistance(second, first)).assertEqual(23);
      expect(hexByteDistance(first, second)).assertEqual(14);
      expect(hexByteDistance(first, second) > 0).assertEqual(true);
      expect(first === second).assertEqual(false);
    });

    /**
     * @tc.name ColorContrastTest_case_021
     * @tc.desc color-contrast: bgPage vs bgCard, ratio form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_021', 0, () => {
      const ratio: number = contrastRatio(COLORS.bgPage, COLORS.bgCard);
      expect(ratio > 1).assertEqual(true);
      expect(ratio >= 21).assertEqual(false);
      expect(ratio <= 21).assertTrue();
      expect(round4(relativeLuminance(COLORS.bgCard)) >= round4(relativeLuminance(COLORS.bgPage))).assertTrue();
      expect(COLORS.bgPage === COLORS.bgCard).assertEqual(false);
      expect((COLORS.bgPage).length).assertEqual(7);
      expect((COLORS.bgCard).length).assertEqual(7);
      expect(ratio * contrastRatio(COLORS.bgCard, COLORS.bgPage) > 0).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_022
     * @tc.desc color-contrast: bgPage vs textMain, ratio form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_022', 0, () => {
      const forward: number = contrastRatio(COLORS.bgPage, COLORS.textMain);
      const backward: number = contrastRatio(COLORS.textMain, COLORS.bgPage);
      expect(round4(forward)).assertEqual(12.1324);
      expect(round4(backward)).assertEqual(12.1324);
      expect(forward >= 1).assertTrue();
      expect(forward >= 4.5).assertEqual(true);
      expect(forward >= 7).assertEqual(true);
      expect(forward >= 3).assertEqual(true);
      expect(round4(relativeLuminance(COLORS.bgPage))).assertEqual(0.9284);
      expect(round4(relativeLuminance(COLORS.textMain))).assertEqual(0.0306);
      expect(forward === backward).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_023
     * @tc.desc color-contrast: bgPage vs textMain, ratio form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_023', 0, () => {
      const first: string = COLORS.bgPage;
      const second: string = COLORS.textMain;
      expect(channelDistance(first, second, 0)).assertEqual(197);
      expect(channelDistance(first, second, 1)).assertEqual(198);
      expect(channelDistance(first, second, 2)).assertEqual(199);
      expect(hexDistance(first, second)).assertEqual(594);
      expect(hexDistance(second, first)).assertEqual(594);
      expect(hexByteDistance(first, second)).assertEqual(343);
      expect(hexByteDistance(first, second) > 0).assertEqual(true);
      expect(first === second).assertEqual(false);
    });

    /**
     * @tc.name ColorContrastTest_case_024
     * @tc.desc color-contrast: bgPage vs textMain, ratio form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_024', 0, () => {
      const ratio: number = contrastRatio(COLORS.bgPage, COLORS.textMain);
      expect(ratio > 1).assertEqual(true);
      expect(ratio >= 21).assertEqual(false);
      expect(ratio <= 21).assertTrue();
      expect(round4(relativeLuminance(COLORS.bgPage)) >= round4(relativeLuminance(COLORS.textMain))).assertTrue();
      expect(COLORS.bgPage === COLORS.textMain).assertEqual(false);
      expect((COLORS.bgPage).length).assertEqual(7);
      expect((COLORS.textMain).length).assertEqual(7);
      expect(ratio * contrastRatio(COLORS.textMain, COLORS.bgPage) > 0).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_025
     * @tc.desc color-contrast: bgPage vs textSub, ratio form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_025', 0, () => {
      const forward: number = contrastRatio(COLORS.bgPage, COLORS.textSub);
      const backward: number = contrastRatio(COLORS.textSub, COLORS.bgPage);
      expect(round4(forward)).assertEqual(2.8694);
      expect(round4(backward)).assertEqual(2.8694);
      expect(forward >= 1).assertTrue();
      expect(forward >= 4.5).assertEqual(false);
      expect(forward >= 7).assertEqual(false);
      expect(forward >= 3).assertEqual(false);
      expect(round4(relativeLuminance(COLORS.bgPage))).assertEqual(0.9284);
      expect(round4(relativeLuminance(COLORS.textSub))).assertEqual(0.2910);
      expect(forward === backward).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_026
     * @tc.desc color-contrast: bgPage vs textSub, ratio form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_026', 0, () => {
      const first: string = COLORS.bgPage;
      const second: string = COLORS.textSub;
      expect(channelDistance(first, second, 0)).assertEqual(101);
      expect(channelDistance(first, second, 1)).assertEqual(100);
      expect(channelDistance(first, second, 2)).assertEqual(97);
      expect(hexDistance(first, second)).assertEqual(298);
      expect(hexDistance(second, first)).assertEqual(298);
      expect(hexByteDistance(first, second)).assertEqual(172);
      expect(hexByteDistance(first, second) > 0).assertEqual(true);
      expect(first === second).assertEqual(false);
    });

    /**
     * @tc.name ColorContrastTest_case_027
     * @tc.desc color-contrast: bgPage vs textSub, ratio form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_027', 0, () => {
      const ratio: number = contrastRatio(COLORS.bgPage, COLORS.textSub);
      expect(ratio > 1).assertEqual(true);
      expect(ratio >= 21).assertEqual(false);
      expect(ratio <= 21).assertTrue();
      expect(round4(relativeLuminance(COLORS.bgPage)) >= round4(relativeLuminance(COLORS.textSub))).assertTrue();
      expect(COLORS.bgPage === COLORS.textSub).assertEqual(false);
      expect((COLORS.bgPage).length).assertEqual(7);
      expect((COLORS.textSub).length).assertEqual(7);
      expect(ratio * contrastRatio(COLORS.textSub, COLORS.bgPage) > 0).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_028
     * @tc.desc color-contrast: bgPage vs border, ratio form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_028', 0, () => {
      const forward: number = contrastRatio(COLORS.bgPage, COLORS.border);
      const backward: number = contrastRatio(COLORS.border, COLORS.bgPage);
      expect(round4(forward)).assertEqual(1.1613);
      expect(round4(backward)).assertEqual(1.1613);
      expect(forward >= 1).assertTrue();
      expect(forward >= 4.5).assertEqual(false);
      expect(forward >= 7).assertEqual(false);
      expect(forward >= 3).assertEqual(false);
      expect(round4(relativeLuminance(COLORS.bgPage))).assertEqual(0.9284);
      expect(round4(relativeLuminance(COLORS.border))).assertEqual(0.7925);
      expect(forward === backward).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_029
     * @tc.desc color-contrast: bgPage vs border, ratio form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_029', 0, () => {
      const first: string = COLORS.bgPage;
      const second: string = COLORS.border;
      expect(channelDistance(first, second, 0)).assertEqual(16);
      expect(channelDistance(first, second, 1)).assertEqual(17);
      expect(channelDistance(first, second, 2)).assertEqual(15);
      expect(hexDistance(first, second)).assertEqual(48);
      expect(hexDistance(second, first)).assertEqual(48);
      expect(hexByteDistance(first, second)).assertEqual(28);
      expect(hexByteDistance(first, second) > 0).assertEqual(true);
      expect(first === second).assertEqual(false);
    });

    /**
     * @tc.name ColorContrastTest_case_030
     * @tc.desc color-contrast: bgPage vs border, ratio form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_030', 0, () => {
      const ratio: number = contrastRatio(COLORS.bgPage, COLORS.border);
      expect(ratio > 1).assertEqual(true);
      expect(ratio >= 21).assertEqual(false);
      expect(ratio <= 21).assertTrue();
      expect(round4(relativeLuminance(COLORS.bgPage)) >= round4(relativeLuminance(COLORS.border))).assertTrue();
      expect(COLORS.bgPage === COLORS.border).assertEqual(false);
      expect((COLORS.bgPage).length).assertEqual(7);
      expect((COLORS.border).length).assertEqual(7);
      expect(ratio * contrastRatio(COLORS.border, COLORS.bgPage) > 0).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_031
     * @tc.desc color-contrast: bgPage vs btnText, ratio form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_031', 0, () => {
      const forward: number = contrastRatio(COLORS.bgPage, COLORS.btnText);
      const backward: number = contrastRatio(COLORS.btnText, COLORS.bgPage);
      expect(round4(forward)).assertEqual(1.0732);
      expect(round4(backward)).assertEqual(1.0732);
      expect(forward >= 1).assertTrue();
      expect(forward >= 4.5).assertEqual(false);
      expect(forward >= 7).assertEqual(false);
      expect(forward >= 3).assertEqual(false);
      expect(round4(relativeLuminance(COLORS.bgPage))).assertEqual(0.9284);
      expect(round4(relativeLuminance(COLORS.btnText))).assertEqual(1.0000);
      expect(forward === backward).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_032
     * @tc.desc color-contrast: bgPage vs btnText, ratio form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_032', 0, () => {
      const first: string = COLORS.bgPage;
      const second: string = COLORS.btnText;
      expect(channelDistance(first, second, 0)).assertEqual(10);
      expect(channelDistance(first, second, 1)).assertEqual(8);
      expect(channelDistance(first, second, 2)).assertEqual(5);
      expect(hexDistance(first, second)).assertEqual(23);
      expect(hexDistance(second, first)).assertEqual(23);
      expect(hexByteDistance(first, second)).assertEqual(14);
      expect(hexByteDistance(first, second) > 0).assertEqual(true);
      expect(first === second).assertEqual(false);
    });

    /**
     * @tc.name ColorContrastTest_case_033
     * @tc.desc color-contrast: bgPage vs btnText, ratio form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_033', 0, () => {
      const ratio: number = contrastRatio(COLORS.bgPage, COLORS.btnText);
      expect(ratio > 1).assertEqual(true);
      expect(ratio >= 21).assertEqual(false);
      expect(ratio <= 21).assertTrue();
      expect(round4(relativeLuminance(COLORS.btnText)) >= round4(relativeLuminance(COLORS.bgPage))).assertTrue();
      expect(COLORS.bgPage === COLORS.btnText).assertEqual(false);
      expect((COLORS.bgPage).length).assertEqual(7);
      expect((COLORS.btnText).length).assertEqual(7);
      expect(ratio * contrastRatio(COLORS.btnText, COLORS.bgPage) > 0).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_034
     * @tc.desc color-contrast: bgCard vs textMain, ratio form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_034', 0, () => {
      const forward: number = contrastRatio(COLORS.bgCard, COLORS.textMain);
      const backward: number = contrastRatio(COLORS.textMain, COLORS.bgCard);
      expect(round4(forward)).assertEqual(13.0208);
      expect(round4(backward)).assertEqual(13.0208);
      expect(forward >= 1).assertTrue();
      expect(forward >= 4.5).assertEqual(true);
      expect(forward >= 7).assertEqual(true);
      expect(forward >= 3).assertEqual(true);
      expect(round4(relativeLuminance(COLORS.bgCard))).assertEqual(1.0000);
      expect(round4(relativeLuminance(COLORS.textMain))).assertEqual(0.0306);
      expect(forward === backward).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_035
     * @tc.desc color-contrast: bgCard vs textMain, ratio form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_035', 0, () => {
      const first: string = COLORS.bgCard;
      const second: string = COLORS.textMain;
      expect(channelDistance(first, second, 0)).assertEqual(207);
      expect(channelDistance(first, second, 1)).assertEqual(206);
      expect(channelDistance(first, second, 2)).assertEqual(204);
      expect(hexDistance(first, second)).assertEqual(617);
      expect(hexDistance(second, first)).assertEqual(617);
      expect(hexByteDistance(first, second)).assertEqual(356);
      expect(hexByteDistance(first, second) > 0).assertEqual(true);
      expect(first === second).assertEqual(false);
    });

    /**
     * @tc.name ColorContrastTest_case_036
     * @tc.desc color-contrast: bgCard vs textMain, ratio form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_036', 0, () => {
      const ratio: number = contrastRatio(COLORS.bgCard, COLORS.textMain);
      expect(ratio > 1).assertEqual(true);
      expect(ratio >= 21).assertEqual(false);
      expect(ratio <= 21).assertTrue();
      expect(round4(relativeLuminance(COLORS.bgCard)) >= round4(relativeLuminance(COLORS.textMain))).assertTrue();
      expect(COLORS.bgCard === COLORS.textMain).assertEqual(false);
      expect((COLORS.bgCard).length).assertEqual(7);
      expect((COLORS.textMain).length).assertEqual(7);
      expect(ratio * contrastRatio(COLORS.textMain, COLORS.bgCard) > 0).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_037
     * @tc.desc color-contrast: bgCard vs textSub, ratio form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_037', 0, () => {
      const forward: number = contrastRatio(COLORS.bgCard, COLORS.textSub);
      const backward: number = contrastRatio(COLORS.textSub, COLORS.bgCard);
      expect(round4(forward)).assertEqual(3.0795);
      expect(round4(backward)).assertEqual(3.0795);
      expect(forward >= 1).assertTrue();
      expect(forward >= 4.5).assertEqual(false);
      expect(forward >= 7).assertEqual(false);
      expect(forward >= 3).assertEqual(true);
      expect(round4(relativeLuminance(COLORS.bgCard))).assertEqual(1.0000);
      expect(round4(relativeLuminance(COLORS.textSub))).assertEqual(0.2910);
      expect(forward === backward).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_038
     * @tc.desc color-contrast: bgCard vs textSub, ratio form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_038', 0, () => {
      const first: string = COLORS.bgCard;
      const second: string = COLORS.textSub;
      expect(channelDistance(first, second, 0)).assertEqual(111);
      expect(channelDistance(first, second, 1)).assertEqual(108);
      expect(channelDistance(first, second, 2)).assertEqual(102);
      expect(hexDistance(first, second)).assertEqual(321);
      expect(hexDistance(second, first)).assertEqual(321);
      expect(hexByteDistance(first, second)).assertEqual(185);
      expect(hexByteDistance(first, second) > 0).assertEqual(true);
      expect(first === second).assertEqual(false);
    });

    /**
     * @tc.name ColorContrastTest_case_039
     * @tc.desc color-contrast: bgCard vs textSub, ratio form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_039', 0, () => {
      const ratio: number = contrastRatio(COLORS.bgCard, COLORS.textSub);
      expect(ratio > 1).assertEqual(true);
      expect(ratio >= 21).assertEqual(false);
      expect(ratio <= 21).assertTrue();
      expect(round4(relativeLuminance(COLORS.bgCard)) >= round4(relativeLuminance(COLORS.textSub))).assertTrue();
      expect(COLORS.bgCard === COLORS.textSub).assertEqual(false);
      expect((COLORS.bgCard).length).assertEqual(7);
      expect((COLORS.textSub).length).assertEqual(7);
      expect(ratio * contrastRatio(COLORS.textSub, COLORS.bgCard) > 0).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_040
     * @tc.desc color-contrast: bgCard vs border, ratio form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_040', 0, () => {
      const forward: number = contrastRatio(COLORS.bgCard, COLORS.border);
      const backward: number = contrastRatio(COLORS.border, COLORS.bgCard);
      expect(round4(forward)).assertEqual(1.2463);
      expect(round4(backward)).assertEqual(1.2463);
      expect(forward >= 1).assertTrue();
      expect(forward >= 4.5).assertEqual(false);
      expect(forward >= 7).assertEqual(false);
      expect(forward >= 3).assertEqual(false);
      expect(round4(relativeLuminance(COLORS.bgCard))).assertEqual(1.0000);
      expect(round4(relativeLuminance(COLORS.border))).assertEqual(0.7925);
      expect(forward === backward).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_041
     * @tc.desc color-contrast: bgCard vs border, ratio form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_041', 0, () => {
      const first: string = COLORS.bgCard;
      const second: string = COLORS.border;
      expect(channelDistance(first, second, 0)).assertEqual(26);
      expect(channelDistance(first, second, 1)).assertEqual(25);
      expect(channelDistance(first, second, 2)).assertEqual(20);
      expect(hexDistance(first, second)).assertEqual(71);
      expect(hexDistance(second, first)).assertEqual(71);
      expect(hexByteDistance(first, second)).assertEqual(41);
      expect(hexByteDistance(first, second) > 0).assertEqual(true);
      expect(first === second).assertEqual(false);
    });

    /**
     * @tc.name ColorContrastTest_case_042
     * @tc.desc color-contrast: bgCard vs border, ratio form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_042', 0, () => {
      const ratio: number = contrastRatio(COLORS.bgCard, COLORS.border);
      expect(ratio > 1).assertEqual(true);
      expect(ratio >= 21).assertEqual(false);
      expect(ratio <= 21).assertTrue();
      expect(round4(relativeLuminance(COLORS.bgCard)) >= round4(relativeLuminance(COLORS.border))).assertTrue();
      expect(COLORS.bgCard === COLORS.border).assertEqual(false);
      expect((COLORS.bgCard).length).assertEqual(7);
      expect((COLORS.border).length).assertEqual(7);
      expect(ratio * contrastRatio(COLORS.border, COLORS.bgCard) > 0).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_043
     * @tc.desc color-contrast: bgCard vs btnText, ratio form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_043', 0, () => {
      const forward: number = contrastRatio(COLORS.bgCard, COLORS.btnText);
      const backward: number = contrastRatio(COLORS.btnText, COLORS.bgCard);
      expect(round4(forward)).assertEqual(1.0000);
      expect(round4(backward)).assertEqual(1.0000);
      expect(forward >= 1).assertTrue();
      expect(forward >= 4.5).assertEqual(false);
      expect(forward >= 7).assertEqual(false);
      expect(forward >= 3).assertEqual(false);
      expect(round4(relativeLuminance(COLORS.bgCard))).assertEqual(1.0000);
      expect(round4(relativeLuminance(COLORS.btnText))).assertEqual(1.0000);
      expect(forward === backward).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_044
     * @tc.desc color-contrast: bgCard vs btnText, ratio form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_044', 0, () => {
      const first: string = COLORS.bgCard;
      const second: string = COLORS.btnText;
      expect(channelDistance(first, second, 0)).assertEqual(0);
      expect(channelDistance(first, second, 1)).assertEqual(0);
      expect(channelDistance(first, second, 2)).assertEqual(0);
      expect(hexDistance(first, second)).assertEqual(0);
      expect(hexDistance(second, first)).assertEqual(0);
      expect(hexByteDistance(first, second)).assertEqual(0);
      expect(hexByteDistance(first, second) > 0).assertEqual(false);
      expect(first === second).assertEqual(true);
    });

    /**
     * @tc.name ColorContrastTest_case_045
     * @tc.desc color-contrast: bgCard vs btnText, ratio form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_045', 0, () => {
      const ratio: number = contrastRatio(COLORS.bgCard, COLORS.btnText);
      expect(ratio > 1).assertEqual(false);
      expect(ratio >= 21).assertEqual(false);
      expect(ratio <= 21).assertTrue();
      expect(round4(relativeLuminance(COLORS.bgCard)) >= round4(relativeLuminance(COLORS.btnText))).assertTrue();
      expect(COLORS.bgCard === COLORS.btnText).assertEqual(true);
      expect((COLORS.bgCard).length).assertEqual(7);
      expect((COLORS.btnText).length).assertEqual(7);
      expect(ratio * contrastRatio(COLORS.btnText, COLORS.bgCard) > 0).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_046
     * @tc.desc color-contrast: textMain vs textSub, ratio form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_046', 0, () => {
      const forward: number = contrastRatio(COLORS.textMain, COLORS.textSub);
      const backward: number = contrastRatio(COLORS.textSub, COLORS.textMain);
      expect(round4(forward)).assertEqual(4.2282);
      expect(round4(backward)).assertEqual(4.2282);
      expect(forward >= 1).assertTrue();
      expect(forward >= 4.5).assertEqual(false);
      expect(forward >= 7).assertEqual(false);
      expect(forward >= 3).assertEqual(true);
      expect(round4(relativeLuminance(COLORS.textMain))).assertEqual(0.0306);
      expect(round4(relativeLuminance(COLORS.textSub))).assertEqual(0.2910);
      expect(forward === backward).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_047
     * @tc.desc color-contrast: textMain vs textSub, ratio form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_047', 0, () => {
      const first: string = COLORS.textMain;
      const second: string = COLORS.textSub;
      expect(channelDistance(first, second, 0)).assertEqual(96);
      expect(channelDistance(first, second, 1)).assertEqual(98);
      expect(channelDistance(first, second, 2)).assertEqual(102);
      expect(hexDistance(first, second)).assertEqual(296);
      expect(hexDistance(second, first)).assertEqual(296);
      expect(hexByteDistance(first, second)).assertEqual(171);
      expect(hexByteDistance(first, second) > 0).assertEqual(true);
      expect(first === second).assertEqual(false);
    });

    /**
     * @tc.name ColorContrastTest_case_048
     * @tc.desc color-contrast: textMain vs textSub, ratio form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_048', 0, () => {
      const ratio: number = contrastRatio(COLORS.textMain, COLORS.textSub);
      expect(ratio > 1).assertEqual(true);
      expect(ratio >= 21).assertEqual(false);
      expect(ratio <= 21).assertTrue();
      expect(round4(relativeLuminance(COLORS.textSub)) >= round4(relativeLuminance(COLORS.textMain))).assertTrue();
      expect(COLORS.textMain === COLORS.textSub).assertEqual(false);
      expect((COLORS.textMain).length).assertEqual(7);
      expect((COLORS.textSub).length).assertEqual(7);
      expect(ratio * contrastRatio(COLORS.textSub, COLORS.textMain) > 0).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_049
     * @tc.desc color-contrast: textMain vs border, ratio form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_049', 0, () => {
      const forward: number = contrastRatio(COLORS.textMain, COLORS.border);
      const backward: number = contrastRatio(COLORS.border, COLORS.textMain);
      expect(round4(forward)).assertEqual(10.4476);
      expect(round4(backward)).assertEqual(10.4476);
      expect(forward >= 1).assertTrue();
      expect(forward >= 4.5).assertEqual(true);
      expect(forward >= 7).assertEqual(true);
      expect(forward >= 3).assertEqual(true);
      expect(round4(relativeLuminance(COLORS.textMain))).assertEqual(0.0306);
      expect(round4(relativeLuminance(COLORS.border))).assertEqual(0.7925);
      expect(forward === backward).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_050
     * @tc.desc color-contrast: textMain vs border, ratio form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_050', 0, () => {
      const first: string = COLORS.textMain;
      const second: string = COLORS.border;
      expect(channelDistance(first, second, 0)).assertEqual(181);
      expect(channelDistance(first, second, 1)).assertEqual(181);
      expect(channelDistance(first, second, 2)).assertEqual(184);
      expect(hexDistance(first, second)).assertEqual(546);
      expect(hexDistance(second, first)).assertEqual(546);
      expect(hexByteDistance(first, second)).assertEqual(315);
      expect(hexByteDistance(first, second) > 0).assertEqual(true);
      expect(first === second).assertEqual(false);
    });

    /**
     * @tc.name ColorContrastTest_case_051
     * @tc.desc color-contrast: textMain vs border, ratio form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_051', 0, () => {
      const ratio: number = contrastRatio(COLORS.textMain, COLORS.border);
      expect(ratio > 1).assertEqual(true);
      expect(ratio >= 21).assertEqual(false);
      expect(ratio <= 21).assertTrue();
      expect(round4(relativeLuminance(COLORS.border)) >= round4(relativeLuminance(COLORS.textMain))).assertTrue();
      expect(COLORS.textMain === COLORS.border).assertEqual(false);
      expect((COLORS.textMain).length).assertEqual(7);
      expect((COLORS.border).length).assertEqual(7);
      expect(ratio * contrastRatio(COLORS.border, COLORS.textMain) > 0).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_052
     * @tc.desc color-contrast: textMain vs btnText, ratio form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_052', 0, () => {
      const forward: number = contrastRatio(COLORS.textMain, COLORS.btnText);
      const backward: number = contrastRatio(COLORS.btnText, COLORS.textMain);
      expect(round4(forward)).assertEqual(13.0208);
      expect(round4(backward)).assertEqual(13.0208);
      expect(forward >= 1).assertTrue();
      expect(forward >= 4.5).assertEqual(true);
      expect(forward >= 7).assertEqual(true);
      expect(forward >= 3).assertEqual(true);
      expect(round4(relativeLuminance(COLORS.textMain))).assertEqual(0.0306);
      expect(round4(relativeLuminance(COLORS.btnText))).assertEqual(1.0000);
      expect(forward === backward).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_053
     * @tc.desc color-contrast: textMain vs btnText, ratio form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_053', 0, () => {
      const first: string = COLORS.textMain;
      const second: string = COLORS.btnText;
      expect(channelDistance(first, second, 0)).assertEqual(207);
      expect(channelDistance(first, second, 1)).assertEqual(206);
      expect(channelDistance(first, second, 2)).assertEqual(204);
      expect(hexDistance(first, second)).assertEqual(617);
      expect(hexDistance(second, first)).assertEqual(617);
      expect(hexByteDistance(first, second)).assertEqual(356);
      expect(hexByteDistance(first, second) > 0).assertEqual(true);
      expect(first === second).assertEqual(false);
    });

    /**
     * @tc.name ColorContrastTest_case_054
     * @tc.desc color-contrast: textMain vs btnText, ratio form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_054', 0, () => {
      const ratio: number = contrastRatio(COLORS.textMain, COLORS.btnText);
      expect(ratio > 1).assertEqual(true);
      expect(ratio >= 21).assertEqual(false);
      expect(ratio <= 21).assertTrue();
      expect(round4(relativeLuminance(COLORS.btnText)) >= round4(relativeLuminance(COLORS.textMain))).assertTrue();
      expect(COLORS.textMain === COLORS.btnText).assertEqual(false);
      expect((COLORS.textMain).length).assertEqual(7);
      expect((COLORS.btnText).length).assertEqual(7);
      expect(ratio * contrastRatio(COLORS.btnText, COLORS.textMain) > 0).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_055
     * @tc.desc color-contrast: textSub vs border, ratio form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_055', 0, () => {
      const forward: number = contrastRatio(COLORS.textSub, COLORS.border);
      const backward: number = contrastRatio(COLORS.border, COLORS.textSub);
      expect(round4(forward)).assertEqual(2.4709);
      expect(round4(backward)).assertEqual(2.4709);
      expect(forward >= 1).assertTrue();
      expect(forward >= 4.5).assertEqual(false);
      expect(forward >= 7).assertEqual(false);
      expect(forward >= 3).assertEqual(false);
      expect(round4(relativeLuminance(COLORS.textSub))).assertEqual(0.2910);
      expect(round4(relativeLuminance(COLORS.border))).assertEqual(0.7925);
      expect(forward === backward).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_056
     * @tc.desc color-contrast: textSub vs border, ratio form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_056', 0, () => {
      const first: string = COLORS.textSub;
      const second: string = COLORS.border;
      expect(channelDistance(first, second, 0)).assertEqual(85);
      expect(channelDistance(first, second, 1)).assertEqual(83);
      expect(channelDistance(first, second, 2)).assertEqual(82);
      expect(hexDistance(first, second)).assertEqual(250);
      expect(hexDistance(second, first)).assertEqual(250);
      expect(hexByteDistance(first, second)).assertEqual(144);
      expect(hexByteDistance(first, second) > 0).assertEqual(true);
      expect(first === second).assertEqual(false);
    });

    /**
     * @tc.name ColorContrastTest_case_057
     * @tc.desc color-contrast: textSub vs border, ratio form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_057', 0, () => {
      const ratio: number = contrastRatio(COLORS.textSub, COLORS.border);
      expect(ratio > 1).assertEqual(true);
      expect(ratio >= 21).assertEqual(false);
      expect(ratio <= 21).assertTrue();
      expect(round4(relativeLuminance(COLORS.border)) >= round4(relativeLuminance(COLORS.textSub))).assertTrue();
      expect(COLORS.textSub === COLORS.border).assertEqual(false);
      expect((COLORS.textSub).length).assertEqual(7);
      expect((COLORS.border).length).assertEqual(7);
      expect(ratio * contrastRatio(COLORS.border, COLORS.textSub) > 0).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_058
     * @tc.desc color-contrast: textSub vs btnText, ratio form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_058', 0, () => {
      const forward: number = contrastRatio(COLORS.textSub, COLORS.btnText);
      const backward: number = contrastRatio(COLORS.btnText, COLORS.textSub);
      expect(round4(forward)).assertEqual(3.0795);
      expect(round4(backward)).assertEqual(3.0795);
      expect(forward >= 1).assertTrue();
      expect(forward >= 4.5).assertEqual(false);
      expect(forward >= 7).assertEqual(false);
      expect(forward >= 3).assertEqual(true);
      expect(round4(relativeLuminance(COLORS.textSub))).assertEqual(0.2910);
      expect(round4(relativeLuminance(COLORS.btnText))).assertEqual(1.0000);
      expect(forward === backward).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_059
     * @tc.desc color-contrast: textSub vs btnText, ratio form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_059', 0, () => {
      const first: string = COLORS.textSub;
      const second: string = COLORS.btnText;
      expect(channelDistance(first, second, 0)).assertEqual(111);
      expect(channelDistance(first, second, 1)).assertEqual(108);
      expect(channelDistance(first, second, 2)).assertEqual(102);
      expect(hexDistance(first, second)).assertEqual(321);
      expect(hexDistance(second, first)).assertEqual(321);
      expect(hexByteDistance(first, second)).assertEqual(185);
      expect(hexByteDistance(first, second) > 0).assertEqual(true);
      expect(first === second).assertEqual(false);
    });

    /**
     * @tc.name ColorContrastTest_case_060
     * @tc.desc color-contrast: textSub vs btnText, ratio form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_060', 0, () => {
      const ratio: number = contrastRatio(COLORS.textSub, COLORS.btnText);
      expect(ratio > 1).assertEqual(true);
      expect(ratio >= 21).assertEqual(false);
      expect(ratio <= 21).assertTrue();
      expect(round4(relativeLuminance(COLORS.btnText)) >= round4(relativeLuminance(COLORS.textSub))).assertTrue();
      expect(COLORS.textSub === COLORS.btnText).assertEqual(false);
      expect((COLORS.textSub).length).assertEqual(7);
      expect((COLORS.btnText).length).assertEqual(7);
      expect(ratio * contrastRatio(COLORS.btnText, COLORS.textSub) > 0).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_061
     * @tc.desc color-contrast: border vs btnText, ratio form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_061', 0, () => {
      const forward: number = contrastRatio(COLORS.border, COLORS.btnText);
      const backward: number = contrastRatio(COLORS.btnText, COLORS.border);
      expect(round4(forward)).assertEqual(1.2463);
      expect(round4(backward)).assertEqual(1.2463);
      expect(forward >= 1).assertTrue();
      expect(forward >= 4.5).assertEqual(false);
      expect(forward >= 7).assertEqual(false);
      expect(forward >= 3).assertEqual(false);
      expect(round4(relativeLuminance(COLORS.border))).assertEqual(0.7925);
      expect(round4(relativeLuminance(COLORS.btnText))).assertEqual(1.0000);
      expect(forward === backward).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_062
     * @tc.desc color-contrast: border vs btnText, ratio form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_062', 0, () => {
      const first: string = COLORS.border;
      const second: string = COLORS.btnText;
      expect(channelDistance(first, second, 0)).assertEqual(26);
      expect(channelDistance(first, second, 1)).assertEqual(25);
      expect(channelDistance(first, second, 2)).assertEqual(20);
      expect(hexDistance(first, second)).assertEqual(71);
      expect(hexDistance(second, first)).assertEqual(71);
      expect(hexByteDistance(first, second)).assertEqual(41);
      expect(hexByteDistance(first, second) > 0).assertEqual(true);
      expect(first === second).assertEqual(false);
    });

    /**
     * @tc.name ColorContrastTest_case_063
     * @tc.desc color-contrast: border vs btnText, ratio form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_063', 0, () => {
      const ratio: number = contrastRatio(COLORS.border, COLORS.btnText);
      expect(ratio > 1).assertEqual(true);
      expect(ratio >= 21).assertEqual(false);
      expect(ratio <= 21).assertTrue();
      expect(round4(relativeLuminance(COLORS.btnText)) >= round4(relativeLuminance(COLORS.border))).assertTrue();
      expect(COLORS.border === COLORS.btnText).assertEqual(false);
      expect((COLORS.border).length).assertEqual(7);
      expect((COLORS.btnText).length).assertEqual(7);
      expect(ratio * contrastRatio(COLORS.btnText, COLORS.border) > 0).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_064
     * @tc.desc color-contrast: rendered role pair textMain/bgCard (body copy on cards), check 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_064', 0, () => {
      const ratio: number = contrastRatio(COLORS.textMain, COLORS.bgCard);
      expect(round4(ratio)).assertEqual(13.0208);
      expect(ratio >= 4.5).assertEqual(true);
      expect(ratio >= 3).assertEqual(true);
      expect(ratio >= 7).assertEqual(true);
      expect(ratio >= 1).assertTrue();
      expect(round4(contrastRatio(COLORS.bgCard, COLORS.textMain))).assertEqual(13.0208);
    });

    /**
     * @tc.name ColorContrastTest_case_065
     * @tc.desc color-contrast: rendered role pair textMain/bgCard (body copy on cards), check 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_065', 0, () => {
      expect(COLORS.textMain === COLORS.bgCard).assertEqual(false);
      expect(round4(contrastRatio(COLORS.textMain, COLORS.bgCard)) <= 21).assertTrue();
      expect((COLORS.textMain).length).assertEqual(7);
      expect((COLORS.bgCard).length).assertEqual(7);
      expect(hexByteDistance(COLORS.textMain, COLORS.bgCard) >= 0).assertTrue();
      expect(hexDistance(COLORS.textMain, COLORS.bgCard) <= 765).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_066
     * @tc.desc color-contrast: rendered role pair textMain/bgPage (body copy on page), check 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_066', 0, () => {
      const ratio: number = contrastRatio(COLORS.textMain, COLORS.bgPage);
      expect(round4(ratio)).assertEqual(12.1324);
      expect(ratio >= 4.5).assertEqual(true);
      expect(ratio >= 3).assertEqual(true);
      expect(ratio >= 7).assertEqual(true);
      expect(ratio >= 1).assertTrue();
      expect(round4(contrastRatio(COLORS.bgPage, COLORS.textMain))).assertEqual(12.1324);
    });

    /**
     * @tc.name ColorContrastTest_case_067
     * @tc.desc color-contrast: rendered role pair textMain/bgPage (body copy on page), check 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_067', 0, () => {
      expect(COLORS.textMain === COLORS.bgPage).assertEqual(false);
      expect(round4(contrastRatio(COLORS.textMain, COLORS.bgPage)) <= 21).assertTrue();
      expect((COLORS.textMain).length).assertEqual(7);
      expect((COLORS.bgPage).length).assertEqual(7);
      expect(hexByteDistance(COLORS.textMain, COLORS.bgPage) >= 0).assertTrue();
      expect(hexDistance(COLORS.textMain, COLORS.bgPage) <= 765).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_068
     * @tc.desc color-contrast: rendered role pair textSub/bgCard (captions on cards), check 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_068', 0, () => {
      const ratio: number = contrastRatio(COLORS.textSub, COLORS.bgCard);
      expect(round4(ratio)).assertEqual(3.0795);
      expect(ratio >= 4.5).assertEqual(false);
      expect(ratio >= 3).assertEqual(true);
      expect(ratio >= 7).assertEqual(false);
      expect(ratio >= 1).assertTrue();
      expect(round4(contrastRatio(COLORS.bgCard, COLORS.textSub))).assertEqual(3.0795);
    });

    /**
     * @tc.name ColorContrastTest_case_069
     * @tc.desc color-contrast: rendered role pair textSub/bgCard (captions on cards), check 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_069', 0, () => {
      expect(COLORS.textSub === COLORS.bgCard).assertEqual(false);
      expect(round4(contrastRatio(COLORS.textSub, COLORS.bgCard)) <= 21).assertTrue();
      expect((COLORS.textSub).length).assertEqual(7);
      expect((COLORS.bgCard).length).assertEqual(7);
      expect(hexByteDistance(COLORS.textSub, COLORS.bgCard) >= 0).assertTrue();
      expect(hexDistance(COLORS.textSub, COLORS.bgCard) <= 765).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_070
     * @tc.desc color-contrast: rendered role pair textSub/bgPage (captions on page), check 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_070', 0, () => {
      const ratio: number = contrastRatio(COLORS.textSub, COLORS.bgPage);
      expect(round4(ratio)).assertEqual(2.8694);
      expect(ratio >= 4.5).assertEqual(false);
      expect(ratio >= 3).assertEqual(false);
      expect(ratio >= 7).assertEqual(false);
      expect(ratio >= 1).assertTrue();
      expect(round4(contrastRatio(COLORS.bgPage, COLORS.textSub))).assertEqual(2.8694);
    });

    /**
     * @tc.name ColorContrastTest_case_071
     * @tc.desc color-contrast: rendered role pair textSub/bgPage (captions on page), check 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_071', 0, () => {
      expect(COLORS.textSub === COLORS.bgPage).assertEqual(false);
      expect(round4(contrastRatio(COLORS.textSub, COLORS.bgPage)) <= 21).assertTrue();
      expect((COLORS.textSub).length).assertEqual(7);
      expect((COLORS.bgPage).length).assertEqual(7);
      expect(hexByteDistance(COLORS.textSub, COLORS.bgPage) >= 0).assertTrue();
      expect(hexDistance(COLORS.textSub, COLORS.bgPage) <= 765).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_072
     * @tc.desc color-contrast: rendered role pair btnText/primary (button caption on accent), check 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_072', 0, () => {
      const ratio: number = contrastRatio(COLORS.btnText, COLORS.primary);
      expect(round4(ratio)).assertEqual(2.2449);
      expect(ratio >= 4.5).assertEqual(false);
      expect(ratio >= 3).assertEqual(false);
      expect(ratio >= 7).assertEqual(false);
      expect(ratio >= 1).assertTrue();
      expect(round4(contrastRatio(COLORS.primary, COLORS.btnText))).assertEqual(2.2449);
    });

    /**
     * @tc.name ColorContrastTest_case_073
     * @tc.desc color-contrast: rendered role pair btnText/primary (button caption on accent), check 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_073', 0, () => {
      expect(COLORS.btnText === COLORS.primary).assertEqual(false);
      expect(round4(contrastRatio(COLORS.btnText, COLORS.primary)) <= 21).assertTrue();
      expect((COLORS.btnText).length).assertEqual(7);
      expect((COLORS.primary).length).assertEqual(7);
      expect(hexByteDistance(COLORS.btnText, COLORS.primary) >= 0).assertTrue();
      expect(hexDistance(COLORS.btnText, COLORS.primary) <= 765).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_074
     * @tc.desc color-contrast: rendered role pair border/bgCard (separator against card), check 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_074', 0, () => {
      const ratio: number = contrastRatio(COLORS.border, COLORS.bgCard);
      expect(round4(ratio)).assertEqual(1.2463);
      expect(ratio >= 4.5).assertEqual(false);
      expect(ratio >= 3).assertEqual(false);
      expect(ratio >= 7).assertEqual(false);
      expect(ratio >= 1).assertTrue();
      expect(round4(contrastRatio(COLORS.bgCard, COLORS.border))).assertEqual(1.2463);
    });

    /**
     * @tc.name ColorContrastTest_case_075
     * @tc.desc color-contrast: rendered role pair border/bgCard (separator against card), check 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_075', 0, () => {
      expect(COLORS.border === COLORS.bgCard).assertEqual(false);
      expect(round4(contrastRatio(COLORS.border, COLORS.bgCard)) <= 21).assertTrue();
      expect((COLORS.border).length).assertEqual(7);
      expect((COLORS.bgCard).length).assertEqual(7);
      expect(hexByteDistance(COLORS.border, COLORS.bgCard) >= 0).assertTrue();
      expect(hexDistance(COLORS.border, COLORS.bgCard) <= 765).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_076
     * @tc.desc color-contrast: rendered role pair primary/bgCard (accent copy on card), check 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_076', 0, () => {
      const ratio: number = contrastRatio(COLORS.primary, COLORS.bgCard);
      expect(round4(ratio)).assertEqual(2.2449);
      expect(ratio >= 4.5).assertEqual(false);
      expect(ratio >= 3).assertEqual(false);
      expect(ratio >= 7).assertEqual(false);
      expect(ratio >= 1).assertTrue();
      expect(round4(contrastRatio(COLORS.bgCard, COLORS.primary))).assertEqual(2.2449);
    });

    /**
     * @tc.name ColorContrastTest_case_077
     * @tc.desc color-contrast: rendered role pair primary/bgCard (accent copy on card), check 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_077', 0, () => {
      expect(COLORS.primary === COLORS.bgCard).assertEqual(false);
      expect(round4(contrastRatio(COLORS.primary, COLORS.bgCard)) <= 21).assertTrue();
      expect((COLORS.primary).length).assertEqual(7);
      expect((COLORS.bgCard).length).assertEqual(7);
      expect(hexByteDistance(COLORS.primary, COLORS.bgCard) >= 0).assertTrue();
      expect(hexDistance(COLORS.primary, COLORS.bgCard) <= 765).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_078
     * @tc.desc color-contrast: ordered matrix cell primary -> primary.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_078', 0, () => {
      const ratio: number = contrastRatio(COLORS.primary, COLORS.primary);
      expect(round4(ratio)).assertEqual(1.0000);
      expect(ratio >= 1).assertTrue();
      expect(ratio <= 21).assertTrue();
      expect(COLORS.primary === COLORS.primary).assertEqual(true);
      expect(round4(contrastRatio(COLORS.primary, COLORS.primary))).assertEqual(1.0000);
      expect(Math.abs(1.0000 - 1.0000) < 0.0001).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_079
     * @tc.desc color-contrast: ordered matrix cell primary -> bgPage.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_079', 0, () => {
      const ratio: number = contrastRatio(COLORS.primary, COLORS.bgPage);
      expect(round4(ratio)).assertEqual(2.0917);
      expect(ratio >= 1).assertTrue();
      expect(ratio <= 21).assertTrue();
      expect(COLORS.primary === COLORS.bgPage).assertEqual(false);
      expect(round4(contrastRatio(COLORS.bgPage, COLORS.primary))).assertEqual(2.0917);
      expect(Math.abs(2.0917 - 2.0917) < 0.0001).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_080
     * @tc.desc color-contrast: ordered matrix cell primary -> bgCard.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_080', 0, () => {
      const ratio: number = contrastRatio(COLORS.primary, COLORS.bgCard);
      expect(round4(ratio)).assertEqual(2.2449);
      expect(ratio >= 1).assertTrue();
      expect(ratio <= 21).assertTrue();
      expect(COLORS.primary === COLORS.bgCard).assertEqual(false);
      expect(round4(contrastRatio(COLORS.bgCard, COLORS.primary))).assertEqual(2.2449);
      expect(Math.abs(2.2449 - 2.2449) < 0.0001).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_081
     * @tc.desc color-contrast: ordered matrix cell primary -> textMain.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_081', 0, () => {
      const ratio: number = contrastRatio(COLORS.primary, COLORS.textMain);
      expect(round4(ratio)).assertEqual(5.8002);
      expect(ratio >= 1).assertTrue();
      expect(ratio <= 21).assertTrue();
      expect(COLORS.primary === COLORS.textMain).assertEqual(false);
      expect(round4(contrastRatio(COLORS.textMain, COLORS.primary))).assertEqual(5.8002);
      expect(Math.abs(5.8002 - 5.8002) < 0.0001).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_082
     * @tc.desc color-contrast: ordered matrix cell primary -> textSub.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_082', 0, () => {
      const ratio: number = contrastRatio(COLORS.primary, COLORS.textSub);
      expect(round4(ratio)).assertEqual(1.3718);
      expect(ratio >= 1).assertTrue();
      expect(ratio <= 21).assertTrue();
      expect(COLORS.primary === COLORS.textSub).assertEqual(false);
      expect(round4(contrastRatio(COLORS.textSub, COLORS.primary))).assertEqual(1.3718);
      expect(Math.abs(1.3718 - 1.3718) < 0.0001).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_083
     * @tc.desc color-contrast: ordered matrix cell primary -> border.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_083', 0, () => {
      const ratio: number = contrastRatio(COLORS.primary, COLORS.border);
      expect(round4(ratio)).assertEqual(1.8013);
      expect(ratio >= 1).assertTrue();
      expect(ratio <= 21).assertTrue();
      expect(COLORS.primary === COLORS.border).assertEqual(false);
      expect(round4(contrastRatio(COLORS.border, COLORS.primary))).assertEqual(1.8013);
      expect(Math.abs(1.8013 - 1.8013) < 0.0001).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_084
     * @tc.desc color-contrast: ordered matrix cell primary -> btnText.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_084', 0, () => {
      const ratio: number = contrastRatio(COLORS.primary, COLORS.btnText);
      expect(round4(ratio)).assertEqual(2.2449);
      expect(ratio >= 1).assertTrue();
      expect(ratio <= 21).assertTrue();
      expect(COLORS.primary === COLORS.btnText).assertEqual(false);
      expect(round4(contrastRatio(COLORS.btnText, COLORS.primary))).assertEqual(2.2449);
      expect(Math.abs(2.2449 - 2.2449) < 0.0001).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_085
     * @tc.desc color-contrast: ordered matrix cell bgPage -> primary.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_085', 0, () => {
      const ratio: number = contrastRatio(COLORS.bgPage, COLORS.primary);
      expect(round4(ratio)).assertEqual(2.0917);
      expect(ratio >= 1).assertTrue();
      expect(ratio <= 21).assertTrue();
      expect(COLORS.bgPage === COLORS.primary).assertEqual(false);
      expect(round4(contrastRatio(COLORS.primary, COLORS.bgPage))).assertEqual(2.0917);
      expect(Math.abs(2.0917 - 2.0917) < 0.0001).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_086
     * @tc.desc color-contrast: ordered matrix cell bgPage -> bgPage.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_086', 0, () => {
      const ratio: number = contrastRatio(COLORS.bgPage, COLORS.bgPage);
      expect(round4(ratio)).assertEqual(1.0000);
      expect(ratio >= 1).assertTrue();
      expect(ratio <= 21).assertTrue();
      expect(COLORS.bgPage === COLORS.bgPage).assertEqual(true);
      expect(round4(contrastRatio(COLORS.bgPage, COLORS.bgPage))).assertEqual(1.0000);
      expect(Math.abs(1.0000 - 1.0000) < 0.0001).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_087
     * @tc.desc color-contrast: ordered matrix cell bgPage -> bgCard.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_087', 0, () => {
      const ratio: number = contrastRatio(COLORS.bgPage, COLORS.bgCard);
      expect(round4(ratio)).assertEqual(1.0732);
      expect(ratio >= 1).assertTrue();
      expect(ratio <= 21).assertTrue();
      expect(COLORS.bgPage === COLORS.bgCard).assertEqual(false);
      expect(round4(contrastRatio(COLORS.bgCard, COLORS.bgPage))).assertEqual(1.0732);
      expect(Math.abs(1.0732 - 1.0732) < 0.0001).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_088
     * @tc.desc color-contrast: ordered matrix cell bgPage -> textMain.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_088', 0, () => {
      const ratio: number = contrastRatio(COLORS.bgPage, COLORS.textMain);
      expect(round4(ratio)).assertEqual(12.1324);
      expect(ratio >= 1).assertTrue();
      expect(ratio <= 21).assertTrue();
      expect(COLORS.bgPage === COLORS.textMain).assertEqual(false);
      expect(round4(contrastRatio(COLORS.textMain, COLORS.bgPage))).assertEqual(12.1324);
      expect(Math.abs(12.1324 - 12.1324) < 0.0001).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_089
     * @tc.desc color-contrast: ordered matrix cell bgPage -> textSub.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_089', 0, () => {
      const ratio: number = contrastRatio(COLORS.bgPage, COLORS.textSub);
      expect(round4(ratio)).assertEqual(2.8694);
      expect(ratio >= 1).assertTrue();
      expect(ratio <= 21).assertTrue();
      expect(COLORS.bgPage === COLORS.textSub).assertEqual(false);
      expect(round4(contrastRatio(COLORS.textSub, COLORS.bgPage))).assertEqual(2.8694);
      expect(Math.abs(2.8694 - 2.8694) < 0.0001).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_090
     * @tc.desc color-contrast: ordered matrix cell bgPage -> border.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_090', 0, () => {
      const ratio: number = contrastRatio(COLORS.bgPage, COLORS.border);
      expect(round4(ratio)).assertEqual(1.1613);
      expect(ratio >= 1).assertTrue();
      expect(ratio <= 21).assertTrue();
      expect(COLORS.bgPage === COLORS.border).assertEqual(false);
      expect(round4(contrastRatio(COLORS.border, COLORS.bgPage))).assertEqual(1.1613);
      expect(Math.abs(1.1613 - 1.1613) < 0.0001).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_091
     * @tc.desc color-contrast: ordered matrix cell bgPage -> btnText.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_091', 0, () => {
      const ratio: number = contrastRatio(COLORS.bgPage, COLORS.btnText);
      expect(round4(ratio)).assertEqual(1.0732);
      expect(ratio >= 1).assertTrue();
      expect(ratio <= 21).assertTrue();
      expect(COLORS.bgPage === COLORS.btnText).assertEqual(false);
      expect(round4(contrastRatio(COLORS.btnText, COLORS.bgPage))).assertEqual(1.0732);
      expect(Math.abs(1.0732 - 1.0732) < 0.0001).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_092
     * @tc.desc color-contrast: ordered matrix cell bgCard -> primary.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_092', 0, () => {
      const ratio: number = contrastRatio(COLORS.bgCard, COLORS.primary);
      expect(round4(ratio)).assertEqual(2.2449);
      expect(ratio >= 1).assertTrue();
      expect(ratio <= 21).assertTrue();
      expect(COLORS.bgCard === COLORS.primary).assertEqual(false);
      expect(round4(contrastRatio(COLORS.primary, COLORS.bgCard))).assertEqual(2.2449);
      expect(Math.abs(2.2449 - 2.2449) < 0.0001).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_093
     * @tc.desc color-contrast: ordered matrix cell bgCard -> bgPage.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_093', 0, () => {
      const ratio: number = contrastRatio(COLORS.bgCard, COLORS.bgPage);
      expect(round4(ratio)).assertEqual(1.0732);
      expect(ratio >= 1).assertTrue();
      expect(ratio <= 21).assertTrue();
      expect(COLORS.bgCard === COLORS.bgPage).assertEqual(false);
      expect(round4(contrastRatio(COLORS.bgPage, COLORS.bgCard))).assertEqual(1.0732);
      expect(Math.abs(1.0732 - 1.0732) < 0.0001).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_094
     * @tc.desc color-contrast: ordered matrix cell bgCard -> bgCard.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_094', 0, () => {
      const ratio: number = contrastRatio(COLORS.bgCard, COLORS.bgCard);
      expect(round4(ratio)).assertEqual(1.0000);
      expect(ratio >= 1).assertTrue();
      expect(ratio <= 21).assertTrue();
      expect(COLORS.bgCard === COLORS.bgCard).assertEqual(true);
      expect(round4(contrastRatio(COLORS.bgCard, COLORS.bgCard))).assertEqual(1.0000);
      expect(Math.abs(1.0000 - 1.0000) < 0.0001).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_095
     * @tc.desc color-contrast: ordered matrix cell bgCard -> textMain.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_095', 0, () => {
      const ratio: number = contrastRatio(COLORS.bgCard, COLORS.textMain);
      expect(round4(ratio)).assertEqual(13.0208);
      expect(ratio >= 1).assertTrue();
      expect(ratio <= 21).assertTrue();
      expect(COLORS.bgCard === COLORS.textMain).assertEqual(false);
      expect(round4(contrastRatio(COLORS.textMain, COLORS.bgCard))).assertEqual(13.0208);
      expect(Math.abs(13.0208 - 13.0208) < 0.0001).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_096
     * @tc.desc color-contrast: ordered matrix cell bgCard -> textSub.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_096', 0, () => {
      const ratio: number = contrastRatio(COLORS.bgCard, COLORS.textSub);
      expect(round4(ratio)).assertEqual(3.0795);
      expect(ratio >= 1).assertTrue();
      expect(ratio <= 21).assertTrue();
      expect(COLORS.bgCard === COLORS.textSub).assertEqual(false);
      expect(round4(contrastRatio(COLORS.textSub, COLORS.bgCard))).assertEqual(3.0795);
      expect(Math.abs(3.0795 - 3.0795) < 0.0001).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_097
     * @tc.desc color-contrast: ordered matrix cell bgCard -> border.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_097', 0, () => {
      const ratio: number = contrastRatio(COLORS.bgCard, COLORS.border);
      expect(round4(ratio)).assertEqual(1.2463);
      expect(ratio >= 1).assertTrue();
      expect(ratio <= 21).assertTrue();
      expect(COLORS.bgCard === COLORS.border).assertEqual(false);
      expect(round4(contrastRatio(COLORS.border, COLORS.bgCard))).assertEqual(1.2463);
      expect(Math.abs(1.2463 - 1.2463) < 0.0001).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_098
     * @tc.desc color-contrast: ordered matrix cell bgCard -> btnText.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_098', 0, () => {
      const ratio: number = contrastRatio(COLORS.bgCard, COLORS.btnText);
      expect(round4(ratio)).assertEqual(1.0000);
      expect(ratio >= 1).assertTrue();
      expect(ratio <= 21).assertTrue();
      expect(COLORS.bgCard === COLORS.btnText).assertEqual(true);
      expect(round4(contrastRatio(COLORS.btnText, COLORS.bgCard))).assertEqual(1.0000);
      expect(Math.abs(1.0000 - 1.0000) < 0.0001).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_099
     * @tc.desc color-contrast: ordered matrix cell textMain -> primary.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_099', 0, () => {
      const ratio: number = contrastRatio(COLORS.textMain, COLORS.primary);
      expect(round4(ratio)).assertEqual(5.8002);
      expect(ratio >= 1).assertTrue();
      expect(ratio <= 21).assertTrue();
      expect(COLORS.textMain === COLORS.primary).assertEqual(false);
      expect(round4(contrastRatio(COLORS.primary, COLORS.textMain))).assertEqual(5.8002);
      expect(Math.abs(5.8002 - 5.8002) < 0.0001).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_100
     * @tc.desc color-contrast: ordered matrix cell textMain -> bgPage.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_100', 0, () => {
      const ratio: number = contrastRatio(COLORS.textMain, COLORS.bgPage);
      expect(round4(ratio)).assertEqual(12.1324);
      expect(ratio >= 1).assertTrue();
      expect(ratio <= 21).assertTrue();
      expect(COLORS.textMain === COLORS.bgPage).assertEqual(false);
      expect(round4(contrastRatio(COLORS.bgPage, COLORS.textMain))).assertEqual(12.1324);
      expect(Math.abs(12.1324 - 12.1324) < 0.0001).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_101
     * @tc.desc color-contrast: ordered matrix cell textMain -> bgCard.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_101', 0, () => {
      const ratio: number = contrastRatio(COLORS.textMain, COLORS.bgCard);
      expect(round4(ratio)).assertEqual(13.0208);
      expect(ratio >= 1).assertTrue();
      expect(ratio <= 21).assertTrue();
      expect(COLORS.textMain === COLORS.bgCard).assertEqual(false);
      expect(round4(contrastRatio(COLORS.bgCard, COLORS.textMain))).assertEqual(13.0208);
      expect(Math.abs(13.0208 - 13.0208) < 0.0001).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_102
     * @tc.desc color-contrast: ordered matrix cell textMain -> textMain.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_102', 0, () => {
      const ratio: number = contrastRatio(COLORS.textMain, COLORS.textMain);
      expect(round4(ratio)).assertEqual(1.0000);
      expect(ratio >= 1).assertTrue();
      expect(ratio <= 21).assertTrue();
      expect(COLORS.textMain === COLORS.textMain).assertEqual(true);
      expect(round4(contrastRatio(COLORS.textMain, COLORS.textMain))).assertEqual(1.0000);
      expect(Math.abs(1.0000 - 1.0000) < 0.0001).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_103
     * @tc.desc color-contrast: ordered matrix cell textMain -> textSub.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_103', 0, () => {
      const ratio: number = contrastRatio(COLORS.textMain, COLORS.textSub);
      expect(round4(ratio)).assertEqual(4.2282);
      expect(ratio >= 1).assertTrue();
      expect(ratio <= 21).assertTrue();
      expect(COLORS.textMain === COLORS.textSub).assertEqual(false);
      expect(round4(contrastRatio(COLORS.textSub, COLORS.textMain))).assertEqual(4.2282);
      expect(Math.abs(4.2282 - 4.2282) < 0.0001).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_104
     * @tc.desc color-contrast: ordered matrix cell textMain -> border.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_104', 0, () => {
      const ratio: number = contrastRatio(COLORS.textMain, COLORS.border);
      expect(round4(ratio)).assertEqual(10.4476);
      expect(ratio >= 1).assertTrue();
      expect(ratio <= 21).assertTrue();
      expect(COLORS.textMain === COLORS.border).assertEqual(false);
      expect(round4(contrastRatio(COLORS.border, COLORS.textMain))).assertEqual(10.4476);
      expect(Math.abs(10.4476 - 10.4476) < 0.0001).assertTrue();
    });

    /**
     * @tc.name ColorContrastTest_case_105
     * @tc.desc color-contrast: ordered matrix cell textMain -> btnText.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorContrastTest_case_105', 0, () => {
      const ratio: number = contrastRatio(COLORS.textMain, COLORS.btnText);
      expect(round4(ratio)).assertEqual(13.0208);
      expect(ratio >= 1).assertTrue();
      expect(ratio <= 21).assertTrue();
      expect(COLORS.textMain === COLORS.btnText).assertEqual(false);
      expect(round4(contrastRatio(COLORS.btnText, COLORS.textMain))).assertEqual(13.0208);
      expect(Math.abs(13.0208 - 13.0208) < 0.0001).assertTrue();
    });

  });
}
