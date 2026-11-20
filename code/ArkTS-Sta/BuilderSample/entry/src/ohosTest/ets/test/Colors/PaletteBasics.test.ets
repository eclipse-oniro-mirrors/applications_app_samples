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
import {
  hexChannel, channelSum, channelSpread, relativeLuminance, round4, channelDistance,
  hexDistance, hexByteDistance, dominantChannel, isUppercaseHex, toHex
} from '../Shared/ColorMath';
import { logSuite } from '../Shared/Copy';

function BrightnessHelper(hex: string): number {
  const r: number = hexChannel(hex, 0);
  const g: number = hexChannel(hex, 1);
  const b: number = hexChannel(hex, 2);
  return Math.round(Math.sqrt(0.299 * r * r + 0.587 * g * g + 0.114 * b * b));
}

export default function ColorPaletteTest(): void {
  describe('ColorPaletteTest', () => {
    beforeAll(() => {
      logSuite('ColorPaletteTest', 'begin');
    });
    beforeEach(async () => {
      // Yield between cases so the device watchdog can service the test runner.
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('ColorPaletteTest', 'end');
    });

    /**
     * @tc.name ColorPaletteTest_case_001
     * @tc.desc color-palette: decode primary (brand accent), check literal and channels; vector primary.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorPaletteTest_case_001', 0, () => {
      const value: string = COLORS.primary;
      expect(value).assertEqual('#67C23A');
      expect(value.length).assertEqual(7);
      expect(value.substring(0, 1)).assertEqual('#');
      expect(isUppercaseHex(value)).assertTrue();
      expect(value.substring(1, 3)).assertEqual('67');
      expect(value.substring(3, 5)).assertEqual('C2');
      expect(value.substring(5, 7)).assertEqual('3A');
      expect(hexChannel(value, 0)).assertEqual(103);
      expect(hexChannel(value, 1)).assertEqual(194);
      expect(hexChannel(value, 2)).assertEqual(58);
      expect(channelSum(value)).assertEqual(355);
      expect(value === COLORS.primary).assertTrue();
    });

    /**
     * @tc.name ColorPaletteTest_case_002
     * @tc.desc color-palette: luminance, brightness and hue family of primary; vector primary.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorPaletteTest_case_002', 0, () => {
      const value: string = COLORS.primary;
      expect(round4(relativeLuminance(value))).assertEqual(0.4177);
      expect(relativeLuminance(value) > 0).assertTrue();
      expect(channelSpread(value)).assertEqual(136);
      expect(dominantChannel(value)).assertEqual('g');
      expect(Math.max(hexChannel(value, 0), Math.max(hexChannel(value, 1), hexChannel(value, 2)))).assertEqual(194);
      expect(Math.min(hexChannel(value, 0), Math.min(hexChannel(value, 1), hexChannel(value, 2)))).assertEqual(58);
      expect(BrightnessHelper(value)).assertEqual(160);
      expect(value.toUpperCase()).assertEqual('#67C23A');
      expect(value.toLowerCase()).assertEqual('#67c23a');
      expect(value.length - 1).assertEqual(6);
    });

    /**
     * @tc.name ColorPaletteTest_case_003
     * @tc.desc color-palette: decode bgPage (page background), check literal and channels; vector bgPage.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorPaletteTest_case_003', 0, () => {
      const value: string = COLORS.bgPage;
      expect(value).assertEqual('#F5F7FA');
      expect(value.length).assertEqual(7);
      expect(value.substring(0, 1)).assertEqual('#');
      expect(isUppercaseHex(value)).assertTrue();
      expect(value.substring(1, 3)).assertEqual('F5');
      expect(value.substring(3, 5)).assertEqual('F7');
      expect(value.substring(5, 7)).assertEqual('FA');
      expect(hexChannel(value, 0)).assertEqual(245);
      expect(hexChannel(value, 1)).assertEqual(247);
      expect(hexChannel(value, 2)).assertEqual(250);
      expect(channelSum(value)).assertEqual(742);
      expect(value === COLORS.bgPage).assertTrue();
    });

    /**
     * @tc.name ColorPaletteTest_case_004
     * @tc.desc color-palette: luminance, brightness and hue family of bgPage; vector bgPage.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorPaletteTest_case_004', 0, () => {
      const value: string = COLORS.bgPage;
      expect(round4(relativeLuminance(value))).assertEqual(0.9284);
      expect(relativeLuminance(value) > 0).assertTrue();
      expect(channelSpread(value)).assertEqual(5);
      expect(dominantChannel(value)).assertEqual('b');
      expect(Math.max(hexChannel(value, 0), Math.max(hexChannel(value, 1), hexChannel(value, 2)))).assertEqual(250);
      expect(Math.min(hexChannel(value, 0), Math.min(hexChannel(value, 1), hexChannel(value, 2)))).assertEqual(245);
      expect(BrightnessHelper(value)).assertEqual(247);
      expect(value.toUpperCase()).assertEqual('#F5F7FA');
      expect(value.toLowerCase()).assertEqual('#f5f7fa');
      expect(value.length - 1).assertEqual(6);
    });

    /**
     * @tc.name ColorPaletteTest_case_005
     * @tc.desc color-palette: decode bgCard (card background), check literal and channels; vector bgCard.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorPaletteTest_case_005', 0, () => {
      const value: string = COLORS.bgCard;
      expect(value).assertEqual('#FFFFFF');
      expect(value.length).assertEqual(7);
      expect(value.substring(0, 1)).assertEqual('#');
      expect(isUppercaseHex(value)).assertTrue();
      expect(value.substring(1, 3)).assertEqual('FF');
      expect(value.substring(3, 5)).assertEqual('FF');
      expect(value.substring(5, 7)).assertEqual('FF');
      expect(hexChannel(value, 0)).assertEqual(255);
      expect(hexChannel(value, 1)).assertEqual(255);
      expect(hexChannel(value, 2)).assertEqual(255);
      expect(channelSum(value)).assertEqual(765);
      expect(value === COLORS.bgCard).assertTrue();
    });

    /**
     * @tc.name ColorPaletteTest_case_006
     * @tc.desc color-palette: luminance, brightness and hue family of bgCard; vector bgCard.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorPaletteTest_case_006', 0, () => {
      const value: string = COLORS.bgCard;
      expect(round4(relativeLuminance(value))).assertEqual(1.0000);
      expect(relativeLuminance(value) > 0).assertTrue();
      expect(channelSpread(value)).assertEqual(0);
      expect(dominantChannel(value)).assertEqual('r');
      expect(Math.max(hexChannel(value, 0), Math.max(hexChannel(value, 1), hexChannel(value, 2)))).assertEqual(255);
      expect(Math.min(hexChannel(value, 0), Math.min(hexChannel(value, 1), hexChannel(value, 2)))).assertEqual(255);
      expect(BrightnessHelper(value)).assertEqual(255);
      expect(value.toUpperCase()).assertEqual('#FFFFFF');
      expect(value.toLowerCase()).assertEqual('#ffffff');
      expect(value.length - 1).assertEqual(6);
    });

    /**
     * @tc.name ColorPaletteTest_case_007
     * @tc.desc color-palette: decode textMain (primary text), check literal and channels; vector textMain.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorPaletteTest_case_007', 0, () => {
      const value: string = COLORS.textMain;
      expect(value).assertEqual('#303133');
      expect(value.length).assertEqual(7);
      expect(value.substring(0, 1)).assertEqual('#');
      expect(isUppercaseHex(value)).assertTrue();
      expect(value.substring(1, 3)).assertEqual('30');
      expect(value.substring(3, 5)).assertEqual('31');
      expect(value.substring(5, 7)).assertEqual('33');
      expect(hexChannel(value, 0)).assertEqual(48);
      expect(hexChannel(value, 1)).assertEqual(49);
      expect(hexChannel(value, 2)).assertEqual(51);
      expect(channelSum(value)).assertEqual(148);
      expect(value === COLORS.textMain).assertTrue();
    });

    /**
     * @tc.name ColorPaletteTest_case_008
     * @tc.desc color-palette: luminance, brightness and hue family of textMain; vector textMain.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorPaletteTest_case_008', 0, () => {
      const value: string = COLORS.textMain;
      expect(round4(relativeLuminance(value))).assertEqual(0.0306);
      expect(relativeLuminance(value) > 0).assertTrue();
      expect(channelSpread(value)).assertEqual(3);
      expect(dominantChannel(value)).assertEqual('b');
      expect(Math.max(hexChannel(value, 0), Math.max(hexChannel(value, 1), hexChannel(value, 2)))).assertEqual(51);
      expect(Math.min(hexChannel(value, 0), Math.min(hexChannel(value, 1), hexChannel(value, 2)))).assertEqual(48);
      expect(BrightnessHelper(value)).assertEqual(49);
      expect(value.toUpperCase()).assertEqual('#303133');
      expect(value.toLowerCase()).assertEqual('#303133');
      expect(value.length - 1).assertEqual(6);
    });

    /**
     * @tc.name ColorPaletteTest_case_009
     * @tc.desc color-palette: decode textSub (secondary text), check literal and channels; vector textSub.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorPaletteTest_case_009', 0, () => {
      const value: string = COLORS.textSub;
      expect(value).assertEqual('#909399');
      expect(value.length).assertEqual(7);
      expect(value.substring(0, 1)).assertEqual('#');
      expect(isUppercaseHex(value)).assertTrue();
      expect(value.substring(1, 3)).assertEqual('90');
      expect(value.substring(3, 5)).assertEqual('93');
      expect(value.substring(5, 7)).assertEqual('99');
      expect(hexChannel(value, 0)).assertEqual(144);
      expect(hexChannel(value, 1)).assertEqual(147);
      expect(hexChannel(value, 2)).assertEqual(153);
      expect(channelSum(value)).assertEqual(444);
      expect(value === COLORS.textSub).assertTrue();
    });

    /**
     * @tc.name ColorPaletteTest_case_010
     * @tc.desc color-palette: luminance, brightness and hue family of textSub; vector textSub.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorPaletteTest_case_010', 0, () => {
      const value: string = COLORS.textSub;
      expect(round4(relativeLuminance(value))).assertEqual(0.2910);
      expect(relativeLuminance(value) > 0).assertTrue();
      expect(channelSpread(value)).assertEqual(9);
      expect(dominantChannel(value)).assertEqual('b');
      expect(Math.max(hexChannel(value, 0), Math.max(hexChannel(value, 1), hexChannel(value, 2)))).assertEqual(153);
      expect(Math.min(hexChannel(value, 0), Math.min(hexChannel(value, 1), hexChannel(value, 2)))).assertEqual(144);
      expect(BrightnessHelper(value)).assertEqual(147);
      expect(value.toUpperCase()).assertEqual('#909399');
      expect(value.toLowerCase()).assertEqual('#909399');
      expect(value.length - 1).assertEqual(6);
    });

    /**
     * @tc.name ColorPaletteTest_case_011
     * @tc.desc color-palette: decode border (separator), check literal and channels; vector border.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorPaletteTest_case_011', 0, () => {
      const value: string = COLORS.border;
      expect(value).assertEqual('#E5E6EB');
      expect(value.length).assertEqual(7);
      expect(value.substring(0, 1)).assertEqual('#');
      expect(isUppercaseHex(value)).assertTrue();
      expect(value.substring(1, 3)).assertEqual('E5');
      expect(value.substring(3, 5)).assertEqual('E6');
      expect(value.substring(5, 7)).assertEqual('EB');
      expect(hexChannel(value, 0)).assertEqual(229);
      expect(hexChannel(value, 1)).assertEqual(230);
      expect(hexChannel(value, 2)).assertEqual(235);
      expect(channelSum(value)).assertEqual(694);
      expect(value === COLORS.border).assertTrue();
    });

    /**
     * @tc.name ColorPaletteTest_case_012
     * @tc.desc color-palette: luminance, brightness and hue family of border; vector border.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorPaletteTest_case_012', 0, () => {
      const value: string = COLORS.border;
      expect(round4(relativeLuminance(value))).assertEqual(0.7925);
      expect(relativeLuminance(value) > 0).assertTrue();
      expect(channelSpread(value)).assertEqual(6);
      expect(dominantChannel(value)).assertEqual('b');
      expect(Math.max(hexChannel(value, 0), Math.max(hexChannel(value, 1), hexChannel(value, 2)))).assertEqual(235);
      expect(Math.min(hexChannel(value, 0), Math.min(hexChannel(value, 1), hexChannel(value, 2)))).assertEqual(229);
      expect(BrightnessHelper(value)).assertEqual(230);
      expect(value.toUpperCase()).assertEqual('#E5E6EB');
      expect(value.toLowerCase()).assertEqual('#e5e6eb');
      expect(value.length - 1).assertEqual(6);
    });

    /**
     * @tc.name ColorPaletteTest_case_013
     * @tc.desc color-palette: decode btnText (button caption), check literal and channels; vector btnText.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorPaletteTest_case_013', 0, () => {
      const value: string = COLORS.btnText;
      expect(value).assertEqual('#FFFFFF');
      expect(value.length).assertEqual(7);
      expect(value.substring(0, 1)).assertEqual('#');
      expect(isUppercaseHex(value)).assertTrue();
      expect(value.substring(1, 3)).assertEqual('FF');
      expect(value.substring(3, 5)).assertEqual('FF');
      expect(value.substring(5, 7)).assertEqual('FF');
      expect(hexChannel(value, 0)).assertEqual(255);
      expect(hexChannel(value, 1)).assertEqual(255);
      expect(hexChannel(value, 2)).assertEqual(255);
      expect(channelSum(value)).assertEqual(765);
      expect(value === COLORS.btnText).assertTrue();
    });

    /**
     * @tc.name ColorPaletteTest_case_014
     * @tc.desc color-palette: luminance, brightness and hue family of btnText; vector btnText.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ColorPaletteTest_case_014', 0, () => {
      const value: string = COLORS.btnText;
      expect(round4(relativeLuminance(value))).assertEqual(1.0000);
      expect(relativeLuminance(value) > 0).assertTrue();
      expect(channelSpread(value)).assertEqual(0);
      expect(dominantChannel(value)).assertEqual('r');
      expect(Math.max(hexChannel(value, 0), Math.max(hexChannel(value, 1), hexChannel(value, 2)))).assertEqual(255);
      expect(Math.min(hexChannel(value, 0), Math.min(hexChannel(value, 1), hexChannel(value, 2)))).assertEqual(255);
      expect(BrightnessHelper(value)).assertEqual(255);
      expect(value.toUpperCase()).assertEqual('#FFFFFF');
      expect(value.toLowerCase()).assertEqual('#ffffff');
      expect(value.length - 1).assertEqual(6);
    });


  });
}