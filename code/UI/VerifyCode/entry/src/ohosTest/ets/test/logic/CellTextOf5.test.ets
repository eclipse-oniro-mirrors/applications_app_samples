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
export default function cellTextOf5Test(): void {
  describe('CellTextOf5Test', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0385
     * @tc.name      VerifyCode_CellTextOf_0385
     * @tc.desc      cellTextOf(codeText="abc123", index=55) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0385', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0385 begin`);
      const actual: string = cellTextOf('abc123', 55);
      logInfo(`cellTextOf(codeText="abc123", index=55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0385 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0386
     * @tc.name      VerifyCode_CellTextOf_0386
     * @tc.desc      cellTextOf(codeText="abc123", index=60) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0386', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0386 begin`);
      const actual: string = cellTextOf('abc123', 60);
      logInfo(`cellTextOf(codeText="abc123", index=60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0386 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0387
     * @tc.name      VerifyCode_CellTextOf_0387
     * @tc.desc      cellTextOf(codeText="abc123", index=65) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0387 begin`);
      const actual: string = cellTextOf('abc123', 65);
      logInfo(`cellTextOf(codeText="abc123", index=65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0387 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0388
     * @tc.name      VerifyCode_CellTextOf_0388
     * @tc.desc      cellTextOf(codeText="abc123", index=70) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0388 begin`);
      const actual: string = cellTextOf('abc123', 70);
      logInfo(`cellTextOf(codeText="abc123", index=70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0388 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0389
     * @tc.name      VerifyCode_CellTextOf_0389
     * @tc.desc      cellTextOf(codeText="abc123", index=75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0389 begin`);
      const actual: string = cellTextOf('abc123', 75);
      logInfo(`cellTextOf(codeText="abc123", index=75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0389 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0390
     * @tc.name      VerifyCode_CellTextOf_0390
     * @tc.desc      cellTextOf(codeText="abc123", index=80) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0390 begin`);
      const actual: string = cellTextOf('abc123', 80);
      logInfo(`cellTextOf(codeText="abc123", index=80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0390 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0391
     * @tc.name      VerifyCode_CellTextOf_0391
     * @tc.desc      cellTextOf(codeText="abc123", index=85) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0391', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0391 begin`);
      const actual: string = cellTextOf('abc123', 85);
      logInfo(`cellTextOf(codeText="abc123", index=85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0391 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0392
     * @tc.name      VerifyCode_CellTextOf_0392
     * @tc.desc      cellTextOf(codeText="abc123", index=90) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0392', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0392 begin`);
      const actual: string = cellTextOf('abc123', 90);
      logInfo(`cellTextOf(codeText="abc123", index=90): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0392 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0393
     * @tc.name      VerifyCode_CellTextOf_0393
     * @tc.desc      cellTextOf(codeText="abc123", index=95) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0393', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0393 begin`);
      const actual: string = cellTextOf('abc123', 95);
      logInfo(`cellTextOf(codeText="abc123", index=95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0393 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0394
     * @tc.name      VerifyCode_CellTextOf_0394
     * @tc.desc      cellTextOf(codeText="abc123", index=105) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0394', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0394 begin`);
      const actual: string = cellTextOf('abc123', 105);
      logInfo(`cellTextOf(codeText="abc123", index=105): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0394 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0395
     * @tc.name      VerifyCode_CellTextOf_0395
     * @tc.desc      cellTextOf(codeText="abc123", index=110) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0395', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0395 begin`);
      const actual: string = cellTextOf('abc123', 110);
      logInfo(`cellTextOf(codeText="abc123", index=110): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0395 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0396
     * @tc.name      VerifyCode_CellTextOf_0396
     * @tc.desc      cellTextOf(codeText="abc123", index=115) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0396', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0396 begin`);
      const actual: string = cellTextOf('abc123', 115);
      logInfo(`cellTextOf(codeText="abc123", index=115): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0396 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0397
     * @tc.name      VerifyCode_CellTextOf_0397
     * @tc.desc      cellTextOf(codeText="abc123", index=120) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0397', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0397 begin`);
      const actual: string = cellTextOf('abc123', 120);
      logInfo(`cellTextOf(codeText="abc123", index=120): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0397 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0398
     * @tc.name      VerifyCode_CellTextOf_0398
     * @tc.desc      cellTextOf(codeText="abc123", index=125) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0398', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0398 begin`);
      const actual: string = cellTextOf('abc123', 125);
      logInfo(`cellTextOf(codeText="abc123", index=125): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0398 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0399
     * @tc.name      VerifyCode_CellTextOf_0399
     * @tc.desc      cellTextOf(codeText="abc123", index=130) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0399', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0399 begin`);
      const actual: string = cellTextOf('abc123', 130);
      logInfo(`cellTextOf(codeText="abc123", index=130): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0399 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0400
     * @tc.name      VerifyCode_CellTextOf_0400
     * @tc.desc      cellTextOf(codeText="abc123", index=135) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0400 begin`);
      const actual: string = cellTextOf('abc123', 135);
      logInfo(`cellTextOf(codeText="abc123", index=135): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0400 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0401
     * @tc.name      VerifyCode_CellTextOf_0401
     * @tc.desc      cellTextOf(codeText="abc123", index=140) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0401 begin`);
      const actual: string = cellTextOf('abc123', 140);
      logInfo(`cellTextOf(codeText="abc123", index=140): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0401 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0402
     * @tc.name      VerifyCode_CellTextOf_0402
     * @tc.desc      cellTextOf(codeText="abc123", index=145) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0402 begin`);
      const actual: string = cellTextOf('abc123', 145);
      logInfo(`cellTextOf(codeText="abc123", index=145): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0402 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0403
     * @tc.name      VerifyCode_CellTextOf_0403
     * @tc.desc      cellTextOf(codeText="abc123", index=150) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0403 begin`);
      const actual: string = cellTextOf('abc123', 150);
      logInfo(`cellTextOf(codeText="abc123", index=150): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0403 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0404
     * @tc.name      VerifyCode_CellTextOf_0404
     * @tc.desc      cellTextOf(codeText="abc123", index=155) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0404 begin`);
      const actual: string = cellTextOf('abc123', 155);
      logInfo(`cellTextOf(codeText="abc123", index=155): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0404 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0405
     * @tc.name      VerifyCode_CellTextOf_0405
     * @tc.desc      cellTextOf(codeText="abc123", index=160) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0405 begin`);
      const actual: string = cellTextOf('abc123', 160);
      logInfo(`cellTextOf(codeText="abc123", index=160): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0405 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0406
     * @tc.name      VerifyCode_CellTextOf_0406
     * @tc.desc      cellTextOf(codeText="abc123", index=165) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0406 begin`);
      const actual: string = cellTextOf('abc123', 165);
      logInfo(`cellTextOf(codeText="abc123", index=165): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0406 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0407
     * @tc.name      VerifyCode_CellTextOf_0407
     * @tc.desc      cellTextOf(codeText="abc123", index=170) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0407 begin`);
      const actual: string = cellTextOf('abc123', 170);
      logInfo(`cellTextOf(codeText="abc123", index=170): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0407 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0408
     * @tc.name      VerifyCode_CellTextOf_0408
     * @tc.desc      cellTextOf(codeText="abc123", index=175) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0408 begin`);
      const actual: string = cellTextOf('abc123', 175);
      logInfo(`cellTextOf(codeText="abc123", index=175): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0408 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0409
     * @tc.name      VerifyCode_CellTextOf_0409
     * @tc.desc      cellTextOf(codeText="abc123", index=180) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0409 begin`);
      const actual: string = cellTextOf('abc123', 180);
      logInfo(`cellTextOf(codeText="abc123", index=180): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0409 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0410
     * @tc.name      VerifyCode_CellTextOf_0410
     * @tc.desc      cellTextOf(codeText="abc123", index=185) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0410 begin`);
      const actual: string = cellTextOf('abc123', 185);
      logInfo(`cellTextOf(codeText="abc123", index=185): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0410 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0411
     * @tc.name      VerifyCode_CellTextOf_0411
     * @tc.desc      cellTextOf(codeText="abc123", index=190) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0411 begin`);
      const actual: string = cellTextOf('abc123', 190);
      logInfo(`cellTextOf(codeText="abc123", index=190): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0411 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0412
     * @tc.name      VerifyCode_CellTextOf_0412
     * @tc.desc      cellTextOf(codeText="abc123", index=195) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0412 begin`);
      const actual: string = cellTextOf('abc123', 195);
      logInfo(`cellTextOf(codeText="abc123", index=195): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0412 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0413
     * @tc.name      VerifyCode_CellTextOf_0413
     * @tc.desc      cellTextOf(codeText="abc123", index=200) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0413 begin`);
      const actual: string = cellTextOf('abc123', 200);
      logInfo(`cellTextOf(codeText="abc123", index=200): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0413 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0414
     * @tc.name      VerifyCode_CellTextOf_0414
     * @tc.desc      cellTextOf(codeText="abc123", index=29) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0414 begin`);
      const actual: string = cellTextOf('abc123', 29);
      logInfo(`cellTextOf(codeText="abc123", index=29): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0414 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0415
     * @tc.name      VerifyCode_CellTextOf_0415
     * @tc.desc      cellTextOf(codeText="abc123", index=37) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0415 begin`);
      const actual: string = cellTextOf('abc123', 37);
      logInfo(`cellTextOf(codeText="abc123", index=37): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0415 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0416
     * @tc.name      VerifyCode_CellTextOf_0416
     * @tc.desc      cellTextOf(codeText="abc123", index=-52) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0416 begin`);
      const actual: string = cellTextOf('abc123', -52);
      logInfo(`cellTextOf(codeText="abc123", index=-52): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0416 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0417
     * @tc.name      VerifyCode_CellTextOf_0417
     * @tc.desc      cellTextOf(codeText="abc123", index=6) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0417 begin`);
      const actual: string = cellTextOf('abc123', 6);
      logInfo(`cellTextOf(codeText="abc123", index=6): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0417 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0418
     * @tc.name      VerifyCode_CellTextOf_0418
     * @tc.desc      cellTextOf(codeText="abc123", index=186) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0418 begin`);
      const actual: string = cellTextOf('abc123', 186);
      logInfo(`cellTextOf(codeText="abc123", index=186): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0418 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0419
     * @tc.name      VerifyCode_CellTextOf_0419
     * @tc.desc      cellTextOf(codeText="abc123", index=46) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0419 begin`);
      const actual: string = cellTextOf('abc123', 46);
      logInfo(`cellTextOf(codeText="abc123", index=46): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0419 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0420
     * @tc.name      VerifyCode_CellTextOf_0420
     * @tc.desc      cellTextOf(codeText="abc123", index=11.81) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0420 begin`);
      const actual: string = cellTextOf('abc123', 11.81);
      logInfo(`cellTextOf(codeText="abc123", index=11.81): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0420 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0421
     * @tc.name      VerifyCode_CellTextOf_0421
     * @tc.desc      cellTextOf(codeText="abc123", index=168) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0421 begin`);
      const actual: string = cellTextOf('abc123', 168);
      logInfo(`cellTextOf(codeText="abc123", index=168): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0421 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0422
     * @tc.name      VerifyCode_CellTextOf_0422
     * @tc.desc      cellTextOf(codeText="abc123", index=31.79) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0422 begin`);
      const actual: string = cellTextOf('abc123', 31.79);
      logInfo(`cellTextOf(codeText="abc123", index=31.79): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0422 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0423
     * @tc.name      VerifyCode_CellTextOf_0423
     * @tc.desc      cellTextOf(codeText="abc123", index=-47) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0423 begin`);
      const actual: string = cellTextOf('abc123', -47);
      logInfo(`cellTextOf(codeText="abc123", index=-47): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0423 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0424
     * @tc.name      VerifyCode_CellTextOf_0424
     * @tc.desc      cellTextOf(codeText="abc123", index=77.89) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0424 begin`);
      const actual: string = cellTextOf('abc123', 77.89);
      logInfo(`cellTextOf(codeText="abc123", index=77.89): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0424 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0425
     * @tc.name      VerifyCode_CellTextOf_0425
     * @tc.desc      cellTextOf(codeText="abc123", index=33) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0425 begin`);
      const actual: string = cellTextOf('abc123', 33);
      logInfo(`cellTextOf(codeText="abc123", index=33): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0425 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0426
     * @tc.name      VerifyCode_CellTextOf_0426
     * @tc.desc      cellTextOf(codeText="abc123", index=98.53) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0426 begin`);
      const actual: string = cellTextOf('abc123', 98.53);
      logInfo(`cellTextOf(codeText="abc123", index=98.53): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0426 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0427
     * @tc.name      VerifyCode_CellTextOf_0427
     * @tc.desc      cellTextOf(codeText="abc123", index=133) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0427 begin`);
      const actual: string = cellTextOf('abc123', 133);
      logInfo(`cellTextOf(codeText="abc123", index=133): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0427 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0428
     * @tc.name      VerifyCode_CellTextOf_0428
     * @tc.desc      cellTextOf(codeText="abc123", index=21.54) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0428 begin`);
      const actual: string = cellTextOf('abc123', 21.54);
      logInfo(`cellTextOf(codeText="abc123", index=21.54): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0428 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0429
     * @tc.name      VerifyCode_CellTextOf_0429
     * @tc.desc      cellTextOf(codeText="a", index=0) returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0429 begin`);
      const actual: string = cellTextOf('a', 0);
      logInfo(`cellTextOf(codeText="a", index=0): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}CellTextOf_0429 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0430
     * @tc.name      VerifyCode_CellTextOf_0430
     * @tc.desc      cellTextOf(codeText="a", index=1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0430 begin`);
      const actual: string = cellTextOf('a', 1);
      logInfo(`cellTextOf(codeText="a", index=1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0430 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0431
     * @tc.name      VerifyCode_CellTextOf_0431
     * @tc.desc      cellTextOf(codeText="a", index=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0431 begin`);
      const actual: string = cellTextOf('a', -1);
      logInfo(`cellTextOf(codeText="a", index=-1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0431 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0432
     * @tc.name      VerifyCode_CellTextOf_0432
     * @tc.desc      cellTextOf(codeText="a", index=2) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0432 begin`);
      const actual: string = cellTextOf('a', 2);
      logInfo(`cellTextOf(codeText="a", index=2): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0432 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0433
     * @tc.name      VerifyCode_CellTextOf_0433
     * @tc.desc      cellTextOf(codeText="a", index=5) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0433 begin`);
      const actual: string = cellTextOf('a', 5);
      logInfo(`cellTextOf(codeText="a", index=5): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0433 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0434
     * @tc.name      VerifyCode_CellTextOf_0434
     * @tc.desc      cellTextOf(codeText="a", index=10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0434 begin`);
      const actual: string = cellTextOf('a', 10);
      logInfo(`cellTextOf(codeText="a", index=10): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0434 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0435
     * @tc.name      VerifyCode_CellTextOf_0435
     * @tc.desc      cellTextOf(codeText="a", index=3) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0435 begin`);
      const actual: string = cellTextOf('a', 3);
      logInfo(`cellTextOf(codeText="a", index=3): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0435 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0436
     * @tc.name      VerifyCode_CellTextOf_0436
     * @tc.desc      cellTextOf(codeText="a", index=100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0436', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0436 begin`);
      const actual: string = cellTextOf('a', 100);
      logInfo(`cellTextOf(codeText="a", index=100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0436 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0437
     * @tc.name      VerifyCode_CellTextOf_0437
     * @tc.desc      cellTextOf(codeText="a", index=15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0437', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0437 begin`);
      const actual: string = cellTextOf('a', 15);
      logInfo(`cellTextOf(codeText="a", index=15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0437 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0438
     * @tc.name      VerifyCode_CellTextOf_0438
     * @tc.desc      cellTextOf(codeText="a", index=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0438', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0438 begin`);
      const actual: string = cellTextOf('a', 20);
      logInfo(`cellTextOf(codeText="a", index=20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0438 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0439
     * @tc.name      VerifyCode_CellTextOf_0439
     * @tc.desc      cellTextOf(codeText="a", index=25) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0439', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0439 begin`);
      const actual: string = cellTextOf('a', 25);
      logInfo(`cellTextOf(codeText="a", index=25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0439 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0440
     * @tc.name      VerifyCode_CellTextOf_0440
     * @tc.desc      cellTextOf(codeText="a", index=30) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0440', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0440 begin`);
      const actual: string = cellTextOf('a', 30);
      logInfo(`cellTextOf(codeText="a", index=30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0440 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0441
     * @tc.name      VerifyCode_CellTextOf_0441
     * @tc.desc      cellTextOf(codeText="a", index=35) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0441', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0441 begin`);
      const actual: string = cellTextOf('a', 35);
      logInfo(`cellTextOf(codeText="a", index=35): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0441 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0442
     * @tc.name      VerifyCode_CellTextOf_0442
     * @tc.desc      cellTextOf(codeText="a", index=40) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0442', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0442 begin`);
      const actual: string = cellTextOf('a', 40);
      logInfo(`cellTextOf(codeText="a", index=40): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0442 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0443
     * @tc.name      VerifyCode_CellTextOf_0443
     * @tc.desc      cellTextOf(codeText="a", index=45) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0443', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0443 begin`);
      const actual: string = cellTextOf('a', 45);
      logInfo(`cellTextOf(codeText="a", index=45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0443 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0444
     * @tc.name      VerifyCode_CellTextOf_0444
     * @tc.desc      cellTextOf(codeText="a", index=50) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0444', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0444 begin`);
      const actual: string = cellTextOf('a', 50);
      logInfo(`cellTextOf(codeText="a", index=50): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0444 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0445
     * @tc.name      VerifyCode_CellTextOf_0445
     * @tc.desc      cellTextOf(codeText="a", index=55) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0445', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0445 begin`);
      const actual: string = cellTextOf('a', 55);
      logInfo(`cellTextOf(codeText="a", index=55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0445 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0446
     * @tc.name      VerifyCode_CellTextOf_0446
     * @tc.desc      cellTextOf(codeText="a", index=60) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0446', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0446 begin`);
      const actual: string = cellTextOf('a', 60);
      logInfo(`cellTextOf(codeText="a", index=60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0446 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0447
     * @tc.name      VerifyCode_CellTextOf_0447
     * @tc.desc      cellTextOf(codeText="a", index=65) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0447', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0447 begin`);
      const actual: string = cellTextOf('a', 65);
      logInfo(`cellTextOf(codeText="a", index=65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0447 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0448
     * @tc.name      VerifyCode_CellTextOf_0448
     * @tc.desc      cellTextOf(codeText="a", index=70) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0448', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0448 begin`);
      const actual: string = cellTextOf('a', 70);
      logInfo(`cellTextOf(codeText="a", index=70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0448 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0449
     * @tc.name      VerifyCode_CellTextOf_0449
     * @tc.desc      cellTextOf(codeText="a", index=75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0449', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0449 begin`);
      const actual: string = cellTextOf('a', 75);
      logInfo(`cellTextOf(codeText="a", index=75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0449 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0450
     * @tc.name      VerifyCode_CellTextOf_0450
     * @tc.desc      cellTextOf(codeText="a", index=80) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0450', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0450 begin`);
      const actual: string = cellTextOf('a', 80);
      logInfo(`cellTextOf(codeText="a", index=80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0450 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0451
     * @tc.name      VerifyCode_CellTextOf_0451
     * @tc.desc      cellTextOf(codeText="a", index=85) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0451', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0451 begin`);
      const actual: string = cellTextOf('a', 85);
      logInfo(`cellTextOf(codeText="a", index=85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0451 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0452
     * @tc.name      VerifyCode_CellTextOf_0452
     * @tc.desc      cellTextOf(codeText="a", index=90) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0452', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0452 begin`);
      const actual: string = cellTextOf('a', 90);
      logInfo(`cellTextOf(codeText="a", index=90): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0452 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0453
     * @tc.name      VerifyCode_CellTextOf_0453
     * @tc.desc      cellTextOf(codeText="a", index=95) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0453', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0453 begin`);
      const actual: string = cellTextOf('a', 95);
      logInfo(`cellTextOf(codeText="a", index=95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0453 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0454
     * @tc.name      VerifyCode_CellTextOf_0454
     * @tc.desc      cellTextOf(codeText="a", index=105) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0454', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0454 begin`);
      const actual: string = cellTextOf('a', 105);
      logInfo(`cellTextOf(codeText="a", index=105): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0454 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0455
     * @tc.name      VerifyCode_CellTextOf_0455
     * @tc.desc      cellTextOf(codeText="a", index=110) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0455', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0455 begin`);
      const actual: string = cellTextOf('a', 110);
      logInfo(`cellTextOf(codeText="a", index=110): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0455 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0456
     * @tc.name      VerifyCode_CellTextOf_0456
     * @tc.desc      cellTextOf(codeText="a", index=115) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0456', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0456 begin`);
      const actual: string = cellTextOf('a', 115);
      logInfo(`cellTextOf(codeText="a", index=115): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0456 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0457
     * @tc.name      VerifyCode_CellTextOf_0457
     * @tc.desc      cellTextOf(codeText="a", index=120) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0457', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0457 begin`);
      const actual: string = cellTextOf('a', 120);
      logInfo(`cellTextOf(codeText="a", index=120): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0457 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0458
     * @tc.name      VerifyCode_CellTextOf_0458
     * @tc.desc      cellTextOf(codeText="a", index=125) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0458', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0458 begin`);
      const actual: string = cellTextOf('a', 125);
      logInfo(`cellTextOf(codeText="a", index=125): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0458 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0459
     * @tc.name      VerifyCode_CellTextOf_0459
     * @tc.desc      cellTextOf(codeText="a", index=130) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0459', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0459 begin`);
      const actual: string = cellTextOf('a', 130);
      logInfo(`cellTextOf(codeText="a", index=130): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0459 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0460
     * @tc.name      VerifyCode_CellTextOf_0460
     * @tc.desc      cellTextOf(codeText="a", index=135) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0460', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0460 begin`);
      const actual: string = cellTextOf('a', 135);
      logInfo(`cellTextOf(codeText="a", index=135): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0460 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0461
     * @tc.name      VerifyCode_CellTextOf_0461
     * @tc.desc      cellTextOf(codeText="a", index=140) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0461', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0461 begin`);
      const actual: string = cellTextOf('a', 140);
      logInfo(`cellTextOf(codeText="a", index=140): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0461 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0462
     * @tc.name      VerifyCode_CellTextOf_0462
     * @tc.desc      cellTextOf(codeText="a", index=145) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0462', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0462 begin`);
      const actual: string = cellTextOf('a', 145);
      logInfo(`cellTextOf(codeText="a", index=145): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0462 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0463
     * @tc.name      VerifyCode_CellTextOf_0463
     * @tc.desc      cellTextOf(codeText="a", index=150) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0463', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0463 begin`);
      const actual: string = cellTextOf('a', 150);
      logInfo(`cellTextOf(codeText="a", index=150): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0463 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0464
     * @tc.name      VerifyCode_CellTextOf_0464
     * @tc.desc      cellTextOf(codeText="a", index=155) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0464', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0464 begin`);
      const actual: string = cellTextOf('a', 155);
      logInfo(`cellTextOf(codeText="a", index=155): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0464 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0465
     * @tc.name      VerifyCode_CellTextOf_0465
     * @tc.desc      cellTextOf(codeText="a", index=160) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0465', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0465 begin`);
      const actual: string = cellTextOf('a', 160);
      logInfo(`cellTextOf(codeText="a", index=160): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0465 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0466
     * @tc.name      VerifyCode_CellTextOf_0466
     * @tc.desc      cellTextOf(codeText="a", index=165) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0466', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0466 begin`);
      const actual: string = cellTextOf('a', 165);
      logInfo(`cellTextOf(codeText="a", index=165): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0466 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0467
     * @tc.name      VerifyCode_CellTextOf_0467
     * @tc.desc      cellTextOf(codeText="a", index=170) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0467', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0467 begin`);
      const actual: string = cellTextOf('a', 170);
      logInfo(`cellTextOf(codeText="a", index=170): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0467 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0468
     * @tc.name      VerifyCode_CellTextOf_0468
     * @tc.desc      cellTextOf(codeText="a", index=175) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0468', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0468 begin`);
      const actual: string = cellTextOf('a', 175);
      logInfo(`cellTextOf(codeText="a", index=175): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0468 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0469
     * @tc.name      VerifyCode_CellTextOf_0469
     * @tc.desc      cellTextOf(codeText="a", index=180) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0469', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0469 begin`);
      const actual: string = cellTextOf('a', 180);
      logInfo(`cellTextOf(codeText="a", index=180): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0469 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0470
     * @tc.name      VerifyCode_CellTextOf_0470
     * @tc.desc      cellTextOf(codeText="a", index=185) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0470', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0470 begin`);
      const actual: string = cellTextOf('a', 185);
      logInfo(`cellTextOf(codeText="a", index=185): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0470 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0471
     * @tc.name      VerifyCode_CellTextOf_0471
     * @tc.desc      cellTextOf(codeText="a", index=190) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0471', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0471 begin`);
      const actual: string = cellTextOf('a', 190);
      logInfo(`cellTextOf(codeText="a", index=190): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0471 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0472
     * @tc.name      VerifyCode_CellTextOf_0472
     * @tc.desc      cellTextOf(codeText="a", index=195) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0472', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0472 begin`);
      const actual: string = cellTextOf('a', 195);
      logInfo(`cellTextOf(codeText="a", index=195): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0472 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0473
     * @tc.name      VerifyCode_CellTextOf_0473
     * @tc.desc      cellTextOf(codeText="a", index=200) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0473', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0473 begin`);
      const actual: string = cellTextOf('a', 200);
      logInfo(`cellTextOf(codeText="a", index=200): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0473 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0474
     * @tc.name      VerifyCode_CellTextOf_0474
     * @tc.desc      cellTextOf(codeText="a", index=29) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0474', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0474 begin`);
      const actual: string = cellTextOf('a', 29);
      logInfo(`cellTextOf(codeText="a", index=29): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0474 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0475
     * @tc.name      VerifyCode_CellTextOf_0475
     * @tc.desc      cellTextOf(codeText="a", index=37) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0475', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0475 begin`);
      const actual: string = cellTextOf('a', 37);
      logInfo(`cellTextOf(codeText="a", index=37): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0475 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0476
     * @tc.name      VerifyCode_CellTextOf_0476
     * @tc.desc      cellTextOf(codeText="a", index=-52) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0476', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0476 begin`);
      const actual: string = cellTextOf('a', -52);
      logInfo(`cellTextOf(codeText="a", index=-52): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0476 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0477
     * @tc.name      VerifyCode_CellTextOf_0477
     * @tc.desc      cellTextOf(codeText="a", index=6) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0477', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0477 begin`);
      const actual: string = cellTextOf('a', 6);
      logInfo(`cellTextOf(codeText="a", index=6): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0477 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0478
     * @tc.name      VerifyCode_CellTextOf_0478
     * @tc.desc      cellTextOf(codeText="a", index=186) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0478', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0478 begin`);
      const actual: string = cellTextOf('a', 186);
      logInfo(`cellTextOf(codeText="a", index=186): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0478 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0479
     * @tc.name      VerifyCode_CellTextOf_0479
     * @tc.desc      cellTextOf(codeText="a", index=46) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0479', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0479 begin`);
      const actual: string = cellTextOf('a', 46);
      logInfo(`cellTextOf(codeText="a", index=46): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0479 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0480
     * @tc.name      VerifyCode_CellTextOf_0480
     * @tc.desc      cellTextOf(codeText="a", index=11.81) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0480', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0480 begin`);
      const actual: string = cellTextOf('a', 11.81);
      logInfo(`cellTextOf(codeText="a", index=11.81): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0480 end`);
    });
  });
}
