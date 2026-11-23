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
export default function cellTextOfTest(): void {
  describe('CellTextOfTest', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0001
     * @tc.name      VerifyCode_CellTextOf_0001
     * @tc.desc      cellTextOf(codeText="", index=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VerifyCode_CellTextOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CellTextOf_0001 begin`);
      const actual: string = cellTextOf('', 0);
      logInfo(`cellTextOf(codeText="", index=0): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0001 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0002
     * @tc.name      VerifyCode_CellTextOf_0002
     * @tc.desc      cellTextOf(codeText="x", index=0) returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VerifyCode_CellTextOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CellTextOf_0002 begin`);
      const actual: string = cellTextOf('x', 0);
      logInfo(`cellTextOf(codeText="x", index=0): actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}CellTextOf_0002 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0003
     * @tc.name      VerifyCode_CellTextOf_0003
     * @tc.desc      cellTextOf(codeText="123456", index=0) returns "1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0003 begin`);
      const actual: string = cellTextOf('123456', 0);
      logInfo(`cellTextOf(codeText="123456", index=0): actual=${actual}`);
      expect(actual).assertEqual('1');
      logInfo(`${BUNDLE}CellTextOf_0003 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0004
     * @tc.name      VerifyCode_CellTextOf_0004
     * @tc.desc      cellTextOf(codeText="123456", index=1) returns "2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0004 begin`);
      const actual: string = cellTextOf('123456', 1);
      logInfo(`cellTextOf(codeText="123456", index=1): actual=${actual}`);
      expect(actual).assertEqual('2');
      logInfo(`${BUNDLE}CellTextOf_0004 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0005
     * @tc.name      VerifyCode_CellTextOf_0005
     * @tc.desc      cellTextOf(codeText="123456", index=2) returns "3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0005 begin`);
      const actual: string = cellTextOf('123456', 2);
      logInfo(`cellTextOf(codeText="123456", index=2): actual=${actual}`);
      expect(actual).assertEqual('3');
      logInfo(`${BUNDLE}CellTextOf_0005 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0006
     * @tc.name      VerifyCode_CellTextOf_0006
     * @tc.desc      cellTextOf(codeText="123456", index=5) returns "6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0006 begin`);
      const actual: string = cellTextOf('123456', 5);
      logInfo(`cellTextOf(codeText="123456", index=5): actual=${actual}`);
      expect(actual).assertEqual('6');
      logInfo(`${BUNDLE}CellTextOf_0006 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0007
     * @tc.name      VerifyCode_CellTextOf_0007
     * @tc.desc      cellTextOf(codeText="123456", index=3) returns "4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0007 begin`);
      const actual: string = cellTextOf('123456', 3);
      logInfo(`cellTextOf(codeText="123456", index=3): actual=${actual}`);
      expect(actual).assertEqual('4');
      logInfo(`${BUNDLE}CellTextOf_0007 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0008
     * @tc.name      VerifyCode_CellTextOf_0008
     * @tc.desc      cellTextOf(codeText="000000", index=0) returns "0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0008 begin`);
      const actual: string = cellTextOf('000000', 0);
      logInfo(`cellTextOf(codeText="000000", index=0): actual=${actual}`);
      expect(actual).assertEqual('0');
      logInfo(`${BUNDLE}CellTextOf_0008 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0009
     * @tc.name      VerifyCode_CellTextOf_0009
     * @tc.desc      cellTextOf(codeText="1234567", index=6) returns "7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0009 begin`);
      const actual: string = cellTextOf('1234567', 6);
      logInfo(`cellTextOf(codeText="1234567", index=6): actual=${actual}`);
      expect(actual).assertEqual('7');
      logInfo(`${BUNDLE}CellTextOf_0009 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0010
     * @tc.name      VerifyCode_CellTextOf_0010
     * @tc.desc      cellTextOf(codeText="abc123", index=0) returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0010 begin`);
      const actual: string = cellTextOf('abc123', 0);
      logInfo(`cellTextOf(codeText="abc123", index=0): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}CellTextOf_0010 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0011
     * @tc.name      VerifyCode_CellTextOf_0011
     * @tc.desc      cellTextOf(codeText="abc123", index=1) returns "b"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0011 begin`);
      const actual: string = cellTextOf('abc123', 1);
      logInfo(`cellTextOf(codeText="abc123", index=1): actual=${actual}`);
      expect(actual).assertEqual('b');
      logInfo(`${BUNDLE}CellTextOf_0011 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0012
     * @tc.name      VerifyCode_CellTextOf_0012
     * @tc.desc      cellTextOf(codeText="abc123", index=2) returns "c"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0012 begin`);
      const actual: string = cellTextOf('abc123', 2);
      logInfo(`cellTextOf(codeText="abc123", index=2): actual=${actual}`);
      expect(actual).assertEqual('c');
      logInfo(`${BUNDLE}CellTextOf_0012 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0013
     * @tc.name      VerifyCode_CellTextOf_0013
     * @tc.desc      cellTextOf(codeText="Hello World", index=0) returns "H"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0013 begin`);
      const actual: string = cellTextOf('Hello World', 0);
      logInfo(`cellTextOf(codeText="Hello World", index=0): actual=${actual}`);
      expect(actual).assertEqual('H');
      logInfo(`${BUNDLE}CellTextOf_0013 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0014
     * @tc.name      VerifyCode_CellTextOf_0014
     * @tc.desc      cellTextOf(codeText="Hello World", index=1) returns "e"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0014 begin`);
      const actual: string = cellTextOf('Hello World', 1);
      logInfo(`cellTextOf(codeText="Hello World", index=1): actual=${actual}`);
      expect(actual).assertEqual('e');
      logInfo(`${BUNDLE}CellTextOf_0014 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0015
     * @tc.name      VerifyCode_CellTextOf_0015
     * @tc.desc      cellTextOf(codeText="Hello World", index=2) returns "l"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0015 begin`);
      const actual: string = cellTextOf('Hello World', 2);
      logInfo(`cellTextOf(codeText="Hello World", index=2): actual=${actual}`);
      expect(actual).assertEqual('l');
      logInfo(`${BUNDLE}CellTextOf_0015 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0016
     * @tc.name      VerifyCode_CellTextOf_0016
     * @tc.desc      cellTextOf(codeText="Hello World", index=5) returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0016 begin`);
      const actual: string = cellTextOf('Hello World', 5);
      logInfo(`cellTextOf(codeText="Hello World", index=5): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}CellTextOf_0016 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0017
     * @tc.name      VerifyCode_CellTextOf_0017
     * @tc.desc      cellTextOf(codeText="Hello World", index=10) returns "d"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0017 begin`);
      const actual: string = cellTextOf('Hello World', 10);
      logInfo(`cellTextOf(codeText="Hello World", index=10): actual=${actual}`);
      expect(actual).assertEqual('d');
      logInfo(`${BUNDLE}CellTextOf_0017 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0018
     * @tc.name      VerifyCode_CellTextOf_0018
     * @tc.desc      cellTextOf(codeText="Hello World", index=6) returns "W"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0018 begin`);
      const actual: string = cellTextOf('Hello World', 6);
      logInfo(`cellTextOf(codeText="Hello World", index=6): actual=${actual}`);
      expect(actual).assertEqual('W');
      logInfo(`${BUNDLE}CellTextOf_0018 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0019
     * @tc.name      VerifyCode_CellTextOf_0019
     * @tc.desc      cellTextOf(codeText="x_1", index=1) returns "_"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_CellTextOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CellTextOf_0019 begin`);
      const actual: string = cellTextOf('x_1', 1);
      logInfo(`cellTextOf(codeText="x_1", index=1): actual=${actual}`);
      expect(actual).assertEqual('_');
      logInfo(`${BUNDLE}CellTextOf_0019 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0020
     * @tc.name      VerifyCode_CellTextOf_0020
     * @tc.desc      cellTextOf(codeText=" 123456 ", index=5) returns "5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0020 begin`);
      const actual: string = cellTextOf(' 123456 ', 5);
      logInfo(`cellTextOf(codeText=" 123456 ", index=5): actual=${actual}`);
      expect(actual).assertEqual('5');
      logInfo(`${BUNDLE}CellTextOf_0020 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0021
     * @tc.name      VerifyCode_CellTextOf_0021
     * @tc.desc      cellTextOf(codeText="", index=1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0021 begin`);
      const actual: string = cellTextOf('', 1);
      logInfo(`cellTextOf(codeText="", index=1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0021 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0022
     * @tc.name      VerifyCode_CellTextOf_0022
     * @tc.desc      cellTextOf(codeText="", index=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0022 begin`);
      const actual: string = cellTextOf('', -1);
      logInfo(`cellTextOf(codeText="", index=-1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0022 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0023
     * @tc.name      VerifyCode_CellTextOf_0023
     * @tc.desc      cellTextOf(codeText="", index=2) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0023 begin`);
      const actual: string = cellTextOf('', 2);
      logInfo(`cellTextOf(codeText="", index=2): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0023 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0024
     * @tc.name      VerifyCode_CellTextOf_0024
     * @tc.desc      cellTextOf(codeText="", index=5) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0024 begin`);
      const actual: string = cellTextOf('', 5);
      logInfo(`cellTextOf(codeText="", index=5): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0024 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0025
     * @tc.name      VerifyCode_CellTextOf_0025
     * @tc.desc      cellTextOf(codeText="", index=10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0025 begin`);
      const actual: string = cellTextOf('', 10);
      logInfo(`cellTextOf(codeText="", index=10): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0025 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0026
     * @tc.name      VerifyCode_CellTextOf_0026
     * @tc.desc      cellTextOf(codeText="", index=3) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0026 begin`);
      const actual: string = cellTextOf('', 3);
      logInfo(`cellTextOf(codeText="", index=3): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0026 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0027
     * @tc.name      VerifyCode_CellTextOf_0027
     * @tc.desc      cellTextOf(codeText="", index=100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0027 begin`);
      const actual: string = cellTextOf('', 100);
      logInfo(`cellTextOf(codeText="", index=100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0027 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0028
     * @tc.name      VerifyCode_CellTextOf_0028
     * @tc.desc      cellTextOf(codeText="", index=15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0028 begin`);
      const actual: string = cellTextOf('', 15);
      logInfo(`cellTextOf(codeText="", index=15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0028 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0029
     * @tc.name      VerifyCode_CellTextOf_0029
     * @tc.desc      cellTextOf(codeText="", index=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0029 begin`);
      const actual: string = cellTextOf('', 20);
      logInfo(`cellTextOf(codeText="", index=20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0029 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0030
     * @tc.name      VerifyCode_CellTextOf_0030
     * @tc.desc      cellTextOf(codeText="", index=25) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0030 begin`);
      const actual: string = cellTextOf('', 25);
      logInfo(`cellTextOf(codeText="", index=25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0030 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0031
     * @tc.name      VerifyCode_CellTextOf_0031
     * @tc.desc      cellTextOf(codeText="", index=30) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0031 begin`);
      const actual: string = cellTextOf('', 30);
      logInfo(`cellTextOf(codeText="", index=30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0031 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0032
     * @tc.name      VerifyCode_CellTextOf_0032
     * @tc.desc      cellTextOf(codeText="", index=35) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0032 begin`);
      const actual: string = cellTextOf('', 35);
      logInfo(`cellTextOf(codeText="", index=35): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0032 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0033
     * @tc.name      VerifyCode_CellTextOf_0033
     * @tc.desc      cellTextOf(codeText="", index=40) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0033 begin`);
      const actual: string = cellTextOf('', 40);
      logInfo(`cellTextOf(codeText="", index=40): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0033 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0034
     * @tc.name      VerifyCode_CellTextOf_0034
     * @tc.desc      cellTextOf(codeText="", index=45) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0034 begin`);
      const actual: string = cellTextOf('', 45);
      logInfo(`cellTextOf(codeText="", index=45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0034 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0035
     * @tc.name      VerifyCode_CellTextOf_0035
     * @tc.desc      cellTextOf(codeText="", index=50) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0035 begin`);
      const actual: string = cellTextOf('', 50);
      logInfo(`cellTextOf(codeText="", index=50): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0035 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0036
     * @tc.name      VerifyCode_CellTextOf_0036
     * @tc.desc      cellTextOf(codeText="", index=55) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0036 begin`);
      const actual: string = cellTextOf('', 55);
      logInfo(`cellTextOf(codeText="", index=55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0036 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0037
     * @tc.name      VerifyCode_CellTextOf_0037
     * @tc.desc      cellTextOf(codeText="", index=60) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0037 begin`);
      const actual: string = cellTextOf('', 60);
      logInfo(`cellTextOf(codeText="", index=60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0037 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0038
     * @tc.name      VerifyCode_CellTextOf_0038
     * @tc.desc      cellTextOf(codeText="", index=65) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0038 begin`);
      const actual: string = cellTextOf('', 65);
      logInfo(`cellTextOf(codeText="", index=65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0038 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0039
     * @tc.name      VerifyCode_CellTextOf_0039
     * @tc.desc      cellTextOf(codeText="", index=70) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0039 begin`);
      const actual: string = cellTextOf('', 70);
      logInfo(`cellTextOf(codeText="", index=70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0039 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0040
     * @tc.name      VerifyCode_CellTextOf_0040
     * @tc.desc      cellTextOf(codeText="", index=75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0040 begin`);
      const actual: string = cellTextOf('', 75);
      logInfo(`cellTextOf(codeText="", index=75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0040 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0041
     * @tc.name      VerifyCode_CellTextOf_0041
     * @tc.desc      cellTextOf(codeText="", index=80) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0041 begin`);
      const actual: string = cellTextOf('', 80);
      logInfo(`cellTextOf(codeText="", index=80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0041 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0042
     * @tc.name      VerifyCode_CellTextOf_0042
     * @tc.desc      cellTextOf(codeText="", index=85) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0042 begin`);
      const actual: string = cellTextOf('', 85);
      logInfo(`cellTextOf(codeText="", index=85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0042 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0043
     * @tc.name      VerifyCode_CellTextOf_0043
     * @tc.desc      cellTextOf(codeText="", index=90) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0043 begin`);
      const actual: string = cellTextOf('', 90);
      logInfo(`cellTextOf(codeText="", index=90): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0043 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0044
     * @tc.name      VerifyCode_CellTextOf_0044
     * @tc.desc      cellTextOf(codeText="", index=95) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0044 begin`);
      const actual: string = cellTextOf('', 95);
      logInfo(`cellTextOf(codeText="", index=95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0044 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0045
     * @tc.name      VerifyCode_CellTextOf_0045
     * @tc.desc      cellTextOf(codeText="", index=105) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0045 begin`);
      const actual: string = cellTextOf('', 105);
      logInfo(`cellTextOf(codeText="", index=105): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0045 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0046
     * @tc.name      VerifyCode_CellTextOf_0046
     * @tc.desc      cellTextOf(codeText="", index=110) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0046 begin`);
      const actual: string = cellTextOf('', 110);
      logInfo(`cellTextOf(codeText="", index=110): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0046 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0047
     * @tc.name      VerifyCode_CellTextOf_0047
     * @tc.desc      cellTextOf(codeText="", index=115) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0047 begin`);
      const actual: string = cellTextOf('', 115);
      logInfo(`cellTextOf(codeText="", index=115): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0047 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0048
     * @tc.name      VerifyCode_CellTextOf_0048
     * @tc.desc      cellTextOf(codeText="", index=120) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0048 begin`);
      const actual: string = cellTextOf('', 120);
      logInfo(`cellTextOf(codeText="", index=120): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0048 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0049
     * @tc.name      VerifyCode_CellTextOf_0049
     * @tc.desc      cellTextOf(codeText="", index=125) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0049 begin`);
      const actual: string = cellTextOf('', 125);
      logInfo(`cellTextOf(codeText="", index=125): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0049 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0050
     * @tc.name      VerifyCode_CellTextOf_0050
     * @tc.desc      cellTextOf(codeText="", index=130) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0050 begin`);
      const actual: string = cellTextOf('', 130);
      logInfo(`cellTextOf(codeText="", index=130): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0050 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0051
     * @tc.name      VerifyCode_CellTextOf_0051
     * @tc.desc      cellTextOf(codeText="", index=135) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0051 begin`);
      const actual: string = cellTextOf('', 135);
      logInfo(`cellTextOf(codeText="", index=135): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0051 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0052
     * @tc.name      VerifyCode_CellTextOf_0052
     * @tc.desc      cellTextOf(codeText="", index=140) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0052 begin`);
      const actual: string = cellTextOf('', 140);
      logInfo(`cellTextOf(codeText="", index=140): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0052 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0053
     * @tc.name      VerifyCode_CellTextOf_0053
     * @tc.desc      cellTextOf(codeText="", index=145) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0053 begin`);
      const actual: string = cellTextOf('', 145);
      logInfo(`cellTextOf(codeText="", index=145): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0053 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0054
     * @tc.name      VerifyCode_CellTextOf_0054
     * @tc.desc      cellTextOf(codeText="", index=150) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0054 begin`);
      const actual: string = cellTextOf('', 150);
      logInfo(`cellTextOf(codeText="", index=150): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0054 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0055
     * @tc.name      VerifyCode_CellTextOf_0055
     * @tc.desc      cellTextOf(codeText="", index=155) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0055 begin`);
      const actual: string = cellTextOf('', 155);
      logInfo(`cellTextOf(codeText="", index=155): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0055 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0056
     * @tc.name      VerifyCode_CellTextOf_0056
     * @tc.desc      cellTextOf(codeText="", index=160) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0056 begin`);
      const actual: string = cellTextOf('', 160);
      logInfo(`cellTextOf(codeText="", index=160): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0056 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0057
     * @tc.name      VerifyCode_CellTextOf_0057
     * @tc.desc      cellTextOf(codeText="", index=165) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0057 begin`);
      const actual: string = cellTextOf('', 165);
      logInfo(`cellTextOf(codeText="", index=165): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0057 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0058
     * @tc.name      VerifyCode_CellTextOf_0058
     * @tc.desc      cellTextOf(codeText="", index=170) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0058 begin`);
      const actual: string = cellTextOf('', 170);
      logInfo(`cellTextOf(codeText="", index=170): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0058 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0059
     * @tc.name      VerifyCode_CellTextOf_0059
     * @tc.desc      cellTextOf(codeText="", index=175) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0059 begin`);
      const actual: string = cellTextOf('', 175);
      logInfo(`cellTextOf(codeText="", index=175): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0059 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0060
     * @tc.name      VerifyCode_CellTextOf_0060
     * @tc.desc      cellTextOf(codeText="", index=180) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0060 begin`);
      const actual: string = cellTextOf('', 180);
      logInfo(`cellTextOf(codeText="", index=180): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0060 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0061
     * @tc.name      VerifyCode_CellTextOf_0061
     * @tc.desc      cellTextOf(codeText="", index=185) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0061 begin`);
      const actual: string = cellTextOf('', 185);
      logInfo(`cellTextOf(codeText="", index=185): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0061 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0062
     * @tc.name      VerifyCode_CellTextOf_0062
     * @tc.desc      cellTextOf(codeText="", index=190) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0062 begin`);
      const actual: string = cellTextOf('', 190);
      logInfo(`cellTextOf(codeText="", index=190): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0062 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0063
     * @tc.name      VerifyCode_CellTextOf_0063
     * @tc.desc      cellTextOf(codeText="", index=195) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0063 begin`);
      const actual: string = cellTextOf('', 195);
      logInfo(`cellTextOf(codeText="", index=195): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0063 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0064
     * @tc.name      VerifyCode_CellTextOf_0064
     * @tc.desc      cellTextOf(codeText="", index=200) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0064 begin`);
      const actual: string = cellTextOf('', 200);
      logInfo(`cellTextOf(codeText="", index=200): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0064 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0065
     * @tc.name      VerifyCode_CellTextOf_0065
     * @tc.desc      cellTextOf(codeText="", index=29) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0065 begin`);
      const actual: string = cellTextOf('', 29);
      logInfo(`cellTextOf(codeText="", index=29): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0065 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0066
     * @tc.name      VerifyCode_CellTextOf_0066
     * @tc.desc      cellTextOf(codeText="", index=37) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0066 begin`);
      const actual: string = cellTextOf('', 37);
      logInfo(`cellTextOf(codeText="", index=37): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0066 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0067
     * @tc.name      VerifyCode_CellTextOf_0067
     * @tc.desc      cellTextOf(codeText="", index=-52) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0067 begin`);
      const actual: string = cellTextOf('', -52);
      logInfo(`cellTextOf(codeText="", index=-52): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0067 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0068
     * @tc.name      VerifyCode_CellTextOf_0068
     * @tc.desc      cellTextOf(codeText="", index=6) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0068 begin`);
      const actual: string = cellTextOf('', 6);
      logInfo(`cellTextOf(codeText="", index=6): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0068 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0069
     * @tc.name      VerifyCode_CellTextOf_0069
     * @tc.desc      cellTextOf(codeText="", index=186) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0069 begin`);
      const actual: string = cellTextOf('', 186);
      logInfo(`cellTextOf(codeText="", index=186): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0069 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0070
     * @tc.name      VerifyCode_CellTextOf_0070
     * @tc.desc      cellTextOf(codeText="", index=46) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0070 begin`);
      const actual: string = cellTextOf('', 46);
      logInfo(`cellTextOf(codeText="", index=46): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0070 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0071
     * @tc.name      VerifyCode_CellTextOf_0071
     * @tc.desc      cellTextOf(codeText="", index=11.81) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0071 begin`);
      const actual: string = cellTextOf('', 11.81);
      logInfo(`cellTextOf(codeText="", index=11.81): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0071 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0072
     * @tc.name      VerifyCode_CellTextOf_0072
     * @tc.desc      cellTextOf(codeText="", index=168) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0072 begin`);
      const actual: string = cellTextOf('', 168);
      logInfo(`cellTextOf(codeText="", index=168): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0072 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0073
     * @tc.name      VerifyCode_CellTextOf_0073
     * @tc.desc      cellTextOf(codeText="", index=31.79) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0073 begin`);
      const actual: string = cellTextOf('', 31.79);
      logInfo(`cellTextOf(codeText="", index=31.79): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0073 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0074
     * @tc.name      VerifyCode_CellTextOf_0074
     * @tc.desc      cellTextOf(codeText="", index=-47) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0074 begin`);
      const actual: string = cellTextOf('', -47);
      logInfo(`cellTextOf(codeText="", index=-47): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0074 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0075
     * @tc.name      VerifyCode_CellTextOf_0075
     * @tc.desc      cellTextOf(codeText="", index=77.89) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0075 begin`);
      const actual: string = cellTextOf('', 77.89);
      logInfo(`cellTextOf(codeText="", index=77.89): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0075 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0076
     * @tc.name      VerifyCode_CellTextOf_0076
     * @tc.desc      cellTextOf(codeText="", index=33) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0076 begin`);
      const actual: string = cellTextOf('', 33);
      logInfo(`cellTextOf(codeText="", index=33): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0076 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0077
     * @tc.name      VerifyCode_CellTextOf_0077
     * @tc.desc      cellTextOf(codeText="", index=98.53) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0077 begin`);
      const actual: string = cellTextOf('', 98.53);
      logInfo(`cellTextOf(codeText="", index=98.53): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0077 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0078
     * @tc.name      VerifyCode_CellTextOf_0078
     * @tc.desc      cellTextOf(codeText="", index=133) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0078 begin`);
      const actual: string = cellTextOf('', 133);
      logInfo(`cellTextOf(codeText="", index=133): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0078 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0079
     * @tc.name      VerifyCode_CellTextOf_0079
     * @tc.desc      cellTextOf(codeText="", index=21.54) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_CellTextOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CellTextOf_0079 begin`);
      const actual: string = cellTextOf('', 21.54);
      logInfo(`cellTextOf(codeText="", index=21.54): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0079 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0080
     * @tc.name      VerifyCode_CellTextOf_0080
     * @tc.desc      cellTextOf(codeText="x", index=1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0080 begin`);
      const actual: string = cellTextOf('x', 1);
      logInfo(`cellTextOf(codeText="x", index=1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0080 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0081
     * @tc.name      VerifyCode_CellTextOf_0081
     * @tc.desc      cellTextOf(codeText="x", index=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0081 begin`);
      const actual: string = cellTextOf('x', -1);
      logInfo(`cellTextOf(codeText="x", index=-1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0081 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0082
     * @tc.name      VerifyCode_CellTextOf_0082
     * @tc.desc      cellTextOf(codeText="x", index=2) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0082 begin`);
      const actual: string = cellTextOf('x', 2);
      logInfo(`cellTextOf(codeText="x", index=2): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0082 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0083
     * @tc.name      VerifyCode_CellTextOf_0083
     * @tc.desc      cellTextOf(codeText="x", index=5) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0083 begin`);
      const actual: string = cellTextOf('x', 5);
      logInfo(`cellTextOf(codeText="x", index=5): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0083 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0084
     * @tc.name      VerifyCode_CellTextOf_0084
     * @tc.desc      cellTextOf(codeText="x", index=10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0084 begin`);
      const actual: string = cellTextOf('x', 10);
      logInfo(`cellTextOf(codeText="x", index=10): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0084 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0085
     * @tc.name      VerifyCode_CellTextOf_0085
     * @tc.desc      cellTextOf(codeText="x", index=3) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0085 begin`);
      const actual: string = cellTextOf('x', 3);
      logInfo(`cellTextOf(codeText="x", index=3): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0085 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0086
     * @tc.name      VerifyCode_CellTextOf_0086
     * @tc.desc      cellTextOf(codeText="x", index=100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0086 begin`);
      const actual: string = cellTextOf('x', 100);
      logInfo(`cellTextOf(codeText="x", index=100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0086 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0087
     * @tc.name      VerifyCode_CellTextOf_0087
     * @tc.desc      cellTextOf(codeText="x", index=15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0087 begin`);
      const actual: string = cellTextOf('x', 15);
      logInfo(`cellTextOf(codeText="x", index=15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0087 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0088
     * @tc.name      VerifyCode_CellTextOf_0088
     * @tc.desc      cellTextOf(codeText="x", index=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0088 begin`);
      const actual: string = cellTextOf('x', 20);
      logInfo(`cellTextOf(codeText="x", index=20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0088 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0089
     * @tc.name      VerifyCode_CellTextOf_0089
     * @tc.desc      cellTextOf(codeText="x", index=25) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0089 begin`);
      const actual: string = cellTextOf('x', 25);
      logInfo(`cellTextOf(codeText="x", index=25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0089 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0090
     * @tc.name      VerifyCode_CellTextOf_0090
     * @tc.desc      cellTextOf(codeText="x", index=30) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0090 begin`);
      const actual: string = cellTextOf('x', 30);
      logInfo(`cellTextOf(codeText="x", index=30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0090 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0091
     * @tc.name      VerifyCode_CellTextOf_0091
     * @tc.desc      cellTextOf(codeText="x", index=35) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0091 begin`);
      const actual: string = cellTextOf('x', 35);
      logInfo(`cellTextOf(codeText="x", index=35): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0091 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0092
     * @tc.name      VerifyCode_CellTextOf_0092
     * @tc.desc      cellTextOf(codeText="x", index=40) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0092 begin`);
      const actual: string = cellTextOf('x', 40);
      logInfo(`cellTextOf(codeText="x", index=40): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0092 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0093
     * @tc.name      VerifyCode_CellTextOf_0093
     * @tc.desc      cellTextOf(codeText="x", index=45) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0093 begin`);
      const actual: string = cellTextOf('x', 45);
      logInfo(`cellTextOf(codeText="x", index=45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0093 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0094
     * @tc.name      VerifyCode_CellTextOf_0094
     * @tc.desc      cellTextOf(codeText="x", index=50) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0094 begin`);
      const actual: string = cellTextOf('x', 50);
      logInfo(`cellTextOf(codeText="x", index=50): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0094 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0095
     * @tc.name      VerifyCode_CellTextOf_0095
     * @tc.desc      cellTextOf(codeText="x", index=55) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0095 begin`);
      const actual: string = cellTextOf('x', 55);
      logInfo(`cellTextOf(codeText="x", index=55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0095 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_CELL_TEXT_OF_0096
     * @tc.name      VerifyCode_CellTextOf_0096
     * @tc.desc      cellTextOf(codeText="x", index=60) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_CellTextOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CellTextOf_0096 begin`);
      const actual: string = cellTextOf('x', 60);
      logInfo(`cellTextOf(codeText="x", index=60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CellTextOf_0096 end`);
    });
  });
}
