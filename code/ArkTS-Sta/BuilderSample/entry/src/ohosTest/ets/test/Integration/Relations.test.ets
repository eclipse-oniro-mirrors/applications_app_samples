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
import { relativeLuminance, round4, hexDistance, isUppercaseHex } from '../Shared/ColorMath';
import { logSuite } from '../Shared/Copy';

export default function RelationsTest(): void {
  describe('RelationsTest', () => {
    beforeAll(() => {
      logSuite('RelationsTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('RelationsTest', 'end');
    });

    /**
     * @tc.name RelationsTest_case_001
     * @tc.desc color-relation: primary against primary luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_001', 0, () => {
      const first: string = COLORS.primary;
      const second: string = COLORS.primary;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(true);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(false);
      expect(hexDistance(first, second)).assertEqual(0);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(true);
      expect(round4(relativeLuminance(first))).assertEqual(0.4177);
    });

    /**
     * @tc.name RelationsTest_case_002
     * @tc.desc color-relation: primary against bgPage luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_002', 0, () => {
      const first: string = COLORS.primary;
      const second: string = COLORS.bgPage;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(false);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(true);
      expect(hexDistance(first, second)).assertEqual(387);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(0.4177);
    });

    /**
     * @tc.name RelationsTest_case_003
     * @tc.desc color-relation: primary against bgCard luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_003', 0, () => {
      const first: string = COLORS.primary;
      const second: string = COLORS.bgCard;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(false);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(true);
      expect(hexDistance(first, second)).assertEqual(410);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(0.4177);
    });

    /**
     * @tc.name RelationsTest_case_004
     * @tc.desc color-relation: primary against textMain luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_004', 0, () => {
      const first: string = COLORS.primary;
      const second: string = COLORS.textMain;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(true);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(false);
      expect(hexDistance(first, second)).assertEqual(207);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(0.4177);
    });

    /**
     * @tc.name RelationsTest_case_005
     * @tc.desc color-relation: primary against textSub luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_005', 0, () => {
      const first: string = COLORS.primary;
      const second: string = COLORS.textSub;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(true);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(false);
      expect(hexDistance(first, second)).assertEqual(183);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(0.4177);
    });

    /**
     * @tc.name RelationsTest_case_006
     * @tc.desc color-relation: primary against border luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_006', 0, () => {
      const first: string = COLORS.primary;
      const second: string = COLORS.border;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(false);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(true);
      expect(hexDistance(first, second)).assertEqual(339);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(0.4177);
    });

    /**
     * @tc.name RelationsTest_case_007
     * @tc.desc color-relation: primary against btnText luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_007', 0, () => {
      const first: string = COLORS.primary;
      const second: string = COLORS.btnText;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(false);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(true);
      expect(hexDistance(first, second)).assertEqual(410);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(0.4177);
    });

    /**
     * @tc.name RelationsTest_case_008
     * @tc.desc color-relation: bgPage against primary luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_008', 0, () => {
      const first: string = COLORS.bgPage;
      const second: string = COLORS.primary;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(true);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(false);
      expect(hexDistance(first, second)).assertEqual(387);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(0.9284);
    });

    /**
     * @tc.name RelationsTest_case_009
     * @tc.desc color-relation: bgPage against bgPage luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_009', 0, () => {
      const first: string = COLORS.bgPage;
      const second: string = COLORS.bgPage;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(true);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(false);
      expect(hexDistance(first, second)).assertEqual(0);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(true);
      expect(round4(relativeLuminance(first))).assertEqual(0.9284);
    });

    /**
     * @tc.name RelationsTest_case_010
     * @tc.desc color-relation: bgPage against bgCard luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_010', 0, () => {
      const first: string = COLORS.bgPage;
      const second: string = COLORS.bgCard;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(false);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(true);
      expect(hexDistance(first, second)).assertEqual(23);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(0.9284);
    });

    /**
     * @tc.name RelationsTest_case_011
     * @tc.desc color-relation: bgPage against textMain luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_011', 0, () => {
      const first: string = COLORS.bgPage;
      const second: string = COLORS.textMain;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(true);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(false);
      expect(hexDistance(first, second)).assertEqual(594);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(0.9284);
    });

    /**
     * @tc.name RelationsTest_case_012
     * @tc.desc color-relation: bgPage against textSub luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_012', 0, () => {
      const first: string = COLORS.bgPage;
      const second: string = COLORS.textSub;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(true);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(false);
      expect(hexDistance(first, second)).assertEqual(298);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(0.9284);
    });

    /**
     * @tc.name RelationsTest_case_013
     * @tc.desc color-relation: bgPage against border luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_013', 0, () => {
      const first: string = COLORS.bgPage;
      const second: string = COLORS.border;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(true);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(false);
      expect(hexDistance(first, second)).assertEqual(48);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(0.9284);
    });

    /**
     * @tc.name RelationsTest_case_014
     * @tc.desc color-relation: bgPage against btnText luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_014', 0, () => {
      const first: string = COLORS.bgPage;
      const second: string = COLORS.btnText;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(false);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(true);
      expect(hexDistance(first, second)).assertEqual(23);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(0.9284);
    });

    /**
     * @tc.name RelationsTest_case_015
     * @tc.desc color-relation: bgCard against primary luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_015', 0, () => {
      const first: string = COLORS.bgCard;
      const second: string = COLORS.primary;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(true);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(false);
      expect(hexDistance(first, second)).assertEqual(410);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(1.0000);
    });

    /**
     * @tc.name RelationsTest_case_016
     * @tc.desc color-relation: bgCard against bgPage luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_016', 0, () => {
      const first: string = COLORS.bgCard;
      const second: string = COLORS.bgPage;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(true);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(false);
      expect(hexDistance(first, second)).assertEqual(23);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(1.0000);
    });

    /**
     * @tc.name RelationsTest_case_017
     * @tc.desc color-relation: bgCard against bgCard luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_017', 0, () => {
      const first: string = COLORS.bgCard;
      const second: string = COLORS.bgCard;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(true);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(false);
      expect(hexDistance(first, second)).assertEqual(0);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(true);
      expect(round4(relativeLuminance(first))).assertEqual(1.0000);
    });

    /**
     * @tc.name RelationsTest_case_018
     * @tc.desc color-relation: bgCard against textMain luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_018', 0, () => {
      const first: string = COLORS.bgCard;
      const second: string = COLORS.textMain;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(true);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(false);
      expect(hexDistance(first, second)).assertEqual(617);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(1.0000);
    });

    /**
     * @tc.name RelationsTest_case_019
     * @tc.desc color-relation: bgCard against textSub luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_019', 0, () => {
      const first: string = COLORS.bgCard;
      const second: string = COLORS.textSub;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(true);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(false);
      expect(hexDistance(first, second)).assertEqual(321);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(1.0000);
    });

    /**
     * @tc.name RelationsTest_case_020
     * @tc.desc color-relation: bgCard against border luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_020', 0, () => {
      const first: string = COLORS.bgCard;
      const second: string = COLORS.border;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(true);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(false);
      expect(hexDistance(first, second)).assertEqual(71);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(1.0000);
    });

    /**
     * @tc.name RelationsTest_case_021
     * @tc.desc color-relation: bgCard against btnText luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_021', 0, () => {
      const first: string = COLORS.bgCard;
      const second: string = COLORS.btnText;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(true);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(false);
      expect(hexDistance(first, second)).assertEqual(0);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(true);
      expect(round4(relativeLuminance(first))).assertEqual(1.0000);
    });

    /**
     * @tc.name RelationsTest_case_022
     * @tc.desc color-relation: textMain against primary luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_022', 0, () => {
      const first: string = COLORS.textMain;
      const second: string = COLORS.primary;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(false);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(true);
      expect(hexDistance(first, second)).assertEqual(207);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(0.0306);
    });

    /**
     * @tc.name RelationsTest_case_023
     * @tc.desc color-relation: textMain against bgPage luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_023', 0, () => {
      const first: string = COLORS.textMain;
      const second: string = COLORS.bgPage;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(false);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(true);
      expect(hexDistance(first, second)).assertEqual(594);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(0.0306);
    });

    /**
     * @tc.name RelationsTest_case_024
     * @tc.desc color-relation: textMain against bgCard luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_024', 0, () => {
      const first: string = COLORS.textMain;
      const second: string = COLORS.bgCard;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(false);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(true);
      expect(hexDistance(first, second)).assertEqual(617);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(0.0306);
    });

    /**
     * @tc.name RelationsTest_case_025
     * @tc.desc color-relation: textMain against textMain luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_025', 0, () => {
      const first: string = COLORS.textMain;
      const second: string = COLORS.textMain;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(true);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(false);
      expect(hexDistance(first, second)).assertEqual(0);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(true);
      expect(round4(relativeLuminance(first))).assertEqual(0.0306);
    });

    /**
     * @tc.name RelationsTest_case_026
     * @tc.desc color-relation: textMain against textSub luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_026', 0, () => {
      const first: string = COLORS.textMain;
      const second: string = COLORS.textSub;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(false);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(true);
      expect(hexDistance(first, second)).assertEqual(296);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(0.0306);
    });

    /**
     * @tc.name RelationsTest_case_027
     * @tc.desc color-relation: textMain against border luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_027', 0, () => {
      const first: string = COLORS.textMain;
      const second: string = COLORS.border;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(false);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(true);
      expect(hexDistance(first, second)).assertEqual(546);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(0.0306);
    });

    /**
     * @tc.name RelationsTest_case_028
     * @tc.desc color-relation: textMain against btnText luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_028', 0, () => {
      const first: string = COLORS.textMain;
      const second: string = COLORS.btnText;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(false);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(true);
      expect(hexDistance(first, second)).assertEqual(617);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(0.0306);
    });

    /**
     * @tc.name RelationsTest_case_029
     * @tc.desc color-relation: textSub against primary luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_029', 0, () => {
      const first: string = COLORS.textSub;
      const second: string = COLORS.primary;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(false);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(true);
      expect(hexDistance(first, second)).assertEqual(183);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(0.2910);
    });

    /**
     * @tc.name RelationsTest_case_030
     * @tc.desc color-relation: textSub against bgPage luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_030', 0, () => {
      const first: string = COLORS.textSub;
      const second: string = COLORS.bgPage;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(false);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(true);
      expect(hexDistance(first, second)).assertEqual(298);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(0.2910);
    });

    /**
     * @tc.name RelationsTest_case_031
     * @tc.desc color-relation: textSub against bgCard luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_031', 0, () => {
      const first: string = COLORS.textSub;
      const second: string = COLORS.bgCard;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(false);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(true);
      expect(hexDistance(first, second)).assertEqual(321);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(0.2910);
    });

    /**
     * @tc.name RelationsTest_case_032
     * @tc.desc color-relation: textSub against textMain luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_032', 0, () => {
      const first: string = COLORS.textSub;
      const second: string = COLORS.textMain;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(true);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(false);
      expect(hexDistance(first, second)).assertEqual(296);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(0.2910);
    });

    /**
     * @tc.name RelationsTest_case_033
     * @tc.desc color-relation: textSub against textSub luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_033', 0, () => {
      const first: string = COLORS.textSub;
      const second: string = COLORS.textSub;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(true);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(false);
      expect(hexDistance(first, second)).assertEqual(0);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(true);
      expect(round4(relativeLuminance(first))).assertEqual(0.2910);
    });

    /**
     * @tc.name RelationsTest_case_034
     * @tc.desc color-relation: textSub against border luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_034', 0, () => {
      const first: string = COLORS.textSub;
      const second: string = COLORS.border;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(false);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(true);
      expect(hexDistance(first, second)).assertEqual(250);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(0.2910);
    });

    /**
     * @tc.name RelationsTest_case_035
     * @tc.desc color-relation: textSub against btnText luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_035', 0, () => {
      const first: string = COLORS.textSub;
      const second: string = COLORS.btnText;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(false);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(true);
      expect(hexDistance(first, second)).assertEqual(321);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(0.2910);
    });

    /**
     * @tc.name RelationsTest_case_036
     * @tc.desc color-relation: border against primary luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_036', 0, () => {
      const first: string = COLORS.border;
      const second: string = COLORS.primary;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(true);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(false);
      expect(hexDistance(first, second)).assertEqual(339);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(0.7925);
    });

    /**
     * @tc.name RelationsTest_case_037
     * @tc.desc color-relation: border against bgPage luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_037', 0, () => {
      const first: string = COLORS.border;
      const second: string = COLORS.bgPage;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(false);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(true);
      expect(hexDistance(first, second)).assertEqual(48);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(0.7925);
    });

    /**
     * @tc.name RelationsTest_case_038
     * @tc.desc color-relation: border against bgCard luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_038', 0, () => {
      const first: string = COLORS.border;
      const second: string = COLORS.bgCard;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(false);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(true);
      expect(hexDistance(first, second)).assertEqual(71);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(0.7925);
    });

    /**
     * @tc.name RelationsTest_case_039
     * @tc.desc color-relation: border against textMain luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_039', 0, () => {
      const first: string = COLORS.border;
      const second: string = COLORS.textMain;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(true);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(false);
      expect(hexDistance(first, second)).assertEqual(546);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(0.7925);
    });

    /**
     * @tc.name RelationsTest_case_040
     * @tc.desc color-relation: border against textSub luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_040', 0, () => {
      const first: string = COLORS.border;
      const second: string = COLORS.textSub;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(true);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(false);
      expect(hexDistance(first, second)).assertEqual(250);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(0.7925);
    });

    /**
     * @tc.name RelationsTest_case_041
     * @tc.desc color-relation: border against border luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_041', 0, () => {
      const first: string = COLORS.border;
      const second: string = COLORS.border;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(true);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(false);
      expect(hexDistance(first, second)).assertEqual(0);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(true);
      expect(round4(relativeLuminance(first))).assertEqual(0.7925);
    });

    /**
     * @tc.name RelationsTest_case_042
     * @tc.desc color-relation: border against btnText luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_042', 0, () => {
      const first: string = COLORS.border;
      const second: string = COLORS.btnText;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(false);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(true);
      expect(hexDistance(first, second)).assertEqual(71);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(0.7925);
    });

    /**
     * @tc.name RelationsTest_case_043
     * @tc.desc color-relation: btnText against primary luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_043', 0, () => {
      const first: string = COLORS.btnText;
      const second: string = COLORS.primary;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(true);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(false);
      expect(hexDistance(first, second)).assertEqual(410);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(1.0000);
    });

    /**
     * @tc.name RelationsTest_case_044
     * @tc.desc color-relation: btnText against bgPage luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_044', 0, () => {
      const first: string = COLORS.btnText;
      const second: string = COLORS.bgPage;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(true);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(false);
      expect(hexDistance(first, second)).assertEqual(23);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(1.0000);
    });

    /**
     * @tc.name RelationsTest_case_045
     * @tc.desc color-relation: btnText against bgCard luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_045', 0, () => {
      const first: string = COLORS.btnText;
      const second: string = COLORS.bgCard;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(true);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(false);
      expect(hexDistance(first, second)).assertEqual(0);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(true);
      expect(round4(relativeLuminance(first))).assertEqual(1.0000);
    });

    /**
     * @tc.name RelationsTest_case_046
     * @tc.desc color-relation: btnText against textMain luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_046', 0, () => {
      const first: string = COLORS.btnText;
      const second: string = COLORS.textMain;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(true);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(false);
      expect(hexDistance(first, second)).assertEqual(617);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(1.0000);
    });

    /**
     * @tc.name RelationsTest_case_047
     * @tc.desc color-relation: btnText against textSub luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_047', 0, () => {
      const first: string = COLORS.btnText;
      const second: string = COLORS.textSub;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(true);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(false);
      expect(hexDistance(first, second)).assertEqual(321);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(1.0000);
    });

    /**
     * @tc.name RelationsTest_case_048
     * @tc.desc color-relation: btnText against border luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_048', 0, () => {
      const first: string = COLORS.btnText;
      const second: string = COLORS.border;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(true);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(false);
      expect(hexDistance(first, second)).assertEqual(71);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(false);
      expect(round4(relativeLuminance(first))).assertEqual(1.0000);
    });

    /**
     * @tc.name RelationsTest_case_049
     * @tc.desc color-relation: btnText against btnText luminance and distance ordering.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_049', 0, () => {
      const first: string = COLORS.btnText;
      const second: string = COLORS.btnText;
      expect(isUppercaseHex(first)).assertTrue();
      expect(isUppercaseHex(second)).assertTrue();
      expect(relativeLuminance(first) >= relativeLuminance(second)).assertEqual(true);
      expect(relativeLuminance(first) < relativeLuminance(second)).assertEqual(false);
      expect(hexDistance(first, second)).assertEqual(0);
      expect(hexDistance(first, second) === hexDistance(second, first)).assertTrue();
      expect(first === second).assertEqual(true);
      expect(round4(relativeLuminance(first))).assertEqual(1.0000);
    });

    /**
     * @tc.name RelationsTest_case_050
     * @tc.desc color-relation: bgCard and btnText intentionally share pure white.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_050', 0, () => {
      expect(COLORS.bgCard).assertEqual(COLORS.btnText);
      expect(COLORS.bgCard).assertEqual('#FFFFFF');
      expect(relativeLuminance(COLORS.bgCard) > relativeLuminance(COLORS.bgPage)).assertTrue();
      expect(relativeLuminance(COLORS.bgPage) > relativeLuminance(COLORS.border)).assertTrue();
      expect(relativeLuminance(COLORS.border) > relativeLuminance(COLORS.textSub)).assertTrue();
      expect(relativeLuminance(COLORS.textSub) > relativeLuminance(COLORS.textMain)).assertTrue();
    });

    /**
     * @tc.name RelationsTest_case_051
     * @tc.desc size-relation: radius vs radius ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_051', 0, () => {
      expect(SIZES.radius <= SIZES.radius).assertEqual(true);
      expect(SIZES.radius >= SIZES.radius).assertEqual(true);
      expect(SIZES.radius === SIZES.radius).assertEqual(true);
      expect(Math.abs(SIZES.radius - SIZES.radius)).assertEqual(0);
      expect(SIZES.radius + SIZES.radius).assertEqual(24);
      expect(SIZES.radius * SIZES.radius).assertEqual(144);
      expect(SIZES.radius - SIZES.radius).assertEqual(0);
    });

    /**
     * @tc.name RelationsTest_case_052
     * @tc.desc size-relation: radius vs padding ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_052', 0, () => {
      expect(SIZES.radius <= SIZES.padding).assertEqual(true);
      expect(SIZES.radius >= SIZES.padding).assertEqual(false);
      expect(SIZES.radius === SIZES.padding).assertEqual(false);
      expect(Math.abs(SIZES.radius - SIZES.padding)).assertEqual(8);
      expect(SIZES.radius + SIZES.padding).assertEqual(32);
      expect(SIZES.radius * SIZES.padding).assertEqual(240);
      expect(SIZES.radius - SIZES.padding).assertEqual(-8);
    });

    /**
     * @tc.name RelationsTest_case_053
     * @tc.desc size-relation: radius vs fontSizeTitle ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_053', 0, () => {
      expect(SIZES.radius <= SIZES.fontSizeTitle).assertEqual(true);
      expect(SIZES.radius >= SIZES.fontSizeTitle).assertEqual(false);
      expect(SIZES.radius === SIZES.fontSizeTitle).assertEqual(false);
      expect(Math.abs(SIZES.radius - SIZES.fontSizeTitle)).assertEqual(10);
      expect(SIZES.radius + SIZES.fontSizeTitle).assertEqual(34);
      expect(SIZES.radius * SIZES.fontSizeTitle).assertEqual(264);
      expect(SIZES.radius - SIZES.fontSizeTitle).assertEqual(-10);
    });

    /**
     * @tc.name RelationsTest_case_054
     * @tc.desc size-relation: radius vs fontSizeNormal ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_054', 0, () => {
      expect(SIZES.radius <= SIZES.fontSizeNormal).assertEqual(true);
      expect(SIZES.radius >= SIZES.fontSizeNormal).assertEqual(false);
      expect(SIZES.radius === SIZES.fontSizeNormal).assertEqual(false);
      expect(Math.abs(SIZES.radius - SIZES.fontSizeNormal)).assertEqual(4);
      expect(SIZES.radius + SIZES.fontSizeNormal).assertEqual(28);
      expect(SIZES.radius * SIZES.fontSizeNormal).assertEqual(192);
      expect(SIZES.radius - SIZES.fontSizeNormal).assertEqual(-4);
    });

    /**
     * @tc.name RelationsTest_case_055
     * @tc.desc size-relation: radius vs fontSizeSmall ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_055', 0, () => {
      expect(SIZES.radius <= SIZES.fontSizeSmall).assertEqual(true);
      expect(SIZES.radius >= SIZES.fontSizeSmall).assertEqual(false);
      expect(SIZES.radius === SIZES.fontSizeSmall).assertEqual(false);
      expect(Math.abs(SIZES.radius - SIZES.fontSizeSmall)).assertEqual(2);
      expect(SIZES.radius + SIZES.fontSizeSmall).assertEqual(26);
      expect(SIZES.radius * SIZES.fontSizeSmall).assertEqual(168);
      expect(SIZES.radius - SIZES.fontSizeSmall).assertEqual(-2);
    });

    /**
     * @tc.name RelationsTest_case_056
     * @tc.desc size-relation: radius vs spacing ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_056', 0, () => {
      expect(SIZES.radius <= SIZES.spacing).assertEqual(true);
      expect(SIZES.radius >= SIZES.spacing).assertEqual(false);
      expect(SIZES.radius === SIZES.spacing).assertEqual(false);
      expect(Math.abs(SIZES.radius - SIZES.spacing)).assertEqual(4);
      expect(SIZES.radius + SIZES.spacing).assertEqual(28);
      expect(SIZES.radius * SIZES.spacing).assertEqual(192);
      expect(SIZES.radius - SIZES.spacing).assertEqual(-4);
    });

    /**
     * @tc.name RelationsTest_case_057
     * @tc.desc size-relation: padding vs radius ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_057', 0, () => {
      expect(SIZES.padding <= SIZES.radius).assertEqual(false);
      expect(SIZES.padding >= SIZES.radius).assertEqual(true);
      expect(SIZES.padding === SIZES.radius).assertEqual(false);
      expect(Math.abs(SIZES.padding - SIZES.radius)).assertEqual(8);
      expect(SIZES.padding + SIZES.radius).assertEqual(32);
      expect(SIZES.padding * SIZES.radius).assertEqual(240);
      expect(SIZES.padding - SIZES.radius).assertEqual(8);
    });

    /**
     * @tc.name RelationsTest_case_058
     * @tc.desc size-relation: padding vs padding ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_058', 0, () => {
      expect(SIZES.padding <= SIZES.padding).assertEqual(true);
      expect(SIZES.padding >= SIZES.padding).assertEqual(true);
      expect(SIZES.padding === SIZES.padding).assertEqual(true);
      expect(Math.abs(SIZES.padding - SIZES.padding)).assertEqual(0);
      expect(SIZES.padding + SIZES.padding).assertEqual(40);
      expect(SIZES.padding * SIZES.padding).assertEqual(400);
      expect(SIZES.padding - SIZES.padding).assertEqual(0);
    });

    /**
     * @tc.name RelationsTest_case_059
     * @tc.desc size-relation: padding vs fontSizeTitle ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_059', 0, () => {
      expect(SIZES.padding <= SIZES.fontSizeTitle).assertEqual(true);
      expect(SIZES.padding >= SIZES.fontSizeTitle).assertEqual(false);
      expect(SIZES.padding === SIZES.fontSizeTitle).assertEqual(false);
      expect(Math.abs(SIZES.padding - SIZES.fontSizeTitle)).assertEqual(2);
      expect(SIZES.padding + SIZES.fontSizeTitle).assertEqual(42);
      expect(SIZES.padding * SIZES.fontSizeTitle).assertEqual(440);
      expect(SIZES.padding - SIZES.fontSizeTitle).assertEqual(-2);
    });

    /**
     * @tc.name RelationsTest_case_060
     * @tc.desc size-relation: padding vs fontSizeNormal ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_060', 0, () => {
      expect(SIZES.padding <= SIZES.fontSizeNormal).assertEqual(false);
      expect(SIZES.padding >= SIZES.fontSizeNormal).assertEqual(true);
      expect(SIZES.padding === SIZES.fontSizeNormal).assertEqual(false);
      expect(Math.abs(SIZES.padding - SIZES.fontSizeNormal)).assertEqual(4);
      expect(SIZES.padding + SIZES.fontSizeNormal).assertEqual(36);
      expect(SIZES.padding * SIZES.fontSizeNormal).assertEqual(320);
      expect(SIZES.padding - SIZES.fontSizeNormal).assertEqual(4);
    });

    /**
     * @tc.name RelationsTest_case_061
     * @tc.desc size-relation: padding vs fontSizeSmall ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_061', 0, () => {
      expect(SIZES.padding <= SIZES.fontSizeSmall).assertEqual(false);
      expect(SIZES.padding >= SIZES.fontSizeSmall).assertEqual(true);
      expect(SIZES.padding === SIZES.fontSizeSmall).assertEqual(false);
      expect(Math.abs(SIZES.padding - SIZES.fontSizeSmall)).assertEqual(6);
      expect(SIZES.padding + SIZES.fontSizeSmall).assertEqual(34);
      expect(SIZES.padding * SIZES.fontSizeSmall).assertEqual(280);
      expect(SIZES.padding - SIZES.fontSizeSmall).assertEqual(6);
    });

    /**
     * @tc.name RelationsTest_case_062
     * @tc.desc size-relation: padding vs spacing ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_062', 0, () => {
      expect(SIZES.padding <= SIZES.spacing).assertEqual(false);
      expect(SIZES.padding >= SIZES.spacing).assertEqual(true);
      expect(SIZES.padding === SIZES.spacing).assertEqual(false);
      expect(Math.abs(SIZES.padding - SIZES.spacing)).assertEqual(4);
      expect(SIZES.padding + SIZES.spacing).assertEqual(36);
      expect(SIZES.padding * SIZES.spacing).assertEqual(320);
      expect(SIZES.padding - SIZES.spacing).assertEqual(4);
    });

    /**
     * @tc.name RelationsTest_case_063
     * @tc.desc size-relation: fontSizeTitle vs radius ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_063', 0, () => {
      expect(SIZES.fontSizeTitle <= SIZES.radius).assertEqual(false);
      expect(SIZES.fontSizeTitle >= SIZES.radius).assertEqual(true);
      expect(SIZES.fontSizeTitle === SIZES.radius).assertEqual(false);
      expect(Math.abs(SIZES.fontSizeTitle - SIZES.radius)).assertEqual(10);
      expect(SIZES.fontSizeTitle + SIZES.radius).assertEqual(34);
      expect(SIZES.fontSizeTitle * SIZES.radius).assertEqual(264);
      expect(SIZES.fontSizeTitle - SIZES.radius).assertEqual(10);
    });

    /**
     * @tc.name RelationsTest_case_064
     * @tc.desc size-relation: fontSizeTitle vs padding ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_064', 0, () => {
      expect(SIZES.fontSizeTitle <= SIZES.padding).assertEqual(false);
      expect(SIZES.fontSizeTitle >= SIZES.padding).assertEqual(true);
      expect(SIZES.fontSizeTitle === SIZES.padding).assertEqual(false);
      expect(Math.abs(SIZES.fontSizeTitle - SIZES.padding)).assertEqual(2);
      expect(SIZES.fontSizeTitle + SIZES.padding).assertEqual(42);
      expect(SIZES.fontSizeTitle * SIZES.padding).assertEqual(440);
      expect(SIZES.fontSizeTitle - SIZES.padding).assertEqual(2);
    });

    /**
     * @tc.name RelationsTest_case_065
     * @tc.desc size-relation: fontSizeTitle vs fontSizeTitle ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_065', 0, () => {
      expect(SIZES.fontSizeTitle <= SIZES.fontSizeTitle).assertEqual(true);
      expect(SIZES.fontSizeTitle >= SIZES.fontSizeTitle).assertEqual(true);
      expect(SIZES.fontSizeTitle === SIZES.fontSizeTitle).assertEqual(true);
      expect(Math.abs(SIZES.fontSizeTitle - SIZES.fontSizeTitle)).assertEqual(0);
      expect(SIZES.fontSizeTitle + SIZES.fontSizeTitle).assertEqual(44);
      expect(SIZES.fontSizeTitle * SIZES.fontSizeTitle).assertEqual(484);
      expect(SIZES.fontSizeTitle - SIZES.fontSizeTitle).assertEqual(0);
    });

    /**
     * @tc.name RelationsTest_case_066
     * @tc.desc size-relation: fontSizeTitle vs fontSizeNormal ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_066', 0, () => {
      expect(SIZES.fontSizeTitle <= SIZES.fontSizeNormal).assertEqual(false);
      expect(SIZES.fontSizeTitle >= SIZES.fontSizeNormal).assertEqual(true);
      expect(SIZES.fontSizeTitle === SIZES.fontSizeNormal).assertEqual(false);
      expect(Math.abs(SIZES.fontSizeTitle - SIZES.fontSizeNormal)).assertEqual(6);
      expect(SIZES.fontSizeTitle + SIZES.fontSizeNormal).assertEqual(38);
      expect(SIZES.fontSizeTitle * SIZES.fontSizeNormal).assertEqual(352);
      expect(SIZES.fontSizeTitle - SIZES.fontSizeNormal).assertEqual(6);
    });

    /**
     * @tc.name RelationsTest_case_067
     * @tc.desc size-relation: fontSizeTitle vs fontSizeSmall ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_067', 0, () => {
      expect(SIZES.fontSizeTitle <= SIZES.fontSizeSmall).assertEqual(false);
      expect(SIZES.fontSizeTitle >= SIZES.fontSizeSmall).assertEqual(true);
      expect(SIZES.fontSizeTitle === SIZES.fontSizeSmall).assertEqual(false);
      expect(Math.abs(SIZES.fontSizeTitle - SIZES.fontSizeSmall)).assertEqual(8);
      expect(SIZES.fontSizeTitle + SIZES.fontSizeSmall).assertEqual(36);
      expect(SIZES.fontSizeTitle * SIZES.fontSizeSmall).assertEqual(308);
      expect(SIZES.fontSizeTitle - SIZES.fontSizeSmall).assertEqual(8);
    });

    /**
     * @tc.name RelationsTest_case_068
     * @tc.desc size-relation: fontSizeTitle vs spacing ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_068', 0, () => {
      expect(SIZES.fontSizeTitle <= SIZES.spacing).assertEqual(false);
      expect(SIZES.fontSizeTitle >= SIZES.spacing).assertEqual(true);
      expect(SIZES.fontSizeTitle === SIZES.spacing).assertEqual(false);
      expect(Math.abs(SIZES.fontSizeTitle - SIZES.spacing)).assertEqual(6);
      expect(SIZES.fontSizeTitle + SIZES.spacing).assertEqual(38);
      expect(SIZES.fontSizeTitle * SIZES.spacing).assertEqual(352);
      expect(SIZES.fontSizeTitle - SIZES.spacing).assertEqual(6);
    });

    /**
     * @tc.name RelationsTest_case_069
     * @tc.desc size-relation: fontSizeNormal vs radius ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_069', 0, () => {
      expect(SIZES.fontSizeNormal <= SIZES.radius).assertEqual(false);
      expect(SIZES.fontSizeNormal >= SIZES.radius).assertEqual(true);
      expect(SIZES.fontSizeNormal === SIZES.radius).assertEqual(false);
      expect(Math.abs(SIZES.fontSizeNormal - SIZES.radius)).assertEqual(4);
      expect(SIZES.fontSizeNormal + SIZES.radius).assertEqual(28);
      expect(SIZES.fontSizeNormal * SIZES.radius).assertEqual(192);
      expect(SIZES.fontSizeNormal - SIZES.radius).assertEqual(4);
    });

    /**
     * @tc.name RelationsTest_case_070
     * @tc.desc size-relation: fontSizeNormal vs padding ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_070', 0, () => {
      expect(SIZES.fontSizeNormal <= SIZES.padding).assertEqual(true);
      expect(SIZES.fontSizeNormal >= SIZES.padding).assertEqual(false);
      expect(SIZES.fontSizeNormal === SIZES.padding).assertEqual(false);
      expect(Math.abs(SIZES.fontSizeNormal - SIZES.padding)).assertEqual(4);
      expect(SIZES.fontSizeNormal + SIZES.padding).assertEqual(36);
      expect(SIZES.fontSizeNormal * SIZES.padding).assertEqual(320);
      expect(SIZES.fontSizeNormal - SIZES.padding).assertEqual(-4);
    });

    /**
     * @tc.name RelationsTest_case_071
     * @tc.desc size-relation: fontSizeNormal vs fontSizeTitle ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_071', 0, () => {
      expect(SIZES.fontSizeNormal <= SIZES.fontSizeTitle).assertEqual(true);
      expect(SIZES.fontSizeNormal >= SIZES.fontSizeTitle).assertEqual(false);
      expect(SIZES.fontSizeNormal === SIZES.fontSizeTitle).assertEqual(false);
      expect(Math.abs(SIZES.fontSizeNormal - SIZES.fontSizeTitle)).assertEqual(6);
      expect(SIZES.fontSizeNormal + SIZES.fontSizeTitle).assertEqual(38);
      expect(SIZES.fontSizeNormal * SIZES.fontSizeTitle).assertEqual(352);
      expect(SIZES.fontSizeNormal - SIZES.fontSizeTitle).assertEqual(-6);
    });

    /**
     * @tc.name RelationsTest_case_072
     * @tc.desc size-relation: fontSizeNormal vs fontSizeNormal ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_072', 0, () => {
      expect(SIZES.fontSizeNormal <= SIZES.fontSizeNormal).assertEqual(true);
      expect(SIZES.fontSizeNormal >= SIZES.fontSizeNormal).assertEqual(true);
      expect(SIZES.fontSizeNormal === SIZES.fontSizeNormal).assertEqual(true);
      expect(Math.abs(SIZES.fontSizeNormal - SIZES.fontSizeNormal)).assertEqual(0);
      expect(SIZES.fontSizeNormal + SIZES.fontSizeNormal).assertEqual(32);
      expect(SIZES.fontSizeNormal * SIZES.fontSizeNormal).assertEqual(256);
      expect(SIZES.fontSizeNormal - SIZES.fontSizeNormal).assertEqual(0);
    });

    /**
     * @tc.name RelationsTest_case_073
     * @tc.desc size-relation: fontSizeNormal vs fontSizeSmall ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_073', 0, () => {
      expect(SIZES.fontSizeNormal <= SIZES.fontSizeSmall).assertEqual(false);
      expect(SIZES.fontSizeNormal >= SIZES.fontSizeSmall).assertEqual(true);
      expect(SIZES.fontSizeNormal === SIZES.fontSizeSmall).assertEqual(false);
      expect(Math.abs(SIZES.fontSizeNormal - SIZES.fontSizeSmall)).assertEqual(2);
      expect(SIZES.fontSizeNormal + SIZES.fontSizeSmall).assertEqual(30);
      expect(SIZES.fontSizeNormal * SIZES.fontSizeSmall).assertEqual(224);
      expect(SIZES.fontSizeNormal - SIZES.fontSizeSmall).assertEqual(2);
    });

    /**
     * @tc.name RelationsTest_case_074
     * @tc.desc size-relation: fontSizeNormal vs spacing ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_074', 0, () => {
      expect(SIZES.fontSizeNormal <= SIZES.spacing).assertEqual(true);
      expect(SIZES.fontSizeNormal >= SIZES.spacing).assertEqual(true);
      expect(SIZES.fontSizeNormal === SIZES.spacing).assertEqual(true);
      expect(Math.abs(SIZES.fontSizeNormal - SIZES.spacing)).assertEqual(0);
      expect(SIZES.fontSizeNormal + SIZES.spacing).assertEqual(32);
      expect(SIZES.fontSizeNormal * SIZES.spacing).assertEqual(256);
      expect(SIZES.fontSizeNormal - SIZES.spacing).assertEqual(0);
    });

    /**
     * @tc.name RelationsTest_case_075
     * @tc.desc size-relation: fontSizeSmall vs radius ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_075', 0, () => {
      expect(SIZES.fontSizeSmall <= SIZES.radius).assertEqual(false);
      expect(SIZES.fontSizeSmall >= SIZES.radius).assertEqual(true);
      expect(SIZES.fontSizeSmall === SIZES.radius).assertEqual(false);
      expect(Math.abs(SIZES.fontSizeSmall - SIZES.radius)).assertEqual(2);
      expect(SIZES.fontSizeSmall + SIZES.radius).assertEqual(26);
      expect(SIZES.fontSizeSmall * SIZES.radius).assertEqual(168);
      expect(SIZES.fontSizeSmall - SIZES.radius).assertEqual(2);
    });

    /**
     * @tc.name RelationsTest_case_076
     * @tc.desc size-relation: fontSizeSmall vs padding ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_076', 0, () => {
      expect(SIZES.fontSizeSmall <= SIZES.padding).assertEqual(true);
      expect(SIZES.fontSizeSmall >= SIZES.padding).assertEqual(false);
      expect(SIZES.fontSizeSmall === SIZES.padding).assertEqual(false);
      expect(Math.abs(SIZES.fontSizeSmall - SIZES.padding)).assertEqual(6);
      expect(SIZES.fontSizeSmall + SIZES.padding).assertEqual(34);
      expect(SIZES.fontSizeSmall * SIZES.padding).assertEqual(280);
      expect(SIZES.fontSizeSmall - SIZES.padding).assertEqual(-6);
    });

    /**
     * @tc.name RelationsTest_case_077
     * @tc.desc size-relation: fontSizeSmall vs fontSizeTitle ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_077', 0, () => {
      expect(SIZES.fontSizeSmall <= SIZES.fontSizeTitle).assertEqual(true);
      expect(SIZES.fontSizeSmall >= SIZES.fontSizeTitle).assertEqual(false);
      expect(SIZES.fontSizeSmall === SIZES.fontSizeTitle).assertEqual(false);
      expect(Math.abs(SIZES.fontSizeSmall - SIZES.fontSizeTitle)).assertEqual(8);
      expect(SIZES.fontSizeSmall + SIZES.fontSizeTitle).assertEqual(36);
      expect(SIZES.fontSizeSmall * SIZES.fontSizeTitle).assertEqual(308);
      expect(SIZES.fontSizeSmall - SIZES.fontSizeTitle).assertEqual(-8);
    });

    /**
     * @tc.name RelationsTest_case_078
     * @tc.desc size-relation: fontSizeSmall vs fontSizeNormal ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_078', 0, () => {
      expect(SIZES.fontSizeSmall <= SIZES.fontSizeNormal).assertEqual(true);
      expect(SIZES.fontSizeSmall >= SIZES.fontSizeNormal).assertEqual(false);
      expect(SIZES.fontSizeSmall === SIZES.fontSizeNormal).assertEqual(false);
      expect(Math.abs(SIZES.fontSizeSmall - SIZES.fontSizeNormal)).assertEqual(2);
      expect(SIZES.fontSizeSmall + SIZES.fontSizeNormal).assertEqual(30);
      expect(SIZES.fontSizeSmall * SIZES.fontSizeNormal).assertEqual(224);
      expect(SIZES.fontSizeSmall - SIZES.fontSizeNormal).assertEqual(-2);
    });

    /**
     * @tc.name RelationsTest_case_079
     * @tc.desc size-relation: fontSizeSmall vs fontSizeSmall ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_079', 0, () => {
      expect(SIZES.fontSizeSmall <= SIZES.fontSizeSmall).assertEqual(true);
      expect(SIZES.fontSizeSmall >= SIZES.fontSizeSmall).assertEqual(true);
      expect(SIZES.fontSizeSmall === SIZES.fontSizeSmall).assertEqual(true);
      expect(Math.abs(SIZES.fontSizeSmall - SIZES.fontSizeSmall)).assertEqual(0);
      expect(SIZES.fontSizeSmall + SIZES.fontSizeSmall).assertEqual(28);
      expect(SIZES.fontSizeSmall * SIZES.fontSizeSmall).assertEqual(196);
      expect(SIZES.fontSizeSmall - SIZES.fontSizeSmall).assertEqual(0);
    });

    /**
     * @tc.name RelationsTest_case_080
     * @tc.desc size-relation: fontSizeSmall vs spacing ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_080', 0, () => {
      expect(SIZES.fontSizeSmall <= SIZES.spacing).assertEqual(true);
      expect(SIZES.fontSizeSmall >= SIZES.spacing).assertEqual(false);
      expect(SIZES.fontSizeSmall === SIZES.spacing).assertEqual(false);
      expect(Math.abs(SIZES.fontSizeSmall - SIZES.spacing)).assertEqual(2);
      expect(SIZES.fontSizeSmall + SIZES.spacing).assertEqual(30);
      expect(SIZES.fontSizeSmall * SIZES.spacing).assertEqual(224);
      expect(SIZES.fontSizeSmall - SIZES.spacing).assertEqual(-2);
    });

    /**
     * @tc.name RelationsTest_case_081
     * @tc.desc size-relation: spacing vs radius ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_081', 0, () => {
      expect(SIZES.spacing <= SIZES.radius).assertEqual(false);
      expect(SIZES.spacing >= SIZES.radius).assertEqual(true);
      expect(SIZES.spacing === SIZES.radius).assertEqual(false);
      expect(Math.abs(SIZES.spacing - SIZES.radius)).assertEqual(4);
      expect(SIZES.spacing + SIZES.radius).assertEqual(28);
      expect(SIZES.spacing * SIZES.radius).assertEqual(192);
      expect(SIZES.spacing - SIZES.radius).assertEqual(4);
    });

    /**
     * @tc.name RelationsTest_case_082
     * @tc.desc size-relation: spacing vs padding ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_082', 0, () => {
      expect(SIZES.spacing <= SIZES.padding).assertEqual(true);
      expect(SIZES.spacing >= SIZES.padding).assertEqual(false);
      expect(SIZES.spacing === SIZES.padding).assertEqual(false);
      expect(Math.abs(SIZES.spacing - SIZES.padding)).assertEqual(4);
      expect(SIZES.spacing + SIZES.padding).assertEqual(36);
      expect(SIZES.spacing * SIZES.padding).assertEqual(320);
      expect(SIZES.spacing - SIZES.padding).assertEqual(-4);
    });

    /**
     * @tc.name RelationsTest_case_083
     * @tc.desc size-relation: spacing vs fontSizeTitle ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_083', 0, () => {
      expect(SIZES.spacing <= SIZES.fontSizeTitle).assertEqual(true);
      expect(SIZES.spacing >= SIZES.fontSizeTitle).assertEqual(false);
      expect(SIZES.spacing === SIZES.fontSizeTitle).assertEqual(false);
      expect(Math.abs(SIZES.spacing - SIZES.fontSizeTitle)).assertEqual(6);
      expect(SIZES.spacing + SIZES.fontSizeTitle).assertEqual(38);
      expect(SIZES.spacing * SIZES.fontSizeTitle).assertEqual(352);
      expect(SIZES.spacing - SIZES.fontSizeTitle).assertEqual(-6);
    });

    /**
     * @tc.name RelationsTest_case_084
     * @tc.desc size-relation: spacing vs fontSizeNormal ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_084', 0, () => {
      expect(SIZES.spacing <= SIZES.fontSizeNormal).assertEqual(true);
      expect(SIZES.spacing >= SIZES.fontSizeNormal).assertEqual(true);
      expect(SIZES.spacing === SIZES.fontSizeNormal).assertEqual(true);
      expect(Math.abs(SIZES.spacing - SIZES.fontSizeNormal)).assertEqual(0);
      expect(SIZES.spacing + SIZES.fontSizeNormal).assertEqual(32);
      expect(SIZES.spacing * SIZES.fontSizeNormal).assertEqual(256);
      expect(SIZES.spacing - SIZES.fontSizeNormal).assertEqual(0);
    });

    /**
     * @tc.name RelationsTest_case_085
     * @tc.desc size-relation: spacing vs fontSizeSmall ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_085', 0, () => {
      expect(SIZES.spacing <= SIZES.fontSizeSmall).assertEqual(false);
      expect(SIZES.spacing >= SIZES.fontSizeSmall).assertEqual(true);
      expect(SIZES.spacing === SIZES.fontSizeSmall).assertEqual(false);
      expect(Math.abs(SIZES.spacing - SIZES.fontSizeSmall)).assertEqual(2);
      expect(SIZES.spacing + SIZES.fontSizeSmall).assertEqual(30);
      expect(SIZES.spacing * SIZES.fontSizeSmall).assertEqual(224);
      expect(SIZES.spacing - SIZES.fontSizeSmall).assertEqual(2);
    });

    /**
     * @tc.name RelationsTest_case_086
     * @tc.desc size-relation: spacing vs spacing ordering and delta.
     * @tc.type Function
     * @tc.level Level1
     */
    it('RelationsTest_case_086', 0, () => {
      expect(SIZES.spacing <= SIZES.spacing).assertEqual(true);
      expect(SIZES.spacing >= SIZES.spacing).assertEqual(true);
      expect(SIZES.spacing === SIZES.spacing).assertEqual(true);
      expect(Math.abs(SIZES.spacing - SIZES.spacing)).assertEqual(0);
      expect(SIZES.spacing + SIZES.spacing).assertEqual(32);
      expect(SIZES.spacing * SIZES.spacing).assertEqual(256);
      expect(SIZES.spacing - SIZES.spacing).assertEqual(0);
    });

  });
}
