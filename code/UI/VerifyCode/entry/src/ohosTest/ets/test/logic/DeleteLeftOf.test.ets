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
import { deleteLeftOf } from '../model/VerifyCodeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_VerifyCode]';
const BUNDLE: string = 'VerifyCode_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for deleteLeftOf (96 cases). */
export default function deleteLeftOfTest(): void {
  describe('DeleteLeftOfTest', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0001
     * @tc.name      VerifyCode_DeleteLeftOf_0001
     * @tc.desc      deleteLeftOf(codeText="123456") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VerifyCode_DeleteLeftOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0001 begin`);
      const actual: string = deleteLeftOf('123456');
      logInfo(`deleteLeftOf(codeText="123456"): actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}DeleteLeftOf_0001 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0002
     * @tc.name      VerifyCode_DeleteLeftOf_0002
     * @tc.desc      deleteLeftOf(codeText="000000") returns "00000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VerifyCode_DeleteLeftOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0002 begin`);
      const actual: string = deleteLeftOf('000000');
      logInfo(`deleteLeftOf(codeText="000000"): actual=${actual}`);
      expect(actual).assertEqual('00000');
      logInfo(`${BUNDLE}DeleteLeftOf_0002 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0003
     * @tc.name      VerifyCode_DeleteLeftOf_0003
     * @tc.desc      deleteLeftOf(codeText="12345") returns "1234"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0003 begin`);
      const actual: string = deleteLeftOf('12345');
      logInfo(`deleteLeftOf(codeText="12345"): actual=${actual}`);
      expect(actual).assertEqual('1234');
      logInfo(`${BUNDLE}DeleteLeftOf_0003 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0004
     * @tc.name      VerifyCode_DeleteLeftOf_0004
     * @tc.desc      deleteLeftOf(codeText="1234567") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0004 begin`);
      const actual: string = deleteLeftOf('1234567');
      logInfo(`deleteLeftOf(codeText="1234567"): actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}DeleteLeftOf_0004 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0005
     * @tc.name      VerifyCode_DeleteLeftOf_0005
     * @tc.desc      deleteLeftOf(codeText="abc123") returns "abc12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0005 begin`);
      const actual: string = deleteLeftOf('abc123');
      logInfo(`deleteLeftOf(codeText="abc123"): actual=${actual}`);
      expect(actual).assertEqual('abc12');
      logInfo(`${BUNDLE}DeleteLeftOf_0005 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0006
     * @tc.name      VerifyCode_DeleteLeftOf_0006
     * @tc.desc      deleteLeftOf(codeText="") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_DeleteLeftOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0006 begin`);
      const actual: string = deleteLeftOf('');
      logInfo(`deleteLeftOf(codeText=""): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}DeleteLeftOf_0006 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0007
     * @tc.name      VerifyCode_DeleteLeftOf_0007
     * @tc.desc      deleteLeftOf(codeText="abc") returns "ab"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0007 begin`);
      const actual: string = deleteLeftOf('abc');
      logInfo(`deleteLeftOf(codeText="abc"): actual=${actual}`);
      expect(actual).assertEqual('ab');
      logInfo(`${BUNDLE}DeleteLeftOf_0007 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0008
     * @tc.name      VerifyCode_DeleteLeftOf_0008
     * @tc.desc      deleteLeftOf(codeText="Hello World") returns "Hello Worl"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0008 begin`);
      const actual: string = deleteLeftOf('Hello World');
      logInfo(`deleteLeftOf(codeText="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('Hello Worl');
      logInfo(`${BUNDLE}DeleteLeftOf_0008 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0009
     * @tc.name      VerifyCode_DeleteLeftOf_0009
     * @tc.desc      deleteLeftOf(codeText="123") returns "12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0009 begin`);
      const actual: string = deleteLeftOf('123');
      logInfo(`deleteLeftOf(codeText="123"): actual=${actual}`);
      expect(actual).assertEqual('12');
      logInfo(`${BUNDLE}DeleteLeftOf_0009 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0010
     * @tc.name      VerifyCode_DeleteLeftOf_0010
     * @tc.desc      deleteLeftOf(codeText=" 123456 ") returns " 123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_DeleteLeftOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0010 begin`);
      const actual: string = deleteLeftOf(' 123456 ');
      logInfo(`deleteLeftOf(codeText=" 123456 "): actual=${actual}`);
      expect(actual).assertEqual(' 123456');
      logInfo(`${BUNDLE}DeleteLeftOf_0010 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0011
     * @tc.name      VerifyCode_DeleteLeftOf_0011
     * @tc.desc      deleteLeftOf(codeText="123456123456") returns "12345612345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0011 begin`);
      const actual: string = deleteLeftOf('123456123456');
      logInfo(`deleteLeftOf(codeText="123456123456"): actual=${actual}`);
      expect(actual).assertEqual('12345612345');
      logInfo(`${BUNDLE}DeleteLeftOf_0011 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0012
     * @tc.name      VerifyCode_DeleteLeftOf_0012
     * @tc.desc      deleteLeftOf(codeText="123456_1") returns "123456_"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0012 begin`);
      const actual: string = deleteLeftOf('123456_1');
      logInfo(`deleteLeftOf(codeText="123456_1"): actual=${actual}`);
      expect(actual).assertEqual('123456_');
      logInfo(`${BUNDLE}DeleteLeftOf_0012 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0013
     * @tc.name      VerifyCode_DeleteLeftOf_0013
     * @tc.desc      deleteLeftOf(codeText="x123456") returns "x12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_DeleteLeftOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0013 begin`);
      const actual: string = deleteLeftOf('x123456');
      logInfo(`deleteLeftOf(codeText="x123456"): actual=${actual}`);
      expect(actual).assertEqual('x12345');
      logInfo(`${BUNDLE}DeleteLeftOf_0013 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0014
     * @tc.name      VerifyCode_DeleteLeftOf_0014
     * @tc.desc      deleteLeftOf(codeText=" 000000 ") returns " 000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_DeleteLeftOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0014 begin`);
      const actual: string = deleteLeftOf(' 000000 ');
      logInfo(`deleteLeftOf(codeText=" 000000 "): actual=${actual}`);
      expect(actual).assertEqual(' 000000');
      logInfo(`${BUNDLE}DeleteLeftOf_0014 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0015
     * @tc.name      VerifyCode_DeleteLeftOf_0015
     * @tc.desc      deleteLeftOf(codeText="000000000000") returns "00000000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0015 begin`);
      const actual: string = deleteLeftOf('000000000000');
      logInfo(`deleteLeftOf(codeText="000000000000"): actual=${actual}`);
      expect(actual).assertEqual('00000000000');
      logInfo(`${BUNDLE}DeleteLeftOf_0015 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0016
     * @tc.name      VerifyCode_DeleteLeftOf_0016
     * @tc.desc      deleteLeftOf(codeText="000000_1") returns "000000_"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0016 begin`);
      const actual: string = deleteLeftOf('000000_1');
      logInfo(`deleteLeftOf(codeText="000000_1"): actual=${actual}`);
      expect(actual).assertEqual('000000_');
      logInfo(`${BUNDLE}DeleteLeftOf_0016 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0017
     * @tc.name      VerifyCode_DeleteLeftOf_0017
     * @tc.desc      deleteLeftOf(codeText="x000000") returns "x00000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_DeleteLeftOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0017 begin`);
      const actual: string = deleteLeftOf('x000000');
      logInfo(`deleteLeftOf(codeText="x000000"): actual=${actual}`);
      expect(actual).assertEqual('x00000');
      logInfo(`${BUNDLE}DeleteLeftOf_0017 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0018
     * @tc.name      VerifyCode_DeleteLeftOf_0018
     * @tc.desc      deleteLeftOf(codeText=" 12345 ") returns " 12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_DeleteLeftOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0018 begin`);
      const actual: string = deleteLeftOf(' 12345 ');
      logInfo(`deleteLeftOf(codeText=" 12345 "): actual=${actual}`);
      expect(actual).assertEqual(' 12345');
      logInfo(`${BUNDLE}DeleteLeftOf_0018 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0019
     * @tc.name      VerifyCode_DeleteLeftOf_0019
     * @tc.desc      deleteLeftOf(codeText="1234512345") returns "123451234"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0019 begin`);
      const actual: string = deleteLeftOf('1234512345');
      logInfo(`deleteLeftOf(codeText="1234512345"): actual=${actual}`);
      expect(actual).assertEqual('123451234');
      logInfo(`${BUNDLE}DeleteLeftOf_0019 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0020
     * @tc.name      VerifyCode_DeleteLeftOf_0020
     * @tc.desc      deleteLeftOf(codeText="12345_1") returns "12345_"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0020 begin`);
      const actual: string = deleteLeftOf('12345_1');
      logInfo(`deleteLeftOf(codeText="12345_1"): actual=${actual}`);
      expect(actual).assertEqual('12345_');
      logInfo(`${BUNDLE}DeleteLeftOf_0020 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0021
     * @tc.name      VerifyCode_DeleteLeftOf_0021
     * @tc.desc      deleteLeftOf(codeText="x12345") returns "x1234"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_DeleteLeftOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0021 begin`);
      const actual: string = deleteLeftOf('x12345');
      logInfo(`deleteLeftOf(codeText="x12345"): actual=${actual}`);
      expect(actual).assertEqual('x1234');
      logInfo(`${BUNDLE}DeleteLeftOf_0021 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0022
     * @tc.name      VerifyCode_DeleteLeftOf_0022
     * @tc.desc      deleteLeftOf(codeText=" 1234567 ") returns " 1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_DeleteLeftOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0022 begin`);
      const actual: string = deleteLeftOf(' 1234567 ');
      logInfo(`deleteLeftOf(codeText=" 1234567 "): actual=${actual}`);
      expect(actual).assertEqual(' 1234567');
      logInfo(`${BUNDLE}DeleteLeftOf_0022 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0023
     * @tc.name      VerifyCode_DeleteLeftOf_0023
     * @tc.desc      deleteLeftOf(codeText="12345671234567") returns "1234567123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0023 begin`);
      const actual: string = deleteLeftOf('12345671234567');
      logInfo(`deleteLeftOf(codeText="12345671234567"): actual=${actual}`);
      expect(actual).assertEqual('1234567123456');
      logInfo(`${BUNDLE}DeleteLeftOf_0023 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0024
     * @tc.name      VerifyCode_DeleteLeftOf_0024
     * @tc.desc      deleteLeftOf(codeText="1234567_1") returns "1234567_"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0024 begin`);
      const actual: string = deleteLeftOf('1234567_1');
      logInfo(`deleteLeftOf(codeText="1234567_1"): actual=${actual}`);
      expect(actual).assertEqual('1234567_');
      logInfo(`${BUNDLE}DeleteLeftOf_0024 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0025
     * @tc.name      VerifyCode_DeleteLeftOf_0025
     * @tc.desc      deleteLeftOf(codeText="x1234567") returns "x123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_DeleteLeftOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0025 begin`);
      const actual: string = deleteLeftOf('x1234567');
      logInfo(`deleteLeftOf(codeText="x1234567"): actual=${actual}`);
      expect(actual).assertEqual('x123456');
      logInfo(`${BUNDLE}DeleteLeftOf_0025 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0026
     * @tc.name      VerifyCode_DeleteLeftOf_0026
     * @tc.desc      deleteLeftOf(codeText=" abc123 ") returns " abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_DeleteLeftOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0026 begin`);
      const actual: string = deleteLeftOf(' abc123 ');
      logInfo(`deleteLeftOf(codeText=" abc123 "): actual=${actual}`);
      expect(actual).assertEqual(' abc123');
      logInfo(`${BUNDLE}DeleteLeftOf_0026 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0027
     * @tc.name      VerifyCode_DeleteLeftOf_0027
     * @tc.desc      deleteLeftOf(codeText="abc123abc123") returns "abc123abc12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0027 begin`);
      const actual: string = deleteLeftOf('abc123abc123');
      logInfo(`deleteLeftOf(codeText="abc123abc123"): actual=${actual}`);
      expect(actual).assertEqual('abc123abc12');
      logInfo(`${BUNDLE}DeleteLeftOf_0027 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0028
     * @tc.name      VerifyCode_DeleteLeftOf_0028
     * @tc.desc      deleteLeftOf(codeText="abc123_1") returns "abc123_"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0028 begin`);
      const actual: string = deleteLeftOf('abc123_1');
      logInfo(`deleteLeftOf(codeText="abc123_1"): actual=${actual}`);
      expect(actual).assertEqual('abc123_');
      logInfo(`${BUNDLE}DeleteLeftOf_0028 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0029
     * @tc.name      VerifyCode_DeleteLeftOf_0029
     * @tc.desc      deleteLeftOf(codeText="xabc123") returns "xabc12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_DeleteLeftOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0029 begin`);
      const actual: string = deleteLeftOf('xabc123');
      logInfo(`deleteLeftOf(codeText="xabc123"): actual=${actual}`);
      expect(actual).assertEqual('xabc12');
      logInfo(`${BUNDLE}DeleteLeftOf_0029 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0030
     * @tc.name      VerifyCode_DeleteLeftOf_0030
     * @tc.desc      deleteLeftOf(codeText=" a ") returns " a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_DeleteLeftOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0030 begin`);
      const actual: string = deleteLeftOf(' a ');
      logInfo(`deleteLeftOf(codeText=" a "): actual=${actual}`);
      expect(actual).assertEqual(' a');
      logInfo(`${BUNDLE}DeleteLeftOf_0030 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0031
     * @tc.name      VerifyCode_DeleteLeftOf_0031
     * @tc.desc      deleteLeftOf(codeText="aa") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0031 begin`);
      const actual: string = deleteLeftOf('aa');
      logInfo(`deleteLeftOf(codeText="aa"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}DeleteLeftOf_0031 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0032
     * @tc.name      VerifyCode_DeleteLeftOf_0032
     * @tc.desc      deleteLeftOf(codeText="a_1") returns "a_"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0032 begin`);
      const actual: string = deleteLeftOf('a_1');
      logInfo(`deleteLeftOf(codeText="a_1"): actual=${actual}`);
      expect(actual).assertEqual('a_');
      logInfo(`${BUNDLE}DeleteLeftOf_0032 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0033
     * @tc.name      VerifyCode_DeleteLeftOf_0033
     * @tc.desc      deleteLeftOf(codeText="xa") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_DeleteLeftOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0033 begin`);
      const actual: string = deleteLeftOf('xa');
      logInfo(`deleteLeftOf(codeText="xa"): actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}DeleteLeftOf_0033 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0034
     * @tc.name      VerifyCode_DeleteLeftOf_0034
     * @tc.desc      deleteLeftOf(codeText=" abc ") returns " abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_DeleteLeftOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0034 begin`);
      const actual: string = deleteLeftOf(' abc ');
      logInfo(`deleteLeftOf(codeText=" abc "): actual=${actual}`);
      expect(actual).assertEqual(' abc');
      logInfo(`${BUNDLE}DeleteLeftOf_0034 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0035
     * @tc.name      VerifyCode_DeleteLeftOf_0035
     * @tc.desc      deleteLeftOf(codeText="abcabc") returns "abcab"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0035 begin`);
      const actual: string = deleteLeftOf('abcabc');
      logInfo(`deleteLeftOf(codeText="abcabc"): actual=${actual}`);
      expect(actual).assertEqual('abcab');
      logInfo(`${BUNDLE}DeleteLeftOf_0035 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0036
     * @tc.name      VerifyCode_DeleteLeftOf_0036
     * @tc.desc      deleteLeftOf(codeText="abc_1") returns "abc_"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0036 begin`);
      const actual: string = deleteLeftOf('abc_1');
      logInfo(`deleteLeftOf(codeText="abc_1"): actual=${actual}`);
      expect(actual).assertEqual('abc_');
      logInfo(`${BUNDLE}DeleteLeftOf_0036 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0037
     * @tc.name      VerifyCode_DeleteLeftOf_0037
     * @tc.desc      deleteLeftOf(codeText="xabc") returns "xab"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_DeleteLeftOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0037 begin`);
      const actual: string = deleteLeftOf('xabc');
      logInfo(`deleteLeftOf(codeText="xabc"): actual=${actual}`);
      expect(actual).assertEqual('xab');
      logInfo(`${BUNDLE}DeleteLeftOf_0037 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0038
     * @tc.name      VerifyCode_DeleteLeftOf_0038
     * @tc.desc      deleteLeftOf(codeText=" Hello World ") returns " Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_DeleteLeftOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0038 begin`);
      const actual: string = deleteLeftOf(' Hello World ');
      logInfo(`deleteLeftOf(codeText=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual(' Hello World');
      logInfo(`${BUNDLE}DeleteLeftOf_0038 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0039
     * @tc.name      VerifyCode_DeleteLeftOf_0039
     * @tc.desc      deleteLeftOf(codeText="Hello WorldHello World") returns "Hello WorldHello Worl"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0039 begin`);
      const actual: string = deleteLeftOf('Hello WorldHello World');
      logInfo(`deleteLeftOf(codeText="Hello WorldHello W...: actual=${actual}`);
      expect(actual).assertEqual('Hello WorldHello Worl');
      logInfo(`${BUNDLE}DeleteLeftOf_0039 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0040
     * @tc.name      VerifyCode_DeleteLeftOf_0040
     * @tc.desc      deleteLeftOf(codeText="Hello World_1") returns "Hello World_"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0040 begin`);
      const actual: string = deleteLeftOf('Hello World_1');
      logInfo(`deleteLeftOf(codeText="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual('Hello World_');
      logInfo(`${BUNDLE}DeleteLeftOf_0040 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0041
     * @tc.name      VerifyCode_DeleteLeftOf_0041
     * @tc.desc      deleteLeftOf(codeText="xHello World") returns "xHello Worl"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_DeleteLeftOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0041 begin`);
      const actual: string = deleteLeftOf('xHello World');
      logInfo(`deleteLeftOf(codeText="xHello World"): actual=${actual}`);
      expect(actual).assertEqual('xHello Worl');
      logInfo(`${BUNDLE}DeleteLeftOf_0041 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0042
     * @tc.name      VerifyCode_DeleteLeftOf_0042
     * @tc.desc      deleteLeftOf(codeText="   ") returns "  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_DeleteLeftOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0042 begin`);
      const actual: string = deleteLeftOf('   ');
      logInfo(`deleteLeftOf(codeText="   "): actual=${actual}`);
      expect(actual).assertEqual('  ');
      logInfo(`${BUNDLE}DeleteLeftOf_0042 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0043
     * @tc.name      VerifyCode_DeleteLeftOf_0043
     * @tc.desc      deleteLeftOf(codeText="  ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0043 begin`);
      const actual: string = deleteLeftOf('  ');
      logInfo(`deleteLeftOf(codeText="  "): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}DeleteLeftOf_0043 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0044
     * @tc.name      VerifyCode_DeleteLeftOf_0044
     * @tc.desc      deleteLeftOf(codeText=" _1") returns " _"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0044 begin`);
      const actual: string = deleteLeftOf(' _1');
      logInfo(`deleteLeftOf(codeText=" _1"): actual=${actual}`);
      expect(actual).assertEqual(' _');
      logInfo(`${BUNDLE}DeleteLeftOf_0044 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0045
     * @tc.name      VerifyCode_DeleteLeftOf_0045
     * @tc.desc      deleteLeftOf(codeText=" 123 ") returns " 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_DeleteLeftOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0045 begin`);
      const actual: string = deleteLeftOf(' 123 ');
      logInfo(`deleteLeftOf(codeText=" 123 "): actual=${actual}`);
      expect(actual).assertEqual(' 123');
      logInfo(`${BUNDLE}DeleteLeftOf_0045 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0046
     * @tc.name      VerifyCode_DeleteLeftOf_0046
     * @tc.desc      deleteLeftOf(codeText="123123") returns "12312"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0046 begin`);
      const actual: string = deleteLeftOf('123123');
      logInfo(`deleteLeftOf(codeText="123123"): actual=${actual}`);
      expect(actual).assertEqual('12312');
      logInfo(`${BUNDLE}DeleteLeftOf_0046 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0047
     * @tc.name      VerifyCode_DeleteLeftOf_0047
     * @tc.desc      deleteLeftOf(codeText="123_1") returns "123_"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0047 begin`);
      const actual: string = deleteLeftOf('123_1');
      logInfo(`deleteLeftOf(codeText="123_1"): actual=${actual}`);
      expect(actual).assertEqual('123_');
      logInfo(`${BUNDLE}DeleteLeftOf_0047 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0048
     * @tc.name      VerifyCode_DeleteLeftOf_0048
     * @tc.desc      deleteLeftOf(codeText="x123") returns "x12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_DeleteLeftOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0048 begin`);
      const actual: string = deleteLeftOf('x123');
      logInfo(`deleteLeftOf(codeText="x123"): actual=${actual}`);
      expect(actual).assertEqual('x12');
      logInfo(`${BUNDLE}DeleteLeftOf_0048 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0049
     * @tc.name      VerifyCode_DeleteLeftOf_0049
     * @tc.desc      deleteLeftOf(codeText="mPb") returns "mP"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0049 begin`);
      const actual: string = deleteLeftOf('mPb');
      logInfo(`deleteLeftOf(codeText="mPb"): actual=${actual}`);
      expect(actual).assertEqual('mP');
      logInfo(`${BUNDLE}DeleteLeftOf_0049 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0050
     * @tc.name      VerifyCode_DeleteLeftOf_0050
     * @tc.desc      deleteLeftOf(codeText="88NQ") returns "88N"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0050 begin`);
      const actual: string = deleteLeftOf('88NQ');
      logInfo(`deleteLeftOf(codeText="88NQ"): actual=${actual}`);
      expect(actual).assertEqual('88N');
      logInfo(`${BUNDLE}DeleteLeftOf_0050 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0051
     * @tc.name      VerifyCode_DeleteLeftOf_0051
     * @tc.desc      deleteLeftOf(codeText="SY8peka9HL") returns "SY8peka9H"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0051 begin`);
      const actual: string = deleteLeftOf('SY8peka9HL');
      logInfo(`deleteLeftOf(codeText="SY8peka9HL"): actual=${actual}`);
      expect(actual).assertEqual('SY8peka9H');
      logInfo(`${BUNDLE}DeleteLeftOf_0051 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0052
     * @tc.name      VerifyCode_DeleteLeftOf_0052
     * @tc.desc      deleteLeftOf(codeText="D4IW2SR") returns "D4IW2S"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0052 begin`);
      const actual: string = deleteLeftOf('D4IW2SR');
      logInfo(`deleteLeftOf(codeText="D4IW2SR"): actual=${actual}`);
      expect(actual).assertEqual('D4IW2S');
      logInfo(`${BUNDLE}DeleteLeftOf_0052 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0053
     * @tc.name      VerifyCode_DeleteLeftOf_0053
     * @tc.desc      deleteLeftOf(codeText="Or") returns "O"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0053 begin`);
      const actual: string = deleteLeftOf('Or');
      logInfo(`deleteLeftOf(codeText="Or"): actual=${actual}`);
      expect(actual).assertEqual('O');
      logInfo(`${BUNDLE}DeleteLeftOf_0053 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0054
     * @tc.name      VerifyCode_DeleteLeftOf_0054
     * @tc.desc      deleteLeftOf(codeText="mzd2") returns "mzd"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0054 begin`);
      const actual: string = deleteLeftOf('mzd2');
      logInfo(`deleteLeftOf(codeText="mzd2"): actual=${actual}`);
      expect(actual).assertEqual('mzd');
      logInfo(`${BUNDLE}DeleteLeftOf_0054 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0055
     * @tc.name      VerifyCode_DeleteLeftOf_0055
     * @tc.desc      deleteLeftOf(codeText="oz7KMy") returns "oz7KM"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0055 begin`);
      const actual: string = deleteLeftOf('oz7KMy');
      logInfo(`deleteLeftOf(codeText="oz7KMy"): actual=${actual}`);
      expect(actual).assertEqual('oz7KM');
      logInfo(`${BUNDLE}DeleteLeftOf_0055 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0056
     * @tc.name      VerifyCode_DeleteLeftOf_0056
     * @tc.desc      deleteLeftOf(codeText="AQ9Ch0nokOp") returns "AQ9Ch0nokO"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0056 begin`);
      const actual: string = deleteLeftOf('AQ9Ch0nokOp');
      logInfo(`deleteLeftOf(codeText="AQ9Ch0nokOp"): actual=${actual}`);
      expect(actual).assertEqual('AQ9Ch0nokO');
      logInfo(`${BUNDLE}DeleteLeftOf_0056 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0057
     * @tc.name      VerifyCode_DeleteLeftOf_0057
     * @tc.desc      deleteLeftOf(codeText="zqe6sMwGTL") returns "zqe6sMwGT"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0057 begin`);
      const actual: string = deleteLeftOf('zqe6sMwGTL');
      logInfo(`deleteLeftOf(codeText="zqe6sMwGTL"): actual=${actual}`);
      expect(actual).assertEqual('zqe6sMwGT');
      logInfo(`${BUNDLE}DeleteLeftOf_0057 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0058
     * @tc.name      VerifyCode_DeleteLeftOf_0058
     * @tc.desc      deleteLeftOf(codeText="98BLnOB8RE96") returns "98BLnOB8RE9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0058 begin`);
      const actual: string = deleteLeftOf('98BLnOB8RE96');
      logInfo(`deleteLeftOf(codeText="98BLnOB8RE96"): actual=${actual}`);
      expect(actual).assertEqual('98BLnOB8RE9');
      logInfo(`${BUNDLE}DeleteLeftOf_0058 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0059
     * @tc.name      VerifyCode_DeleteLeftOf_0059
     * @tc.desc      deleteLeftOf(codeText="I26xIap") returns "I26xIa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0059 begin`);
      const actual: string = deleteLeftOf('I26xIap');
      logInfo(`deleteLeftOf(codeText="I26xIap"): actual=${actual}`);
      expect(actual).assertEqual('I26xIa');
      logInfo(`${BUNDLE}DeleteLeftOf_0059 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0060
     * @tc.name      VerifyCode_DeleteLeftOf_0060
     * @tc.desc      deleteLeftOf(codeText="nzE") returns "nz"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0060 begin`);
      const actual: string = deleteLeftOf('nzE');
      logInfo(`deleteLeftOf(codeText="nzE"): actual=${actual}`);
      expect(actual).assertEqual('nz');
      logInfo(`${BUNDLE}DeleteLeftOf_0060 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0061
     * @tc.name      VerifyCode_DeleteLeftOf_0061
     * @tc.desc      deleteLeftOf(codeText="10hB1l") returns "10hB1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0061 begin`);
      const actual: string = deleteLeftOf('10hB1l');
      logInfo(`deleteLeftOf(codeText="10hB1l"): actual=${actual}`);
      expect(actual).assertEqual('10hB1');
      logInfo(`${BUNDLE}DeleteLeftOf_0061 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0062
     * @tc.name      VerifyCode_DeleteLeftOf_0062
     * @tc.desc      deleteLeftOf(codeText="QKWK") returns "QKW"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0062 begin`);
      const actual: string = deleteLeftOf('QKWK');
      logInfo(`deleteLeftOf(codeText="QKWK"): actual=${actual}`);
      expect(actual).assertEqual('QKW');
      logInfo(`${BUNDLE}DeleteLeftOf_0062 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0063
     * @tc.name      VerifyCode_DeleteLeftOf_0063
     * @tc.desc      deleteLeftOf(codeText="8p5xvG") returns "8p5xv"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0063 begin`);
      const actual: string = deleteLeftOf('8p5xvG');
      logInfo(`deleteLeftOf(codeText="8p5xvG"): actual=${actual}`);
      expect(actual).assertEqual('8p5xv');
      logInfo(`${BUNDLE}DeleteLeftOf_0063 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0064
     * @tc.name      VerifyCode_DeleteLeftOf_0064
     * @tc.desc      deleteLeftOf(codeText="inLvS") returns "inLv"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0064 begin`);
      const actual: string = deleteLeftOf('inLvS');
      logInfo(`deleteLeftOf(codeText="inLvS"): actual=${actual}`);
      expect(actual).assertEqual('inLv');
      logInfo(`${BUNDLE}DeleteLeftOf_0064 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0065
     * @tc.name      VerifyCode_DeleteLeftOf_0065
     * @tc.desc      deleteLeftOf(codeText="aKf3uyfD1rFe") returns "aKf3uyfD1rF"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0065 begin`);
      const actual: string = deleteLeftOf('aKf3uyfD1rFe');
      logInfo(`deleteLeftOf(codeText="aKf3uyfD1rFe"): actual=${actual}`);
      expect(actual).assertEqual('aKf3uyfD1rF');
      logInfo(`${BUNDLE}DeleteLeftOf_0065 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0066
     * @tc.name      VerifyCode_DeleteLeftOf_0066
     * @tc.desc      deleteLeftOf(codeText="wcGa1KfE") returns "wcGa1Kf"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0066 begin`);
      const actual: string = deleteLeftOf('wcGa1KfE');
      logInfo(`deleteLeftOf(codeText="wcGa1KfE"): actual=${actual}`);
      expect(actual).assertEqual('wcGa1Kf');
      logInfo(`${BUNDLE}DeleteLeftOf_0066 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0067
     * @tc.name      VerifyCode_DeleteLeftOf_0067
     * @tc.desc      deleteLeftOf(codeText="Pd") returns "P"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0067 begin`);
      const actual: string = deleteLeftOf('Pd');
      logInfo(`deleteLeftOf(codeText="Pd"): actual=${actual}`);
      expect(actual).assertEqual('P');
      logInfo(`${BUNDLE}DeleteLeftOf_0067 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0068
     * @tc.name      VerifyCode_DeleteLeftOf_0068
     * @tc.desc      deleteLeftOf(codeText="Sp96oyq") returns "Sp96oy"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0068 begin`);
      const actual: string = deleteLeftOf('Sp96oyq');
      logInfo(`deleteLeftOf(codeText="Sp96oyq"): actual=${actual}`);
      expect(actual).assertEqual('Sp96oy');
      logInfo(`${BUNDLE}DeleteLeftOf_0068 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0069
     * @tc.name      VerifyCode_DeleteLeftOf_0069
     * @tc.desc      deleteLeftOf(codeText="Cii") returns "Ci"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0069 begin`);
      const actual: string = deleteLeftOf('Cii');
      logInfo(`deleteLeftOf(codeText="Cii"): actual=${actual}`);
      expect(actual).assertEqual('Ci');
      logInfo(`${BUNDLE}DeleteLeftOf_0069 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0070
     * @tc.name      VerifyCode_DeleteLeftOf_0070
     * @tc.desc      deleteLeftOf(codeText="1kZy6XU") returns "1kZy6X"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0070 begin`);
      const actual: string = deleteLeftOf('1kZy6XU');
      logInfo(`deleteLeftOf(codeText="1kZy6XU"): actual=${actual}`);
      expect(actual).assertEqual('1kZy6X');
      logInfo(`${BUNDLE}DeleteLeftOf_0070 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0071
     * @tc.name      VerifyCode_DeleteLeftOf_0071
     * @tc.desc      deleteLeftOf(codeText="HxbswFN9UupK") returns "HxbswFN9Uup"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0071 begin`);
      const actual: string = deleteLeftOf('HxbswFN9UupK');
      logInfo(`deleteLeftOf(codeText="HxbswFN9UupK"): actual=${actual}`);
      expect(actual).assertEqual('HxbswFN9Uup');
      logInfo(`${BUNDLE}DeleteLeftOf_0071 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0072
     * @tc.name      VerifyCode_DeleteLeftOf_0072
     * @tc.desc      deleteLeftOf(codeText="q7CA") returns "q7C"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0072 begin`);
      const actual: string = deleteLeftOf('q7CA');
      logInfo(`deleteLeftOf(codeText="q7CA"): actual=${actual}`);
      expect(actual).assertEqual('q7C');
      logInfo(`${BUNDLE}DeleteLeftOf_0072 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0073
     * @tc.name      VerifyCode_DeleteLeftOf_0073
     * @tc.desc      deleteLeftOf(codeText="5fT2h0") returns "5fT2h"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0073 begin`);
      const actual: string = deleteLeftOf('5fT2h0');
      logInfo(`deleteLeftOf(codeText="5fT2h0"): actual=${actual}`);
      expect(actual).assertEqual('5fT2h');
      logInfo(`${BUNDLE}DeleteLeftOf_0073 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0074
     * @tc.name      VerifyCode_DeleteLeftOf_0074
     * @tc.desc      deleteLeftOf(codeText="ksOfZ6CcoX") returns "ksOfZ6Cco"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0074 begin`);
      const actual: string = deleteLeftOf('ksOfZ6CcoX');
      logInfo(`deleteLeftOf(codeText="ksOfZ6CcoX"): actual=${actual}`);
      expect(actual).assertEqual('ksOfZ6Cco');
      logInfo(`${BUNDLE}DeleteLeftOf_0074 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0075
     * @tc.name      VerifyCode_DeleteLeftOf_0075
     * @tc.desc      deleteLeftOf(codeText="gTvT") returns "gTv"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0075 begin`);
      const actual: string = deleteLeftOf('gTvT');
      logInfo(`deleteLeftOf(codeText="gTvT"): actual=${actual}`);
      expect(actual).assertEqual('gTv');
      logInfo(`${BUNDLE}DeleteLeftOf_0075 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0076
     * @tc.name      VerifyCode_DeleteLeftOf_0076
     * @tc.desc      deleteLeftOf(codeText="fcUC1EP07Zqv") returns "fcUC1EP07Zq"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0076 begin`);
      const actual: string = deleteLeftOf('fcUC1EP07Zqv');
      logInfo(`deleteLeftOf(codeText="fcUC1EP07Zqv"): actual=${actual}`);
      expect(actual).assertEqual('fcUC1EP07Zq');
      logInfo(`${BUNDLE}DeleteLeftOf_0076 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0077
     * @tc.name      VerifyCode_DeleteLeftOf_0077
     * @tc.desc      deleteLeftOf(codeText="Zo5") returns "Zo"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0077 begin`);
      const actual: string = deleteLeftOf('Zo5');
      logInfo(`deleteLeftOf(codeText="Zo5"): actual=${actual}`);
      expect(actual).assertEqual('Zo');
      logInfo(`${BUNDLE}DeleteLeftOf_0077 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0078
     * @tc.name      VerifyCode_DeleteLeftOf_0078
     * @tc.desc      deleteLeftOf(codeText="4sP") returns "4s"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0078 begin`);
      const actual: string = deleteLeftOf('4sP');
      logInfo(`deleteLeftOf(codeText="4sP"): actual=${actual}`);
      expect(actual).assertEqual('4s');
      logInfo(`${BUNDLE}DeleteLeftOf_0078 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0079
     * @tc.name      VerifyCode_DeleteLeftOf_0079
     * @tc.desc      deleteLeftOf(codeText="aIOXvR") returns "aIOXv"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0079 begin`);
      const actual: string = deleteLeftOf('aIOXvR');
      logInfo(`deleteLeftOf(codeText="aIOXvR"): actual=${actual}`);
      expect(actual).assertEqual('aIOXv');
      logInfo(`${BUNDLE}DeleteLeftOf_0079 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0080
     * @tc.name      VerifyCode_DeleteLeftOf_0080
     * @tc.desc      deleteLeftOf(codeText="ciqgrZmnJYn") returns "ciqgrZmnJY"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0080 begin`);
      const actual: string = deleteLeftOf('ciqgrZmnJYn');
      logInfo(`deleteLeftOf(codeText="ciqgrZmnJYn"): actual=${actual}`);
      expect(actual).assertEqual('ciqgrZmnJY');
      logInfo(`${BUNDLE}DeleteLeftOf_0080 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0081
     * @tc.name      VerifyCode_DeleteLeftOf_0081
     * @tc.desc      deleteLeftOf(codeText="Q3UGrNB9S8vG") returns "Q3UGrNB9S8v"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0081 begin`);
      const actual: string = deleteLeftOf('Q3UGrNB9S8vG');
      logInfo(`deleteLeftOf(codeText="Q3UGrNB9S8vG"): actual=${actual}`);
      expect(actual).assertEqual('Q3UGrNB9S8v');
      logInfo(`${BUNDLE}DeleteLeftOf_0081 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0082
     * @tc.name      VerifyCode_DeleteLeftOf_0082
     * @tc.desc      deleteLeftOf(codeText="G33EX") returns "G33E"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0082 begin`);
      const actual: string = deleteLeftOf('G33EX');
      logInfo(`deleteLeftOf(codeText="G33EX"): actual=${actual}`);
      expect(actual).assertEqual('G33E');
      logInfo(`${BUNDLE}DeleteLeftOf_0082 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0083
     * @tc.name      VerifyCode_DeleteLeftOf_0083
     * @tc.desc      deleteLeftOf(codeText="IOAjfa8") returns "IOAjfa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0083 begin`);
      const actual: string = deleteLeftOf('IOAjfa8');
      logInfo(`deleteLeftOf(codeText="IOAjfa8"): actual=${actual}`);
      expect(actual).assertEqual('IOAjfa');
      logInfo(`${BUNDLE}DeleteLeftOf_0083 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0084
     * @tc.name      VerifyCode_DeleteLeftOf_0084
     * @tc.desc      deleteLeftOf(codeText="Ree") returns "Re"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0084 begin`);
      const actual: string = deleteLeftOf('Ree');
      logInfo(`deleteLeftOf(codeText="Ree"): actual=${actual}`);
      expect(actual).assertEqual('Re');
      logInfo(`${BUNDLE}DeleteLeftOf_0084 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0085
     * @tc.name      VerifyCode_DeleteLeftOf_0085
     * @tc.desc      deleteLeftOf(codeText="6vKeY") returns "6vKe"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0085 begin`);
      const actual: string = deleteLeftOf('6vKeY');
      logInfo(`deleteLeftOf(codeText="6vKeY"): actual=${actual}`);
      expect(actual).assertEqual('6vKe');
      logInfo(`${BUNDLE}DeleteLeftOf_0085 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0086
     * @tc.name      VerifyCode_DeleteLeftOf_0086
     * @tc.desc      deleteLeftOf(codeText="bLnDTfowi6") returns "bLnDTfowi"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0086 begin`);
      const actual: string = deleteLeftOf('bLnDTfowi6');
      logInfo(`deleteLeftOf(codeText="bLnDTfowi6"): actual=${actual}`);
      expect(actual).assertEqual('bLnDTfowi');
      logInfo(`${BUNDLE}DeleteLeftOf_0086 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0087
     * @tc.name      VerifyCode_DeleteLeftOf_0087
     * @tc.desc      deleteLeftOf(codeText="29ZRrIkRCWm") returns "29ZRrIkRCW"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0087 begin`);
      const actual: string = deleteLeftOf('29ZRrIkRCWm');
      logInfo(`deleteLeftOf(codeText="29ZRrIkRCWm"): actual=${actual}`);
      expect(actual).assertEqual('29ZRrIkRCW');
      logInfo(`${BUNDLE}DeleteLeftOf_0087 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0088
     * @tc.name      VerifyCode_DeleteLeftOf_0088
     * @tc.desc      deleteLeftOf(codeText="VTmjvl") returns "VTmjv"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0088 begin`);
      const actual: string = deleteLeftOf('VTmjvl');
      logInfo(`deleteLeftOf(codeText="VTmjvl"): actual=${actual}`);
      expect(actual).assertEqual('VTmjv');
      logInfo(`${BUNDLE}DeleteLeftOf_0088 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0089
     * @tc.name      VerifyCode_DeleteLeftOf_0089
     * @tc.desc      deleteLeftOf(codeText="wIf3t3") returns "wIf3t"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0089 begin`);
      const actual: string = deleteLeftOf('wIf3t3');
      logInfo(`deleteLeftOf(codeText="wIf3t3"): actual=${actual}`);
      expect(actual).assertEqual('wIf3t');
      logInfo(`${BUNDLE}DeleteLeftOf_0089 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0090
     * @tc.name      VerifyCode_DeleteLeftOf_0090
     * @tc.desc      deleteLeftOf(codeText="SqCrLrIouCA") returns "SqCrLrIouC"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0090 begin`);
      const actual: string = deleteLeftOf('SqCrLrIouCA');
      logInfo(`deleteLeftOf(codeText="SqCrLrIouCA"): actual=${actual}`);
      expect(actual).assertEqual('SqCrLrIouC');
      logInfo(`${BUNDLE}DeleteLeftOf_0090 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0091
     * @tc.name      VerifyCode_DeleteLeftOf_0091
     * @tc.desc      deleteLeftOf(codeText="0e6z") returns "0e6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0091 begin`);
      const actual: string = deleteLeftOf('0e6z');
      logInfo(`deleteLeftOf(codeText="0e6z"): actual=${actual}`);
      expect(actual).assertEqual('0e6');
      logInfo(`${BUNDLE}DeleteLeftOf_0091 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0092
     * @tc.name      VerifyCode_DeleteLeftOf_0092
     * @tc.desc      deleteLeftOf(codeText="BswXbQdt") returns "BswXbQd"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0092 begin`);
      const actual: string = deleteLeftOf('BswXbQdt');
      logInfo(`deleteLeftOf(codeText="BswXbQdt"): actual=${actual}`);
      expect(actual).assertEqual('BswXbQd');
      logInfo(`${BUNDLE}DeleteLeftOf_0092 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0093
     * @tc.name      VerifyCode_DeleteLeftOf_0093
     * @tc.desc      deleteLeftOf(codeText="9PJyBjqrJ") returns "9PJyBjqr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0093 begin`);
      const actual: string = deleteLeftOf('9PJyBjqrJ');
      logInfo(`deleteLeftOf(codeText="9PJyBjqrJ"): actual=${actual}`);
      expect(actual).assertEqual('9PJyBjqr');
      logInfo(`${BUNDLE}DeleteLeftOf_0093 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0094
     * @tc.name      VerifyCode_DeleteLeftOf_0094
     * @tc.desc      deleteLeftOf(codeText="uTapEzA") returns "uTapEz"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0094 begin`);
      const actual: string = deleteLeftOf('uTapEzA');
      logInfo(`deleteLeftOf(codeText="uTapEzA"): actual=${actual}`);
      expect(actual).assertEqual('uTapEz');
      logInfo(`${BUNDLE}DeleteLeftOf_0094 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0095
     * @tc.name      VerifyCode_DeleteLeftOf_0095
     * @tc.desc      deleteLeftOf(codeText="w0uBa") returns "w0uB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0095 begin`);
      const actual: string = deleteLeftOf('w0uBa');
      logInfo(`deleteLeftOf(codeText="w0uBa"): actual=${actual}`);
      expect(actual).assertEqual('w0uB');
      logInfo(`${BUNDLE}DeleteLeftOf_0095 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_DELETE_LEFT_OF_0096
     * @tc.name      VerifyCode_DeleteLeftOf_0096
     * @tc.desc      deleteLeftOf(codeText="ZwIvp2iWpdYb") returns "ZwIvp2iWpdY"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_DeleteLeftOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DeleteLeftOf_0096 begin`);
      const actual: string = deleteLeftOf('ZwIvp2iWpdYb');
      logInfo(`deleteLeftOf(codeText="ZwIvp2iWpdYb"): actual=${actual}`);
      expect(actual).assertEqual('ZwIvp2iWpdY');
      logInfo(`${BUNDLE}DeleteLeftOf_0096 end`);
    });
  });
}
