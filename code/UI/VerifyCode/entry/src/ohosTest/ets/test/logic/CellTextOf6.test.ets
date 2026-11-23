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

/** Logic checks for cellTextOf (20 cases). */
export default function cellTextOf6Test(): void {
  describe('CellTextOf6Test', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0481
     * @tc.name      VerifyCode_CellTextOf_0481
     * @tc.desc      cellTextOf(codeText="a", index=168) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0481', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0481 begin`);
      const actual: string = cellTextOf('a', 168);
      logInfo(`cellTextOf(codeText="a", index=168): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0481 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0482
     * @tc.name      VerifyCode_CellTextOf_0482
     * @tc.desc      cellTextOf(codeText="a", index=31.79) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0482', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0482 begin`);
      const actual: string = cellTextOf('a', 31.79);
      logInfo(`cellTextOf(codeText="a", index=31.79): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0482 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0483
     * @tc.name      VerifyCode_CellTextOf_0483
     * @tc.desc      cellTextOf(codeText="a", index=-47) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0483', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0483 begin`);
      const actual: string = cellTextOf('a', -47);
      logInfo(`cellTextOf(codeText="a", index=-47): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0483 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0484
     * @tc.name      VerifyCode_CellTextOf_0484
     * @tc.desc      cellTextOf(codeText="a", index=77.89) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0484', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0484 begin`);
      const actual: string = cellTextOf('a', 77.89);
      logInfo(`cellTextOf(codeText="a", index=77.89): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0484 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0485
     * @tc.name      VerifyCode_CellTextOf_0485
     * @tc.desc      cellTextOf(codeText="a", index=33) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0485', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0485 begin`);
      const actual: string = cellTextOf('a', 33);
      logInfo(`cellTextOf(codeText="a", index=33): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0485 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0486
     * @tc.name      VerifyCode_CellTextOf_0486
     * @tc.desc      cellTextOf(codeText="a", index=98.53) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0486', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0486 begin`);
      const actual: string = cellTextOf('a', 98.53);
      logInfo(`cellTextOf(codeText="a", index=98.53): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0486 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0487
     * @tc.name      VerifyCode_CellTextOf_0487
     * @tc.desc      cellTextOf(codeText="a", index=133) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0487', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0487 begin`);
      const actual: string = cellTextOf('a', 133);
      logInfo(`cellTextOf(codeText="a", index=133): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0487 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0488
     * @tc.name      VerifyCode_CellTextOf_0488
     * @tc.desc      cellTextOf(codeText="a", index=21.54) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0488', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0488 begin`);
      const actual: string = cellTextOf('a', 21.54);
      logInfo(`cellTextOf(codeText="a", index=21.54): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0488 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0489
     * @tc.name      VerifyCode_CellTextOf_0489
     * @tc.desc      cellTextOf(codeText="abc", index=0) returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0489', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0489 begin`);
      const actual: string = cellTextOf('abc', 0);
      logInfo(`cellTextOf(codeText="abc", index=0): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}CellTextOf_0489 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0490
     * @tc.name      VerifyCode_CellTextOf_0490
     * @tc.desc      cellTextOf(codeText="abc", index=1) returns "b"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0490', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0490 begin`);
      const actual: string = cellTextOf('abc', 1);
      logInfo(`cellTextOf(codeText="abc", index=1): actual=${actual}`);
      expect(actual).assertEqual('b');
      logInfo(`${BUNDLE}CellTextOf_0490 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0491
     * @tc.name      VerifyCode_CellTextOf_0491
     * @tc.desc      cellTextOf(codeText="abc", index=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0491', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0491 begin`);
      const actual: string = cellTextOf('abc', -1);
      logInfo(`cellTextOf(codeText="abc", index=-1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0491 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0492
     * @tc.name      VerifyCode_CellTextOf_0492
     * @tc.desc      cellTextOf(codeText="abc", index=2) returns "c"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0492', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0492 begin`);
      const actual: string = cellTextOf('abc', 2);
      logInfo(`cellTextOf(codeText="abc", index=2): actual=${actual}`);
      expect(actual).assertEqual('c');
      logInfo(`${BUNDLE}CellTextOf_0492 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0493
     * @tc.name      VerifyCode_CellTextOf_0493
     * @tc.desc      cellTextOf(codeText="abc", index=5) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0493', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0493 begin`);
      const actual: string = cellTextOf('abc', 5);
      logInfo(`cellTextOf(codeText="abc", index=5): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0493 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0494
     * @tc.name      VerifyCode_CellTextOf_0494
     * @tc.desc      cellTextOf(codeText="abc", index=10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0494', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0494 begin`);
      const actual: string = cellTextOf('abc', 10);
      logInfo(`cellTextOf(codeText="abc", index=10): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0494 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0495
     * @tc.name      VerifyCode_CellTextOf_0495
     * @tc.desc      cellTextOf(codeText="abc", index=3) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0495', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0495 begin`);
      const actual: string = cellTextOf('abc', 3);
      logInfo(`cellTextOf(codeText="abc", index=3): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0495 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0496
     * @tc.name      VerifyCode_CellTextOf_0496
     * @tc.desc      cellTextOf(codeText="abc", index=100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0496', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0496 begin`);
      const actual: string = cellTextOf('abc', 100);
      logInfo(`cellTextOf(codeText="abc", index=100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0496 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0497
     * @tc.name      VerifyCode_CellTextOf_0497
     * @tc.desc      cellTextOf(codeText="abc", index=15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0497', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0497 begin`);
      const actual: string = cellTextOf('abc', 15);
      logInfo(`cellTextOf(codeText="abc", index=15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0497 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0498
     * @tc.name      VerifyCode_CellTextOf_0498
     * @tc.desc      cellTextOf(codeText="abc", index=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0498', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0498 begin`);
      const actual: string = cellTextOf('abc', 20);
      logInfo(`cellTextOf(codeText="abc", index=20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0498 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0499
     * @tc.name      VerifyCode_CellTextOf_0499
     * @tc.desc      cellTextOf(codeText="abc", index=25) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0499', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0499 begin`);
      const actual: string = cellTextOf('abc', 25);
      logInfo(`cellTextOf(codeText="abc", index=25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0499 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0500
     * @tc.name      VerifyCode_CellTextOf_0500
     * @tc.desc      cellTextOf(codeText="abc", index=30) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0500 begin`);
      const actual: string = cellTextOf('abc', 30);
      logInfo(`cellTextOf(codeText="abc", index=30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0500 end`);
    });
  });
}
