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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { padZero } from './model/FormExtLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FormExtAbility]';
const BUNDLE: string = 'FormExtAbility_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for padZero (24 cases). */
export default function padZero2Test(): void {
  describe('PadZero2Test', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0097
     * @tc.name      FormExtAbility_PadZero_0097
     * @tc.desc      padZero(num=68) returns "68"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0097 begin`);
      const actual: string = padZero(68);
      logInfo(`padZero(num=68): actual=${actual}`);
      expect(actual).assertEqual('68');
      logInfo(`${BUNDLE}PadZero_0097 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0098
     * @tc.name      FormExtAbility_PadZero_0098
     * @tc.desc      padZero(num=37.29) returns "37.29"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0098 begin`);
      const actual: string = padZero(37.29);
      logInfo(`padZero(num=37.29): actual=${actual}`);
      expect(actual).assertEqual('37.29');
      logInfo(`${BUNDLE}PadZero_0098 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0099
     * @tc.name      FormExtAbility_PadZero_0099
     * @tc.desc      padZero(num=-78) returns "0-78"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PadZero_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PadZero_0099 begin`);
      const actual: string = padZero(-78);
      logInfo(`padZero(num=-78): actual=${actual}`);
      expect(actual).assertEqual('0-78');
      logInfo(`${BUNDLE}PadZero_0099 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0100
     * @tc.name      FormExtAbility_PadZero_0100
     * @tc.desc      padZero(num=12) returns "12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0100 begin`);
      const actual: string = padZero(12);
      logInfo(`padZero(num=12): actual=${actual}`);
      expect(actual).assertEqual('12');
      logInfo(`${BUNDLE}PadZero_0100 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0101
     * @tc.name      FormExtAbility_PadZero_0101
     * @tc.desc      padZero(num=93.37) returns "93.37"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0101 begin`);
      const actual: string = padZero(93.37);
      logInfo(`padZero(num=93.37): actual=${actual}`);
      expect(actual).assertEqual('93.37');
      logInfo(`${BUNDLE}PadZero_0101 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0102
     * @tc.name      FormExtAbility_PadZero_0102
     * @tc.desc      padZero(num=168) returns "168"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0102 begin`);
      const actual: string = padZero(168);
      logInfo(`padZero(num=168): actual=${actual}`);
      expect(actual).assertEqual('168');
      logInfo(`${BUNDLE}PadZero_0102 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0103
     * @tc.name      FormExtAbility_PadZero_0103
     * @tc.desc      padZero(num=55.51) returns "55.51"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0103 begin`);
      const actual: string = padZero(55.51);
      logInfo(`padZero(num=55.51): actual=${actual}`);
      expect(actual).assertEqual('55.51');
      logInfo(`${BUNDLE}PadZero_0103 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0104
     * @tc.name      FormExtAbility_PadZero_0104
     * @tc.desc      padZero(num=161) returns "161"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0104 begin`);
      const actual: string = padZero(161);
      logInfo(`padZero(num=161): actual=${actual}`);
      expect(actual).assertEqual('161');
      logInfo(`${BUNDLE}PadZero_0104 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0105
     * @tc.name      FormExtAbility_PadZero_0105
     * @tc.desc      padZero(num=172) returns "172"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0105 begin`);
      const actual: string = padZero(172);
      logInfo(`padZero(num=172): actual=${actual}`);
      expect(actual).assertEqual('172');
      logInfo(`${BUNDLE}PadZero_0105 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0106
     * @tc.name      FormExtAbility_PadZero_0106
     * @tc.desc      padZero(num=198) returns "198"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0106 begin`);
      const actual: string = padZero(198);
      logInfo(`padZero(num=198): actual=${actual}`);
      expect(actual).assertEqual('198');
      logInfo(`${BUNDLE}PadZero_0106 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0107
     * @tc.name      FormExtAbility_PadZero_0107
     * @tc.desc      padZero(num=77) returns "77"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0107 begin`);
      const actual: string = padZero(77);
      logInfo(`padZero(num=77): actual=${actual}`);
      expect(actual).assertEqual('77');
      logInfo(`${BUNDLE}PadZero_0107 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0108
     * @tc.name      FormExtAbility_PadZero_0108
     * @tc.desc      padZero(num=-18) returns "0-18"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PadZero_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PadZero_0108 begin`);
      const actual: string = padZero(-18);
      logInfo(`padZero(num=-18): actual=${actual}`);
      expect(actual).assertEqual('0-18');
      logInfo(`${BUNDLE}PadZero_0108 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0109
     * @tc.name      FormExtAbility_PadZero_0109
     * @tc.desc      padZero(num=58.8) returns "58.8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0109 begin`);
      const actual: string = padZero(58.8);
      logInfo(`padZero(num=58.8): actual=${actual}`);
      expect(actual).assertEqual('58.8');
      logInfo(`${BUNDLE}PadZero_0109 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0110
     * @tc.name      FormExtAbility_PadZero_0110
     * @tc.desc      padZero(num=-50) returns "0-50"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PadZero_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PadZero_0110 begin`);
      const actual: string = padZero(-50);
      logInfo(`padZero(num=-50): actual=${actual}`);
      expect(actual).assertEqual('0-50');
      logInfo(`${BUNDLE}PadZero_0110 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0111
     * @tc.name      FormExtAbility_PadZero_0111
     * @tc.desc      padZero(num=21.47) returns "21.47"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0111 begin`);
      const actual: string = padZero(21.47);
      logInfo(`padZero(num=21.47): actual=${actual}`);
      expect(actual).assertEqual('21.47');
      logInfo(`${BUNDLE}PadZero_0111 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0112
     * @tc.name      FormExtAbility_PadZero_0112
     * @tc.desc      padZero(num=86.89) returns "86.89"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0112 begin`);
      const actual: string = padZero(86.89);
      logInfo(`padZero(num=86.89): actual=${actual}`);
      expect(actual).assertEqual('86.89');
      logInfo(`${BUNDLE}PadZero_0112 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0113
     * @tc.name      FormExtAbility_PadZero_0113
     * @tc.desc      padZero(num=7) returns "07"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0113 begin`);
      const actual: string = padZero(7);
      logInfo(`padZero(num=7): actual=${actual}`);
      expect(actual).assertEqual('07');
      logInfo(`${BUNDLE}PadZero_0113 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0114
     * @tc.name      FormExtAbility_PadZero_0114
     * @tc.desc      padZero(num=-93) returns "0-93"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PadZero_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PadZero_0114 begin`);
      const actual: string = padZero(-93);
      logInfo(`padZero(num=-93): actual=${actual}`);
      expect(actual).assertEqual('0-93');
      logInfo(`${BUNDLE}PadZero_0114 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0115
     * @tc.name      FormExtAbility_PadZero_0115
     * @tc.desc      padZero(num=51) returns "51"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0115 begin`);
      const actual: string = padZero(51);
      logInfo(`padZero(num=51): actual=${actual}`);
      expect(actual).assertEqual('51');
      logInfo(`${BUNDLE}PadZero_0115 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0116
     * @tc.name      FormExtAbility_PadZero_0116
     * @tc.desc      padZero(num=33.71) returns "33.71"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0116 begin`);
      const actual: string = padZero(33.71);
      logInfo(`padZero(num=33.71): actual=${actual}`);
      expect(actual).assertEqual('33.71');
      logInfo(`${BUNDLE}PadZero_0116 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0117
     * @tc.name      FormExtAbility_PadZero_0117
     * @tc.desc      padZero(num=2.45) returns "02.45"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0117 begin`);
      const actual: string = padZero(2.45);
      logInfo(`padZero(num=2.45): actual=${actual}`);
      expect(actual).assertEqual('02.45');
      logInfo(`${BUNDLE}PadZero_0117 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0118
     * @tc.name      FormExtAbility_PadZero_0118
     * @tc.desc      padZero(num=62.71) returns "62.71"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0118 begin`);
      const actual: string = padZero(62.71);
      logInfo(`padZero(num=62.71): actual=${actual}`);
      expect(actual).assertEqual('62.71');
      logInfo(`${BUNDLE}PadZero_0118 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0119
     * @tc.name      FormExtAbility_PadZero_0119
     * @tc.desc      padZero(num=184) returns "184"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_PadZero_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}PadZero_0119 begin`);
      const actual: string = padZero(184);
      logInfo(`padZero(num=184): actual=${actual}`);
      expect(actual).assertEqual('184');
      logInfo(`${BUNDLE}PadZero_0119 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_PAD_ZERO_0120
     * @tc.name      FormExtAbility_PadZero_0120
     * @tc.desc      padZero(num=-4) returns "0-4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_PadZero_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}PadZero_0120 begin`);
      const actual: string = padZero(-4);
      logInfo(`padZero(num=-4): actual=${actual}`);
      expect(actual).assertEqual('0-4');
      logInfo(`${BUNDLE}PadZero_0120 end`);
    });
  });
}
