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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../TestExecution';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { cellKeyOf } from '../model/VerifyCodeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_VerifyCode]';
const BUNDLE: string = 'VerifyCode_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for cellKeyOf (96 cases). */
export default function cellKeyOf2Test(): void {
  describe('CellKeyOf2Test', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0097
     * @tc.name      VerifyCode_CellKeyOf_0097
     * @tc.desc      cellKeyOf(item=84.78) returns "84.78"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0097 begin`);
      const actual: string = cellKeyOf(84.78);
      logInfo(`cellKeyOf(item=84.78): actual=${actual}`);
      expect(actual).assertEqual('84.78');
      logInfo(`${BUNDLE}CellKeyOf_0097 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0098
     * @tc.name      VerifyCode_CellKeyOf_0098
     * @tc.desc      cellKeyOf(item=11) returns "11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0098 begin`);
      const actual: string = cellKeyOf(11);
      logInfo(`cellKeyOf(item=11): actual=${actual}`);
      expect(actual).assertEqual('11');
      logInfo(`${BUNDLE}CellKeyOf_0098 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0099
     * @tc.name      VerifyCode_CellKeyOf_0099
     * @tc.desc      cellKeyOf(item=99.97) returns "99.97"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0099 begin`);
      const actual: string = cellKeyOf(99.97);
      logInfo(`cellKeyOf(item=99.97): actual=${actual}`);
      expect(actual).assertEqual('99.97');
      logInfo(`${BUNDLE}CellKeyOf_0099 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0100
     * @tc.name      VerifyCode_CellKeyOf_0100
     * @tc.desc      cellKeyOf(item=13) returns "13"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0100 begin`);
      const actual: string = cellKeyOf(13);
      logInfo(`cellKeyOf(item=13): actual=${actual}`);
      expect(actual).assertEqual('13');
      logInfo(`${BUNDLE}CellKeyOf_0100 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0101
     * @tc.name      VerifyCode_CellKeyOf_0101
     * @tc.desc      cellKeyOf(item=88) returns "88"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0101 begin`);
      const actual: string = cellKeyOf(88);
      logInfo(`cellKeyOf(item=88): actual=${actual}`);
      expect(actual).assertEqual('88');
      logInfo(`${BUNDLE}CellKeyOf_0101 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0102
     * @tc.name      VerifyCode_CellKeyOf_0102
     * @tc.desc      cellKeyOf(item=-67) returns "-67"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0102 begin`);
      const actual: string = cellKeyOf(-67);
      logInfo(`cellKeyOf(item=-67): actual=${actual}`);
      expect(actual).assertEqual('-67');
      logInfo(`${BUNDLE}CellKeyOf_0102 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0103
     * @tc.name      VerifyCode_CellKeyOf_0103
     * @tc.desc      cellKeyOf(item=94.68) returns "94.68"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0103 begin`);
      const actual: string = cellKeyOf(94.68);
      logInfo(`cellKeyOf(item=94.68): actual=${actual}`);
      expect(actual).assertEqual('94.68');
      logInfo(`${BUNDLE}CellKeyOf_0103 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0104
     * @tc.name      VerifyCode_CellKeyOf_0104
     * @tc.desc      cellKeyOf(item=-97) returns "-97"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0104 begin`);
      const actual: string = cellKeyOf(-97);
      logInfo(`cellKeyOf(item=-97): actual=${actual}`);
      expect(actual).assertEqual('-97');
      logInfo(`${BUNDLE}CellKeyOf_0104 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0105
     * @tc.name      VerifyCode_CellKeyOf_0105
     * @tc.desc      cellKeyOf(item=-19) returns "-19"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0105 begin`);
      const actual: string = cellKeyOf(-19);
      logInfo(`cellKeyOf(item=-19): actual=${actual}`);
      expect(actual).assertEqual('-19');
      logInfo(`${BUNDLE}CellKeyOf_0105 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0106
     * @tc.name      VerifyCode_CellKeyOf_0106
     * @tc.desc      cellKeyOf(item=18.13) returns "18.13"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0106 begin`);
      const actual: string = cellKeyOf(18.13);
      logInfo(`cellKeyOf(item=18.13): actual=${actual}`);
      expect(actual).assertEqual('18.13');
      logInfo(`${BUNDLE}CellKeyOf_0106 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0107
     * @tc.name      VerifyCode_CellKeyOf_0107
     * @tc.desc      cellKeyOf(item=57.16) returns "57.16"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0107 begin`);
      const actual: string = cellKeyOf(57.16);
      logInfo(`cellKeyOf(item=57.16): actual=${actual}`);
      expect(actual).assertEqual('57.16');
      logInfo(`${BUNDLE}CellKeyOf_0107 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0108
     * @tc.name      VerifyCode_CellKeyOf_0108
     * @tc.desc      cellKeyOf(item=16) returns "16"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0108 begin`);
      const actual: string = cellKeyOf(16);
      logInfo(`cellKeyOf(item=16): actual=${actual}`);
      expect(actual).assertEqual('16');
      logInfo(`${BUNDLE}CellKeyOf_0108 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0109
     * @tc.name      VerifyCode_CellKeyOf_0109
     * @tc.desc      cellKeyOf(item=-42) returns "-42"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0109 begin`);
      const actual: string = cellKeyOf(-42);
      logInfo(`cellKeyOf(item=-42): actual=${actual}`);
      expect(actual).assertEqual('-42');
      logInfo(`${BUNDLE}CellKeyOf_0109 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0110
     * @tc.name      VerifyCode_CellKeyOf_0110
     * @tc.desc      cellKeyOf(item=35.01) returns "35.01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0110 begin`);
      const actual: string = cellKeyOf(35.01);
      logInfo(`cellKeyOf(item=35.01): actual=${actual}`);
      expect(actual).assertEqual('35.01');
      logInfo(`${BUNDLE}CellKeyOf_0110 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0111
     * @tc.name      VerifyCode_CellKeyOf_0111
     * @tc.desc      cellKeyOf(item=-91) returns "-91"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0111 begin`);
      const actual: string = cellKeyOf(-91);
      logInfo(`cellKeyOf(item=-91): actual=${actual}`);
      expect(actual).assertEqual('-91');
      logInfo(`${BUNDLE}CellKeyOf_0111 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0112
     * @tc.name      VerifyCode_CellKeyOf_0112
     * @tc.desc      cellKeyOf(item=76) returns "76"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0112 begin`);
      const actual: string = cellKeyOf(76);
      logInfo(`cellKeyOf(item=76): actual=${actual}`);
      expect(actual).assertEqual('76');
      logInfo(`${BUNDLE}CellKeyOf_0112 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0113
     * @tc.name      VerifyCode_CellKeyOf_0113
     * @tc.desc      cellKeyOf(item=176) returns "176"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0113 begin`);
      const actual: string = cellKeyOf(176);
      logInfo(`cellKeyOf(item=176): actual=${actual}`);
      expect(actual).assertEqual('176');
      logInfo(`${BUNDLE}CellKeyOf_0113 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0114
     * @tc.name      VerifyCode_CellKeyOf_0114
     * @tc.desc      cellKeyOf(item=-92) returns "-92"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0114 begin`);
      const actual: string = cellKeyOf(-92);
      logInfo(`cellKeyOf(item=-92): actual=${actual}`);
      expect(actual).assertEqual('-92');
      logInfo(`${BUNDLE}CellKeyOf_0114 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0115
     * @tc.name      VerifyCode_CellKeyOf_0115
     * @tc.desc      cellKeyOf(item=-47) returns "-47"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0115 begin`);
      const actual: string = cellKeyOf(-47);
      logInfo(`cellKeyOf(item=-47): actual=${actual}`);
      expect(actual).assertEqual('-47');
      logInfo(`${BUNDLE}CellKeyOf_0115 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0116
     * @tc.name      VerifyCode_CellKeyOf_0116
     * @tc.desc      cellKeyOf(item=37) returns "37"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0116 begin`);
      const actual: string = cellKeyOf(37);
      logInfo(`cellKeyOf(item=37): actual=${actual}`);
      expect(actual).assertEqual('37');
      logInfo(`${BUNDLE}CellKeyOf_0116 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0117
     * @tc.name      VerifyCode_CellKeyOf_0117
     * @tc.desc      cellKeyOf(item=42.49) returns "42.49"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0117 begin`);
      const actual: string = cellKeyOf(42.49);
      logInfo(`cellKeyOf(item=42.49): actual=${actual}`);
      expect(actual).assertEqual('42.49');
      logInfo(`${BUNDLE}CellKeyOf_0117 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0118
     * @tc.name      VerifyCode_CellKeyOf_0118
     * @tc.desc      cellKeyOf(item=199) returns "199"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0118 begin`);
      const actual: string = cellKeyOf(199);
      logInfo(`cellKeyOf(item=199): actual=${actual}`);
      expect(actual).assertEqual('199');
      logInfo(`${BUNDLE}CellKeyOf_0118 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0119
     * @tc.name      VerifyCode_CellKeyOf_0119
     * @tc.desc      cellKeyOf(item=-94) returns "-94"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0119 begin`);
      const actual: string = cellKeyOf(-94);
      logInfo(`cellKeyOf(item=-94): actual=${actual}`);
      expect(actual).assertEqual('-94');
      logInfo(`${BUNDLE}CellKeyOf_0119 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0120
     * @tc.name      VerifyCode_CellKeyOf_0120
     * @tc.desc      cellKeyOf(item=98) returns "98"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0120 begin`);
      const actual: string = cellKeyOf(98);
      logInfo(`cellKeyOf(item=98): actual=${actual}`);
      expect(actual).assertEqual('98');
      logInfo(`${BUNDLE}CellKeyOf_0120 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0121
     * @tc.name      VerifyCode_CellKeyOf_0121
     * @tc.desc      cellKeyOf(item=74) returns "74"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0121 begin`);
      const actual: string = cellKeyOf(74);
      logInfo(`cellKeyOf(item=74): actual=${actual}`);
      expect(actual).assertEqual('74');
      logInfo(`${BUNDLE}CellKeyOf_0121 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0122
     * @tc.name      VerifyCode_CellKeyOf_0122
     * @tc.desc      cellKeyOf(item=92.56) returns "92.56"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0122 begin`);
      const actual: string = cellKeyOf(92.56);
      logInfo(`cellKeyOf(item=92.56): actual=${actual}`);
      expect(actual).assertEqual('92.56');
      logInfo(`${BUNDLE}CellKeyOf_0122 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0123
     * @tc.name      VerifyCode_CellKeyOf_0123
     * @tc.desc      cellKeyOf(item=41.01) returns "41.01"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0123 begin`);
      const actual: string = cellKeyOf(41.01);
      logInfo(`cellKeyOf(item=41.01): actual=${actual}`);
      expect(actual).assertEqual('41.01');
      logInfo(`${BUNDLE}CellKeyOf_0123 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0124
     * @tc.name      VerifyCode_CellKeyOf_0124
     * @tc.desc      cellKeyOf(item=108) returns "108"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0124 begin`);
      const actual: string = cellKeyOf(108);
      logInfo(`cellKeyOf(item=108): actual=${actual}`);
      expect(actual).assertEqual('108');
      logInfo(`${BUNDLE}CellKeyOf_0124 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0125
     * @tc.name      VerifyCode_CellKeyOf_0125
     * @tc.desc      cellKeyOf(item=168) returns "168"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0125 begin`);
      const actual: string = cellKeyOf(168);
      logInfo(`cellKeyOf(item=168): actual=${actual}`);
      expect(actual).assertEqual('168');
      logInfo(`${BUNDLE}CellKeyOf_0125 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0126
     * @tc.name      VerifyCode_CellKeyOf_0126
     * @tc.desc      cellKeyOf(item=-86) returns "-86"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0126 begin`);
      const actual: string = cellKeyOf(-86);
      logInfo(`cellKeyOf(item=-86): actual=${actual}`);
      expect(actual).assertEqual('-86');
      logInfo(`${BUNDLE}CellKeyOf_0126 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0127
     * @tc.name      VerifyCode_CellKeyOf_0127
     * @tc.desc      cellKeyOf(item=77.41) returns "77.41"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0127 begin`);
      const actual: string = cellKeyOf(77.41);
      logInfo(`cellKeyOf(item=77.41): actual=${actual}`);
      expect(actual).assertEqual('77.41');
      logInfo(`${BUNDLE}CellKeyOf_0127 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0128
     * @tc.name      VerifyCode_CellKeyOf_0128
     * @tc.desc      cellKeyOf(item=4.66) returns "4.66"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0128 begin`);
      const actual: string = cellKeyOf(4.66);
      logInfo(`cellKeyOf(item=4.66): actual=${actual}`);
      expect(actual).assertEqual('4.66');
      logInfo(`${BUNDLE}CellKeyOf_0128 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0129
     * @tc.name      VerifyCode_CellKeyOf_0129
     * @tc.desc      cellKeyOf(item=92.22) returns "92.22"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0129 begin`);
      const actual: string = cellKeyOf(92.22);
      logInfo(`cellKeyOf(item=92.22): actual=${actual}`);
      expect(actual).assertEqual('92.22');
      logInfo(`${BUNDLE}CellKeyOf_0129 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0130
     * @tc.name      VerifyCode_CellKeyOf_0130
     * @tc.desc      cellKeyOf(item=-3) returns "-3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0130 begin`);
      const actual: string = cellKeyOf(-3);
      logInfo(`cellKeyOf(item=-3): actual=${actual}`);
      expect(actual).assertEqual('-3');
      logInfo(`${BUNDLE}CellKeyOf_0130 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0131
     * @tc.name      VerifyCode_CellKeyOf_0131
     * @tc.desc      cellKeyOf(item=39.73) returns "39.73"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0131 begin`);
      const actual: string = cellKeyOf(39.73);
      logInfo(`cellKeyOf(item=39.73): actual=${actual}`);
      expect(actual).assertEqual('39.73');
      logInfo(`${BUNDLE}CellKeyOf_0131 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0132
     * @tc.name      VerifyCode_CellKeyOf_0132
     * @tc.desc      cellKeyOf(item=84.64) returns "84.64"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0132 begin`);
      const actual: string = cellKeyOf(84.64);
      logInfo(`cellKeyOf(item=84.64): actual=${actual}`);
      expect(actual).assertEqual('84.64');
      logInfo(`${BUNDLE}CellKeyOf_0132 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0133
     * @tc.name      VerifyCode_CellKeyOf_0133
     * @tc.desc      cellKeyOf(item=10.79) returns "10.79"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0133 begin`);
      const actual: string = cellKeyOf(10.79);
      logInfo(`cellKeyOf(item=10.79): actual=${actual}`);
      expect(actual).assertEqual('10.79');
      logInfo(`${BUNDLE}CellKeyOf_0133 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0134
     * @tc.name      VerifyCode_CellKeyOf_0134
     * @tc.desc      cellKeyOf(item=23) returns "23"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0134 begin`);
      const actual: string = cellKeyOf(23);
      logInfo(`cellKeyOf(item=23): actual=${actual}`);
      expect(actual).assertEqual('23');
      logInfo(`${BUNDLE}CellKeyOf_0134 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0135
     * @tc.name      VerifyCode_CellKeyOf_0135
     * @tc.desc      cellKeyOf(item=87) returns "87"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0135 begin`);
      const actual: string = cellKeyOf(87);
      logInfo(`cellKeyOf(item=87): actual=${actual}`);
      expect(actual).assertEqual('87');
      logInfo(`${BUNDLE}CellKeyOf_0135 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0136
     * @tc.name      VerifyCode_CellKeyOf_0136
     * @tc.desc      cellKeyOf(item=70.32) returns "70.32"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0136 begin`);
      const actual: string = cellKeyOf(70.32);
      logInfo(`cellKeyOf(item=70.32): actual=${actual}`);
      expect(actual).assertEqual('70.32');
      logInfo(`${BUNDLE}CellKeyOf_0136 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0137
     * @tc.name      VerifyCode_CellKeyOf_0137
     * @tc.desc      cellKeyOf(item=-7) returns "-7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0137 begin`);
      const actual: string = cellKeyOf(-7);
      logInfo(`cellKeyOf(item=-7): actual=${actual}`);
      expect(actual).assertEqual('-7');
      logInfo(`${BUNDLE}CellKeyOf_0137 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0138
     * @tc.name      VerifyCode_CellKeyOf_0138
     * @tc.desc      cellKeyOf(item=111) returns "111"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0138 begin`);
      const actual: string = cellKeyOf(111);
      logInfo(`cellKeyOf(item=111): actual=${actual}`);
      expect(actual).assertEqual('111');
      logInfo(`${BUNDLE}CellKeyOf_0138 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0139
     * @tc.name      VerifyCode_CellKeyOf_0139
     * @tc.desc      cellKeyOf(item=34.15) returns "34.15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0139 begin`);
      const actual: string = cellKeyOf(34.15);
      logInfo(`cellKeyOf(item=34.15): actual=${actual}`);
      expect(actual).assertEqual('34.15');
      logInfo(`${BUNDLE}CellKeyOf_0139 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0140
     * @tc.name      VerifyCode_CellKeyOf_0140
     * @tc.desc      cellKeyOf(item=153) returns "153"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0140 begin`);
      const actual: string = cellKeyOf(153);
      logInfo(`cellKeyOf(item=153): actual=${actual}`);
      expect(actual).assertEqual('153');
      logInfo(`${BUNDLE}CellKeyOf_0140 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0141
     * @tc.name      VerifyCode_CellKeyOf_0141
     * @tc.desc      cellKeyOf(item=59.53) returns "59.53"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0141 begin`);
      const actual: string = cellKeyOf(59.53);
      logInfo(`cellKeyOf(item=59.53): actual=${actual}`);
      expect(actual).assertEqual('59.53');
      logInfo(`${BUNDLE}CellKeyOf_0141 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0142
     * @tc.name      VerifyCode_CellKeyOf_0142
     * @tc.desc      cellKeyOf(item=68) returns "68"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0142 begin`);
      const actual: string = cellKeyOf(68);
      logInfo(`cellKeyOf(item=68): actual=${actual}`);
      expect(actual).assertEqual('68');
      logInfo(`${BUNDLE}CellKeyOf_0142 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0143
     * @tc.name      VerifyCode_CellKeyOf_0143
     * @tc.desc      cellKeyOf(item=62.25) returns "62.25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0143 begin`);
      const actual: string = cellKeyOf(62.25);
      logInfo(`cellKeyOf(item=62.25): actual=${actual}`);
      expect(actual).assertEqual('62.25');
      logInfo(`${BUNDLE}CellKeyOf_0143 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0144
     * @tc.name      VerifyCode_CellKeyOf_0144
     * @tc.desc      cellKeyOf(item=83) returns "83"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0144 begin`);
      const actual: string = cellKeyOf(83);
      logInfo(`cellKeyOf(item=83): actual=${actual}`);
      expect(actual).assertEqual('83');
      logInfo(`${BUNDLE}CellKeyOf_0144 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0145
     * @tc.name      VerifyCode_CellKeyOf_0145
     * @tc.desc      cellKeyOf(item=81.53) returns "81.53"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0145 begin`);
      const actual: string = cellKeyOf(81.53);
      logInfo(`cellKeyOf(item=81.53): actual=${actual}`);
      expect(actual).assertEqual('81.53');
      logInfo(`${BUNDLE}CellKeyOf_0145 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0146
     * @tc.name      VerifyCode_CellKeyOf_0146
     * @tc.desc      cellKeyOf(item=-81) returns "-81"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0146 begin`);
      const actual: string = cellKeyOf(-81);
      logInfo(`cellKeyOf(item=-81): actual=${actual}`);
      expect(actual).assertEqual('-81');
      logInfo(`${BUNDLE}CellKeyOf_0146 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0147
     * @tc.name      VerifyCode_CellKeyOf_0147
     * @tc.desc      cellKeyOf(item=-90) returns "-90"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0147 begin`);
      const actual: string = cellKeyOf(-90);
      logInfo(`cellKeyOf(item=-90): actual=${actual}`);
      expect(actual).assertEqual('-90');
      logInfo(`${BUNDLE}CellKeyOf_0147 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0148
     * @tc.name      VerifyCode_CellKeyOf_0148
     * @tc.desc      cellKeyOf(item=-59) returns "-59"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0148 begin`);
      const actual: string = cellKeyOf(-59);
      logInfo(`cellKeyOf(item=-59): actual=${actual}`);
      expect(actual).assertEqual('-59');
      logInfo(`${BUNDLE}CellKeyOf_0148 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0149
     * @tc.name      VerifyCode_CellKeyOf_0149
     * @tc.desc      cellKeyOf(item=156) returns "156"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0149 begin`);
      const actual: string = cellKeyOf(156);
      logInfo(`cellKeyOf(item=156): actual=${actual}`);
      expect(actual).assertEqual('156');
      logInfo(`${BUNDLE}CellKeyOf_0149 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0150
     * @tc.name      VerifyCode_CellKeyOf_0150
     * @tc.desc      cellKeyOf(item=149) returns "149"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0150 begin`);
      const actual: string = cellKeyOf(149);
      logInfo(`cellKeyOf(item=149): actual=${actual}`);
      expect(actual).assertEqual('149');
      logInfo(`${BUNDLE}CellKeyOf_0150 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0151
     * @tc.name      VerifyCode_CellKeyOf_0151
     * @tc.desc      cellKeyOf(item=-14) returns "-14"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0151 begin`);
      const actual: string = cellKeyOf(-14);
      logInfo(`cellKeyOf(item=-14): actual=${actual}`);
      expect(actual).assertEqual('-14');
      logInfo(`${BUNDLE}CellKeyOf_0151 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0152
     * @tc.name      VerifyCode_CellKeyOf_0152
     * @tc.desc      cellKeyOf(item=-51) returns "-51"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0152 begin`);
      const actual: string = cellKeyOf(-51);
      logInfo(`cellKeyOf(item=-51): actual=${actual}`);
      expect(actual).assertEqual('-51');
      logInfo(`${BUNDLE}CellKeyOf_0152 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0153
     * @tc.name      VerifyCode_CellKeyOf_0153
     * @tc.desc      cellKeyOf(item=-10) returns "-10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0153 begin`);
      const actual: string = cellKeyOf(-10);
      logInfo(`cellKeyOf(item=-10): actual=${actual}`);
      expect(actual).assertEqual('-10');
      logInfo(`${BUNDLE}CellKeyOf_0153 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0154
     * @tc.name      VerifyCode_CellKeyOf_0154
     * @tc.desc      cellKeyOf(item=192) returns "192"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0154 begin`);
      const actual: string = cellKeyOf(192);
      logInfo(`cellKeyOf(item=192): actual=${actual}`);
      expect(actual).assertEqual('192');
      logInfo(`${BUNDLE}CellKeyOf_0154 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0155
     * @tc.name      VerifyCode_CellKeyOf_0155
     * @tc.desc      cellKeyOf(item=98.21) returns "98.21"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0155 begin`);
      const actual: string = cellKeyOf(98.21);
      logInfo(`cellKeyOf(item=98.21): actual=${actual}`);
      expect(actual).assertEqual('98.21');
      logInfo(`${BUNDLE}CellKeyOf_0155 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0156
     * @tc.name      VerifyCode_CellKeyOf_0156
     * @tc.desc      cellKeyOf(item=78.27) returns "78.27"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0156 begin`);
      const actual: string = cellKeyOf(78.27);
      logInfo(`cellKeyOf(item=78.27): actual=${actual}`);
      expect(actual).assertEqual('78.27');
      logInfo(`${BUNDLE}CellKeyOf_0156 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0157
     * @tc.name      VerifyCode_CellKeyOf_0157
     * @tc.desc      cellKeyOf(item=99) returns "99"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0157 begin`);
      const actual: string = cellKeyOf(99);
      logInfo(`cellKeyOf(item=99): actual=${actual}`);
      expect(actual).assertEqual('99');
      logInfo(`${BUNDLE}CellKeyOf_0157 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0158
     * @tc.name      VerifyCode_CellKeyOf_0158
     * @tc.desc      cellKeyOf(item=54) returns "54"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0158 begin`);
      const actual: string = cellKeyOf(54);
      logInfo(`cellKeyOf(item=54): actual=${actual}`);
      expect(actual).assertEqual('54');
      logInfo(`${BUNDLE}CellKeyOf_0158 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0159
     * @tc.name      VerifyCode_CellKeyOf_0159
     * @tc.desc      cellKeyOf(item=117) returns "117"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0159 begin`);
      const actual: string = cellKeyOf(117);
      logInfo(`cellKeyOf(item=117): actual=${actual}`);
      expect(actual).assertEqual('117');
      logInfo(`${BUNDLE}CellKeyOf_0159 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0160
     * @tc.name      VerifyCode_CellKeyOf_0160
     * @tc.desc      cellKeyOf(item=-82) returns "-82"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0160 begin`);
      const actual: string = cellKeyOf(-82);
      logInfo(`cellKeyOf(item=-82): actual=${actual}`);
      expect(actual).assertEqual('-82');
      logInfo(`${BUNDLE}CellKeyOf_0160 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0161
     * @tc.name      VerifyCode_CellKeyOf_0161
     * @tc.desc      cellKeyOf(item=-88) returns "-88"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0161 begin`);
      const actual: string = cellKeyOf(-88);
      logInfo(`cellKeyOf(item=-88): actual=${actual}`);
      expect(actual).assertEqual('-88');
      logInfo(`${BUNDLE}CellKeyOf_0161 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0162
     * @tc.name      VerifyCode_CellKeyOf_0162
     * @tc.desc      cellKeyOf(item=84) returns "84"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0162 begin`);
      const actual: string = cellKeyOf(84);
      logInfo(`cellKeyOf(item=84): actual=${actual}`);
      expect(actual).assertEqual('84');
      logInfo(`${BUNDLE}CellKeyOf_0162 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0163
     * @tc.name      VerifyCode_CellKeyOf_0163
     * @tc.desc      cellKeyOf(item=-80) returns "-80"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0163 begin`);
      const actual: string = cellKeyOf(-80);
      logInfo(`cellKeyOf(item=-80): actual=${actual}`);
      expect(actual).assertEqual('-80');
      logInfo(`${BUNDLE}CellKeyOf_0163 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0164
     * @tc.name      VerifyCode_CellKeyOf_0164
     * @tc.desc      cellKeyOf(item=179) returns "179"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0164 begin`);
      const actual: string = cellKeyOf(179);
      logInfo(`cellKeyOf(item=179): actual=${actual}`);
      expect(actual).assertEqual('179');
      logInfo(`${BUNDLE}CellKeyOf_0164 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0165
     * @tc.name      VerifyCode_CellKeyOf_0165
     * @tc.desc      cellKeyOf(item=-75) returns "-75"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0165 begin`);
      const actual: string = cellKeyOf(-75);
      logInfo(`cellKeyOf(item=-75): actual=${actual}`);
      expect(actual).assertEqual('-75');
      logInfo(`${BUNDLE}CellKeyOf_0165 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0166
     * @tc.name      VerifyCode_CellKeyOf_0166
     * @tc.desc      cellKeyOf(item=49) returns "49"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0166 begin`);
      const actual: string = cellKeyOf(49);
      logInfo(`cellKeyOf(item=49): actual=${actual}`);
      expect(actual).assertEqual('49');
      logInfo(`${BUNDLE}CellKeyOf_0166 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0167
     * @tc.name      VerifyCode_CellKeyOf_0167
     * @tc.desc      cellKeyOf(item=193) returns "193"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0167 begin`);
      const actual: string = cellKeyOf(193);
      logInfo(`cellKeyOf(item=193): actual=${actual}`);
      expect(actual).assertEqual('193');
      logInfo(`${BUNDLE}CellKeyOf_0167 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0168
     * @tc.name      VerifyCode_CellKeyOf_0168
     * @tc.desc      cellKeyOf(item=21) returns "21"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0168 begin`);
      const actual: string = cellKeyOf(21);
      logInfo(`cellKeyOf(item=21): actual=${actual}`);
      expect(actual).assertEqual('21');
      logInfo(`${BUNDLE}CellKeyOf_0168 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0169
     * @tc.name      VerifyCode_CellKeyOf_0169
     * @tc.desc      cellKeyOf(item=136) returns "136"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0169 begin`);
      const actual: string = cellKeyOf(136);
      logInfo(`cellKeyOf(item=136): actual=${actual}`);
      expect(actual).assertEqual('136');
      logInfo(`${BUNDLE}CellKeyOf_0169 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0170
     * @tc.name      VerifyCode_CellKeyOf_0170
     * @tc.desc      cellKeyOf(item=-2) returns "-2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0170 begin`);
      const actual: string = cellKeyOf(-2);
      logInfo(`cellKeyOf(item=-2): actual=${actual}`);
      expect(actual).assertEqual('-2');
      logInfo(`${BUNDLE}CellKeyOf_0170 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0171
     * @tc.name      VerifyCode_CellKeyOf_0171
     * @tc.desc      cellKeyOf(item=151) returns "151"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0171 begin`);
      const actual: string = cellKeyOf(151);
      logInfo(`cellKeyOf(item=151): actual=${actual}`);
      expect(actual).assertEqual('151');
      logInfo(`${BUNDLE}CellKeyOf_0171 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0172
     * @tc.name      VerifyCode_CellKeyOf_0172
     * @tc.desc      cellKeyOf(item=34.2) returns "34.2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0172 begin`);
      const actual: string = cellKeyOf(34.2);
      logInfo(`cellKeyOf(item=34.2): actual=${actual}`);
      expect(actual).assertEqual('34.2');
      logInfo(`${BUNDLE}CellKeyOf_0172 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0173
     * @tc.name      VerifyCode_CellKeyOf_0173
     * @tc.desc      cellKeyOf(item=9) returns "9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0173 begin`);
      const actual: string = cellKeyOf(9);
      logInfo(`cellKeyOf(item=9): actual=${actual}`);
      expect(actual).assertEqual('9');
      logInfo(`${BUNDLE}CellKeyOf_0173 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0174
     * @tc.name      VerifyCode_CellKeyOf_0174
     * @tc.desc      cellKeyOf(item=186) returns "186"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0174 begin`);
      const actual: string = cellKeyOf(186);
      logInfo(`cellKeyOf(item=186): actual=${actual}`);
      expect(actual).assertEqual('186');
      logInfo(`${BUNDLE}CellKeyOf_0174 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0175
     * @tc.name      VerifyCode_CellKeyOf_0175
     * @tc.desc      cellKeyOf(item=49.78) returns "49.78"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0175 begin`);
      const actual: string = cellKeyOf(49.78);
      logInfo(`cellKeyOf(item=49.78): actual=${actual}`);
      expect(actual).assertEqual('49.78');
      logInfo(`${BUNDLE}CellKeyOf_0175 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0176
     * @tc.name      VerifyCode_CellKeyOf_0176
     * @tc.desc      cellKeyOf(item=18) returns "18"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0176 begin`);
      const actual: string = cellKeyOf(18);
      logInfo(`cellKeyOf(item=18): actual=${actual}`);
      expect(actual).assertEqual('18');
      logInfo(`${BUNDLE}CellKeyOf_0176 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0177
     * @tc.name      VerifyCode_CellKeyOf_0177
     * @tc.desc      cellKeyOf(item=37.44) returns "37.44"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0177 begin`);
      const actual: string = cellKeyOf(37.44);
      logInfo(`cellKeyOf(item=37.44): actual=${actual}`);
      expect(actual).assertEqual('37.44');
      logInfo(`${BUNDLE}CellKeyOf_0177 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0178
     * @tc.name      VerifyCode_CellKeyOf_0178
     * @tc.desc      cellKeyOf(item=152) returns "152"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0178 begin`);
      const actual: string = cellKeyOf(152);
      logInfo(`cellKeyOf(item=152): actual=${actual}`);
      expect(actual).assertEqual('152');
      logInfo(`${BUNDLE}CellKeyOf_0178 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0179
     * @tc.name      VerifyCode_CellKeyOf_0179
     * @tc.desc      cellKeyOf(item=-65) returns "-65"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0179 begin`);
      const actual: string = cellKeyOf(-65);
      logInfo(`cellKeyOf(item=-65): actual=${actual}`);
      expect(actual).assertEqual('-65');
      logInfo(`${BUNDLE}CellKeyOf_0179 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0180
     * @tc.name      VerifyCode_CellKeyOf_0180
     * @tc.desc      cellKeyOf(item=56.11) returns "56.11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0180 begin`);
      const actual: string = cellKeyOf(56.11);
      logInfo(`cellKeyOf(item=56.11): actual=${actual}`);
      expect(actual).assertEqual('56.11');
      logInfo(`${BUNDLE}CellKeyOf_0180 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0181
     * @tc.name      VerifyCode_CellKeyOf_0181
     * @tc.desc      cellKeyOf(item=58.25) returns "58.25"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0181 begin`);
      const actual: string = cellKeyOf(58.25);
      logInfo(`cellKeyOf(item=58.25): actual=${actual}`);
      expect(actual).assertEqual('58.25');
      logInfo(`${BUNDLE}CellKeyOf_0181 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0182
     * @tc.name      VerifyCode_CellKeyOf_0182
     * @tc.desc      cellKeyOf(item=-15) returns "-15"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0182 begin`);
      const actual: string = cellKeyOf(-15);
      logInfo(`cellKeyOf(item=-15): actual=${actual}`);
      expect(actual).assertEqual('-15');
      logInfo(`${BUNDLE}CellKeyOf_0182 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0183
     * @tc.name      VerifyCode_CellKeyOf_0183
     * @tc.desc      cellKeyOf(item=63) returns "63"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0183 begin`);
      const actual: string = cellKeyOf(63);
      logInfo(`cellKeyOf(item=63): actual=${actual}`);
      expect(actual).assertEqual('63');
      logInfo(`${BUNDLE}CellKeyOf_0183 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0184
     * @tc.name      VerifyCode_CellKeyOf_0184
     * @tc.desc      cellKeyOf(item=82) returns "82"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0184 begin`);
      const actual: string = cellKeyOf(82);
      logInfo(`cellKeyOf(item=82): actual=${actual}`);
      expect(actual).assertEqual('82');
      logInfo(`${BUNDLE}CellKeyOf_0184 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0185
     * @tc.name      VerifyCode_CellKeyOf_0185
     * @tc.desc      cellKeyOf(item=-69) returns "-69"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0185 begin`);
      const actual: string = cellKeyOf(-69);
      logInfo(`cellKeyOf(item=-69): actual=${actual}`);
      expect(actual).assertEqual('-69');
      logInfo(`${BUNDLE}CellKeyOf_0185 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0186
     * @tc.name      VerifyCode_CellKeyOf_0186
     * @tc.desc      cellKeyOf(item=98.5) returns "98.5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0186 begin`);
      const actual: string = cellKeyOf(98.5);
      logInfo(`cellKeyOf(item=98.5): actual=${actual}`);
      expect(actual).assertEqual('98.5');
      logInfo(`${BUNDLE}CellKeyOf_0186 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0187
     * @tc.name      VerifyCode_CellKeyOf_0187
     * @tc.desc      cellKeyOf(item=122) returns "122"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0187 begin`);
      const actual: string = cellKeyOf(122);
      logInfo(`cellKeyOf(item=122): actual=${actual}`);
      expect(actual).assertEqual('122');
      logInfo(`${BUNDLE}CellKeyOf_0187 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0188
     * @tc.name      VerifyCode_CellKeyOf_0188
     * @tc.desc      cellKeyOf(item=25.87) returns "25.87"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0188 begin`);
      const actual: string = cellKeyOf(25.87);
      logInfo(`cellKeyOf(item=25.87): actual=${actual}`);
      expect(actual).assertEqual('25.87');
      logInfo(`${BUNDLE}CellKeyOf_0188 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0189
     * @tc.name      VerifyCode_CellKeyOf_0189
     * @tc.desc      cellKeyOf(item=19.51) returns "19.51"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0189 begin`);
      const actual: string = cellKeyOf(19.51);
      logInfo(`cellKeyOf(item=19.51): actual=${actual}`);
      expect(actual).assertEqual('19.51');
      logInfo(`${BUNDLE}CellKeyOf_0189 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0190
     * @tc.name      VerifyCode_CellKeyOf_0190
     * @tc.desc      cellKeyOf(item=-22) returns "-22"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0190 begin`);
      const actual: string = cellKeyOf(-22);
      logInfo(`cellKeyOf(item=-22): actual=${actual}`);
      expect(actual).assertEqual('-22');
      logInfo(`${BUNDLE}CellKeyOf_0190 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0191
     * @tc.name      VerifyCode_CellKeyOf_0191
     * @tc.desc      cellKeyOf(item=-45) returns "-45"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellKeyOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellKeyOf_0191 begin`);
      const actual: string = cellKeyOf(-45);
      logInfo(`cellKeyOf(item=-45): actual=${actual}`);
      expect(actual).assertEqual('-45');
      logInfo(`${BUNDLE}CellKeyOf_0191 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_KEY_OF_0192
     * @tc.name      VerifyCode_CellKeyOf_0192
     * @tc.desc      cellKeyOf(item=138) returns "138"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellKeyOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellKeyOf_0192 begin`);
      const actual: string = cellKeyOf(138);
      logInfo(`cellKeyOf(item=138): actual=${actual}`);
      expect(actual).assertEqual('138');
      logInfo(`${BUNDLE}CellKeyOf_0192 end`);
    });
  });
}
