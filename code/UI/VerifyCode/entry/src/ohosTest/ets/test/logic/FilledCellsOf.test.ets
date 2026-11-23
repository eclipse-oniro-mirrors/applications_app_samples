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
import { filledCellsOf } from '../model/VerifyCodeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_VerifyCode]';
const BUNDLE: string = 'VerifyCode_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for filledCellsOf (96 cases). */
export default function filledCellsOfTest(): void {
  describe('FilledCellsOfTest', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0001
     * @tc.name      VerifyCode_FilledCellsOf_0001
     * @tc.desc      filledCellsOf(codeText="") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VerifyCode_FilledCellsOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0001 begin`);
      const actual: number = filledCellsOf('');
      logInfo(`filledCellsOf(codeText=""): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}FilledCellsOf_0001 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0002
     * @tc.name      VerifyCode_FilledCellsOf_0002
     * @tc.desc      filledCellsOf(codeText="x") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VerifyCode_FilledCellsOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0002 begin`);
      const actual: number = filledCellsOf('x');
      logInfo(`filledCellsOf(codeText="x"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}FilledCellsOf_0002 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0003
     * @tc.name      VerifyCode_FilledCellsOf_0003
     * @tc.desc      filledCellsOf(codeText="123456") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0003 begin`);
      const actual: number = filledCellsOf('123456');
      logInfo(`filledCellsOf(codeText="123456"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0003 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0004
     * @tc.name      VerifyCode_FilledCellsOf_0004
     * @tc.desc      filledCellsOf(codeText="12345") returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0004 begin`);
      const actual: number = filledCellsOf('12345');
      logInfo(`filledCellsOf(codeText="12345"): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}FilledCellsOf_0004 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0005
     * @tc.name      VerifyCode_FilledCellsOf_0005
     * @tc.desc      filledCellsOf(codeText="abc") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0005 begin`);
      const actual: number = filledCellsOf('abc');
      logInfo(`filledCellsOf(codeText="abc"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}FilledCellsOf_0005 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0006
     * @tc.name      VerifyCode_FilledCellsOf_0006
     * @tc.desc      filledCellsOf(codeText="xx") returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0006 begin`);
      const actual: number = filledCellsOf('xx');
      logInfo(`filledCellsOf(codeText="xx"): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}FilledCellsOf_0006 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0007
     * @tc.name      VerifyCode_FilledCellsOf_0007
     * @tc.desc      filledCellsOf(codeText="xabc") returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_FilledCellsOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0007 begin`);
      const actual: number = filledCellsOf('xabc');
      logInfo(`filledCellsOf(codeText="xabc"): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}FilledCellsOf_0007 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0008
     * @tc.name      VerifyCode_FilledCellsOf_0008
     * @tc.desc      filledCellsOf(codeText="000000") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0008 begin`);
      const actual: number = filledCellsOf('000000');
      logInfo(`filledCellsOf(codeText="000000"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0008 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0009
     * @tc.name      VerifyCode_FilledCellsOf_0009
     * @tc.desc      filledCellsOf(codeText="1234567") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0009 begin`);
      const actual: number = filledCellsOf('1234567');
      logInfo(`filledCellsOf(codeText="1234567"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0009 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0010
     * @tc.name      VerifyCode_FilledCellsOf_0010
     * @tc.desc      filledCellsOf(codeText="abc123") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0010 begin`);
      const actual: number = filledCellsOf('abc123');
      logInfo(`filledCellsOf(codeText="abc123"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0010 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0011
     * @tc.name      VerifyCode_FilledCellsOf_0011
     * @tc.desc      filledCellsOf(codeText="a") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0011 begin`);
      const actual: number = filledCellsOf('a');
      logInfo(`filledCellsOf(codeText="a"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}FilledCellsOf_0011 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0012
     * @tc.name      VerifyCode_FilledCellsOf_0012
     * @tc.desc      filledCellsOf(codeText="Hello World") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0012 begin`);
      const actual: number = filledCellsOf('Hello World');
      logInfo(`filledCellsOf(codeText="Hello World"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0012 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0013
     * @tc.name      VerifyCode_FilledCellsOf_0013
     * @tc.desc      filledCellsOf(codeText=" ") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0013 begin`);
      const actual: number = filledCellsOf(' ');
      logInfo(`filledCellsOf(codeText=" "): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}FilledCellsOf_0013 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0014
     * @tc.name      VerifyCode_FilledCellsOf_0014
     * @tc.desc      filledCellsOf(codeText="123") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0014 begin`);
      const actual: number = filledCellsOf('123');
      logInfo(`filledCellsOf(codeText="123"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}FilledCellsOf_0014 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0015
     * @tc.name      VerifyCode_FilledCellsOf_0015
     * @tc.desc      filledCellsOf(codeText=" x ") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_FilledCellsOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0015 begin`);
      const actual: number = filledCellsOf(' x ');
      logInfo(`filledCellsOf(codeText=" x "): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}FilledCellsOf_0015 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0016
     * @tc.name      VerifyCode_FilledCellsOf_0016
     * @tc.desc      filledCellsOf(codeText="x_1") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0016 begin`);
      const actual: number = filledCellsOf('x_1');
      logInfo(`filledCellsOf(codeText="x_1"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}FilledCellsOf_0016 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0017
     * @tc.name      VerifyCode_FilledCellsOf_0017
     * @tc.desc      filledCellsOf(codeText=" 123456 ") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_FilledCellsOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0017 begin`);
      const actual: number = filledCellsOf(' 123456 ');
      logInfo(`filledCellsOf(codeText=" 123456 "): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0017 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0018
     * @tc.name      VerifyCode_FilledCellsOf_0018
     * @tc.desc      filledCellsOf(codeText="123456123456") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0018 begin`);
      const actual: number = filledCellsOf('123456123456');
      logInfo(`filledCellsOf(codeText="123456123456"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0018 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0019
     * @tc.name      VerifyCode_FilledCellsOf_0019
     * @tc.desc      filledCellsOf(codeText="123456_1") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0019 begin`);
      const actual: number = filledCellsOf('123456_1');
      logInfo(`filledCellsOf(codeText="123456_1"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0019 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0020
     * @tc.name      VerifyCode_FilledCellsOf_0020
     * @tc.desc      filledCellsOf(codeText="x123456") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_FilledCellsOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0020 begin`);
      const actual: number = filledCellsOf('x123456');
      logInfo(`filledCellsOf(codeText="x123456"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0020 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0021
     * @tc.name      VerifyCode_FilledCellsOf_0021
     * @tc.desc      filledCellsOf(codeText=" 000000 ") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_FilledCellsOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0021 begin`);
      const actual: number = filledCellsOf(' 000000 ');
      logInfo(`filledCellsOf(codeText=" 000000 "): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0021 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0022
     * @tc.name      VerifyCode_FilledCellsOf_0022
     * @tc.desc      filledCellsOf(codeText="000000000000") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0022 begin`);
      const actual: number = filledCellsOf('000000000000');
      logInfo(`filledCellsOf(codeText="000000000000"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0022 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0023
     * @tc.name      VerifyCode_FilledCellsOf_0023
     * @tc.desc      filledCellsOf(codeText="000000_1") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0023 begin`);
      const actual: number = filledCellsOf('000000_1');
      logInfo(`filledCellsOf(codeText="000000_1"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0023 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0024
     * @tc.name      VerifyCode_FilledCellsOf_0024
     * @tc.desc      filledCellsOf(codeText="x000000") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_FilledCellsOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0024 begin`);
      const actual: number = filledCellsOf('x000000');
      logInfo(`filledCellsOf(codeText="x000000"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0024 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0025
     * @tc.name      VerifyCode_FilledCellsOf_0025
     * @tc.desc      filledCellsOf(codeText=" 12345 ") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_FilledCellsOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0025 begin`);
      const actual: number = filledCellsOf(' 12345 ');
      logInfo(`filledCellsOf(codeText=" 12345 "): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0025 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0026
     * @tc.name      VerifyCode_FilledCellsOf_0026
     * @tc.desc      filledCellsOf(codeText="1234512345") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0026 begin`);
      const actual: number = filledCellsOf('1234512345');
      logInfo(`filledCellsOf(codeText="1234512345"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0026 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0027
     * @tc.name      VerifyCode_FilledCellsOf_0027
     * @tc.desc      filledCellsOf(codeText="12345_1") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0027 begin`);
      const actual: number = filledCellsOf('12345_1');
      logInfo(`filledCellsOf(codeText="12345_1"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0027 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0028
     * @tc.name      VerifyCode_FilledCellsOf_0028
     * @tc.desc      filledCellsOf(codeText="x12345") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_FilledCellsOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0028 begin`);
      const actual: number = filledCellsOf('x12345');
      logInfo(`filledCellsOf(codeText="x12345"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0028 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0029
     * @tc.name      VerifyCode_FilledCellsOf_0029
     * @tc.desc      filledCellsOf(codeText=" 1234567 ") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_FilledCellsOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0029 begin`);
      const actual: number = filledCellsOf(' 1234567 ');
      logInfo(`filledCellsOf(codeText=" 1234567 "): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0029 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0030
     * @tc.name      VerifyCode_FilledCellsOf_0030
     * @tc.desc      filledCellsOf(codeText="12345671234567") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0030 begin`);
      const actual: number = filledCellsOf('12345671234567');
      logInfo(`filledCellsOf(codeText="12345671234567"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0030 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0031
     * @tc.name      VerifyCode_FilledCellsOf_0031
     * @tc.desc      filledCellsOf(codeText="1234567_1") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0031 begin`);
      const actual: number = filledCellsOf('1234567_1');
      logInfo(`filledCellsOf(codeText="1234567_1"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0031 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0032
     * @tc.name      VerifyCode_FilledCellsOf_0032
     * @tc.desc      filledCellsOf(codeText="x1234567") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_FilledCellsOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0032 begin`);
      const actual: number = filledCellsOf('x1234567');
      logInfo(`filledCellsOf(codeText="x1234567"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0032 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0033
     * @tc.name      VerifyCode_FilledCellsOf_0033
     * @tc.desc      filledCellsOf(codeText=" abc123 ") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_FilledCellsOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0033 begin`);
      const actual: number = filledCellsOf(' abc123 ');
      logInfo(`filledCellsOf(codeText=" abc123 "): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0033 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0034
     * @tc.name      VerifyCode_FilledCellsOf_0034
     * @tc.desc      filledCellsOf(codeText="abc123abc123") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0034 begin`);
      const actual: number = filledCellsOf('abc123abc123');
      logInfo(`filledCellsOf(codeText="abc123abc123"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0034 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0035
     * @tc.name      VerifyCode_FilledCellsOf_0035
     * @tc.desc      filledCellsOf(codeText="abc123_1") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0035 begin`);
      const actual: number = filledCellsOf('abc123_1');
      logInfo(`filledCellsOf(codeText="abc123_1"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0035 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0036
     * @tc.name      VerifyCode_FilledCellsOf_0036
     * @tc.desc      filledCellsOf(codeText="xabc123") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_FilledCellsOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0036 begin`);
      const actual: number = filledCellsOf('xabc123');
      logInfo(`filledCellsOf(codeText="xabc123"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0036 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0037
     * @tc.name      VerifyCode_FilledCellsOf_0037
     * @tc.desc      filledCellsOf(codeText=" a ") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_FilledCellsOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0037 begin`);
      const actual: number = filledCellsOf(' a ');
      logInfo(`filledCellsOf(codeText=" a "): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}FilledCellsOf_0037 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0038
     * @tc.name      VerifyCode_FilledCellsOf_0038
     * @tc.desc      filledCellsOf(codeText="aa") returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0038 begin`);
      const actual: number = filledCellsOf('aa');
      logInfo(`filledCellsOf(codeText="aa"): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}FilledCellsOf_0038 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0039
     * @tc.name      VerifyCode_FilledCellsOf_0039
     * @tc.desc      filledCellsOf(codeText="a_1") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0039 begin`);
      const actual: number = filledCellsOf('a_1');
      logInfo(`filledCellsOf(codeText="a_1"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}FilledCellsOf_0039 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0040
     * @tc.name      VerifyCode_FilledCellsOf_0040
     * @tc.desc      filledCellsOf(codeText="xa") returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_FilledCellsOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0040 begin`);
      const actual: number = filledCellsOf('xa');
      logInfo(`filledCellsOf(codeText="xa"): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}FilledCellsOf_0040 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0041
     * @tc.name      VerifyCode_FilledCellsOf_0041
     * @tc.desc      filledCellsOf(codeText=" abc ") returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_FilledCellsOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0041 begin`);
      const actual: number = filledCellsOf(' abc ');
      logInfo(`filledCellsOf(codeText=" abc "): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}FilledCellsOf_0041 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0042
     * @tc.name      VerifyCode_FilledCellsOf_0042
     * @tc.desc      filledCellsOf(codeText="abcabc") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0042 begin`);
      const actual: number = filledCellsOf('abcabc');
      logInfo(`filledCellsOf(codeText="abcabc"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0042 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0043
     * @tc.name      VerifyCode_FilledCellsOf_0043
     * @tc.desc      filledCellsOf(codeText="abc_1") returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0043 begin`);
      const actual: number = filledCellsOf('abc_1');
      logInfo(`filledCellsOf(codeText="abc_1"): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}FilledCellsOf_0043 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0044
     * @tc.name      VerifyCode_FilledCellsOf_0044
     * @tc.desc      filledCellsOf(codeText=" Hello World ") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_FilledCellsOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0044 begin`);
      const actual: number = filledCellsOf(' Hello World ');
      logInfo(`filledCellsOf(codeText=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0044 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0045
     * @tc.name      VerifyCode_FilledCellsOf_0045
     * @tc.desc      filledCellsOf(codeText="Hello WorldHello World") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0045 begin`);
      const actual: number = filledCellsOf('Hello WorldHello World');
      logInfo(`filledCellsOf(codeText="Hello WorldHello ...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0045 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0046
     * @tc.name      VerifyCode_FilledCellsOf_0046
     * @tc.desc      filledCellsOf(codeText="Hello World_1") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0046 begin`);
      const actual: number = filledCellsOf('Hello World_1');
      logInfo(`filledCellsOf(codeText="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0046 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0047
     * @tc.name      VerifyCode_FilledCellsOf_0047
     * @tc.desc      filledCellsOf(codeText="xHello World") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_FilledCellsOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0047 begin`);
      const actual: number = filledCellsOf('xHello World');
      logInfo(`filledCellsOf(codeText="xHello World"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0047 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0048
     * @tc.name      VerifyCode_FilledCellsOf_0048
     * @tc.desc      filledCellsOf(codeText="   ") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_FilledCellsOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0048 begin`);
      const actual: number = filledCellsOf('   ');
      logInfo(`filledCellsOf(codeText="   "): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}FilledCellsOf_0048 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0049
     * @tc.name      VerifyCode_FilledCellsOf_0049
     * @tc.desc      filledCellsOf(codeText="  ") returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0049 begin`);
      const actual: number = filledCellsOf('  ');
      logInfo(`filledCellsOf(codeText="  "): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}FilledCellsOf_0049 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0050
     * @tc.name      VerifyCode_FilledCellsOf_0050
     * @tc.desc      filledCellsOf(codeText=" _1") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0050 begin`);
      const actual: number = filledCellsOf(' _1');
      logInfo(`filledCellsOf(codeText=" _1"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}FilledCellsOf_0050 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0051
     * @tc.name      VerifyCode_FilledCellsOf_0051
     * @tc.desc      filledCellsOf(codeText="x ") returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_FilledCellsOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0051 begin`);
      const actual: number = filledCellsOf('x ');
      logInfo(`filledCellsOf(codeText="x "): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}FilledCellsOf_0051 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0052
     * @tc.name      VerifyCode_FilledCellsOf_0052
     * @tc.desc      filledCellsOf(codeText=" 123 ") returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_FilledCellsOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0052 begin`);
      const actual: number = filledCellsOf(' 123 ');
      logInfo(`filledCellsOf(codeText=" 123 "): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}FilledCellsOf_0052 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0053
     * @tc.name      VerifyCode_FilledCellsOf_0053
     * @tc.desc      filledCellsOf(codeText="123123") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0053 begin`);
      const actual: number = filledCellsOf('123123');
      logInfo(`filledCellsOf(codeText="123123"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0053 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0054
     * @tc.name      VerifyCode_FilledCellsOf_0054
     * @tc.desc      filledCellsOf(codeText="123_1") returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0054 begin`);
      const actual: number = filledCellsOf('123_1');
      logInfo(`filledCellsOf(codeText="123_1"): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}FilledCellsOf_0054 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0055
     * @tc.name      VerifyCode_FilledCellsOf_0055
     * @tc.desc      filledCellsOf(codeText="x123") returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_FilledCellsOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0055 begin`);
      const actual: number = filledCellsOf('x123');
      logInfo(`filledCellsOf(codeText="x123"): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}FilledCellsOf_0055 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0056
     * @tc.name      VerifyCode_FilledCellsOf_0056
     * @tc.desc      filledCellsOf(codeText="HKYd0nXDk") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0056 begin`);
      const actual: number = filledCellsOf('HKYd0nXDk');
      logInfo(`filledCellsOf(codeText="HKYd0nXDk"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0056 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0057
     * @tc.name      VerifyCode_FilledCellsOf_0057
     * @tc.desc      filledCellsOf(codeText="GxZqEytV") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0057 begin`);
      const actual: number = filledCellsOf('GxZqEytV');
      logInfo(`filledCellsOf(codeText="GxZqEytV"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0057 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0058
     * @tc.name      VerifyCode_FilledCellsOf_0058
     * @tc.desc      filledCellsOf(codeText="4kHR32tfvxs") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0058 begin`);
      const actual: number = filledCellsOf('4kHR32tfvxs');
      logInfo(`filledCellsOf(codeText="4kHR32tfvxs"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0058 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0059
     * @tc.name      VerifyCode_FilledCellsOf_0059
     * @tc.desc      filledCellsOf(codeText="EAGVyVkiG") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0059 begin`);
      const actual: number = filledCellsOf('EAGVyVkiG');
      logInfo(`filledCellsOf(codeText="EAGVyVkiG"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0059 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0060
     * @tc.name      VerifyCode_FilledCellsOf_0060
     * @tc.desc      filledCellsOf(codeText="PGB8oih52AVF") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0060 begin`);
      const actual: number = filledCellsOf('PGB8oih52AVF');
      logInfo(`filledCellsOf(codeText="PGB8oih52AVF"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0060 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0061
     * @tc.name      VerifyCode_FilledCellsOf_0061
     * @tc.desc      filledCellsOf(codeText="J3OKc5hXTub") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0061 begin`);
      const actual: number = filledCellsOf('J3OKc5hXTub');
      logInfo(`filledCellsOf(codeText="J3OKc5hXTub"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0061 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0062
     * @tc.name      VerifyCode_FilledCellsOf_0062
     * @tc.desc      filledCellsOf(codeText="E3Nl") returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0062 begin`);
      const actual: number = filledCellsOf('E3Nl');
      logInfo(`filledCellsOf(codeText="E3Nl"): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}FilledCellsOf_0062 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0063
     * @tc.name      VerifyCode_FilledCellsOf_0063
     * @tc.desc      filledCellsOf(codeText="6") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0063 begin`);
      const actual: number = filledCellsOf('6');
      logInfo(`filledCellsOf(codeText="6"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}FilledCellsOf_0063 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0064
     * @tc.name      VerifyCode_FilledCellsOf_0064
     * @tc.desc      filledCellsOf(codeText="WkDKlIQ") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0064 begin`);
      const actual: number = filledCellsOf('WkDKlIQ');
      logInfo(`filledCellsOf(codeText="WkDKlIQ"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0064 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0065
     * @tc.name      VerifyCode_FilledCellsOf_0065
     * @tc.desc      filledCellsOf(codeText="W3OYxD") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0065 begin`);
      const actual: number = filledCellsOf('W3OYxD');
      logInfo(`filledCellsOf(codeText="W3OYxD"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0065 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0066
     * @tc.name      VerifyCode_FilledCellsOf_0066
     * @tc.desc      filledCellsOf(codeText="6pANHwY") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0066 begin`);
      const actual: number = filledCellsOf('6pANHwY');
      logInfo(`filledCellsOf(codeText="6pANHwY"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0066 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0067
     * @tc.name      VerifyCode_FilledCellsOf_0067
     * @tc.desc      filledCellsOf(codeText="lK8akMGu8Y") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0067 begin`);
      const actual: number = filledCellsOf('lK8akMGu8Y');
      logInfo(`filledCellsOf(codeText="lK8akMGu8Y"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0067 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0068
     * @tc.name      VerifyCode_FilledCellsOf_0068
     * @tc.desc      filledCellsOf(codeText="3VSXRiIq") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0068 begin`);
      const actual: number = filledCellsOf('3VSXRiIq');
      logInfo(`filledCellsOf(codeText="3VSXRiIq"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0068 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0069
     * @tc.name      VerifyCode_FilledCellsOf_0069
     * @tc.desc      filledCellsOf(codeText="oAii") returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0069 begin`);
      const actual: number = filledCellsOf('oAii');
      logInfo(`filledCellsOf(codeText="oAii"): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}FilledCellsOf_0069 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0070
     * @tc.name      VerifyCode_FilledCellsOf_0070
     * @tc.desc      filledCellsOf(codeText="F36c") returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0070 begin`);
      const actual: number = filledCellsOf('F36c');
      logInfo(`filledCellsOf(codeText="F36c"): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}FilledCellsOf_0070 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0071
     * @tc.name      VerifyCode_FilledCellsOf_0071
     * @tc.desc      filledCellsOf(codeText="phYw0TSK") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0071 begin`);
      const actual: number = filledCellsOf('phYw0TSK');
      logInfo(`filledCellsOf(codeText="phYw0TSK"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0071 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0072
     * @tc.name      VerifyCode_FilledCellsOf_0072
     * @tc.desc      filledCellsOf(codeText="79kePI") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0072 begin`);
      const actual: number = filledCellsOf('79kePI');
      logInfo(`filledCellsOf(codeText="79kePI"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0072 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0073
     * @tc.name      VerifyCode_FilledCellsOf_0073
     * @tc.desc      filledCellsOf(codeText="Qn") returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0073 begin`);
      const actual: number = filledCellsOf('Qn');
      logInfo(`filledCellsOf(codeText="Qn"): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}FilledCellsOf_0073 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0074
     * @tc.name      VerifyCode_FilledCellsOf_0074
     * @tc.desc      filledCellsOf(codeText="vK") returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0074 begin`);
      const actual: number = filledCellsOf('vK');
      logInfo(`filledCellsOf(codeText="vK"): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}FilledCellsOf_0074 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0075
     * @tc.name      VerifyCode_FilledCellsOf_0075
     * @tc.desc      filledCellsOf(codeText="IPfQKz") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0075 begin`);
      const actual: number = filledCellsOf('IPfQKz');
      logInfo(`filledCellsOf(codeText="IPfQKz"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0075 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0076
     * @tc.name      VerifyCode_FilledCellsOf_0076
     * @tc.desc      filledCellsOf(codeText="8TP2nf") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0076 begin`);
      const actual: number = filledCellsOf('8TP2nf');
      logInfo(`filledCellsOf(codeText="8TP2nf"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0076 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0077
     * @tc.name      VerifyCode_FilledCellsOf_0077
     * @tc.desc      filledCellsOf(codeText="cb8BFFH") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0077 begin`);
      const actual: number = filledCellsOf('cb8BFFH');
      logInfo(`filledCellsOf(codeText="cb8BFFH"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0077 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0078
     * @tc.name      VerifyCode_FilledCellsOf_0078
     * @tc.desc      filledCellsOf(codeText="caJQTLb78LUB") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0078 begin`);
      const actual: number = filledCellsOf('caJQTLb78LUB');
      logInfo(`filledCellsOf(codeText="caJQTLb78LUB"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0078 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0079
     * @tc.name      VerifyCode_FilledCellsOf_0079
     * @tc.desc      filledCellsOf(codeText="MKRlLS") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0079 begin`);
      const actual: number = filledCellsOf('MKRlLS');
      logInfo(`filledCellsOf(codeText="MKRlLS"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0079 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0080
     * @tc.name      VerifyCode_FilledCellsOf_0080
     * @tc.desc      filledCellsOf(codeText="tIvZ") returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0080 begin`);
      const actual: number = filledCellsOf('tIvZ');
      logInfo(`filledCellsOf(codeText="tIvZ"): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}FilledCellsOf_0080 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0081
     * @tc.name      VerifyCode_FilledCellsOf_0081
     * @tc.desc      filledCellsOf(codeText="re4SGOiXRaEI") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0081 begin`);
      const actual: number = filledCellsOf('re4SGOiXRaEI');
      logInfo(`filledCellsOf(codeText="re4SGOiXRaEI"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0081 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0082
     * @tc.name      VerifyCode_FilledCellsOf_0082
     * @tc.desc      filledCellsOf(codeText="RrGP3Pnsnf") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0082 begin`);
      const actual: number = filledCellsOf('RrGP3Pnsnf');
      logInfo(`filledCellsOf(codeText="RrGP3Pnsnf"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0082 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0083
     * @tc.name      VerifyCode_FilledCellsOf_0083
     * @tc.desc      filledCellsOf(codeText="bjFUoFaDY7") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0083 begin`);
      const actual: number = filledCellsOf('bjFUoFaDY7');
      logInfo(`filledCellsOf(codeText="bjFUoFaDY7"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0083 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0084
     * @tc.name      VerifyCode_FilledCellsOf_0084
     * @tc.desc      filledCellsOf(codeText="Cuk") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0084 begin`);
      const actual: number = filledCellsOf('Cuk');
      logInfo(`filledCellsOf(codeText="Cuk"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}FilledCellsOf_0084 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0085
     * @tc.name      VerifyCode_FilledCellsOf_0085
     * @tc.desc      filledCellsOf(codeText="jMk") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0085 begin`);
      const actual: number = filledCellsOf('jMk');
      logInfo(`filledCellsOf(codeText="jMk"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}FilledCellsOf_0085 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0086
     * @tc.name      VerifyCode_FilledCellsOf_0086
     * @tc.desc      filledCellsOf(codeText="P7hUZDT") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0086 begin`);
      const actual: number = filledCellsOf('P7hUZDT');
      logInfo(`filledCellsOf(codeText="P7hUZDT"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0086 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0087
     * @tc.name      VerifyCode_FilledCellsOf_0087
     * @tc.desc      filledCellsOf(codeText="ySh") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0087 begin`);
      const actual: number = filledCellsOf('ySh');
      logInfo(`filledCellsOf(codeText="ySh"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}FilledCellsOf_0087 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0088
     * @tc.name      VerifyCode_FilledCellsOf_0088
     * @tc.desc      filledCellsOf(codeText="bCVfR1Iz1hN") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0088 begin`);
      const actual: number = filledCellsOf('bCVfR1Iz1hN');
      logInfo(`filledCellsOf(codeText="bCVfR1Iz1hN"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0088 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0089
     * @tc.name      VerifyCode_FilledCellsOf_0089
     * @tc.desc      filledCellsOf(codeText="Pjdv7O") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0089 begin`);
      const actual: number = filledCellsOf('Pjdv7O');
      logInfo(`filledCellsOf(codeText="Pjdv7O"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0089 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0090
     * @tc.name      VerifyCode_FilledCellsOf_0090
     * @tc.desc      filledCellsOf(codeText="Mq") returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0090 begin`);
      const actual: number = filledCellsOf('Mq');
      logInfo(`filledCellsOf(codeText="Mq"): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}FilledCellsOf_0090 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0091
     * @tc.name      VerifyCode_FilledCellsOf_0091
     * @tc.desc      filledCellsOf(codeText="Ng9BN") returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0091 begin`);
      const actual: number = filledCellsOf('Ng9BN');
      logInfo(`filledCellsOf(codeText="Ng9BN"): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}FilledCellsOf_0091 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0092
     * @tc.name      VerifyCode_FilledCellsOf_0092
     * @tc.desc      filledCellsOf(codeText="ZB3G2l8l2qi") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0092 begin`);
      const actual: number = filledCellsOf('ZB3G2l8l2qi');
      logInfo(`filledCellsOf(codeText="ZB3G2l8l2qi"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0092 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0093
     * @tc.name      VerifyCode_FilledCellsOf_0093
     * @tc.desc      filledCellsOf(codeText="Tf5K") returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0093 begin`);
      const actual: number = filledCellsOf('Tf5K');
      logInfo(`filledCellsOf(codeText="Tf5K"): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}FilledCellsOf_0093 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0094
     * @tc.name      VerifyCode_FilledCellsOf_0094
     * @tc.desc      filledCellsOf(codeText="bN2nGTurQs") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0094 begin`);
      const actual: number = filledCellsOf('bN2nGTurQs');
      logInfo(`filledCellsOf(codeText="bN2nGTurQs"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0094 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0095
     * @tc.name      VerifyCode_FilledCellsOf_0095
     * @tc.desc      filledCellsOf(codeText="FA") returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0095 begin`);
      const actual: number = filledCellsOf('FA');
      logInfo(`filledCellsOf(codeText="FA"): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}FilledCellsOf_0095 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_FILLED_CELLS_OF_0096
     * @tc.name      VerifyCode_FilledCellsOf_0096
     * @tc.desc      filledCellsOf(codeText="5nWl6T16PF") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_FilledCellsOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FilledCellsOf_0096 begin`);
      const actual: number = filledCellsOf('5nWl6T16PF');
      logInfo(`filledCellsOf(codeText="5nWl6T16PF"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}FilledCellsOf_0096 end`);
    });
  });
}
