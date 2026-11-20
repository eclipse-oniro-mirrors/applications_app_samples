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
export default function cellTextOf4Test(): void {
  describe('CellTextOf4Test', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0289
     * @tc.name      VerifyCode_CellTextOf_0289
     * @tc.desc      cellTextOf(codeText="12345", index=160) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0289 begin`);
      const actual: string = cellTextOf('12345', 160);
      logInfo(`cellTextOf(codeText="12345", index=160): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0289 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0290
     * @tc.name      VerifyCode_CellTextOf_0290
     * @tc.desc      cellTextOf(codeText="12345", index=165) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0290 begin`);
      const actual: string = cellTextOf('12345', 165);
      logInfo(`cellTextOf(codeText="12345", index=165): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0290 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0291
     * @tc.name      VerifyCode_CellTextOf_0291
     * @tc.desc      cellTextOf(codeText="12345", index=170) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0291 begin`);
      const actual: string = cellTextOf('12345', 170);
      logInfo(`cellTextOf(codeText="12345", index=170): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0291 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0292
     * @tc.name      VerifyCode_CellTextOf_0292
     * @tc.desc      cellTextOf(codeText="12345", index=175) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0292 begin`);
      const actual: string = cellTextOf('12345', 175);
      logInfo(`cellTextOf(codeText="12345", index=175): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0292 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0293
     * @tc.name      VerifyCode_CellTextOf_0293
     * @tc.desc      cellTextOf(codeText="12345", index=180) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0293 begin`);
      const actual: string = cellTextOf('12345', 180);
      logInfo(`cellTextOf(codeText="12345", index=180): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0293 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0294
     * @tc.name      VerifyCode_CellTextOf_0294
     * @tc.desc      cellTextOf(codeText="12345", index=185) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0294 begin`);
      const actual: string = cellTextOf('12345', 185);
      logInfo(`cellTextOf(codeText="12345", index=185): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0294 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0295
     * @tc.name      VerifyCode_CellTextOf_0295
     * @tc.desc      cellTextOf(codeText="12345", index=190) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0295 begin`);
      const actual: string = cellTextOf('12345', 190);
      logInfo(`cellTextOf(codeText="12345", index=190): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0295 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0296
     * @tc.name      VerifyCode_CellTextOf_0296
     * @tc.desc      cellTextOf(codeText="12345", index=195) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0296 begin`);
      const actual: string = cellTextOf('12345', 195);
      logInfo(`cellTextOf(codeText="12345", index=195): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0296 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0297
     * @tc.name      VerifyCode_CellTextOf_0297
     * @tc.desc      cellTextOf(codeText="12345", index=200) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0297 begin`);
      const actual: string = cellTextOf('12345', 200);
      logInfo(`cellTextOf(codeText="12345", index=200): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0297 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0298
     * @tc.name      VerifyCode_CellTextOf_0298
     * @tc.desc      cellTextOf(codeText="12345", index=29) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0298 begin`);
      const actual: string = cellTextOf('12345', 29);
      logInfo(`cellTextOf(codeText="12345", index=29): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0298 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0299
     * @tc.name      VerifyCode_CellTextOf_0299
     * @tc.desc      cellTextOf(codeText="12345", index=37) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0299 begin`);
      const actual: string = cellTextOf('12345', 37);
      logInfo(`cellTextOf(codeText="12345", index=37): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0299 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0300
     * @tc.name      VerifyCode_CellTextOf_0300
     * @tc.desc      cellTextOf(codeText="12345", index=-52) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0300 begin`);
      const actual: string = cellTextOf('12345', -52);
      logInfo(`cellTextOf(codeText="12345", index=-52): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0300 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0301
     * @tc.name      VerifyCode_CellTextOf_0301
     * @tc.desc      cellTextOf(codeText="12345", index=6) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0301 begin`);
      const actual: string = cellTextOf('12345', 6);
      logInfo(`cellTextOf(codeText="12345", index=6): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0301 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0302
     * @tc.name      VerifyCode_CellTextOf_0302
     * @tc.desc      cellTextOf(codeText="12345", index=186) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0302 begin`);
      const actual: string = cellTextOf('12345', 186);
      logInfo(`cellTextOf(codeText="12345", index=186): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0302 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0303
     * @tc.name      VerifyCode_CellTextOf_0303
     * @tc.desc      cellTextOf(codeText="12345", index=46) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0303 begin`);
      const actual: string = cellTextOf('12345', 46);
      logInfo(`cellTextOf(codeText="12345", index=46): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0303 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0304
     * @tc.name      VerifyCode_CellTextOf_0304
     * @tc.desc      cellTextOf(codeText="12345", index=11.81) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0304 begin`);
      const actual: string = cellTextOf('12345', 11.81);
      logInfo(`cellTextOf(codeText="12345", index=11.81): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0304 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0305
     * @tc.name      VerifyCode_CellTextOf_0305
     * @tc.desc      cellTextOf(codeText="12345", index=168) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0305 begin`);
      const actual: string = cellTextOf('12345', 168);
      logInfo(`cellTextOf(codeText="12345", index=168): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0305 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0306
     * @tc.name      VerifyCode_CellTextOf_0306
     * @tc.desc      cellTextOf(codeText="12345", index=31.79) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0306 begin`);
      const actual: string = cellTextOf('12345', 31.79);
      logInfo(`cellTextOf(codeText="12345", index=31.79): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0306 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0307
     * @tc.name      VerifyCode_CellTextOf_0307
     * @tc.desc      cellTextOf(codeText="12345", index=-47) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0307 begin`);
      const actual: string = cellTextOf('12345', -47);
      logInfo(`cellTextOf(codeText="12345", index=-47): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0307 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0308
     * @tc.name      VerifyCode_CellTextOf_0308
     * @tc.desc      cellTextOf(codeText="12345", index=77.89) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0308 begin`);
      const actual: string = cellTextOf('12345', 77.89);
      logInfo(`cellTextOf(codeText="12345", index=77.89): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0308 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0309
     * @tc.name      VerifyCode_CellTextOf_0309
     * @tc.desc      cellTextOf(codeText="12345", index=33) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0309 begin`);
      const actual: string = cellTextOf('12345', 33);
      logInfo(`cellTextOf(codeText="12345", index=33): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0309 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0310
     * @tc.name      VerifyCode_CellTextOf_0310
     * @tc.desc      cellTextOf(codeText="12345", index=98.53) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0310 begin`);
      const actual: string = cellTextOf('12345', 98.53);
      logInfo(`cellTextOf(codeText="12345", index=98.53): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0310 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0311
     * @tc.name      VerifyCode_CellTextOf_0311
     * @tc.desc      cellTextOf(codeText="12345", index=133) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0311 begin`);
      const actual: string = cellTextOf('12345', 133);
      logInfo(`cellTextOf(codeText="12345", index=133): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0311 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0312
     * @tc.name      VerifyCode_CellTextOf_0312
     * @tc.desc      cellTextOf(codeText="12345", index=21.54) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0312 begin`);
      const actual: string = cellTextOf('12345', 21.54);
      logInfo(`cellTextOf(codeText="12345", index=21.54): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0312 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0313
     * @tc.name      VerifyCode_CellTextOf_0313
     * @tc.desc      cellTextOf(codeText="1234567", index=0) returns "1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0313 begin`);
      const actual: string = cellTextOf('1234567', 0);
      logInfo(`cellTextOf(codeText="1234567", index=0): actual=${actual}`);
      expect(actual).assertEqual('1');
      logInfo(`${BUNDLE}CellTextOf_0313 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0314
     * @tc.name      VerifyCode_CellTextOf_0314
     * @tc.desc      cellTextOf(codeText="1234567", index=1) returns "2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0314 begin`);
      const actual: string = cellTextOf('1234567', 1);
      logInfo(`cellTextOf(codeText="1234567", index=1): actual=${actual}`);
      expect(actual).assertEqual('2');
      logInfo(`${BUNDLE}CellTextOf_0314 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0315
     * @tc.name      VerifyCode_CellTextOf_0315
     * @tc.desc      cellTextOf(codeText="1234567", index=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0315 begin`);
      const actual: string = cellTextOf('1234567', -1);
      logInfo(`cellTextOf(codeText="1234567", index=-1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0315 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0316
     * @tc.name      VerifyCode_CellTextOf_0316
     * @tc.desc      cellTextOf(codeText="1234567", index=2) returns "3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0316 begin`);
      const actual: string = cellTextOf('1234567', 2);
      logInfo(`cellTextOf(codeText="1234567", index=2): actual=${actual}`);
      expect(actual).assertEqual('3');
      logInfo(`${BUNDLE}CellTextOf_0316 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0317
     * @tc.name      VerifyCode_CellTextOf_0317
     * @tc.desc      cellTextOf(codeText="1234567", index=5) returns "6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0317 begin`);
      const actual: string = cellTextOf('1234567', 5);
      logInfo(`cellTextOf(codeText="1234567", index=5): actual=${actual}`);
      expect(actual).assertEqual('6');
      logInfo(`${BUNDLE}CellTextOf_0317 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0318
     * @tc.name      VerifyCode_CellTextOf_0318
     * @tc.desc      cellTextOf(codeText="1234567", index=10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0318 begin`);
      const actual: string = cellTextOf('1234567', 10);
      logInfo(`cellTextOf(codeText="1234567", index=10): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0318 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0319
     * @tc.name      VerifyCode_CellTextOf_0319
     * @tc.desc      cellTextOf(codeText="1234567", index=3) returns "4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0319 begin`);
      const actual: string = cellTextOf('1234567', 3);
      logInfo(`cellTextOf(codeText="1234567", index=3): actual=${actual}`);
      expect(actual).assertEqual('4');
      logInfo(`${BUNDLE}CellTextOf_0319 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0320
     * @tc.name      VerifyCode_CellTextOf_0320
     * @tc.desc      cellTextOf(codeText="1234567", index=100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0320 begin`);
      const actual: string = cellTextOf('1234567', 100);
      logInfo(`cellTextOf(codeText="1234567", index=100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0320 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0321
     * @tc.name      VerifyCode_CellTextOf_0321
     * @tc.desc      cellTextOf(codeText="1234567", index=15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0321 begin`);
      const actual: string = cellTextOf('1234567', 15);
      logInfo(`cellTextOf(codeText="1234567", index=15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0321 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0322
     * @tc.name      VerifyCode_CellTextOf_0322
     * @tc.desc      cellTextOf(codeText="1234567", index=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0322 begin`);
      const actual: string = cellTextOf('1234567', 20);
      logInfo(`cellTextOf(codeText="1234567", index=20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0322 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0323
     * @tc.name      VerifyCode_CellTextOf_0323
     * @tc.desc      cellTextOf(codeText="1234567", index=25) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0323 begin`);
      const actual: string = cellTextOf('1234567', 25);
      logInfo(`cellTextOf(codeText="1234567", index=25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0323 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0324
     * @tc.name      VerifyCode_CellTextOf_0324
     * @tc.desc      cellTextOf(codeText="1234567", index=30) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0324 begin`);
      const actual: string = cellTextOf('1234567', 30);
      logInfo(`cellTextOf(codeText="1234567", index=30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0324 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0325
     * @tc.name      VerifyCode_CellTextOf_0325
     * @tc.desc      cellTextOf(codeText="1234567", index=35) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0325 begin`);
      const actual: string = cellTextOf('1234567', 35);
      logInfo(`cellTextOf(codeText="1234567", index=35): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0325 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0326
     * @tc.name      VerifyCode_CellTextOf_0326
     * @tc.desc      cellTextOf(codeText="1234567", index=40) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0326 begin`);
      const actual: string = cellTextOf('1234567', 40);
      logInfo(`cellTextOf(codeText="1234567", index=40): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0326 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0327
     * @tc.name      VerifyCode_CellTextOf_0327
     * @tc.desc      cellTextOf(codeText="1234567", index=45) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0327 begin`);
      const actual: string = cellTextOf('1234567', 45);
      logInfo(`cellTextOf(codeText="1234567", index=45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0327 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0328
     * @tc.name      VerifyCode_CellTextOf_0328
     * @tc.desc      cellTextOf(codeText="1234567", index=50) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0328 begin`);
      const actual: string = cellTextOf('1234567', 50);
      logInfo(`cellTextOf(codeText="1234567", index=50): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0328 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0329
     * @tc.name      VerifyCode_CellTextOf_0329
     * @tc.desc      cellTextOf(codeText="1234567", index=55) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0329 begin`);
      const actual: string = cellTextOf('1234567', 55);
      logInfo(`cellTextOf(codeText="1234567", index=55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0329 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0330
     * @tc.name      VerifyCode_CellTextOf_0330
     * @tc.desc      cellTextOf(codeText="1234567", index=60) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0330 begin`);
      const actual: string = cellTextOf('1234567', 60);
      logInfo(`cellTextOf(codeText="1234567", index=60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0330 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0331
     * @tc.name      VerifyCode_CellTextOf_0331
     * @tc.desc      cellTextOf(codeText="1234567", index=65) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0331 begin`);
      const actual: string = cellTextOf('1234567', 65);
      logInfo(`cellTextOf(codeText="1234567", index=65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0331 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0332
     * @tc.name      VerifyCode_CellTextOf_0332
     * @tc.desc      cellTextOf(codeText="1234567", index=70) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0332 begin`);
      const actual: string = cellTextOf('1234567', 70);
      logInfo(`cellTextOf(codeText="1234567", index=70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0332 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0333
     * @tc.name      VerifyCode_CellTextOf_0333
     * @tc.desc      cellTextOf(codeText="1234567", index=75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0333 begin`);
      const actual: string = cellTextOf('1234567', 75);
      logInfo(`cellTextOf(codeText="1234567", index=75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0333 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0334
     * @tc.name      VerifyCode_CellTextOf_0334
     * @tc.desc      cellTextOf(codeText="1234567", index=80) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0334 begin`);
      const actual: string = cellTextOf('1234567', 80);
      logInfo(`cellTextOf(codeText="1234567", index=80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0334 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0335
     * @tc.name      VerifyCode_CellTextOf_0335
     * @tc.desc      cellTextOf(codeText="1234567", index=85) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0335 begin`);
      const actual: string = cellTextOf('1234567', 85);
      logInfo(`cellTextOf(codeText="1234567", index=85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0335 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0336
     * @tc.name      VerifyCode_CellTextOf_0336
     * @tc.desc      cellTextOf(codeText="1234567", index=90) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0336 begin`);
      const actual: string = cellTextOf('1234567', 90);
      logInfo(`cellTextOf(codeText="1234567", index=90): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0336 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0337
     * @tc.name      VerifyCode_CellTextOf_0337
     * @tc.desc      cellTextOf(codeText="1234567", index=95) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0337 begin`);
      const actual: string = cellTextOf('1234567', 95);
      logInfo(`cellTextOf(codeText="1234567", index=95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0337 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0338
     * @tc.name      VerifyCode_CellTextOf_0338
     * @tc.desc      cellTextOf(codeText="1234567", index=105) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0338 begin`);
      const actual: string = cellTextOf('1234567', 105);
      logInfo(`cellTextOf(codeText="1234567", index=105): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0338 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0339
     * @tc.name      VerifyCode_CellTextOf_0339
     * @tc.desc      cellTextOf(codeText="1234567", index=110) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0339 begin`);
      const actual: string = cellTextOf('1234567', 110);
      logInfo(`cellTextOf(codeText="1234567", index=110): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0339 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0340
     * @tc.name      VerifyCode_CellTextOf_0340
     * @tc.desc      cellTextOf(codeText="1234567", index=115) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0340 begin`);
      const actual: string = cellTextOf('1234567', 115);
      logInfo(`cellTextOf(codeText="1234567", index=115): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0340 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0341
     * @tc.name      VerifyCode_CellTextOf_0341
     * @tc.desc      cellTextOf(codeText="1234567", index=120) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0341 begin`);
      const actual: string = cellTextOf('1234567', 120);
      logInfo(`cellTextOf(codeText="1234567", index=120): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0341 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0342
     * @tc.name      VerifyCode_CellTextOf_0342
     * @tc.desc      cellTextOf(codeText="1234567", index=125) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0342 begin`);
      const actual: string = cellTextOf('1234567', 125);
      logInfo(`cellTextOf(codeText="1234567", index=125): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0342 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0343
     * @tc.name      VerifyCode_CellTextOf_0343
     * @tc.desc      cellTextOf(codeText="1234567", index=130) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0343 begin`);
      const actual: string = cellTextOf('1234567', 130);
      logInfo(`cellTextOf(codeText="1234567", index=130): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0343 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0344
     * @tc.name      VerifyCode_CellTextOf_0344
     * @tc.desc      cellTextOf(codeText="1234567", index=135) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0344 begin`);
      const actual: string = cellTextOf('1234567', 135);
      logInfo(`cellTextOf(codeText="1234567", index=135): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0344 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0345
     * @tc.name      VerifyCode_CellTextOf_0345
     * @tc.desc      cellTextOf(codeText="1234567", index=140) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0345 begin`);
      const actual: string = cellTextOf('1234567', 140);
      logInfo(`cellTextOf(codeText="1234567", index=140): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0345 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0346
     * @tc.name      VerifyCode_CellTextOf_0346
     * @tc.desc      cellTextOf(codeText="1234567", index=145) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0346 begin`);
      const actual: string = cellTextOf('1234567', 145);
      logInfo(`cellTextOf(codeText="1234567", index=145): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0346 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0347
     * @tc.name      VerifyCode_CellTextOf_0347
     * @tc.desc      cellTextOf(codeText="1234567", index=150) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0347 begin`);
      const actual: string = cellTextOf('1234567', 150);
      logInfo(`cellTextOf(codeText="1234567", index=150): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0347 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0348
     * @tc.name      VerifyCode_CellTextOf_0348
     * @tc.desc      cellTextOf(codeText="1234567", index=155) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0348 begin`);
      const actual: string = cellTextOf('1234567', 155);
      logInfo(`cellTextOf(codeText="1234567", index=155): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0348 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0349
     * @tc.name      VerifyCode_CellTextOf_0349
     * @tc.desc      cellTextOf(codeText="1234567", index=160) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0349 begin`);
      const actual: string = cellTextOf('1234567', 160);
      logInfo(`cellTextOf(codeText="1234567", index=160): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0349 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0350
     * @tc.name      VerifyCode_CellTextOf_0350
     * @tc.desc      cellTextOf(codeText="1234567", index=165) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0350 begin`);
      const actual: string = cellTextOf('1234567', 165);
      logInfo(`cellTextOf(codeText="1234567", index=165): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0350 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0351
     * @tc.name      VerifyCode_CellTextOf_0351
     * @tc.desc      cellTextOf(codeText="1234567", index=170) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0351 begin`);
      const actual: string = cellTextOf('1234567', 170);
      logInfo(`cellTextOf(codeText="1234567", index=170): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0351 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0352
     * @tc.name      VerifyCode_CellTextOf_0352
     * @tc.desc      cellTextOf(codeText="1234567", index=175) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0352 begin`);
      const actual: string = cellTextOf('1234567', 175);
      logInfo(`cellTextOf(codeText="1234567", index=175): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0352 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0353
     * @tc.name      VerifyCode_CellTextOf_0353
     * @tc.desc      cellTextOf(codeText="1234567", index=180) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0353 begin`);
      const actual: string = cellTextOf('1234567', 180);
      logInfo(`cellTextOf(codeText="1234567", index=180): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0353 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0354
     * @tc.name      VerifyCode_CellTextOf_0354
     * @tc.desc      cellTextOf(codeText="1234567", index=185) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0354 begin`);
      const actual: string = cellTextOf('1234567', 185);
      logInfo(`cellTextOf(codeText="1234567", index=185): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0354 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0355
     * @tc.name      VerifyCode_CellTextOf_0355
     * @tc.desc      cellTextOf(codeText="1234567", index=190) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0355 begin`);
      const actual: string = cellTextOf('1234567', 190);
      logInfo(`cellTextOf(codeText="1234567", index=190): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0355 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0356
     * @tc.name      VerifyCode_CellTextOf_0356
     * @tc.desc      cellTextOf(codeText="1234567", index=195) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0356 begin`);
      const actual: string = cellTextOf('1234567', 195);
      logInfo(`cellTextOf(codeText="1234567", index=195): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0356 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0357
     * @tc.name      VerifyCode_CellTextOf_0357
     * @tc.desc      cellTextOf(codeText="1234567", index=200) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0357 begin`);
      const actual: string = cellTextOf('1234567', 200);
      logInfo(`cellTextOf(codeText="1234567", index=200): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0357 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0358
     * @tc.name      VerifyCode_CellTextOf_0358
     * @tc.desc      cellTextOf(codeText="1234567", index=29) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0358 begin`);
      const actual: string = cellTextOf('1234567', 29);
      logInfo(`cellTextOf(codeText="1234567", index=29): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0358 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0359
     * @tc.name      VerifyCode_CellTextOf_0359
     * @tc.desc      cellTextOf(codeText="1234567", index=37) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0359 begin`);
      const actual: string = cellTextOf('1234567', 37);
      logInfo(`cellTextOf(codeText="1234567", index=37): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0359 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0360
     * @tc.name      VerifyCode_CellTextOf_0360
     * @tc.desc      cellTextOf(codeText="1234567", index=-52) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0360 begin`);
      const actual: string = cellTextOf('1234567', -52);
      logInfo(`cellTextOf(codeText="1234567", index=-52): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0360 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0361
     * @tc.name      VerifyCode_CellTextOf_0361
     * @tc.desc      cellTextOf(codeText="1234567", index=186) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0361 begin`);
      const actual: string = cellTextOf('1234567', 186);
      logInfo(`cellTextOf(codeText="1234567", index=186): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0361 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0362
     * @tc.name      VerifyCode_CellTextOf_0362
     * @tc.desc      cellTextOf(codeText="1234567", index=46) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0362 begin`);
      const actual: string = cellTextOf('1234567', 46);
      logInfo(`cellTextOf(codeText="1234567", index=46): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0362 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0363
     * @tc.name      VerifyCode_CellTextOf_0363
     * @tc.desc      cellTextOf(codeText="1234567", index=11.81) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0363 begin`);
      const actual: string = cellTextOf('1234567', 11.81);
      logInfo(`cellTextOf(codeText="1234567", index=11.81): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0363 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0364
     * @tc.name      VerifyCode_CellTextOf_0364
     * @tc.desc      cellTextOf(codeText="1234567", index=168) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0364 begin`);
      const actual: string = cellTextOf('1234567', 168);
      logInfo(`cellTextOf(codeText="1234567", index=168): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0364 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0365
     * @tc.name      VerifyCode_CellTextOf_0365
     * @tc.desc      cellTextOf(codeText="1234567", index=31.79) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0365 begin`);
      const actual: string = cellTextOf('1234567', 31.79);
      logInfo(`cellTextOf(codeText="1234567", index=31.79): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0365 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0366
     * @tc.name      VerifyCode_CellTextOf_0366
     * @tc.desc      cellTextOf(codeText="1234567", index=-47) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0366 begin`);
      const actual: string = cellTextOf('1234567', -47);
      logInfo(`cellTextOf(codeText="1234567", index=-47): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0366 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0367
     * @tc.name      VerifyCode_CellTextOf_0367
     * @tc.desc      cellTextOf(codeText="1234567", index=77.89) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0367 begin`);
      const actual: string = cellTextOf('1234567', 77.89);
      logInfo(`cellTextOf(codeText="1234567", index=77.89): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0367 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0368
     * @tc.name      VerifyCode_CellTextOf_0368
     * @tc.desc      cellTextOf(codeText="1234567", index=33) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0368 begin`);
      const actual: string = cellTextOf('1234567', 33);
      logInfo(`cellTextOf(codeText="1234567", index=33): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0368 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0369
     * @tc.name      VerifyCode_CellTextOf_0369
     * @tc.desc      cellTextOf(codeText="1234567", index=98.53) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0369 begin`);
      const actual: string = cellTextOf('1234567', 98.53);
      logInfo(`cellTextOf(codeText="1234567", index=98.53): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0369 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0370
     * @tc.name      VerifyCode_CellTextOf_0370
     * @tc.desc      cellTextOf(codeText="1234567", index=133) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0370 begin`);
      const actual: string = cellTextOf('1234567', 133);
      logInfo(`cellTextOf(codeText="1234567", index=133): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0370 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0371
     * @tc.name      VerifyCode_CellTextOf_0371
     * @tc.desc      cellTextOf(codeText="1234567", index=21.54) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0371 begin`);
      const actual: string = cellTextOf('1234567', 21.54);
      logInfo(`cellTextOf(codeText="1234567", index=21.54): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0371 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0372
     * @tc.name      VerifyCode_CellTextOf_0372
     * @tc.desc      cellTextOf(codeText="abc123", index=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0372 begin`);
      const actual: string = cellTextOf('abc123', -1);
      logInfo(`cellTextOf(codeText="abc123", index=-1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0372 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0373
     * @tc.name      VerifyCode_CellTextOf_0373
     * @tc.desc      cellTextOf(codeText="abc123", index=5) returns "3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0373', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0373 begin`);
      const actual: string = cellTextOf('abc123', 5);
      logInfo(`cellTextOf(codeText="abc123", index=5): actual=${actual}`);
      expect(actual).assertEqual('3');
      logInfo(`${BUNDLE}CellTextOf_0373 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0374
     * @tc.name      VerifyCode_CellTextOf_0374
     * @tc.desc      cellTextOf(codeText="abc123", index=10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0374', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0374 begin`);
      const actual: string = cellTextOf('abc123', 10);
      logInfo(`cellTextOf(codeText="abc123", index=10): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0374 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0375
     * @tc.name      VerifyCode_CellTextOf_0375
     * @tc.desc      cellTextOf(codeText="abc123", index=3) returns "1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0375', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0375 begin`);
      const actual: string = cellTextOf('abc123', 3);
      logInfo(`cellTextOf(codeText="abc123", index=3): actual=${actual}`);
      expect(actual).assertEqual('1');
      logInfo(`${BUNDLE}CellTextOf_0375 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0376
     * @tc.name      VerifyCode_CellTextOf_0376
     * @tc.desc      cellTextOf(codeText="abc123", index=100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0376', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0376 begin`);
      const actual: string = cellTextOf('abc123', 100);
      logInfo(`cellTextOf(codeText="abc123", index=100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0376 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0377
     * @tc.name      VerifyCode_CellTextOf_0377
     * @tc.desc      cellTextOf(codeText="abc123", index=15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0377', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0377 begin`);
      const actual: string = cellTextOf('abc123', 15);
      logInfo(`cellTextOf(codeText="abc123", index=15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0377 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0378
     * @tc.name      VerifyCode_CellTextOf_0378
     * @tc.desc      cellTextOf(codeText="abc123", index=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0378', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0378 begin`);
      const actual: string = cellTextOf('abc123', 20);
      logInfo(`cellTextOf(codeText="abc123", index=20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0378 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0379
     * @tc.name      VerifyCode_CellTextOf_0379
     * @tc.desc      cellTextOf(codeText="abc123", index=25) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0379', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0379 begin`);
      const actual: string = cellTextOf('abc123', 25);
      logInfo(`cellTextOf(codeText="abc123", index=25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0379 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0380
     * @tc.name      VerifyCode_CellTextOf_0380
     * @tc.desc      cellTextOf(codeText="abc123", index=30) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0380', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0380 begin`);
      const actual: string = cellTextOf('abc123', 30);
      logInfo(`cellTextOf(codeText="abc123", index=30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0380 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0381
     * @tc.name      VerifyCode_CellTextOf_0381
     * @tc.desc      cellTextOf(codeText="abc123", index=35) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0381', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0381 begin`);
      const actual: string = cellTextOf('abc123', 35);
      logInfo(`cellTextOf(codeText="abc123", index=35): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0381 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0382
     * @tc.name      VerifyCode_CellTextOf_0382
     * @tc.desc      cellTextOf(codeText="abc123", index=40) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0382', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0382 begin`);
      const actual: string = cellTextOf('abc123', 40);
      logInfo(`cellTextOf(codeText="abc123", index=40): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0382 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0383
     * @tc.name      VerifyCode_CellTextOf_0383
     * @tc.desc      cellTextOf(codeText="abc123", index=45) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0383', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0383 begin`);
      const actual: string = cellTextOf('abc123', 45);
      logInfo(`cellTextOf(codeText="abc123", index=45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0383 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0384
     * @tc.name      VerifyCode_CellTextOf_0384
     * @tc.desc      cellTextOf(codeText="abc123", index=50) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0384', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0384 begin`);
      const actual: string = cellTextOf('abc123', 50);
      logInfo(`cellTextOf(codeText="abc123", index=50): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0384 end`);
    });
  });
}
