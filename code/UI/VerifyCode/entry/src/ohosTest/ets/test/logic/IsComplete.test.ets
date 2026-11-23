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
import { isComplete } from '../model/VerifyCodeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_VerifyCode]';
const BUNDLE: string = 'VerifyCode_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for isComplete (50 cases). */
export default function isCompleteTest(): void {
  describe('IsCompleteTest', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0001
     * @tc.name      VerifyCode_IsComplete_0001
     * @tc.desc      isComplete(codeText="123456") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VerifyCode_IsComplete_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsComplete_0001 begin`);
      const actual: boolean = isComplete('123456');
      logInfo(`isComplete(codeText="123456"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsComplete_0001 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0002
     * @tc.name      VerifyCode_IsComplete_0002
     * @tc.desc      isComplete(codeText="12345") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VerifyCode_IsComplete_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsComplete_0002 begin`);
      const actual: boolean = isComplete('12345');
      logInfo(`isComplete(codeText="12345"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0002 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0003
     * @tc.name      VerifyCode_IsComplete_0003
     * @tc.desc      isComplete(codeText="000000") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_IsComplete_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsComplete_0003 begin`);
      const actual: boolean = isComplete('000000');
      logInfo(`isComplete(codeText="000000"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsComplete_0003 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0004
     * @tc.name      VerifyCode_IsComplete_0004
     * @tc.desc      isComplete(codeText="1234567") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_IsComplete_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsComplete_0004 begin`);
      const actual: boolean = isComplete('1234567');
      logInfo(`isComplete(codeText="1234567"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0004 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0005
     * @tc.name      VerifyCode_IsComplete_0005
     * @tc.desc      isComplete(codeText="abc123") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_IsComplete_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsComplete_0005 begin`);
      const actual: boolean = isComplete('abc123');
      logInfo(`isComplete(codeText="abc123"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsComplete_0005 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0006
     * @tc.name      VerifyCode_IsComplete_0006
     * @tc.desc      isComplete(codeText="") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_IsComplete_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsComplete_0006 begin`);
      const actual: boolean = isComplete('');
      logInfo(`isComplete(codeText=""): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0006 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0007
     * @tc.name      VerifyCode_IsComplete_0007
     * @tc.desc      isComplete(codeText="a") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_IsComplete_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsComplete_0007 begin`);
      const actual: boolean = isComplete('a');
      logInfo(`isComplete(codeText="a"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0007 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0008
     * @tc.name      VerifyCode_IsComplete_0008
     * @tc.desc      isComplete(codeText="abc") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_IsComplete_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsComplete_0008 begin`);
      const actual: boolean = isComplete('abc');
      logInfo(`isComplete(codeText="abc"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0008 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0009
     * @tc.name      VerifyCode_IsComplete_0009
     * @tc.desc      isComplete(codeText="Hello World") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_IsComplete_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsComplete_0009 begin`);
      const actual: boolean = isComplete('Hello World');
      logInfo(`isComplete(codeText="Hello World"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0009 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0010
     * @tc.name      VerifyCode_IsComplete_0010
     * @tc.desc      isComplete(codeText=" ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_IsComplete_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsComplete_0010 begin`);
      const actual: boolean = isComplete(' ');
      logInfo(`isComplete(codeText=" "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0010 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0011
     * @tc.name      VerifyCode_IsComplete_0011
     * @tc.desc      isComplete(codeText="123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_IsComplete_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsComplete_0011 begin`);
      const actual: boolean = isComplete('123');
      logInfo(`isComplete(codeText="123"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0011 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0012
     * @tc.name      VerifyCode_IsComplete_0012
     * @tc.desc      isComplete(codeText=" 123456 ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_IsComplete_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsComplete_0012 begin`);
      const actual: boolean = isComplete(' 123456 ');
      logInfo(`isComplete(codeText=" 123456 "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0012 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0013
     * @tc.name      VerifyCode_IsComplete_0013
     * @tc.desc      isComplete(codeText="123456123456") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_IsComplete_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsComplete_0013 begin`);
      const actual: boolean = isComplete('123456123456');
      logInfo(`isComplete(codeText="123456123456"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0013 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0014
     * @tc.name      VerifyCode_IsComplete_0014
     * @tc.desc      isComplete(codeText="123456_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_IsComplete_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsComplete_0014 begin`);
      const actual: boolean = isComplete('123456_1');
      logInfo(`isComplete(codeText="123456_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0014 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0015
     * @tc.name      VerifyCode_IsComplete_0015
     * @tc.desc      isComplete(codeText="x123456") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_IsComplete_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsComplete_0015 begin`);
      const actual: boolean = isComplete('x123456');
      logInfo(`isComplete(codeText="x123456"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0015 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0016
     * @tc.name      VerifyCode_IsComplete_0016
     * @tc.desc      isComplete(codeText=" 000000 ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_IsComplete_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsComplete_0016 begin`);
      const actual: boolean = isComplete(' 000000 ');
      logInfo(`isComplete(codeText=" 000000 "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0016 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0017
     * @tc.name      VerifyCode_IsComplete_0017
     * @tc.desc      isComplete(codeText="000000000000") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_IsComplete_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsComplete_0017 begin`);
      const actual: boolean = isComplete('000000000000');
      logInfo(`isComplete(codeText="000000000000"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0017 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0018
     * @tc.name      VerifyCode_IsComplete_0018
     * @tc.desc      isComplete(codeText="000000_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_IsComplete_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsComplete_0018 begin`);
      const actual: boolean = isComplete('000000_1');
      logInfo(`isComplete(codeText="000000_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0018 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0019
     * @tc.name      VerifyCode_IsComplete_0019
     * @tc.desc      isComplete(codeText="x000000") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_IsComplete_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsComplete_0019 begin`);
      const actual: boolean = isComplete('x000000');
      logInfo(`isComplete(codeText="x000000"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0019 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0020
     * @tc.name      VerifyCode_IsComplete_0020
     * @tc.desc      isComplete(codeText=" 12345 ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_IsComplete_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsComplete_0020 begin`);
      const actual: boolean = isComplete(' 12345 ');
      logInfo(`isComplete(codeText=" 12345 "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0020 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0021
     * @tc.name      VerifyCode_IsComplete_0021
     * @tc.desc      isComplete(codeText="1234512345") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_IsComplete_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsComplete_0021 begin`);
      const actual: boolean = isComplete('1234512345');
      logInfo(`isComplete(codeText="1234512345"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0021 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0022
     * @tc.name      VerifyCode_IsComplete_0022
     * @tc.desc      isComplete(codeText="12345_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_IsComplete_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsComplete_0022 begin`);
      const actual: boolean = isComplete('12345_1');
      logInfo(`isComplete(codeText="12345_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0022 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0023
     * @tc.name      VerifyCode_IsComplete_0023
     * @tc.desc      isComplete(codeText="x12345") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_IsComplete_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsComplete_0023 begin`);
      const actual: boolean = isComplete('x12345');
      logInfo(`isComplete(codeText="x12345"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsComplete_0023 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0024
     * @tc.name      VerifyCode_IsComplete_0024
     * @tc.desc      isComplete(codeText=" 1234567 ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_IsComplete_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsComplete_0024 begin`);
      const actual: boolean = isComplete(' 1234567 ');
      logInfo(`isComplete(codeText=" 1234567 "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0024 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0025
     * @tc.name      VerifyCode_IsComplete_0025
     * @tc.desc      isComplete(codeText="12345671234567") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_IsComplete_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsComplete_0025 begin`);
      const actual: boolean = isComplete('12345671234567');
      logInfo(`isComplete(codeText="12345671234567"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0025 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0026
     * @tc.name      VerifyCode_IsComplete_0026
     * @tc.desc      isComplete(codeText="1234567_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_IsComplete_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsComplete_0026 begin`);
      const actual: boolean = isComplete('1234567_1');
      logInfo(`isComplete(codeText="1234567_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0026 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0027
     * @tc.name      VerifyCode_IsComplete_0027
     * @tc.desc      isComplete(codeText="x1234567") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_IsComplete_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsComplete_0027 begin`);
      const actual: boolean = isComplete('x1234567');
      logInfo(`isComplete(codeText="x1234567"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0027 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0028
     * @tc.name      VerifyCode_IsComplete_0028
     * @tc.desc      isComplete(codeText=" abc123 ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_IsComplete_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsComplete_0028 begin`);
      const actual: boolean = isComplete(' abc123 ');
      logInfo(`isComplete(codeText=" abc123 "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0028 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0029
     * @tc.name      VerifyCode_IsComplete_0029
     * @tc.desc      isComplete(codeText="abc123abc123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_IsComplete_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsComplete_0029 begin`);
      const actual: boolean = isComplete('abc123abc123');
      logInfo(`isComplete(codeText="abc123abc123"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0029 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0030
     * @tc.name      VerifyCode_IsComplete_0030
     * @tc.desc      isComplete(codeText="abc123_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_IsComplete_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsComplete_0030 begin`);
      const actual: boolean = isComplete('abc123_1');
      logInfo(`isComplete(codeText="abc123_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0030 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0031
     * @tc.name      VerifyCode_IsComplete_0031
     * @tc.desc      isComplete(codeText="xabc123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_IsComplete_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsComplete_0031 begin`);
      const actual: boolean = isComplete('xabc123');
      logInfo(`isComplete(codeText="xabc123"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0031 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0032
     * @tc.name      VerifyCode_IsComplete_0032
     * @tc.desc      isComplete(codeText=" a ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_IsComplete_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsComplete_0032 begin`);
      const actual: boolean = isComplete(' a ');
      logInfo(`isComplete(codeText=" a "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0032 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0033
     * @tc.name      VerifyCode_IsComplete_0033
     * @tc.desc      isComplete(codeText="aa") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_IsComplete_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsComplete_0033 begin`);
      const actual: boolean = isComplete('aa');
      logInfo(`isComplete(codeText="aa"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0033 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0034
     * @tc.name      VerifyCode_IsComplete_0034
     * @tc.desc      isComplete(codeText="a_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_IsComplete_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsComplete_0034 begin`);
      const actual: boolean = isComplete('a_1');
      logInfo(`isComplete(codeText="a_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0034 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0035
     * @tc.name      VerifyCode_IsComplete_0035
     * @tc.desc      isComplete(codeText="xa") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_IsComplete_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsComplete_0035 begin`);
      const actual: boolean = isComplete('xa');
      logInfo(`isComplete(codeText="xa"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0035 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0036
     * @tc.name      VerifyCode_IsComplete_0036
     * @tc.desc      isComplete(codeText=" abc ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_IsComplete_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsComplete_0036 begin`);
      const actual: boolean = isComplete(' abc ');
      logInfo(`isComplete(codeText=" abc "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0036 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0037
     * @tc.name      VerifyCode_IsComplete_0037
     * @tc.desc      isComplete(codeText="abcabc") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_IsComplete_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsComplete_0037 begin`);
      const actual: boolean = isComplete('abcabc');
      logInfo(`isComplete(codeText="abcabc"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsComplete_0037 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0038
     * @tc.name      VerifyCode_IsComplete_0038
     * @tc.desc      isComplete(codeText="abc_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_IsComplete_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsComplete_0038 begin`);
      const actual: boolean = isComplete('abc_1');
      logInfo(`isComplete(codeText="abc_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0038 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0039
     * @tc.name      VerifyCode_IsComplete_0039
     * @tc.desc      isComplete(codeText="xabc") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_IsComplete_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsComplete_0039 begin`);
      const actual: boolean = isComplete('xabc');
      logInfo(`isComplete(codeText="xabc"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0039 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0040
     * @tc.name      VerifyCode_IsComplete_0040
     * @tc.desc      isComplete(codeText=" Hello World ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_IsComplete_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsComplete_0040 begin`);
      const actual: boolean = isComplete(' Hello World ');
      logInfo(`isComplete(codeText=" Hello World "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0040 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0041
     * @tc.name      VerifyCode_IsComplete_0041
     * @tc.desc      isComplete(codeText="Hello WorldHello World") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_IsComplete_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsComplete_0041 begin`);
      const actual: boolean = isComplete('Hello WorldHello World');
      logInfo(`isComplete(codeText="Hello WorldHello Wor...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0041 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0042
     * @tc.name      VerifyCode_IsComplete_0042
     * @tc.desc      isComplete(codeText="Hello World_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_IsComplete_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsComplete_0042 begin`);
      const actual: boolean = isComplete('Hello World_1');
      logInfo(`isComplete(codeText="Hello World_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0042 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0043
     * @tc.name      VerifyCode_IsComplete_0043
     * @tc.desc      isComplete(codeText="xHello World") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_IsComplete_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsComplete_0043 begin`);
      const actual: boolean = isComplete('xHello World');
      logInfo(`isComplete(codeText="xHello World"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0043 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0044
     * @tc.name      VerifyCode_IsComplete_0044
     * @tc.desc      isComplete(codeText="   ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_IsComplete_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsComplete_0044 begin`);
      const actual: boolean = isComplete('   ');
      logInfo(`isComplete(codeText="   "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0044 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0045
     * @tc.name      VerifyCode_IsComplete_0045
     * @tc.desc      isComplete(codeText="  ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_IsComplete_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsComplete_0045 begin`);
      const actual: boolean = isComplete('  ');
      logInfo(`isComplete(codeText="  "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0045 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0046
     * @tc.name      VerifyCode_IsComplete_0046
     * @tc.desc      isComplete(codeText=" _1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_IsComplete_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsComplete_0046 begin`);
      const actual: boolean = isComplete(' _1');
      logInfo(`isComplete(codeText=" _1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0046 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0047
     * @tc.name      VerifyCode_IsComplete_0047
     * @tc.desc      isComplete(codeText="x ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_IsComplete_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsComplete_0047 begin`);
      const actual: boolean = isComplete('x ');
      logInfo(`isComplete(codeText="x "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0047 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0048
     * @tc.name      VerifyCode_IsComplete_0048
     * @tc.desc      isComplete(codeText=" 123 ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_IsComplete_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsComplete_0048 begin`);
      const actual: boolean = isComplete(' 123 ');
      logInfo(`isComplete(codeText=" 123 "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0048 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0049
     * @tc.name      VerifyCode_IsComplete_0049
     * @tc.desc      isComplete(codeText="123123") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_IsComplete_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsComplete_0049 begin`);
      const actual: boolean = isComplete('123123');
      logInfo(`isComplete(codeText="123123"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsComplete_0049 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_IS_COMPLETE_0050
     * @tc.name      VerifyCode_IsComplete_0050
     * @tc.desc      isComplete(codeText="123_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_IsComplete_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsComplete_0050 begin`);
      const actual: boolean = isComplete('123_1');
      logInfo(`isComplete(codeText="123_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsComplete_0050 end`);
    });
  });
}
