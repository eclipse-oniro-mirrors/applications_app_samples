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
import { cellTextOf } from '../model/VerifyCodeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_VerifyCode]';
const BUNDLE: string = 'VerifyCode_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for cellTextOf (96 cases). */
export default function cellTextOf2Test(): void {
  describe('CellTextOf2Test', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0097
     * @tc.name      VerifyCode_CellTextOf_0097
     * @tc.desc      cellTextOf(codeText="x", index=65) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0097 begin`);
      const actual: string = cellTextOf('x', 65);
      logInfo(`cellTextOf(codeText="x", index=65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0097 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0098
     * @tc.name      VerifyCode_CellTextOf_0098
     * @tc.desc      cellTextOf(codeText="x", index=70) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0098 begin`);
      const actual: string = cellTextOf('x', 70);
      logInfo(`cellTextOf(codeText="x", index=70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0098 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0099
     * @tc.name      VerifyCode_CellTextOf_0099
     * @tc.desc      cellTextOf(codeText="x", index=75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0099 begin`);
      const actual: string = cellTextOf('x', 75);
      logInfo(`cellTextOf(codeText="x", index=75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0099 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0100
     * @tc.name      VerifyCode_CellTextOf_0100
     * @tc.desc      cellTextOf(codeText="x", index=80) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0100 begin`);
      const actual: string = cellTextOf('x', 80);
      logInfo(`cellTextOf(codeText="x", index=80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0100 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0101
     * @tc.name      VerifyCode_CellTextOf_0101
     * @tc.desc      cellTextOf(codeText="x", index=85) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0101 begin`);
      const actual: string = cellTextOf('x', 85);
      logInfo(`cellTextOf(codeText="x", index=85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0101 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0102
     * @tc.name      VerifyCode_CellTextOf_0102
     * @tc.desc      cellTextOf(codeText="x", index=90) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0102 begin`);
      const actual: string = cellTextOf('x', 90);
      logInfo(`cellTextOf(codeText="x", index=90): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0102 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0103
     * @tc.name      VerifyCode_CellTextOf_0103
     * @tc.desc      cellTextOf(codeText="x", index=95) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0103 begin`);
      const actual: string = cellTextOf('x', 95);
      logInfo(`cellTextOf(codeText="x", index=95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0103 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0104
     * @tc.name      VerifyCode_CellTextOf_0104
     * @tc.desc      cellTextOf(codeText="x", index=105) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0104 begin`);
      const actual: string = cellTextOf('x', 105);
      logInfo(`cellTextOf(codeText="x", index=105): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0104 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0105
     * @tc.name      VerifyCode_CellTextOf_0105
     * @tc.desc      cellTextOf(codeText="x", index=110) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0105 begin`);
      const actual: string = cellTextOf('x', 110);
      logInfo(`cellTextOf(codeText="x", index=110): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0105 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0106
     * @tc.name      VerifyCode_CellTextOf_0106
     * @tc.desc      cellTextOf(codeText="x", index=115) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0106 begin`);
      const actual: string = cellTextOf('x', 115);
      logInfo(`cellTextOf(codeText="x", index=115): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0106 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0107
     * @tc.name      VerifyCode_CellTextOf_0107
     * @tc.desc      cellTextOf(codeText="x", index=120) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0107 begin`);
      const actual: string = cellTextOf('x', 120);
      logInfo(`cellTextOf(codeText="x", index=120): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0107 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0108
     * @tc.name      VerifyCode_CellTextOf_0108
     * @tc.desc      cellTextOf(codeText="x", index=125) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0108 begin`);
      const actual: string = cellTextOf('x', 125);
      logInfo(`cellTextOf(codeText="x", index=125): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0108 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0109
     * @tc.name      VerifyCode_CellTextOf_0109
     * @tc.desc      cellTextOf(codeText="x", index=130) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0109 begin`);
      const actual: string = cellTextOf('x', 130);
      logInfo(`cellTextOf(codeText="x", index=130): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0109 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0110
     * @tc.name      VerifyCode_CellTextOf_0110
     * @tc.desc      cellTextOf(codeText="x", index=135) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0110 begin`);
      const actual: string = cellTextOf('x', 135);
      logInfo(`cellTextOf(codeText="x", index=135): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0110 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0111
     * @tc.name      VerifyCode_CellTextOf_0111
     * @tc.desc      cellTextOf(codeText="x", index=140) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0111 begin`);
      const actual: string = cellTextOf('x', 140);
      logInfo(`cellTextOf(codeText="x", index=140): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0111 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0112
     * @tc.name      VerifyCode_CellTextOf_0112
     * @tc.desc      cellTextOf(codeText="x", index=145) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0112 begin`);
      const actual: string = cellTextOf('x', 145);
      logInfo(`cellTextOf(codeText="x", index=145): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0112 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0113
     * @tc.name      VerifyCode_CellTextOf_0113
     * @tc.desc      cellTextOf(codeText="x", index=150) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0113 begin`);
      const actual: string = cellTextOf('x', 150);
      logInfo(`cellTextOf(codeText="x", index=150): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0113 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0114
     * @tc.name      VerifyCode_CellTextOf_0114
     * @tc.desc      cellTextOf(codeText="x", index=155) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0114 begin`);
      const actual: string = cellTextOf('x', 155);
      logInfo(`cellTextOf(codeText="x", index=155): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0114 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0115
     * @tc.name      VerifyCode_CellTextOf_0115
     * @tc.desc      cellTextOf(codeText="x", index=160) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0115 begin`);
      const actual: string = cellTextOf('x', 160);
      logInfo(`cellTextOf(codeText="x", index=160): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0115 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0116
     * @tc.name      VerifyCode_CellTextOf_0116
     * @tc.desc      cellTextOf(codeText="x", index=165) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0116 begin`);
      const actual: string = cellTextOf('x', 165);
      logInfo(`cellTextOf(codeText="x", index=165): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0116 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0117
     * @tc.name      VerifyCode_CellTextOf_0117
     * @tc.desc      cellTextOf(codeText="x", index=170) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0117 begin`);
      const actual: string = cellTextOf('x', 170);
      logInfo(`cellTextOf(codeText="x", index=170): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0117 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0118
     * @tc.name      VerifyCode_CellTextOf_0118
     * @tc.desc      cellTextOf(codeText="x", index=175) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0118 begin`);
      const actual: string = cellTextOf('x', 175);
      logInfo(`cellTextOf(codeText="x", index=175): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0118 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0119
     * @tc.name      VerifyCode_CellTextOf_0119
     * @tc.desc      cellTextOf(codeText="x", index=180) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0119 begin`);
      const actual: string = cellTextOf('x', 180);
      logInfo(`cellTextOf(codeText="x", index=180): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0119 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0120
     * @tc.name      VerifyCode_CellTextOf_0120
     * @tc.desc      cellTextOf(codeText="x", index=185) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0120 begin`);
      const actual: string = cellTextOf('x', 185);
      logInfo(`cellTextOf(codeText="x", index=185): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0120 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0121
     * @tc.name      VerifyCode_CellTextOf_0121
     * @tc.desc      cellTextOf(codeText="x", index=190) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0121 begin`);
      const actual: string = cellTextOf('x', 190);
      logInfo(`cellTextOf(codeText="x", index=190): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0121 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0122
     * @tc.name      VerifyCode_CellTextOf_0122
     * @tc.desc      cellTextOf(codeText="x", index=195) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0122 begin`);
      const actual: string = cellTextOf('x', 195);
      logInfo(`cellTextOf(codeText="x", index=195): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0122 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0123
     * @tc.name      VerifyCode_CellTextOf_0123
     * @tc.desc      cellTextOf(codeText="x", index=200) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0123 begin`);
      const actual: string = cellTextOf('x', 200);
      logInfo(`cellTextOf(codeText="x", index=200): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0123 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0124
     * @tc.name      VerifyCode_CellTextOf_0124
     * @tc.desc      cellTextOf(codeText="x", index=29) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0124 begin`);
      const actual: string = cellTextOf('x', 29);
      logInfo(`cellTextOf(codeText="x", index=29): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0124 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0125
     * @tc.name      VerifyCode_CellTextOf_0125
     * @tc.desc      cellTextOf(codeText="x", index=37) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0125 begin`);
      const actual: string = cellTextOf('x', 37);
      logInfo(`cellTextOf(codeText="x", index=37): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0125 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0126
     * @tc.name      VerifyCode_CellTextOf_0126
     * @tc.desc      cellTextOf(codeText="x", index=-52) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0126 begin`);
      const actual: string = cellTextOf('x', -52);
      logInfo(`cellTextOf(codeText="x", index=-52): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0126 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0127
     * @tc.name      VerifyCode_CellTextOf_0127
     * @tc.desc      cellTextOf(codeText="x", index=6) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0127 begin`);
      const actual: string = cellTextOf('x', 6);
      logInfo(`cellTextOf(codeText="x", index=6): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0127 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0128
     * @tc.name      VerifyCode_CellTextOf_0128
     * @tc.desc      cellTextOf(codeText="x", index=186) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0128 begin`);
      const actual: string = cellTextOf('x', 186);
      logInfo(`cellTextOf(codeText="x", index=186): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0128 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0129
     * @tc.name      VerifyCode_CellTextOf_0129
     * @tc.desc      cellTextOf(codeText="x", index=46) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0129 begin`);
      const actual: string = cellTextOf('x', 46);
      logInfo(`cellTextOf(codeText="x", index=46): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0129 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0130
     * @tc.name      VerifyCode_CellTextOf_0130
     * @tc.desc      cellTextOf(codeText="x", index=11.81) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0130 begin`);
      const actual: string = cellTextOf('x', 11.81);
      logInfo(`cellTextOf(codeText="x", index=11.81): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0130 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0131
     * @tc.name      VerifyCode_CellTextOf_0131
     * @tc.desc      cellTextOf(codeText="x", index=168) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0131 begin`);
      const actual: string = cellTextOf('x', 168);
      logInfo(`cellTextOf(codeText="x", index=168): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0131 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0132
     * @tc.name      VerifyCode_CellTextOf_0132
     * @tc.desc      cellTextOf(codeText="x", index=31.79) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0132 begin`);
      const actual: string = cellTextOf('x', 31.79);
      logInfo(`cellTextOf(codeText="x", index=31.79): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0132 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0133
     * @tc.name      VerifyCode_CellTextOf_0133
     * @tc.desc      cellTextOf(codeText="x", index=-47) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0133 begin`);
      const actual: string = cellTextOf('x', -47);
      logInfo(`cellTextOf(codeText="x", index=-47): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0133 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0134
     * @tc.name      VerifyCode_CellTextOf_0134
     * @tc.desc      cellTextOf(codeText="x", index=77.89) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0134 begin`);
      const actual: string = cellTextOf('x', 77.89);
      logInfo(`cellTextOf(codeText="x", index=77.89): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0134 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0135
     * @tc.name      VerifyCode_CellTextOf_0135
     * @tc.desc      cellTextOf(codeText="x", index=33) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0135 begin`);
      const actual: string = cellTextOf('x', 33);
      logInfo(`cellTextOf(codeText="x", index=33): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0135 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0136
     * @tc.name      VerifyCode_CellTextOf_0136
     * @tc.desc      cellTextOf(codeText="x", index=98.53) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0136 begin`);
      const actual: string = cellTextOf('x', 98.53);
      logInfo(`cellTextOf(codeText="x", index=98.53): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0136 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0137
     * @tc.name      VerifyCode_CellTextOf_0137
     * @tc.desc      cellTextOf(codeText="x", index=133) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0137 begin`);
      const actual: string = cellTextOf('x', 133);
      logInfo(`cellTextOf(codeText="x", index=133): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0137 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0138
     * @tc.name      VerifyCode_CellTextOf_0138
     * @tc.desc      cellTextOf(codeText="x", index=21.54) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0138 begin`);
      const actual: string = cellTextOf('x', 21.54);
      logInfo(`cellTextOf(codeText="x", index=21.54): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0138 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0139
     * @tc.name      VerifyCode_CellTextOf_0139
     * @tc.desc      cellTextOf(codeText="123456", index=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0139 begin`);
      const actual: string = cellTextOf('123456', -1);
      logInfo(`cellTextOf(codeText="123456", index=-1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0139 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0140
     * @tc.name      VerifyCode_CellTextOf_0140
     * @tc.desc      cellTextOf(codeText="123456", index=10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0140 begin`);
      const actual: string = cellTextOf('123456', 10);
      logInfo(`cellTextOf(codeText="123456", index=10): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0140 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0141
     * @tc.name      VerifyCode_CellTextOf_0141
     * @tc.desc      cellTextOf(codeText="123456", index=100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0141 begin`);
      const actual: string = cellTextOf('123456', 100);
      logInfo(`cellTextOf(codeText="123456", index=100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0141 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0142
     * @tc.name      VerifyCode_CellTextOf_0142
     * @tc.desc      cellTextOf(codeText="123456", index=15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0142 begin`);
      const actual: string = cellTextOf('123456', 15);
      logInfo(`cellTextOf(codeText="123456", index=15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0142 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0143
     * @tc.name      VerifyCode_CellTextOf_0143
     * @tc.desc      cellTextOf(codeText="123456", index=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0143 begin`);
      const actual: string = cellTextOf('123456', 20);
      logInfo(`cellTextOf(codeText="123456", index=20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0143 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0144
     * @tc.name      VerifyCode_CellTextOf_0144
     * @tc.desc      cellTextOf(codeText="123456", index=25) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0144 begin`);
      const actual: string = cellTextOf('123456', 25);
      logInfo(`cellTextOf(codeText="123456", index=25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0144 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0145
     * @tc.name      VerifyCode_CellTextOf_0145
     * @tc.desc      cellTextOf(codeText="123456", index=30) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0145 begin`);
      const actual: string = cellTextOf('123456', 30);
      logInfo(`cellTextOf(codeText="123456", index=30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0145 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0146
     * @tc.name      VerifyCode_CellTextOf_0146
     * @tc.desc      cellTextOf(codeText="123456", index=35) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0146 begin`);
      const actual: string = cellTextOf('123456', 35);
      logInfo(`cellTextOf(codeText="123456", index=35): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0146 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0147
     * @tc.name      VerifyCode_CellTextOf_0147
     * @tc.desc      cellTextOf(codeText="123456", index=40) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0147 begin`);
      const actual: string = cellTextOf('123456', 40);
      logInfo(`cellTextOf(codeText="123456", index=40): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0147 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0148
     * @tc.name      VerifyCode_CellTextOf_0148
     * @tc.desc      cellTextOf(codeText="123456", index=45) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0148 begin`);
      const actual: string = cellTextOf('123456', 45);
      logInfo(`cellTextOf(codeText="123456", index=45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0148 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0149
     * @tc.name      VerifyCode_CellTextOf_0149
     * @tc.desc      cellTextOf(codeText="123456", index=50) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0149 begin`);
      const actual: string = cellTextOf('123456', 50);
      logInfo(`cellTextOf(codeText="123456", index=50): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0149 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0150
     * @tc.name      VerifyCode_CellTextOf_0150
     * @tc.desc      cellTextOf(codeText="123456", index=55) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0150 begin`);
      const actual: string = cellTextOf('123456', 55);
      logInfo(`cellTextOf(codeText="123456", index=55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0150 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0151
     * @tc.name      VerifyCode_CellTextOf_0151
     * @tc.desc      cellTextOf(codeText="123456", index=60) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0151 begin`);
      const actual: string = cellTextOf('123456', 60);
      logInfo(`cellTextOf(codeText="123456", index=60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0151 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0152
     * @tc.name      VerifyCode_CellTextOf_0152
     * @tc.desc      cellTextOf(codeText="123456", index=65) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0152 begin`);
      const actual: string = cellTextOf('123456', 65);
      logInfo(`cellTextOf(codeText="123456", index=65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0152 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0153
     * @tc.name      VerifyCode_CellTextOf_0153
     * @tc.desc      cellTextOf(codeText="123456", index=70) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0153 begin`);
      const actual: string = cellTextOf('123456', 70);
      logInfo(`cellTextOf(codeText="123456", index=70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0153 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0154
     * @tc.name      VerifyCode_CellTextOf_0154
     * @tc.desc      cellTextOf(codeText="123456", index=75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0154 begin`);
      const actual: string = cellTextOf('123456', 75);
      logInfo(`cellTextOf(codeText="123456", index=75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0154 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0155
     * @tc.name      VerifyCode_CellTextOf_0155
     * @tc.desc      cellTextOf(codeText="123456", index=80) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0155 begin`);
      const actual: string = cellTextOf('123456', 80);
      logInfo(`cellTextOf(codeText="123456", index=80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0155 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0156
     * @tc.name      VerifyCode_CellTextOf_0156
     * @tc.desc      cellTextOf(codeText="123456", index=85) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0156 begin`);
      const actual: string = cellTextOf('123456', 85);
      logInfo(`cellTextOf(codeText="123456", index=85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0156 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0157
     * @tc.name      VerifyCode_CellTextOf_0157
     * @tc.desc      cellTextOf(codeText="123456", index=90) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0157 begin`);
      const actual: string = cellTextOf('123456', 90);
      logInfo(`cellTextOf(codeText="123456", index=90): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0157 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0158
     * @tc.name      VerifyCode_CellTextOf_0158
     * @tc.desc      cellTextOf(codeText="123456", index=95) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0158 begin`);
      const actual: string = cellTextOf('123456', 95);
      logInfo(`cellTextOf(codeText="123456", index=95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0158 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0159
     * @tc.name      VerifyCode_CellTextOf_0159
     * @tc.desc      cellTextOf(codeText="123456", index=105) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0159 begin`);
      const actual: string = cellTextOf('123456', 105);
      logInfo(`cellTextOf(codeText="123456", index=105): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0159 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0160
     * @tc.name      VerifyCode_CellTextOf_0160
     * @tc.desc      cellTextOf(codeText="123456", index=110) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0160 begin`);
      const actual: string = cellTextOf('123456', 110);
      logInfo(`cellTextOf(codeText="123456", index=110): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0160 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0161
     * @tc.name      VerifyCode_CellTextOf_0161
     * @tc.desc      cellTextOf(codeText="123456", index=115) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0161 begin`);
      const actual: string = cellTextOf('123456', 115);
      logInfo(`cellTextOf(codeText="123456", index=115): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0161 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0162
     * @tc.name      VerifyCode_CellTextOf_0162
     * @tc.desc      cellTextOf(codeText="123456", index=120) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0162 begin`);
      const actual: string = cellTextOf('123456', 120);
      logInfo(`cellTextOf(codeText="123456", index=120): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0162 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0163
     * @tc.name      VerifyCode_CellTextOf_0163
     * @tc.desc      cellTextOf(codeText="123456", index=125) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0163 begin`);
      const actual: string = cellTextOf('123456', 125);
      logInfo(`cellTextOf(codeText="123456", index=125): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0163 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0164
     * @tc.name      VerifyCode_CellTextOf_0164
     * @tc.desc      cellTextOf(codeText="123456", index=130) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0164 begin`);
      const actual: string = cellTextOf('123456', 130);
      logInfo(`cellTextOf(codeText="123456", index=130): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0164 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0165
     * @tc.name      VerifyCode_CellTextOf_0165
     * @tc.desc      cellTextOf(codeText="123456", index=135) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0165 begin`);
      const actual: string = cellTextOf('123456', 135);
      logInfo(`cellTextOf(codeText="123456", index=135): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0165 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0166
     * @tc.name      VerifyCode_CellTextOf_0166
     * @tc.desc      cellTextOf(codeText="123456", index=140) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0166 begin`);
      const actual: string = cellTextOf('123456', 140);
      logInfo(`cellTextOf(codeText="123456", index=140): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0166 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0167
     * @tc.name      VerifyCode_CellTextOf_0167
     * @tc.desc      cellTextOf(codeText="123456", index=145) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0167 begin`);
      const actual: string = cellTextOf('123456', 145);
      logInfo(`cellTextOf(codeText="123456", index=145): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0167 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0168
     * @tc.name      VerifyCode_CellTextOf_0168
     * @tc.desc      cellTextOf(codeText="123456", index=150) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0168 begin`);
      const actual: string = cellTextOf('123456', 150);
      logInfo(`cellTextOf(codeText="123456", index=150): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0168 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0169
     * @tc.name      VerifyCode_CellTextOf_0169
     * @tc.desc      cellTextOf(codeText="123456", index=155) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0169 begin`);
      const actual: string = cellTextOf('123456', 155);
      logInfo(`cellTextOf(codeText="123456", index=155): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0169 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0170
     * @tc.name      VerifyCode_CellTextOf_0170
     * @tc.desc      cellTextOf(codeText="123456", index=160) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0170 begin`);
      const actual: string = cellTextOf('123456', 160);
      logInfo(`cellTextOf(codeText="123456", index=160): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0170 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0171
     * @tc.name      VerifyCode_CellTextOf_0171
     * @tc.desc      cellTextOf(codeText="123456", index=165) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0171 begin`);
      const actual: string = cellTextOf('123456', 165);
      logInfo(`cellTextOf(codeText="123456", index=165): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0171 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0172
     * @tc.name      VerifyCode_CellTextOf_0172
     * @tc.desc      cellTextOf(codeText="123456", index=170) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0172 begin`);
      const actual: string = cellTextOf('123456', 170);
      logInfo(`cellTextOf(codeText="123456", index=170): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0172 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0173
     * @tc.name      VerifyCode_CellTextOf_0173
     * @tc.desc      cellTextOf(codeText="123456", index=175) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0173 begin`);
      const actual: string = cellTextOf('123456', 175);
      logInfo(`cellTextOf(codeText="123456", index=175): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0173 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0174
     * @tc.name      VerifyCode_CellTextOf_0174
     * @tc.desc      cellTextOf(codeText="123456", index=180) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0174 begin`);
      const actual: string = cellTextOf('123456', 180);
      logInfo(`cellTextOf(codeText="123456", index=180): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0174 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0175
     * @tc.name      VerifyCode_CellTextOf_0175
     * @tc.desc      cellTextOf(codeText="123456", index=185) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0175 begin`);
      const actual: string = cellTextOf('123456', 185);
      logInfo(`cellTextOf(codeText="123456", index=185): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0175 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0176
     * @tc.name      VerifyCode_CellTextOf_0176
     * @tc.desc      cellTextOf(codeText="123456", index=190) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0176 begin`);
      const actual: string = cellTextOf('123456', 190);
      logInfo(`cellTextOf(codeText="123456", index=190): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0176 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0177
     * @tc.name      VerifyCode_CellTextOf_0177
     * @tc.desc      cellTextOf(codeText="123456", index=195) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0177 begin`);
      const actual: string = cellTextOf('123456', 195);
      logInfo(`cellTextOf(codeText="123456", index=195): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0177 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0178
     * @tc.name      VerifyCode_CellTextOf_0178
     * @tc.desc      cellTextOf(codeText="123456", index=200) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0178 begin`);
      const actual: string = cellTextOf('123456', 200);
      logInfo(`cellTextOf(codeText="123456", index=200): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0178 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0179
     * @tc.name      VerifyCode_CellTextOf_0179
     * @tc.desc      cellTextOf(codeText="123456", index=29) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0179 begin`);
      const actual: string = cellTextOf('123456', 29);
      logInfo(`cellTextOf(codeText="123456", index=29): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0179 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0180
     * @tc.name      VerifyCode_CellTextOf_0180
     * @tc.desc      cellTextOf(codeText="123456", index=37) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0180 begin`);
      const actual: string = cellTextOf('123456', 37);
      logInfo(`cellTextOf(codeText="123456", index=37): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0180 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0181
     * @tc.name      VerifyCode_CellTextOf_0181
     * @tc.desc      cellTextOf(codeText="123456", index=-52) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0181 begin`);
      const actual: string = cellTextOf('123456', -52);
      logInfo(`cellTextOf(codeText="123456", index=-52): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0181 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0182
     * @tc.name      VerifyCode_CellTextOf_0182
     * @tc.desc      cellTextOf(codeText="123456", index=6) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0182 begin`);
      const actual: string = cellTextOf('123456', 6);
      logInfo(`cellTextOf(codeText="123456", index=6): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0182 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0183
     * @tc.name      VerifyCode_CellTextOf_0183
     * @tc.desc      cellTextOf(codeText="123456", index=186) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0183 begin`);
      const actual: string = cellTextOf('123456', 186);
      logInfo(`cellTextOf(codeText="123456", index=186): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0183 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0184
     * @tc.name      VerifyCode_CellTextOf_0184
     * @tc.desc      cellTextOf(codeText="123456", index=46) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0184 begin`);
      const actual: string = cellTextOf('123456', 46);
      logInfo(`cellTextOf(codeText="123456", index=46): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0184 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0185
     * @tc.name      VerifyCode_CellTextOf_0185
     * @tc.desc      cellTextOf(codeText="123456", index=11.81) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0185 begin`);
      const actual: string = cellTextOf('123456', 11.81);
      logInfo(`cellTextOf(codeText="123456", index=11.81): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0185 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0186
     * @tc.name      VerifyCode_CellTextOf_0186
     * @tc.desc      cellTextOf(codeText="123456", index=168) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0186 begin`);
      const actual: string = cellTextOf('123456', 168);
      logInfo(`cellTextOf(codeText="123456", index=168): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0186 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0187
     * @tc.name      VerifyCode_CellTextOf_0187
     * @tc.desc      cellTextOf(codeText="123456", index=31.79) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0187 begin`);
      const actual: string = cellTextOf('123456', 31.79);
      logInfo(`cellTextOf(codeText="123456", index=31.79): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0187 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0188
     * @tc.name      VerifyCode_CellTextOf_0188
     * @tc.desc      cellTextOf(codeText="123456", index=-47) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0188 begin`);
      const actual: string = cellTextOf('123456', -47);
      logInfo(`cellTextOf(codeText="123456", index=-47): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0188 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0189
     * @tc.name      VerifyCode_CellTextOf_0189
     * @tc.desc      cellTextOf(codeText="123456", index=77.89) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0189 begin`);
      const actual: string = cellTextOf('123456', 77.89);
      logInfo(`cellTextOf(codeText="123456", index=77.89): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0189 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0190
     * @tc.name      VerifyCode_CellTextOf_0190
     * @tc.desc      cellTextOf(codeText="123456", index=33) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0190 begin`);
      const actual: string = cellTextOf('123456', 33);
      logInfo(`cellTextOf(codeText="123456", index=33): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0190 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0191
     * @tc.name      VerifyCode_CellTextOf_0191
     * @tc.desc      cellTextOf(codeText="123456", index=98.53) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0191 begin`);
      const actual: string = cellTextOf('123456', 98.53);
      logInfo(`cellTextOf(codeText="123456", index=98.53): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0191 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0192
     * @tc.name      VerifyCode_CellTextOf_0192
     * @tc.desc      cellTextOf(codeText="123456", index=133) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0192 begin`);
      const actual: string = cellTextOf('123456', 133);
      logInfo(`cellTextOf(codeText="123456", index=133): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0192 end`);
    });
  });
}
