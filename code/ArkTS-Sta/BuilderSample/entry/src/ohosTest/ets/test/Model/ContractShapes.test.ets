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
import { ColorOptions, SizeOptions } from '../../../../main/ets/model/ResModel';
import { logSuite } from '../Shared/Copy';

export default function ContractShapesTest(): void {
  describe('ContractShapesTest', () => {
    beforeAll(() => {
      logSuite('ContractShapesTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('ContractShapesTest', 'end');
    });

    /**
     * @tc.name ContractShapesTest_case_001
     * @tc.desc model-contract: ColorOptions.primary keeps its declared string payload, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ContractShapesTest_case_001', 0, () => {
      const sample: ColorOptions = {
        primary: COLORS.primary, bgPage: COLORS.bgPage, bgCard: COLORS.bgCard,
        textMain: COLORS.textMain, textSub: COLORS.textSub, border: COLORS.border,
        btnText: COLORS.btnText
      };
      expect(sample.primary).assertEqual(COLORS.primary);
      expect(sample.primary).assertEqual('#67C23A');
      expect(typeof sample.primary).assertEqual('string');
      expect(sample === COLORS).assertFalse();
      expect(sample.primary.length).assertEqual(7);
      expect(sample.btnText).assertEqual(COLORS.btnText);
    });

    /**
     * @tc.name ContractShapesTest_case_002
     * @tc.desc model-contract: ColorOptions.primary keeps its declared string payload, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ContractShapesTest_case_002', 0, () => {
      const sample: ColorOptions = {
        primary: COLORS.primary, bgPage: COLORS.bgPage, bgCard: COLORS.bgCard,
        textMain: COLORS.textMain, textSub: COLORS.textSub, border: COLORS.border,
        btnText: COLORS.btnText
      };
      expect(sample.primary).assertEqual(COLORS.primary);
      expect(sample.primary).assertEqual('#67C23A');
      expect(typeof sample.primary).assertEqual('string');
      const truncated: string = sample.primary.substring(0, 4);
      expect(truncated.length).assertEqual(4);
      expect(sample.primary.startsWith('#')).assertTrue();
      expect(sample.primary === COLORS.primary).assertTrue();
      expect(sample.border).assertEqual(COLORS.border);
    });

    /**
     * @tc.name ContractShapesTest_case_003
     * @tc.desc model-contract: ColorOptions.bgPage keeps its declared string payload, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ContractShapesTest_case_003', 0, () => {
      const sample: ColorOptions = {
        primary: COLORS.primary, bgPage: COLORS.bgPage, bgCard: COLORS.bgCard,
        textMain: COLORS.textMain, textSub: COLORS.textSub, border: COLORS.border,
        btnText: COLORS.btnText
      };
      expect(sample.bgPage).assertEqual(COLORS.bgPage);
      expect(sample.bgPage).assertEqual('#F5F7FA');
      expect(typeof sample.bgPage).assertEqual('string');
      expect(sample === COLORS).assertFalse();
      expect(sample.bgPage.length).assertEqual(7);
      expect(sample.btnText).assertEqual(COLORS.btnText);
    });

    /**
     * @tc.name ContractShapesTest_case_004
     * @tc.desc model-contract: ColorOptions.bgPage keeps its declared string payload, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ContractShapesTest_case_004', 0, () => {
      const sample: ColorOptions = {
        primary: COLORS.primary, bgPage: COLORS.bgPage, bgCard: COLORS.bgCard,
        textMain: COLORS.textMain, textSub: COLORS.textSub, border: COLORS.border,
        btnText: COLORS.btnText
      };
      expect(sample.bgPage).assertEqual(COLORS.bgPage);
      expect(sample.bgPage).assertEqual('#F5F7FA');
      expect(typeof sample.bgPage).assertEqual('string');
      const truncated: string = sample.bgPage.substring(0, 4);
      expect(truncated.length).assertEqual(4);
      expect(sample.bgPage.startsWith('#')).assertTrue();
      expect(sample.bgPage === COLORS.bgPage).assertTrue();
      expect(sample.border).assertEqual(COLORS.border);
    });

    /**
     * @tc.name ContractShapesTest_case_005
     * @tc.desc model-contract: ColorOptions.bgCard keeps its declared string payload, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ContractShapesTest_case_005', 0, () => {
      const sample: ColorOptions = {
        primary: COLORS.primary, bgPage: COLORS.bgPage, bgCard: COLORS.bgCard,
        textMain: COLORS.textMain, textSub: COLORS.textSub, border: COLORS.border,
        btnText: COLORS.btnText
      };
      expect(sample.bgCard).assertEqual(COLORS.bgCard);
      expect(sample.bgCard).assertEqual('#FFFFFF');
      expect(typeof sample.bgCard).assertEqual('string');
      expect(sample === COLORS).assertFalse();
      expect(sample.bgCard.length).assertEqual(7);
      expect(sample.btnText).assertEqual(COLORS.btnText);
    });

    /**
     * @tc.name ContractShapesTest_case_006
     * @tc.desc model-contract: ColorOptions.bgCard keeps its declared string payload, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ContractShapesTest_case_006', 0, () => {
      const sample: ColorOptions = {
        primary: COLORS.primary, bgPage: COLORS.bgPage, bgCard: COLORS.bgCard,
        textMain: COLORS.textMain, textSub: COLORS.textSub, border: COLORS.border,
        btnText: COLORS.btnText
      };
      expect(sample.bgCard).assertEqual(COLORS.bgCard);
      expect(sample.bgCard).assertEqual('#FFFFFF');
      expect(typeof sample.bgCard).assertEqual('string');
      const truncated: string = sample.bgCard.substring(0, 4);
      expect(truncated.length).assertEqual(4);
      expect(sample.bgCard.startsWith('#')).assertTrue();
      expect(sample.bgCard === COLORS.bgCard).assertTrue();
      expect(sample.border).assertEqual(COLORS.border);
    });

    /**
     * @tc.name ContractShapesTest_case_007
     * @tc.desc model-contract: ColorOptions.textMain keeps its declared string payload, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ContractShapesTest_case_007', 0, () => {
      const sample: ColorOptions = {
        primary: COLORS.primary, bgPage: COLORS.bgPage, bgCard: COLORS.bgCard,
        textMain: COLORS.textMain, textSub: COLORS.textSub, border: COLORS.border,
        btnText: COLORS.btnText
      };
      expect(sample.textMain).assertEqual(COLORS.textMain);
      expect(sample.textMain).assertEqual('#303133');
      expect(typeof sample.textMain).assertEqual('string');
      expect(sample === COLORS).assertFalse();
      expect(sample.textMain.length).assertEqual(7);
      expect(sample.btnText).assertEqual(COLORS.btnText);
    });

    /**
     * @tc.name ContractShapesTest_case_008
     * @tc.desc model-contract: ColorOptions.textMain keeps its declared string payload, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ContractShapesTest_case_008', 0, () => {
      const sample: ColorOptions = {
        primary: COLORS.primary, bgPage: COLORS.bgPage, bgCard: COLORS.bgCard,
        textMain: COLORS.textMain, textSub: COLORS.textSub, border: COLORS.border,
        btnText: COLORS.btnText
      };
      expect(sample.textMain).assertEqual(COLORS.textMain);
      expect(sample.textMain).assertEqual('#303133');
      expect(typeof sample.textMain).assertEqual('string');
      const truncated: string = sample.textMain.substring(0, 4);
      expect(truncated.length).assertEqual(4);
      expect(sample.textMain.startsWith('#')).assertTrue();
      expect(sample.textMain === COLORS.textMain).assertTrue();
      expect(sample.border).assertEqual(COLORS.border);
    });

    /**
     * @tc.name ContractShapesTest_case_009
     * @tc.desc model-contract: ColorOptions.textSub keeps its declared string payload, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ContractShapesTest_case_009', 0, () => {
      const sample: ColorOptions = {
        primary: COLORS.primary, bgPage: COLORS.bgPage, bgCard: COLORS.bgCard,
        textMain: COLORS.textMain, textSub: COLORS.textSub, border: COLORS.border,
        btnText: COLORS.btnText
      };
      expect(sample.textSub).assertEqual(COLORS.textSub);
      expect(sample.textSub).assertEqual('#909399');
      expect(typeof sample.textSub).assertEqual('string');
      expect(sample === COLORS).assertFalse();
      expect(sample.textSub.length).assertEqual(7);
      expect(sample.btnText).assertEqual(COLORS.btnText);
    });

    /**
     * @tc.name ContractShapesTest_case_010
     * @tc.desc model-contract: ColorOptions.textSub keeps its declared string payload, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ContractShapesTest_case_010', 0, () => {
      const sample: ColorOptions = {
        primary: COLORS.primary, bgPage: COLORS.bgPage, bgCard: COLORS.bgCard,
        textMain: COLORS.textMain, textSub: COLORS.textSub, border: COLORS.border,
        btnText: COLORS.btnText
      };
      expect(sample.textSub).assertEqual(COLORS.textSub);
      expect(sample.textSub).assertEqual('#909399');
      expect(typeof sample.textSub).assertEqual('string');
      const truncated: string = sample.textSub.substring(0, 4);
      expect(truncated.length).assertEqual(4);
      expect(sample.textSub.startsWith('#')).assertTrue();
      expect(sample.textSub === COLORS.textSub).assertTrue();
      expect(sample.border).assertEqual(COLORS.border);
    });

    /**
     * @tc.name ContractShapesTest_case_011
     * @tc.desc model-contract: ColorOptions.border keeps its declared string payload, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ContractShapesTest_case_011', 0, () => {
      const sample: ColorOptions = {
        primary: COLORS.primary, bgPage: COLORS.bgPage, bgCard: COLORS.bgCard,
        textMain: COLORS.textMain, textSub: COLORS.textSub, border: COLORS.border,
        btnText: COLORS.btnText
      };
      expect(sample.border).assertEqual(COLORS.border);
      expect(sample.border).assertEqual('#E5E6EB');
      expect(typeof sample.border).assertEqual('string');
      expect(sample === COLORS).assertFalse();
      expect(sample.border.length).assertEqual(7);
      expect(sample.btnText).assertEqual(COLORS.btnText);
    });

    /**
     * @tc.name ContractShapesTest_case_012
     * @tc.desc model-contract: ColorOptions.border keeps its declared string payload, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ContractShapesTest_case_012', 0, () => {
      const sample: ColorOptions = {
        primary: COLORS.primary, bgPage: COLORS.bgPage, bgCard: COLORS.bgCard,
        textMain: COLORS.textMain, textSub: COLORS.textSub, border: COLORS.border,
        btnText: COLORS.btnText
      };
      expect(sample.border).assertEqual(COLORS.border);
      expect(sample.border).assertEqual('#E5E6EB');
      expect(typeof sample.border).assertEqual('string');
      const truncated: string = sample.border.substring(0, 4);
      expect(truncated.length).assertEqual(4);
      expect(sample.border.startsWith('#')).assertTrue();
      expect(sample.border === COLORS.border).assertTrue();
      expect(sample.border).assertEqual(COLORS.border);
    });

    /**
     * @tc.name ContractShapesTest_case_013
     * @tc.desc model-contract: ColorOptions.btnText keeps its declared string payload, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ContractShapesTest_case_013', 0, () => {
      const sample: ColorOptions = {
        primary: COLORS.primary, bgPage: COLORS.bgPage, bgCard: COLORS.bgCard,
        textMain: COLORS.textMain, textSub: COLORS.textSub, border: COLORS.border,
        btnText: COLORS.btnText
      };
      expect(sample.btnText).assertEqual(COLORS.btnText);
      expect(sample.btnText).assertEqual('#FFFFFF');
      expect(typeof sample.btnText).assertEqual('string');
      expect(sample === COLORS).assertFalse();
      expect(sample.btnText.length).assertEqual(7);
      expect(sample.btnText).assertEqual(COLORS.btnText);
    });

    /**
     * @tc.name ContractShapesTest_case_014
     * @tc.desc model-contract: ColorOptions.btnText keeps its declared string payload, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ContractShapesTest_case_014', 0, () => {
      const sample: ColorOptions = {
        primary: COLORS.primary, bgPage: COLORS.bgPage, bgCard: COLORS.bgCard,
        textMain: COLORS.textMain, textSub: COLORS.textSub, border: COLORS.border,
        btnText: COLORS.btnText
      };
      expect(sample.btnText).assertEqual(COLORS.btnText);
      expect(sample.btnText).assertEqual('#FFFFFF');
      expect(typeof sample.btnText).assertEqual('string');
      const truncated: string = sample.btnText.substring(0, 4);
      expect(truncated.length).assertEqual(4);
      expect(sample.btnText.startsWith('#')).assertTrue();
      expect(sample.btnText === COLORS.btnText).assertTrue();
      expect(sample.border).assertEqual(COLORS.border);
    });

    /**
     * @tc.name ContractShapesTest_case_015
     * @tc.desc model-contract: SizeOptions.radius keeps its declared int payload, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ContractShapesTest_case_015', 0, () => {
      const sample: SizeOptions = {
        radius: SIZES.radius, padding: SIZES.padding, fontSizeTitle: SIZES.fontSizeTitle,
        fontSizeNormal: SIZES.fontSizeNormal, fontSizeSmall: SIZES.fontSizeSmall, spacing: SIZES.spacing
      };
      expect(sample.radius).assertEqual(SIZES.radius);
      expect(sample.radius).assertEqual(12);
      expect(typeof sample.radius).assertEqual('int');
      expect(sample === SIZES).assertFalse();
      expect(Number.isInteger(sample.radius)).assertTrue();
      expect(sample.padding).assertEqual(SIZES.padding);
    });

    /**
     * @tc.name ContractShapesTest_case_016
     * @tc.desc model-contract: SizeOptions.radius keeps its declared int payload, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ContractShapesTest_case_016', 0, () => {
      const sample: SizeOptions = {
        radius: SIZES.radius, padding: SIZES.padding, fontSizeTitle: SIZES.fontSizeTitle,
        fontSizeNormal: SIZES.fontSizeNormal, fontSizeSmall: SIZES.fontSizeSmall, spacing: SIZES.spacing
      };
      expect(sample.radius).assertEqual(SIZES.radius);
      expect(sample.radius).assertEqual(12);
      expect(typeof sample.radius).assertEqual('int');
      expect(sample.radius + 0).assertEqual(12);
      expect(sample.radius * 1).assertEqual(12);
      expect(sample.radius === SIZES.radius).assertTrue();
      expect(sample.spacing).assertEqual(SIZES.spacing);
    });

    /**
     * @tc.name ContractShapesTest_case_017
     * @tc.desc model-contract: SizeOptions.padding keeps its declared int payload, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ContractShapesTest_case_017', 0, () => {
      const sample: SizeOptions = {
        radius: SIZES.radius, padding: SIZES.padding, fontSizeTitle: SIZES.fontSizeTitle,
        fontSizeNormal: SIZES.fontSizeNormal, fontSizeSmall: SIZES.fontSizeSmall, spacing: SIZES.spacing
      };
      expect(sample.padding).assertEqual(SIZES.padding);
      expect(sample.padding).assertEqual(20);
      expect(typeof sample.padding).assertEqual('int');
      expect(sample === SIZES).assertFalse();
      expect(Number.isInteger(sample.padding)).assertTrue();
      expect(sample.padding).assertEqual(SIZES.padding);
    });

    /**
     * @tc.name ContractShapesTest_case_018
     * @tc.desc model-contract: SizeOptions.padding keeps its declared int payload, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ContractShapesTest_case_018', 0, () => {
      const sample: SizeOptions = {
        radius: SIZES.radius, padding: SIZES.padding, fontSizeTitle: SIZES.fontSizeTitle,
        fontSizeNormal: SIZES.fontSizeNormal, fontSizeSmall: SIZES.fontSizeSmall, spacing: SIZES.spacing
      };
      expect(sample.padding).assertEqual(SIZES.padding);
      expect(sample.padding).assertEqual(20);
      expect(typeof sample.padding).assertEqual('int');
      expect(sample.padding + 0).assertEqual(20);
      expect(sample.padding * 1).assertEqual(20);
      expect(sample.padding === SIZES.padding).assertTrue();
      expect(sample.spacing).assertEqual(SIZES.spacing);
    });

    /**
     * @tc.name ContractShapesTest_case_019
     * @tc.desc model-contract: SizeOptions.fontSizeTitle keeps its declared int payload, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ContractShapesTest_case_019', 0, () => {
      const sample: SizeOptions = {
        radius: SIZES.radius, padding: SIZES.padding, fontSizeTitle: SIZES.fontSizeTitle,
        fontSizeNormal: SIZES.fontSizeNormal, fontSizeSmall: SIZES.fontSizeSmall, spacing: SIZES.spacing
      };
      expect(sample.fontSizeTitle).assertEqual(SIZES.fontSizeTitle);
      expect(sample.fontSizeTitle).assertEqual(22);
      expect(typeof sample.fontSizeTitle).assertEqual('int');
      expect(sample === SIZES).assertFalse();
      expect(Number.isInteger(sample.fontSizeTitle)).assertTrue();
      expect(sample.padding).assertEqual(SIZES.padding);
    });

    /**
     * @tc.name ContractShapesTest_case_020
     * @tc.desc model-contract: SizeOptions.fontSizeTitle keeps its declared int payload, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ContractShapesTest_case_020', 0, () => {
      const sample: SizeOptions = {
        radius: SIZES.radius, padding: SIZES.padding, fontSizeTitle: SIZES.fontSizeTitle,
        fontSizeNormal: SIZES.fontSizeNormal, fontSizeSmall: SIZES.fontSizeSmall, spacing: SIZES.spacing
      };
      expect(sample.fontSizeTitle).assertEqual(SIZES.fontSizeTitle);
      expect(sample.fontSizeTitle).assertEqual(22);
      expect(typeof sample.fontSizeTitle).assertEqual('int');
      expect(sample.fontSizeTitle + 0).assertEqual(22);
      expect(sample.fontSizeTitle * 1).assertEqual(22);
      expect(sample.fontSizeTitle === SIZES.fontSizeTitle).assertTrue();
      expect(sample.spacing).assertEqual(SIZES.spacing);
    });

    /**
     * @tc.name ContractShapesTest_case_021
     * @tc.desc model-contract: SizeOptions.fontSizeNormal keeps its declared int payload, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ContractShapesTest_case_021', 0, () => {
      const sample: SizeOptions = {
        radius: SIZES.radius, padding: SIZES.padding, fontSizeTitle: SIZES.fontSizeTitle,
        fontSizeNormal: SIZES.fontSizeNormal, fontSizeSmall: SIZES.fontSizeSmall, spacing: SIZES.spacing
      };
      expect(sample.fontSizeNormal).assertEqual(SIZES.fontSizeNormal);
      expect(sample.fontSizeNormal).assertEqual(16);
      expect(typeof sample.fontSizeNormal).assertEqual('int');
      expect(sample === SIZES).assertFalse();
      expect(Number.isInteger(sample.fontSizeNormal)).assertTrue();
      expect(sample.padding).assertEqual(SIZES.padding);
    });

    /**
     * @tc.name ContractShapesTest_case_022
     * @tc.desc model-contract: SizeOptions.fontSizeNormal keeps its declared int payload, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ContractShapesTest_case_022', 0, () => {
      const sample: SizeOptions = {
        radius: SIZES.radius, padding: SIZES.padding, fontSizeTitle: SIZES.fontSizeTitle,
        fontSizeNormal: SIZES.fontSizeNormal, fontSizeSmall: SIZES.fontSizeSmall, spacing: SIZES.spacing
      };
      expect(sample.fontSizeNormal).assertEqual(SIZES.fontSizeNormal);
      expect(sample.fontSizeNormal).assertEqual(16);
      expect(typeof sample.fontSizeNormal).assertEqual('int');
      expect(sample.fontSizeNormal + 0).assertEqual(16);
      expect(sample.fontSizeNormal * 1).assertEqual(16);
      expect(sample.fontSizeNormal === SIZES.fontSizeNormal).assertTrue();
      expect(sample.spacing).assertEqual(SIZES.spacing);
    });

    /**
     * @tc.name ContractShapesTest_case_023
     * @tc.desc model-contract: SizeOptions.fontSizeSmall keeps its declared int payload, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ContractShapesTest_case_023', 0, () => {
      const sample: SizeOptions = {
        radius: SIZES.radius, padding: SIZES.padding, fontSizeTitle: SIZES.fontSizeTitle,
        fontSizeNormal: SIZES.fontSizeNormal, fontSizeSmall: SIZES.fontSizeSmall, spacing: SIZES.spacing
      };
      expect(sample.fontSizeSmall).assertEqual(SIZES.fontSizeSmall);
      expect(sample.fontSizeSmall).assertEqual(14);
      expect(typeof sample.fontSizeSmall).assertEqual('int');
      expect(sample === SIZES).assertFalse();
      expect(Number.isInteger(sample.fontSizeSmall)).assertTrue();
      expect(sample.padding).assertEqual(SIZES.padding);
    });

    /**
     * @tc.name ContractShapesTest_case_024
     * @tc.desc model-contract: SizeOptions.fontSizeSmall keeps its declared int payload, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ContractShapesTest_case_024', 0, () => {
      const sample: SizeOptions = {
        radius: SIZES.radius, padding: SIZES.padding, fontSizeTitle: SIZES.fontSizeTitle,
        fontSizeNormal: SIZES.fontSizeNormal, fontSizeSmall: SIZES.fontSizeSmall, spacing: SIZES.spacing
      };
      expect(sample.fontSizeSmall).assertEqual(SIZES.fontSizeSmall);
      expect(sample.fontSizeSmall).assertEqual(14);
      expect(typeof sample.fontSizeSmall).assertEqual('int');
      expect(sample.fontSizeSmall + 0).assertEqual(14);
      expect(sample.fontSizeSmall * 1).assertEqual(14);
      expect(sample.fontSizeSmall === SIZES.fontSizeSmall).assertTrue();
      expect(sample.spacing).assertEqual(SIZES.spacing);
    });

    /**
     * @tc.name ContractShapesTest_case_025
     * @tc.desc model-contract: SizeOptions.spacing keeps its declared int payload, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ContractShapesTest_case_025', 0, () => {
      const sample: SizeOptions = {
        radius: SIZES.radius, padding: SIZES.padding, fontSizeTitle: SIZES.fontSizeTitle,
        fontSizeNormal: SIZES.fontSizeNormal, fontSizeSmall: SIZES.fontSizeSmall, spacing: SIZES.spacing
      };
      expect(sample.spacing).assertEqual(SIZES.spacing);
      expect(sample.spacing).assertEqual(16);
      expect(typeof sample.spacing).assertEqual('int');
      expect(sample === SIZES).assertFalse();
      expect(Number.isInteger(sample.spacing)).assertTrue();
      expect(sample.padding).assertEqual(SIZES.padding);
    });

    /**
     * @tc.name ContractShapesTest_case_026
     * @tc.desc model-contract: SizeOptions.spacing keeps its declared int payload, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ContractShapesTest_case_026', 0, () => {
      const sample: SizeOptions = {
        radius: SIZES.radius, padding: SIZES.padding, fontSizeTitle: SIZES.fontSizeTitle,
        fontSizeNormal: SIZES.fontSizeNormal, fontSizeSmall: SIZES.fontSizeSmall, spacing: SIZES.spacing
      };
      expect(sample.spacing).assertEqual(SIZES.spacing);
      expect(sample.spacing).assertEqual(16);
      expect(typeof sample.spacing).assertEqual('int');
      expect(sample.spacing + 0).assertEqual(16);
      expect(sample.spacing * 1).assertEqual(16);
      expect(sample.spacing === SIZES.spacing).assertTrue();
      expect(sample.spacing).assertEqual(SIZES.spacing);
    });

    /**
     * @tc.name ContractShapesTest_case_027
     * @tc.desc model-contract: full ColorOptions literal round-trips every declared key.
     * @tc.type Function
     * @tc.level Level1
     */
    it('ContractShapesTest_case_027', 0, () => {
      const literal: ColorOptions = {
        primary: '#67C23A', bgPage: '#F5F7FA', bgCard: '#FFFFFF',
        textMain: '#303133', textSub: '#909399', border: '#E5E6EB', btnText: '#FFFFFF'
      };
      expect(literal.primary).assertEqual(COLORS.primary);
      expect(literal.bgPage).assertEqual(COLORS.bgPage);
      expect(literal.bgCard).assertEqual(COLORS.bgCard);
      expect(literal.textMain).assertEqual(COLORS.textMain);
      expect(literal.textSub).assertEqual(COLORS.textSub);
      expect(literal.border).assertEqual(COLORS.border);
      expect(literal.btnText).assertEqual(COLORS.btnText);
    });

  });
}
