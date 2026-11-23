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
export default function cellTextOf3Test(): void {
  describe('CellTextOf3Test', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0193
     * @tc.name      VerifyCode_CellTextOf_0193
     * @tc.desc      cellTextOf(codeText="123456", index=21.54) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0193 begin`);
      const actual: string = cellTextOf('123456', 21.54);
      logInfo(`cellTextOf(codeText="123456", index=21.54): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0193 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0194
     * @tc.name      VerifyCode_CellTextOf_0194
     * @tc.desc      cellTextOf(codeText="000000", index=1) returns "0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0194 begin`);
      const actual: string = cellTextOf('000000', 1);
      logInfo(`cellTextOf(codeText="000000", index=1): actual=${actual}`);
      expect(actual).assertEqual('0');
      logInfo(`${BUNDLE}CellTextOf_0194 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0195
     * @tc.name      VerifyCode_CellTextOf_0195
     * @tc.desc      cellTextOf(codeText="000000", index=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0195 begin`);
      const actual: string = cellTextOf('000000', -1);
      logInfo(`cellTextOf(codeText="000000", index=-1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0195 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0196
     * @tc.name      VerifyCode_CellTextOf_0196
     * @tc.desc      cellTextOf(codeText="000000", index=2) returns "0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0196 begin`);
      const actual: string = cellTextOf('000000', 2);
      logInfo(`cellTextOf(codeText="000000", index=2): actual=${actual}`);
      expect(actual).assertEqual('0');
      logInfo(`${BUNDLE}CellTextOf_0196 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0197
     * @tc.name      VerifyCode_CellTextOf_0197
     * @tc.desc      cellTextOf(codeText="000000", index=5) returns "0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0197 begin`);
      const actual: string = cellTextOf('000000', 5);
      logInfo(`cellTextOf(codeText="000000", index=5): actual=${actual}`);
      expect(actual).assertEqual('0');
      logInfo(`${BUNDLE}CellTextOf_0197 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0198
     * @tc.name      VerifyCode_CellTextOf_0198
     * @tc.desc      cellTextOf(codeText="000000", index=10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0198 begin`);
      const actual: string = cellTextOf('000000', 10);
      logInfo(`cellTextOf(codeText="000000", index=10): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0198 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0199
     * @tc.name      VerifyCode_CellTextOf_0199
     * @tc.desc      cellTextOf(codeText="000000", index=3) returns "0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0199 begin`);
      const actual: string = cellTextOf('000000', 3);
      logInfo(`cellTextOf(codeText="000000", index=3): actual=${actual}`);
      expect(actual).assertEqual('0');
      logInfo(`${BUNDLE}CellTextOf_0199 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0200
     * @tc.name      VerifyCode_CellTextOf_0200
     * @tc.desc      cellTextOf(codeText="000000", index=100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0200 begin`);
      const actual: string = cellTextOf('000000', 100);
      logInfo(`cellTextOf(codeText="000000", index=100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0200 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0201
     * @tc.name      VerifyCode_CellTextOf_0201
     * @tc.desc      cellTextOf(codeText="000000", index=15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0201 begin`);
      const actual: string = cellTextOf('000000', 15);
      logInfo(`cellTextOf(codeText="000000", index=15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0201 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0202
     * @tc.name      VerifyCode_CellTextOf_0202
     * @tc.desc      cellTextOf(codeText="000000", index=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0202 begin`);
      const actual: string = cellTextOf('000000', 20);
      logInfo(`cellTextOf(codeText="000000", index=20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0202 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0203
     * @tc.name      VerifyCode_CellTextOf_0203
     * @tc.desc      cellTextOf(codeText="000000", index=25) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0203 begin`);
      const actual: string = cellTextOf('000000', 25);
      logInfo(`cellTextOf(codeText="000000", index=25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0203 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0204
     * @tc.name      VerifyCode_CellTextOf_0204
     * @tc.desc      cellTextOf(codeText="000000", index=30) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0204 begin`);
      const actual: string = cellTextOf('000000', 30);
      logInfo(`cellTextOf(codeText="000000", index=30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0204 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0205
     * @tc.name      VerifyCode_CellTextOf_0205
     * @tc.desc      cellTextOf(codeText="000000", index=35) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0205 begin`);
      const actual: string = cellTextOf('000000', 35);
      logInfo(`cellTextOf(codeText="000000", index=35): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0205 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0206
     * @tc.name      VerifyCode_CellTextOf_0206
     * @tc.desc      cellTextOf(codeText="000000", index=40) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0206 begin`);
      const actual: string = cellTextOf('000000', 40);
      logInfo(`cellTextOf(codeText="000000", index=40): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0206 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0207
     * @tc.name      VerifyCode_CellTextOf_0207
     * @tc.desc      cellTextOf(codeText="000000", index=45) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0207 begin`);
      const actual: string = cellTextOf('000000', 45);
      logInfo(`cellTextOf(codeText="000000", index=45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0207 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0208
     * @tc.name      VerifyCode_CellTextOf_0208
     * @tc.desc      cellTextOf(codeText="000000", index=50) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0208 begin`);
      const actual: string = cellTextOf('000000', 50);
      logInfo(`cellTextOf(codeText="000000", index=50): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0208 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0209
     * @tc.name      VerifyCode_CellTextOf_0209
     * @tc.desc      cellTextOf(codeText="000000", index=55) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0209 begin`);
      const actual: string = cellTextOf('000000', 55);
      logInfo(`cellTextOf(codeText="000000", index=55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0209 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0210
     * @tc.name      VerifyCode_CellTextOf_0210
     * @tc.desc      cellTextOf(codeText="000000", index=60) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0210 begin`);
      const actual: string = cellTextOf('000000', 60);
      logInfo(`cellTextOf(codeText="000000", index=60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0210 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0211
     * @tc.name      VerifyCode_CellTextOf_0211
     * @tc.desc      cellTextOf(codeText="000000", index=65) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0211 begin`);
      const actual: string = cellTextOf('000000', 65);
      logInfo(`cellTextOf(codeText="000000", index=65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0211 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0212
     * @tc.name      VerifyCode_CellTextOf_0212
     * @tc.desc      cellTextOf(codeText="000000", index=70) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0212 begin`);
      const actual: string = cellTextOf('000000', 70);
      logInfo(`cellTextOf(codeText="000000", index=70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0212 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0213
     * @tc.name      VerifyCode_CellTextOf_0213
     * @tc.desc      cellTextOf(codeText="000000", index=75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0213 begin`);
      const actual: string = cellTextOf('000000', 75);
      logInfo(`cellTextOf(codeText="000000", index=75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0213 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0214
     * @tc.name      VerifyCode_CellTextOf_0214
     * @tc.desc      cellTextOf(codeText="000000", index=80) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0214 begin`);
      const actual: string = cellTextOf('000000', 80);
      logInfo(`cellTextOf(codeText="000000", index=80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0214 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0215
     * @tc.name      VerifyCode_CellTextOf_0215
     * @tc.desc      cellTextOf(codeText="000000", index=85) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0215 begin`);
      const actual: string = cellTextOf('000000', 85);
      logInfo(`cellTextOf(codeText="000000", index=85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0215 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0216
     * @tc.name      VerifyCode_CellTextOf_0216
     * @tc.desc      cellTextOf(codeText="000000", index=90) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0216 begin`);
      const actual: string = cellTextOf('000000', 90);
      logInfo(`cellTextOf(codeText="000000", index=90): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0216 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0217
     * @tc.name      VerifyCode_CellTextOf_0217
     * @tc.desc      cellTextOf(codeText="000000", index=95) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0217 begin`);
      const actual: string = cellTextOf('000000', 95);
      logInfo(`cellTextOf(codeText="000000", index=95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0217 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0218
     * @tc.name      VerifyCode_CellTextOf_0218
     * @tc.desc      cellTextOf(codeText="000000", index=105) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0218 begin`);
      const actual: string = cellTextOf('000000', 105);
      logInfo(`cellTextOf(codeText="000000", index=105): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0218 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0219
     * @tc.name      VerifyCode_CellTextOf_0219
     * @tc.desc      cellTextOf(codeText="000000", index=110) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0219 begin`);
      const actual: string = cellTextOf('000000', 110);
      logInfo(`cellTextOf(codeText="000000", index=110): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0219 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0220
     * @tc.name      VerifyCode_CellTextOf_0220
     * @tc.desc      cellTextOf(codeText="000000", index=115) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0220 begin`);
      const actual: string = cellTextOf('000000', 115);
      logInfo(`cellTextOf(codeText="000000", index=115): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0220 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0221
     * @tc.name      VerifyCode_CellTextOf_0221
     * @tc.desc      cellTextOf(codeText="000000", index=120) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0221 begin`);
      const actual: string = cellTextOf('000000', 120);
      logInfo(`cellTextOf(codeText="000000", index=120): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0221 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0222
     * @tc.name      VerifyCode_CellTextOf_0222
     * @tc.desc      cellTextOf(codeText="000000", index=125) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0222 begin`);
      const actual: string = cellTextOf('000000', 125);
      logInfo(`cellTextOf(codeText="000000", index=125): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0222 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0223
     * @tc.name      VerifyCode_CellTextOf_0223
     * @tc.desc      cellTextOf(codeText="000000", index=130) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0223 begin`);
      const actual: string = cellTextOf('000000', 130);
      logInfo(`cellTextOf(codeText="000000", index=130): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0223 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0224
     * @tc.name      VerifyCode_CellTextOf_0224
     * @tc.desc      cellTextOf(codeText="000000", index=135) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0224 begin`);
      const actual: string = cellTextOf('000000', 135);
      logInfo(`cellTextOf(codeText="000000", index=135): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0224 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0225
     * @tc.name      VerifyCode_CellTextOf_0225
     * @tc.desc      cellTextOf(codeText="000000", index=140) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0225 begin`);
      const actual: string = cellTextOf('000000', 140);
      logInfo(`cellTextOf(codeText="000000", index=140): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0225 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0226
     * @tc.name      VerifyCode_CellTextOf_0226
     * @tc.desc      cellTextOf(codeText="000000", index=145) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0226 begin`);
      const actual: string = cellTextOf('000000', 145);
      logInfo(`cellTextOf(codeText="000000", index=145): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0226 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0227
     * @tc.name      VerifyCode_CellTextOf_0227
     * @tc.desc      cellTextOf(codeText="000000", index=150) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0227 begin`);
      const actual: string = cellTextOf('000000', 150);
      logInfo(`cellTextOf(codeText="000000", index=150): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0227 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0228
     * @tc.name      VerifyCode_CellTextOf_0228
     * @tc.desc      cellTextOf(codeText="000000", index=155) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0228 begin`);
      const actual: string = cellTextOf('000000', 155);
      logInfo(`cellTextOf(codeText="000000", index=155): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0228 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0229
     * @tc.name      VerifyCode_CellTextOf_0229
     * @tc.desc      cellTextOf(codeText="000000", index=160) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0229 begin`);
      const actual: string = cellTextOf('000000', 160);
      logInfo(`cellTextOf(codeText="000000", index=160): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0229 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0230
     * @tc.name      VerifyCode_CellTextOf_0230
     * @tc.desc      cellTextOf(codeText="000000", index=165) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0230 begin`);
      const actual: string = cellTextOf('000000', 165);
      logInfo(`cellTextOf(codeText="000000", index=165): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0230 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0231
     * @tc.name      VerifyCode_CellTextOf_0231
     * @tc.desc      cellTextOf(codeText="000000", index=170) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0231 begin`);
      const actual: string = cellTextOf('000000', 170);
      logInfo(`cellTextOf(codeText="000000", index=170): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0231 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0232
     * @tc.name      VerifyCode_CellTextOf_0232
     * @tc.desc      cellTextOf(codeText="000000", index=175) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0232 begin`);
      const actual: string = cellTextOf('000000', 175);
      logInfo(`cellTextOf(codeText="000000", index=175): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0232 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0233
     * @tc.name      VerifyCode_CellTextOf_0233
     * @tc.desc      cellTextOf(codeText="000000", index=180) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0233 begin`);
      const actual: string = cellTextOf('000000', 180);
      logInfo(`cellTextOf(codeText="000000", index=180): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0233 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0234
     * @tc.name      VerifyCode_CellTextOf_0234
     * @tc.desc      cellTextOf(codeText="000000", index=185) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0234 begin`);
      const actual: string = cellTextOf('000000', 185);
      logInfo(`cellTextOf(codeText="000000", index=185): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0234 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0235
     * @tc.name      VerifyCode_CellTextOf_0235
     * @tc.desc      cellTextOf(codeText="000000", index=190) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0235 begin`);
      const actual: string = cellTextOf('000000', 190);
      logInfo(`cellTextOf(codeText="000000", index=190): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0235 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0236
     * @tc.name      VerifyCode_CellTextOf_0236
     * @tc.desc      cellTextOf(codeText="000000", index=195) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0236 begin`);
      const actual: string = cellTextOf('000000', 195);
      logInfo(`cellTextOf(codeText="000000", index=195): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0236 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0237
     * @tc.name      VerifyCode_CellTextOf_0237
     * @tc.desc      cellTextOf(codeText="000000", index=200) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0237 begin`);
      const actual: string = cellTextOf('000000', 200);
      logInfo(`cellTextOf(codeText="000000", index=200): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0237 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0238
     * @tc.name      VerifyCode_CellTextOf_0238
     * @tc.desc      cellTextOf(codeText="000000", index=29) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0238 begin`);
      const actual: string = cellTextOf('000000', 29);
      logInfo(`cellTextOf(codeText="000000", index=29): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0238 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0239
     * @tc.name      VerifyCode_CellTextOf_0239
     * @tc.desc      cellTextOf(codeText="000000", index=37) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0239 begin`);
      const actual: string = cellTextOf('000000', 37);
      logInfo(`cellTextOf(codeText="000000", index=37): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0239 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0240
     * @tc.name      VerifyCode_CellTextOf_0240
     * @tc.desc      cellTextOf(codeText="000000", index=-52) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0240 begin`);
      const actual: string = cellTextOf('000000', -52);
      logInfo(`cellTextOf(codeText="000000", index=-52): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0240 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0241
     * @tc.name      VerifyCode_CellTextOf_0241
     * @tc.desc      cellTextOf(codeText="000000", index=6) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0241 begin`);
      const actual: string = cellTextOf('000000', 6);
      logInfo(`cellTextOf(codeText="000000", index=6): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0241 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0242
     * @tc.name      VerifyCode_CellTextOf_0242
     * @tc.desc      cellTextOf(codeText="000000", index=186) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0242 begin`);
      const actual: string = cellTextOf('000000', 186);
      logInfo(`cellTextOf(codeText="000000", index=186): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0242 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0243
     * @tc.name      VerifyCode_CellTextOf_0243
     * @tc.desc      cellTextOf(codeText="000000", index=46) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0243 begin`);
      const actual: string = cellTextOf('000000', 46);
      logInfo(`cellTextOf(codeText="000000", index=46): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0243 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0244
     * @tc.name      VerifyCode_CellTextOf_0244
     * @tc.desc      cellTextOf(codeText="000000", index=11.81) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0244 begin`);
      const actual: string = cellTextOf('000000', 11.81);
      logInfo(`cellTextOf(codeText="000000", index=11.81): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0244 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0245
     * @tc.name      VerifyCode_CellTextOf_0245
     * @tc.desc      cellTextOf(codeText="000000", index=168) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0245 begin`);
      const actual: string = cellTextOf('000000', 168);
      logInfo(`cellTextOf(codeText="000000", index=168): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0245 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0246
     * @tc.name      VerifyCode_CellTextOf_0246
     * @tc.desc      cellTextOf(codeText="000000", index=31.79) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0246 begin`);
      const actual: string = cellTextOf('000000', 31.79);
      logInfo(`cellTextOf(codeText="000000", index=31.79): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0246 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0247
     * @tc.name      VerifyCode_CellTextOf_0247
     * @tc.desc      cellTextOf(codeText="000000", index=-47) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0247 begin`);
      const actual: string = cellTextOf('000000', -47);
      logInfo(`cellTextOf(codeText="000000", index=-47): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0247 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0248
     * @tc.name      VerifyCode_CellTextOf_0248
     * @tc.desc      cellTextOf(codeText="000000", index=77.89) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0248 begin`);
      const actual: string = cellTextOf('000000', 77.89);
      logInfo(`cellTextOf(codeText="000000", index=77.89): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0248 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0249
     * @tc.name      VerifyCode_CellTextOf_0249
     * @tc.desc      cellTextOf(codeText="000000", index=33) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0249 begin`);
      const actual: string = cellTextOf('000000', 33);
      logInfo(`cellTextOf(codeText="000000", index=33): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0249 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0250
     * @tc.name      VerifyCode_CellTextOf_0250
     * @tc.desc      cellTextOf(codeText="000000", index=98.53) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0250 begin`);
      const actual: string = cellTextOf('000000', 98.53);
      logInfo(`cellTextOf(codeText="000000", index=98.53): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0250 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0251
     * @tc.name      VerifyCode_CellTextOf_0251
     * @tc.desc      cellTextOf(codeText="000000", index=133) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0251 begin`);
      const actual: string = cellTextOf('000000', 133);
      logInfo(`cellTextOf(codeText="000000", index=133): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0251 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0252
     * @tc.name      VerifyCode_CellTextOf_0252
     * @tc.desc      cellTextOf(codeText="000000", index=21.54) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0252 begin`);
      const actual: string = cellTextOf('000000', 21.54);
      logInfo(`cellTextOf(codeText="000000", index=21.54): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0252 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0253
     * @tc.name      VerifyCode_CellTextOf_0253
     * @tc.desc      cellTextOf(codeText="12345", index=0) returns "1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0253 begin`);
      const actual: string = cellTextOf('12345', 0);
      logInfo(`cellTextOf(codeText="12345", index=0): actual=${actual}`);
      expect(actual).assertEqual('1');
      logInfo(`${BUNDLE}CellTextOf_0253 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0254
     * @tc.name      VerifyCode_CellTextOf_0254
     * @tc.desc      cellTextOf(codeText="12345", index=1) returns "2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0254 begin`);
      const actual: string = cellTextOf('12345', 1);
      logInfo(`cellTextOf(codeText="12345", index=1): actual=${actual}`);
      expect(actual).assertEqual('2');
      logInfo(`${BUNDLE}CellTextOf_0254 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0255
     * @tc.name      VerifyCode_CellTextOf_0255
     * @tc.desc      cellTextOf(codeText="12345", index=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0255 begin`);
      const actual: string = cellTextOf('12345', -1);
      logInfo(`cellTextOf(codeText="12345", index=-1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0255 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0256
     * @tc.name      VerifyCode_CellTextOf_0256
     * @tc.desc      cellTextOf(codeText="12345", index=2) returns "3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0256 begin`);
      const actual: string = cellTextOf('12345', 2);
      logInfo(`cellTextOf(codeText="12345", index=2): actual=${actual}`);
      expect(actual).assertEqual('3');
      logInfo(`${BUNDLE}CellTextOf_0256 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0257
     * @tc.name      VerifyCode_CellTextOf_0257
     * @tc.desc      cellTextOf(codeText="12345", index=5) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0257 begin`);
      const actual: string = cellTextOf('12345', 5);
      logInfo(`cellTextOf(codeText="12345", index=5): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0257 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0258
     * @tc.name      VerifyCode_CellTextOf_0258
     * @tc.desc      cellTextOf(codeText="12345", index=10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0258 begin`);
      const actual: string = cellTextOf('12345', 10);
      logInfo(`cellTextOf(codeText="12345", index=10): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0258 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0259
     * @tc.name      VerifyCode_CellTextOf_0259
     * @tc.desc      cellTextOf(codeText="12345", index=3) returns "4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0259 begin`);
      const actual: string = cellTextOf('12345', 3);
      logInfo(`cellTextOf(codeText="12345", index=3): actual=${actual}`);
      expect(actual).assertEqual('4');
      logInfo(`${BUNDLE}CellTextOf_0259 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0260
     * @tc.name      VerifyCode_CellTextOf_0260
     * @tc.desc      cellTextOf(codeText="12345", index=100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0260 begin`);
      const actual: string = cellTextOf('12345', 100);
      logInfo(`cellTextOf(codeText="12345", index=100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0260 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0261
     * @tc.name      VerifyCode_CellTextOf_0261
     * @tc.desc      cellTextOf(codeText="12345", index=15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0261 begin`);
      const actual: string = cellTextOf('12345', 15);
      logInfo(`cellTextOf(codeText="12345", index=15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0261 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0262
     * @tc.name      VerifyCode_CellTextOf_0262
     * @tc.desc      cellTextOf(codeText="12345", index=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0262 begin`);
      const actual: string = cellTextOf('12345', 20);
      logInfo(`cellTextOf(codeText="12345", index=20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0262 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0263
     * @tc.name      VerifyCode_CellTextOf_0263
     * @tc.desc      cellTextOf(codeText="12345", index=25) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0263 begin`);
      const actual: string = cellTextOf('12345', 25);
      logInfo(`cellTextOf(codeText="12345", index=25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0263 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0264
     * @tc.name      VerifyCode_CellTextOf_0264
     * @tc.desc      cellTextOf(codeText="12345", index=30) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0264 begin`);
      const actual: string = cellTextOf('12345', 30);
      logInfo(`cellTextOf(codeText="12345", index=30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0264 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0265
     * @tc.name      VerifyCode_CellTextOf_0265
     * @tc.desc      cellTextOf(codeText="12345", index=35) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0265 begin`);
      const actual: string = cellTextOf('12345', 35);
      logInfo(`cellTextOf(codeText="12345", index=35): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0265 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0266
     * @tc.name      VerifyCode_CellTextOf_0266
     * @tc.desc      cellTextOf(codeText="12345", index=40) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0266 begin`);
      const actual: string = cellTextOf('12345', 40);
      logInfo(`cellTextOf(codeText="12345", index=40): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0266 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0267
     * @tc.name      VerifyCode_CellTextOf_0267
     * @tc.desc      cellTextOf(codeText="12345", index=45) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0267 begin`);
      const actual: string = cellTextOf('12345', 45);
      logInfo(`cellTextOf(codeText="12345", index=45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0267 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0268
     * @tc.name      VerifyCode_CellTextOf_0268
     * @tc.desc      cellTextOf(codeText="12345", index=50) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0268 begin`);
      const actual: string = cellTextOf('12345', 50);
      logInfo(`cellTextOf(codeText="12345", index=50): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0268 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0269
     * @tc.name      VerifyCode_CellTextOf_0269
     * @tc.desc      cellTextOf(codeText="12345", index=55) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0269 begin`);
      const actual: string = cellTextOf('12345', 55);
      logInfo(`cellTextOf(codeText="12345", index=55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0269 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0270
     * @tc.name      VerifyCode_CellTextOf_0270
     * @tc.desc      cellTextOf(codeText="12345", index=60) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0270 begin`);
      const actual: string = cellTextOf('12345', 60);
      logInfo(`cellTextOf(codeText="12345", index=60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0270 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0271
     * @tc.name      VerifyCode_CellTextOf_0271
     * @tc.desc      cellTextOf(codeText="12345", index=65) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0271 begin`);
      const actual: string = cellTextOf('12345', 65);
      logInfo(`cellTextOf(codeText="12345", index=65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0271 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0272
     * @tc.name      VerifyCode_CellTextOf_0272
     * @tc.desc      cellTextOf(codeText="12345", index=70) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0272 begin`);
      const actual: string = cellTextOf('12345', 70);
      logInfo(`cellTextOf(codeText="12345", index=70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0272 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0273
     * @tc.name      VerifyCode_CellTextOf_0273
     * @tc.desc      cellTextOf(codeText="12345", index=75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0273 begin`);
      const actual: string = cellTextOf('12345', 75);
      logInfo(`cellTextOf(codeText="12345", index=75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0273 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0274
     * @tc.name      VerifyCode_CellTextOf_0274
     * @tc.desc      cellTextOf(codeText="12345", index=80) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0274 begin`);
      const actual: string = cellTextOf('12345', 80);
      logInfo(`cellTextOf(codeText="12345", index=80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0274 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0275
     * @tc.name      VerifyCode_CellTextOf_0275
     * @tc.desc      cellTextOf(codeText="12345", index=85) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0275 begin`);
      const actual: string = cellTextOf('12345', 85);
      logInfo(`cellTextOf(codeText="12345", index=85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0275 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0276
     * @tc.name      VerifyCode_CellTextOf_0276
     * @tc.desc      cellTextOf(codeText="12345", index=90) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0276 begin`);
      const actual: string = cellTextOf('12345', 90);
      logInfo(`cellTextOf(codeText="12345", index=90): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0276 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0277
     * @tc.name      VerifyCode_CellTextOf_0277
     * @tc.desc      cellTextOf(codeText="12345", index=95) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0277 begin`);
      const actual: string = cellTextOf('12345', 95);
      logInfo(`cellTextOf(codeText="12345", index=95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0277 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0278
     * @tc.name      VerifyCode_CellTextOf_0278
     * @tc.desc      cellTextOf(codeText="12345", index=105) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0278 begin`);
      const actual: string = cellTextOf('12345', 105);
      logInfo(`cellTextOf(codeText="12345", index=105): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0278 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0279
     * @tc.name      VerifyCode_CellTextOf_0279
     * @tc.desc      cellTextOf(codeText="12345", index=110) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0279 begin`);
      const actual: string = cellTextOf('12345', 110);
      logInfo(`cellTextOf(codeText="12345", index=110): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0279 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0280
     * @tc.name      VerifyCode_CellTextOf_0280
     * @tc.desc      cellTextOf(codeText="12345", index=115) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0280 begin`);
      const actual: string = cellTextOf('12345', 115);
      logInfo(`cellTextOf(codeText="12345", index=115): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0280 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0281
     * @tc.name      VerifyCode_CellTextOf_0281
     * @tc.desc      cellTextOf(codeText="12345", index=120) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0281 begin`);
      const actual: string = cellTextOf('12345', 120);
      logInfo(`cellTextOf(codeText="12345", index=120): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0281 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0282
     * @tc.name      VerifyCode_CellTextOf_0282
     * @tc.desc      cellTextOf(codeText="12345", index=125) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0282 begin`);
      const actual: string = cellTextOf('12345', 125);
      logInfo(`cellTextOf(codeText="12345", index=125): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0282 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0283
     * @tc.name      VerifyCode_CellTextOf_0283
     * @tc.desc      cellTextOf(codeText="12345", index=130) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0283 begin`);
      const actual: string = cellTextOf('12345', 130);
      logInfo(`cellTextOf(codeText="12345", index=130): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0283 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0284
     * @tc.name      VerifyCode_CellTextOf_0284
     * @tc.desc      cellTextOf(codeText="12345", index=135) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0284 begin`);
      const actual: string = cellTextOf('12345', 135);
      logInfo(`cellTextOf(codeText="12345", index=135): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0284 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0285
     * @tc.name      VerifyCode_CellTextOf_0285
     * @tc.desc      cellTextOf(codeText="12345", index=140) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0285 begin`);
      const actual: string = cellTextOf('12345', 140);
      logInfo(`cellTextOf(codeText="12345", index=140): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0285 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0286
     * @tc.name      VerifyCode_CellTextOf_0286
     * @tc.desc      cellTextOf(codeText="12345", index=145) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0286 begin`);
      const actual: string = cellTextOf('12345', 145);
      logInfo(`cellTextOf(codeText="12345", index=145): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0286 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0287
     * @tc.name      VerifyCode_CellTextOf_0287
     * @tc.desc      cellTextOf(codeText="12345", index=150) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0287 begin`);
      const actual: string = cellTextOf('12345', 150);
      logInfo(`cellTextOf(codeText="12345", index=150): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0287 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0288
     * @tc.name      VerifyCode_CellTextOf_0288
     * @tc.desc      cellTextOf(codeText="12345", index=155) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0288 begin`);
      const actual: string = cellTextOf('12345', 155);
      logInfo(`cellTextOf(codeText="12345", index=155): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0288 end`);
    });
  });
}
