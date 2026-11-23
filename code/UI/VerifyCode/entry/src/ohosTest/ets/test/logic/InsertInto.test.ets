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
import { insertInto } from '../model/VerifyCodeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_VerifyCode]';
const BUNDLE: string = 'VerifyCode_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for insertInto (96 cases). */
export default function insertIntoTest(): void {
  describe('InsertIntoTest', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0001
     * @tc.name      VerifyCode_InsertInto_0001
     * @tc.desc      insertInto(codeText="123456", text="Hello") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VerifyCode_InsertInto_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}InsertInto_0001 begin`);
      const actual: string = insertInto('123456', 'Hello');
      logInfo(`insertInto(codeText="123456", text="Hello"): actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0001 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0002
     * @tc.name      VerifyCode_InsertInto_0002
     * @tc.desc      insertInto(codeText="000000", text="Hello") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VerifyCode_InsertInto_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}InsertInto_0002 begin`);
      const actual: string = insertInto('000000', 'Hello');
      logInfo(`insertInto(codeText="000000", text="Hello"): actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0002 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0003
     * @tc.name      VerifyCode_InsertInto_0003
     * @tc.desc      insertInto(codeText="12345", text="Hello") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0003 begin`);
      const actual: string = insertInto('12345', 'Hello');
      logInfo(`insertInto(codeText="12345", text="Hello"): actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0003 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0004
     * @tc.name      VerifyCode_InsertInto_0004
     * @tc.desc      insertInto(codeText="12345", text="123") returns "12345123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0004 begin`);
      const actual: string = insertInto('12345', '123');
      logInfo(`insertInto(codeText="12345", text="123"): actual=${actual}`);
      expect(actual).assertEqual('12345123');
      logInfo(`${BUNDLE}InsertInto_0004 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0005
     * @tc.name      VerifyCode_InsertInto_0005
     * @tc.desc      insertInto(codeText="12345", text="   ") returns "12345   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0005 begin`);
      const actual: string = insertInto('12345', '   ');
      logInfo(`insertInto(codeText="12345", text="   "): actual=${actual}`);
      expect(actual).assertEqual('12345   ');
      logInfo(`${BUNDLE}InsertInto_0005 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0006
     * @tc.name      VerifyCode_InsertInto_0006
     * @tc.desc      insertInto(codeText="12345", text="  ") returns "12345  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0006 begin`);
      const actual: string = insertInto('12345', '  ');
      logInfo(`insertInto(codeText="12345", text="  "): actual=${actual}`);
      expect(actual).assertEqual('12345  ');
      logInfo(`${BUNDLE}InsertInto_0006 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0007
     * @tc.name      VerifyCode_InsertInto_0007
     * @tc.desc      insertInto(codeText="12345", text=" 123 ") returns "12345 123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0007 begin`);
      const actual: string = insertInto('12345', ' 123 ');
      logInfo(`insertInto(codeText="12345", text=" 123 "): actual=${actual}`);
      expect(actual).assertEqual('12345 123 ');
      logInfo(`${BUNDLE}InsertInto_0007 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0008
     * @tc.name      VerifyCode_InsertInto_0008
     * @tc.desc      insertInto(codeText="1234567", text="Hello") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0008 begin`);
      const actual: string = insertInto('1234567', 'Hello');
      logInfo(`insertInto(codeText="1234567", text="Hello"): actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0008 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0009
     * @tc.name      VerifyCode_InsertInto_0009
     * @tc.desc      insertInto(codeText="abc123", text="Hello") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0009 begin`);
      const actual: string = insertInto('abc123', 'Hello');
      logInfo(`insertInto(codeText="abc123", text="Hello"): actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0009 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0010
     * @tc.name      VerifyCode_InsertInto_0010
     * @tc.desc      insertInto(codeText="", text="Hello") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0010 begin`);
      const actual: string = insertInto('', 'Hello');
      logInfo(`insertInto(codeText="", text="Hello"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0010 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0011
     * @tc.name      VerifyCode_InsertInto_0011
     * @tc.desc      insertInto(codeText="", text="123") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0011 begin`);
      const actual: string = insertInto('', '123');
      logInfo(`insertInto(codeText="", text="123"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0011 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0012
     * @tc.name      VerifyCode_InsertInto_0012
     * @tc.desc      insertInto(codeText="", text="   ") returns "   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0012 begin`);
      const actual: string = insertInto('', '   ');
      logInfo(`insertInto(codeText="", text="   "): actual=${actual}`);
      expect(actual).assertEqual('   ');
      logInfo(`${BUNDLE}InsertInto_0012 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0013
     * @tc.name      VerifyCode_InsertInto_0013
     * @tc.desc      insertInto(codeText="", text="  ") returns "  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0013 begin`);
      const actual: string = insertInto('', '  ');
      logInfo(`insertInto(codeText="", text="  "): actual=${actual}`);
      expect(actual).assertEqual('  ');
      logInfo(`${BUNDLE}InsertInto_0013 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0014
     * @tc.name      VerifyCode_InsertInto_0014
     * @tc.desc      insertInto(codeText="", text=" 123 ") returns " 123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0014 begin`);
      const actual: string = insertInto('', ' 123 ');
      logInfo(`insertInto(codeText="", text=" 123 "): actual=${actual}`);
      expect(actual).assertEqual(' 123 ');
      logInfo(`${BUNDLE}InsertInto_0014 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0015
     * @tc.name      VerifyCode_InsertInto_0015
     * @tc.desc      insertInto(codeText="a", text="Hello") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0015 begin`);
      const actual: string = insertInto('a', 'Hello');
      logInfo(`insertInto(codeText="a", text="Hello"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0015 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0016
     * @tc.name      VerifyCode_InsertInto_0016
     * @tc.desc      insertInto(codeText="a", text="123") returns "a123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0016 begin`);
      const actual: string = insertInto('a', '123');
      logInfo(`insertInto(codeText="a", text="123"): actual=${actual}`);
      expect(actual).assertEqual('a123');
      logInfo(`${BUNDLE}InsertInto_0016 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0017
     * @tc.name      VerifyCode_InsertInto_0017
     * @tc.desc      insertInto(codeText="a", text="   ") returns "a   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0017 begin`);
      const actual: string = insertInto('a', '   ');
      logInfo(`insertInto(codeText="a", text="   "): actual=${actual}`);
      expect(actual).assertEqual('a   ');
      logInfo(`${BUNDLE}InsertInto_0017 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0018
     * @tc.name      VerifyCode_InsertInto_0018
     * @tc.desc      insertInto(codeText="a", text="  ") returns "a  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0018 begin`);
      const actual: string = insertInto('a', '  ');
      logInfo(`insertInto(codeText="a", text="  "): actual=${actual}`);
      expect(actual).assertEqual('a  ');
      logInfo(`${BUNDLE}InsertInto_0018 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0019
     * @tc.name      VerifyCode_InsertInto_0019
     * @tc.desc      insertInto(codeText="a", text=" 123 ") returns "a 123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0019 begin`);
      const actual: string = insertInto('a', ' 123 ');
      logInfo(`insertInto(codeText="a", text=" 123 "): actual=${actual}`);
      expect(actual).assertEqual('a 123 ');
      logInfo(`${BUNDLE}InsertInto_0019 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0020
     * @tc.name      VerifyCode_InsertInto_0020
     * @tc.desc      insertInto(codeText="abc", text="Hello") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0020 begin`);
      const actual: string = insertInto('abc', 'Hello');
      logInfo(`insertInto(codeText="abc", text="Hello"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0020 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0021
     * @tc.name      VerifyCode_InsertInto_0021
     * @tc.desc      insertInto(codeText="abc", text="   ") returns "abc   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0021 begin`);
      const actual: string = insertInto('abc', '   ');
      logInfo(`insertInto(codeText="abc", text="   "): actual=${actual}`);
      expect(actual).assertEqual('abc   ');
      logInfo(`${BUNDLE}InsertInto_0021 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0022
     * @tc.name      VerifyCode_InsertInto_0022
     * @tc.desc      insertInto(codeText="abc", text="  ") returns "abc  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0022 begin`);
      const actual: string = insertInto('abc', '  ');
      logInfo(`insertInto(codeText="abc", text="  "): actual=${actual}`);
      expect(actual).assertEqual('abc  ');
      logInfo(`${BUNDLE}InsertInto_0022 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0023
     * @tc.name      VerifyCode_InsertInto_0023
     * @tc.desc      insertInto(codeText="abc", text=" 123 ") returns "abc 123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0023 begin`);
      const actual: string = insertInto('abc', ' 123 ');
      logInfo(`insertInto(codeText="abc", text=" 123 "): actual=${actual}`);
      expect(actual).assertEqual('abc 123 ');
      logInfo(`${BUNDLE}InsertInto_0023 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0024
     * @tc.name      VerifyCode_InsertInto_0024
     * @tc.desc      insertInto(codeText="Hello World", text="Hello") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0024 begin`);
      const actual: string = insertInto('Hello World', 'Hello');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0024 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0025
     * @tc.name      VerifyCode_InsertInto_0025
     * @tc.desc      insertInto(codeText=" ", text="Hello") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0025 begin`);
      const actual: string = insertInto(' ', 'Hello');
      logInfo(`insertInto(codeText=" ", text="Hello"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0025 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0026
     * @tc.name      VerifyCode_InsertInto_0026
     * @tc.desc      insertInto(codeText=" ", text="123") returns " 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0026 begin`);
      const actual: string = insertInto(' ', '123');
      logInfo(`insertInto(codeText=" ", text="123"): actual=${actual}`);
      expect(actual).assertEqual(' 123');
      logInfo(`${BUNDLE}InsertInto_0026 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0027
     * @tc.name      VerifyCode_InsertInto_0027
     * @tc.desc      insertInto(codeText=" ", text="   ") returns "    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0027 begin`);
      const actual: string = insertInto(' ', '   ');
      logInfo(`insertInto(codeText=" ", text="   "): actual=${actual}`);
      expect(actual).assertEqual('    ');
      logInfo(`${BUNDLE}InsertInto_0027 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0028
     * @tc.name      VerifyCode_InsertInto_0028
     * @tc.desc      insertInto(codeText=" ", text=" 123 ") returns "  123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0028 begin`);
      const actual: string = insertInto(' ', ' 123 ');
      logInfo(`insertInto(codeText=" ", text=" 123 "): actual=${actual}`);
      expect(actual).assertEqual('  123 ');
      logInfo(`${BUNDLE}InsertInto_0028 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0029
     * @tc.name      VerifyCode_InsertInto_0029
     * @tc.desc      insertInto(codeText="123", text="123") returns "123123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0029 begin`);
      const actual: string = insertInto('123', '123');
      logInfo(`insertInto(codeText="123", text="123"): actual=${actual}`);
      expect(actual).assertEqual('123123');
      logInfo(`${BUNDLE}InsertInto_0029 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0030
     * @tc.name      VerifyCode_InsertInto_0030
     * @tc.desc      insertInto(codeText="123", text="   ") returns "123   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0030 begin`);
      const actual: string = insertInto('123', '   ');
      logInfo(`insertInto(codeText="123", text="   "): actual=${actual}`);
      expect(actual).assertEqual('123   ');
      logInfo(`${BUNDLE}InsertInto_0030 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0031
     * @tc.name      VerifyCode_InsertInto_0031
     * @tc.desc      insertInto(codeText="123", text="  ") returns "123  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0031 begin`);
      const actual: string = insertInto('123', '  ');
      logInfo(`insertInto(codeText="123", text="  "): actual=${actual}`);
      expect(actual).assertEqual('123  ');
      logInfo(`${BUNDLE}InsertInto_0031 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0032
     * @tc.name      VerifyCode_InsertInto_0032
     * @tc.desc      insertInto(codeText="123", text=" 123 ") returns "123 123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0032 begin`);
      const actual: string = insertInto('123', ' 123 ');
      logInfo(`insertInto(codeText="123", text=" 123 "): actual=${actual}`);
      expect(actual).assertEqual('123 123 ');
      logInfo(`${BUNDLE}InsertInto_0032 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0033
     * @tc.name      VerifyCode_InsertInto_0033
     * @tc.desc      insertInto(codeText=" 123456 ", text="Hello") returns " 123456 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0033 begin`);
      const actual: string = insertInto(' 123456 ', 'Hello');
      logInfo(`insertInto(codeText=" 123456 ", text="Hel...: actual=${actual}`);
      expect(actual).assertEqual(' 123456 ');
      logInfo(`${BUNDLE}InsertInto_0033 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0034
     * @tc.name      VerifyCode_InsertInto_0034
     * @tc.desc      insertInto(codeText="123456123456", text="Hello") returns "123456123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0034 begin`);
      const actual: string = insertInto('123456123456', 'Hello');
      logInfo(`insertInto(codeText="123456123456", text=...: actual=${actual}`);
      expect(actual).assertEqual('123456123456');
      logInfo(`${BUNDLE}InsertInto_0034 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0035
     * @tc.name      VerifyCode_InsertInto_0035
     * @tc.desc      insertInto(codeText="123456_1", text="Hello") returns "123456_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0035 begin`);
      const actual: string = insertInto('123456_1', 'Hello');
      logInfo(`insertInto(codeText="123456_1", text="Hel...: actual=${actual}`);
      expect(actual).assertEqual('123456_1');
      logInfo(`${BUNDLE}InsertInto_0035 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0036
     * @tc.name      VerifyCode_InsertInto_0036
     * @tc.desc      insertInto(codeText="x123456", text="Hello") returns "x123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0036 begin`);
      const actual: string = insertInto('x123456', 'Hello');
      logInfo(`insertInto(codeText="x123456", text="Hello"): actual=${actual}`);
      expect(actual).assertEqual('x123456');
      logInfo(`${BUNDLE}InsertInto_0036 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0037
     * @tc.name      VerifyCode_InsertInto_0037
     * @tc.desc      insertInto(codeText=" 000000 ", text="Hello") returns " 000000 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0037 begin`);
      const actual: string = insertInto(' 000000 ', 'Hello');
      logInfo(`insertInto(codeText=" 000000 ", text="Hel...: actual=${actual}`);
      expect(actual).assertEqual(' 000000 ');
      logInfo(`${BUNDLE}InsertInto_0037 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0038
     * @tc.name      VerifyCode_InsertInto_0038
     * @tc.desc      insertInto(codeText="000000000000", text="Hello") returns "000000000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0038 begin`);
      const actual: string = insertInto('000000000000', 'Hello');
      logInfo(`insertInto(codeText="000000000000", text=...: actual=${actual}`);
      expect(actual).assertEqual('000000000000');
      logInfo(`${BUNDLE}InsertInto_0038 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0039
     * @tc.name      VerifyCode_InsertInto_0039
     * @tc.desc      insertInto(codeText="000000_1", text="Hello") returns "000000_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0039 begin`);
      const actual: string = insertInto('000000_1', 'Hello');
      logInfo(`insertInto(codeText="000000_1", text="Hel...: actual=${actual}`);
      expect(actual).assertEqual('000000_1');
      logInfo(`${BUNDLE}InsertInto_0039 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0040
     * @tc.name      VerifyCode_InsertInto_0040
     * @tc.desc      insertInto(codeText="x000000", text="Hello") returns "x000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0040 begin`);
      const actual: string = insertInto('x000000', 'Hello');
      logInfo(`insertInto(codeText="x000000", text="Hello"): actual=${actual}`);
      expect(actual).assertEqual('x000000');
      logInfo(`${BUNDLE}InsertInto_0040 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0041
     * @tc.name      VerifyCode_InsertInto_0041
     * @tc.desc      insertInto(codeText=" 12345 ", text="Hello") returns " 12345 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0041 begin`);
      const actual: string = insertInto(' 12345 ', 'Hello');
      logInfo(`insertInto(codeText=" 12345 ", text="Hello"): actual=${actual}`);
      expect(actual).assertEqual(' 12345 ');
      logInfo(`${BUNDLE}InsertInto_0041 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0042
     * @tc.name      VerifyCode_InsertInto_0042
     * @tc.desc      insertInto(codeText="1234512345", text="Hello") returns "1234512345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0042 begin`);
      const actual: string = insertInto('1234512345', 'Hello');
      logInfo(`insertInto(codeText="1234512345", text="H...: actual=${actual}`);
      expect(actual).assertEqual('1234512345');
      logInfo(`${BUNDLE}InsertInto_0042 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0043
     * @tc.name      VerifyCode_InsertInto_0043
     * @tc.desc      insertInto(codeText="12345_1", text="Hello") returns "12345_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0043 begin`);
      const actual: string = insertInto('12345_1', 'Hello');
      logInfo(`insertInto(codeText="12345_1", text="Hello"): actual=${actual}`);
      expect(actual).assertEqual('12345_1');
      logInfo(`${BUNDLE}InsertInto_0043 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0044
     * @tc.name      VerifyCode_InsertInto_0044
     * @tc.desc      insertInto(codeText="x12345", text="Hello") returns "x12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0044 begin`);
      const actual: string = insertInto('x12345', 'Hello');
      logInfo(`insertInto(codeText="x12345", text="Hello"): actual=${actual}`);
      expect(actual).assertEqual('x12345');
      logInfo(`${BUNDLE}InsertInto_0044 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0045
     * @tc.name      VerifyCode_InsertInto_0045
     * @tc.desc      insertInto(codeText=" 1234567 ", text="Hello") returns " 1234567 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0045 begin`);
      const actual: string = insertInto(' 1234567 ', 'Hello');
      logInfo(`insertInto(codeText=" 1234567 ", text="He...: actual=${actual}`);
      expect(actual).assertEqual(' 1234567 ');
      logInfo(`${BUNDLE}InsertInto_0045 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0046
     * @tc.name      VerifyCode_InsertInto_0046
     * @tc.desc      insertInto(codeText="12345671234567", text="Hello") returns "12345671234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0046 begin`);
      const actual: string = insertInto('12345671234567', 'Hello');
      logInfo(`insertInto(codeText="12345671234567", tex...: actual=${actual}`);
      expect(actual).assertEqual('12345671234567');
      logInfo(`${BUNDLE}InsertInto_0046 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0047
     * @tc.name      VerifyCode_InsertInto_0047
     * @tc.desc      insertInto(codeText="1234567_1", text="Hello") returns "1234567_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0047 begin`);
      const actual: string = insertInto('1234567_1', 'Hello');
      logInfo(`insertInto(codeText="1234567_1", text="He...: actual=${actual}`);
      expect(actual).assertEqual('1234567_1');
      logInfo(`${BUNDLE}InsertInto_0047 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0048
     * @tc.name      VerifyCode_InsertInto_0048
     * @tc.desc      insertInto(codeText="x1234567", text="Hello") returns "x1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0048 begin`);
      const actual: string = insertInto('x1234567', 'Hello');
      logInfo(`insertInto(codeText="x1234567", text="Hel...: actual=${actual}`);
      expect(actual).assertEqual('x1234567');
      logInfo(`${BUNDLE}InsertInto_0048 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0049
     * @tc.name      VerifyCode_InsertInto_0049
     * @tc.desc      insertInto(codeText=" abc123 ", text="Hello") returns " abc123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0049 begin`);
      const actual: string = insertInto(' abc123 ', 'Hello');
      logInfo(`insertInto(codeText=" abc123 ", text="Hel...: actual=${actual}`);
      expect(actual).assertEqual(' abc123 ');
      logInfo(`${BUNDLE}InsertInto_0049 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0050
     * @tc.name      VerifyCode_InsertInto_0050
     * @tc.desc      insertInto(codeText="abc123abc123", text="Hello") returns "abc123abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0050 begin`);
      const actual: string = insertInto('abc123abc123', 'Hello');
      logInfo(`insertInto(codeText="abc123abc123", text=...: actual=${actual}`);
      expect(actual).assertEqual('abc123abc123');
      logInfo(`${BUNDLE}InsertInto_0050 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0051
     * @tc.name      VerifyCode_InsertInto_0051
     * @tc.desc      insertInto(codeText="abc123_1", text="Hello") returns "abc123_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0051 begin`);
      const actual: string = insertInto('abc123_1', 'Hello');
      logInfo(`insertInto(codeText="abc123_1", text="Hel...: actual=${actual}`);
      expect(actual).assertEqual('abc123_1');
      logInfo(`${BUNDLE}InsertInto_0051 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0052
     * @tc.name      VerifyCode_InsertInto_0052
     * @tc.desc      insertInto(codeText="xabc123", text="Hello") returns "xabc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0052 begin`);
      const actual: string = insertInto('xabc123', 'Hello');
      logInfo(`insertInto(codeText="xabc123", text="Hello"): actual=${actual}`);
      expect(actual).assertEqual('xabc123');
      logInfo(`${BUNDLE}InsertInto_0052 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0053
     * @tc.name      VerifyCode_InsertInto_0053
     * @tc.desc      insertInto(codeText=" a ", text="Hello") returns " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0053 begin`);
      const actual: string = insertInto(' a ', 'Hello');
      logInfo(`insertInto(codeText=" a ", text="Hello"): actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`${BUNDLE}InsertInto_0053 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0054
     * @tc.name      VerifyCode_InsertInto_0054
     * @tc.desc      insertInto(codeText=" a ", text="123") returns " a 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0054 begin`);
      const actual: string = insertInto(' a ', '123');
      logInfo(`insertInto(codeText=" a ", text="123"): actual=${actual}`);
      expect(actual).assertEqual(' a 123');
      logInfo(`${BUNDLE}InsertInto_0054 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0055
     * @tc.name      VerifyCode_InsertInto_0055
     * @tc.desc      insertInto(codeText=" a ", text="   ") returns " a    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0055 begin`);
      const actual: string = insertInto(' a ', '   ');
      logInfo(`insertInto(codeText=" a ", text="   "): actual=${actual}`);
      expect(actual).assertEqual(' a    ');
      logInfo(`${BUNDLE}InsertInto_0055 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0056
     * @tc.name      VerifyCode_InsertInto_0056
     * @tc.desc      insertInto(codeText=" a ", text="  ") returns " a   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0056 begin`);
      const actual: string = insertInto(' a ', '  ');
      logInfo(`insertInto(codeText=" a ", text="  "): actual=${actual}`);
      expect(actual).assertEqual(' a   ');
      logInfo(`${BUNDLE}InsertInto_0056 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0057
     * @tc.name      VerifyCode_InsertInto_0057
     * @tc.desc      insertInto(codeText=" a ", text=" 123 ") returns " a  123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0057 begin`);
      const actual: string = insertInto(' a ', ' 123 ');
      logInfo(`insertInto(codeText=" a ", text=" 123 "): actual=${actual}`);
      expect(actual).assertEqual(' a  123 ');
      logInfo(`${BUNDLE}InsertInto_0057 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0058
     * @tc.name      VerifyCode_InsertInto_0058
     * @tc.desc      insertInto(codeText="aa", text="Hello") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0058 begin`);
      const actual: string = insertInto('aa', 'Hello');
      logInfo(`insertInto(codeText="aa", text="Hello"): actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`${BUNDLE}InsertInto_0058 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0059
     * @tc.name      VerifyCode_InsertInto_0059
     * @tc.desc      insertInto(codeText="aa", text="123") returns "aa123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0059 begin`);
      const actual: string = insertInto('aa', '123');
      logInfo(`insertInto(codeText="aa", text="123"): actual=${actual}`);
      expect(actual).assertEqual('aa123');
      logInfo(`${BUNDLE}InsertInto_0059 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0060
     * @tc.name      VerifyCode_InsertInto_0060
     * @tc.desc      insertInto(codeText="aa", text="   ") returns "aa   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0060 begin`);
      const actual: string = insertInto('aa', '   ');
      logInfo(`insertInto(codeText="aa", text="   "): actual=${actual}`);
      expect(actual).assertEqual('aa   ');
      logInfo(`${BUNDLE}InsertInto_0060 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0061
     * @tc.name      VerifyCode_InsertInto_0061
     * @tc.desc      insertInto(codeText="aa", text="  ") returns "aa  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0061 begin`);
      const actual: string = insertInto('aa', '  ');
      logInfo(`insertInto(codeText="aa", text="  "): actual=${actual}`);
      expect(actual).assertEqual('aa  ');
      logInfo(`${BUNDLE}InsertInto_0061 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0062
     * @tc.name      VerifyCode_InsertInto_0062
     * @tc.desc      insertInto(codeText="aa", text=" 123 ") returns "aa 123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0062 begin`);
      const actual: string = insertInto('aa', ' 123 ');
      logInfo(`insertInto(codeText="aa", text=" 123 "): actual=${actual}`);
      expect(actual).assertEqual('aa 123 ');
      logInfo(`${BUNDLE}InsertInto_0062 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0063
     * @tc.name      VerifyCode_InsertInto_0063
     * @tc.desc      insertInto(codeText="a_1", text="Hello") returns "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0063 begin`);
      const actual: string = insertInto('a_1', 'Hello');
      logInfo(`insertInto(codeText="a_1", text="Hello"): actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`${BUNDLE}InsertInto_0063 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0064
     * @tc.name      VerifyCode_InsertInto_0064
     * @tc.desc      insertInto(codeText="a_1", text="123") returns "a_1123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0064 begin`);
      const actual: string = insertInto('a_1', '123');
      logInfo(`insertInto(codeText="a_1", text="123"): actual=${actual}`);
      expect(actual).assertEqual('a_1123');
      logInfo(`${BUNDLE}InsertInto_0064 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0065
     * @tc.name      VerifyCode_InsertInto_0065
     * @tc.desc      insertInto(codeText="a_1", text="   ") returns "a_1   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0065 begin`);
      const actual: string = insertInto('a_1', '   ');
      logInfo(`insertInto(codeText="a_1", text="   "): actual=${actual}`);
      expect(actual).assertEqual('a_1   ');
      logInfo(`${BUNDLE}InsertInto_0065 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0066
     * @tc.name      VerifyCode_InsertInto_0066
     * @tc.desc      insertInto(codeText="a_1", text="  ") returns "a_1  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0066 begin`);
      const actual: string = insertInto('a_1', '  ');
      logInfo(`insertInto(codeText="a_1", text="  "): actual=${actual}`);
      expect(actual).assertEqual('a_1  ');
      logInfo(`${BUNDLE}InsertInto_0066 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0067
     * @tc.name      VerifyCode_InsertInto_0067
     * @tc.desc      insertInto(codeText="a_1", text=" 123 ") returns "a_1 123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0067 begin`);
      const actual: string = insertInto('a_1', ' 123 ');
      logInfo(`insertInto(codeText="a_1", text=" 123 "): actual=${actual}`);
      expect(actual).assertEqual('a_1 123 ');
      logInfo(`${BUNDLE}InsertInto_0067 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0068
     * @tc.name      VerifyCode_InsertInto_0068
     * @tc.desc      insertInto(codeText="xa", text="Hello") returns "xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0068 begin`);
      const actual: string = insertInto('xa', 'Hello');
      logInfo(`insertInto(codeText="xa", text="Hello"): actual=${actual}`);
      expect(actual).assertEqual('xa');
      logInfo(`${BUNDLE}InsertInto_0068 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0069
     * @tc.name      VerifyCode_InsertInto_0069
     * @tc.desc      insertInto(codeText="xa", text="123") returns "xa123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0069 begin`);
      const actual: string = insertInto('xa', '123');
      logInfo(`insertInto(codeText="xa", text="123"): actual=${actual}`);
      expect(actual).assertEqual('xa123');
      logInfo(`${BUNDLE}InsertInto_0069 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0070
     * @tc.name      VerifyCode_InsertInto_0070
     * @tc.desc      insertInto(codeText="xa", text="   ") returns "xa   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0070 begin`);
      const actual: string = insertInto('xa', '   ');
      logInfo(`insertInto(codeText="xa", text="   "): actual=${actual}`);
      expect(actual).assertEqual('xa   ');
      logInfo(`${BUNDLE}InsertInto_0070 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0071
     * @tc.name      VerifyCode_InsertInto_0071
     * @tc.desc      insertInto(codeText="xa", text="  ") returns "xa  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0071 begin`);
      const actual: string = insertInto('xa', '  ');
      logInfo(`insertInto(codeText="xa", text="  "): actual=${actual}`);
      expect(actual).assertEqual('xa  ');
      logInfo(`${BUNDLE}InsertInto_0071 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0072
     * @tc.name      VerifyCode_InsertInto_0072
     * @tc.desc      insertInto(codeText="xa", text=" 123 ") returns "xa 123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0072 begin`);
      const actual: string = insertInto('xa', ' 123 ');
      logInfo(`insertInto(codeText="xa", text=" 123 "): actual=${actual}`);
      expect(actual).assertEqual('xa 123 ');
      logInfo(`${BUNDLE}InsertInto_0072 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0073
     * @tc.name      VerifyCode_InsertInto_0073
     * @tc.desc      insertInto(codeText=" abc ", text="Hello") returns " abc "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0073 begin`);
      const actual: string = insertInto(' abc ', 'Hello');
      logInfo(`insertInto(codeText=" abc ", text="Hello"): actual=${actual}`);
      expect(actual).assertEqual(' abc ');
      logInfo(`${BUNDLE}InsertInto_0073 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0074
     * @tc.name      VerifyCode_InsertInto_0074
     * @tc.desc      insertInto(codeText=" abc ", text="123") returns " abc 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0074 begin`);
      const actual: string = insertInto(' abc ', '123');
      logInfo(`insertInto(codeText=" abc ", text="123"): actual=${actual}`);
      expect(actual).assertEqual(' abc 123');
      logInfo(`${BUNDLE}InsertInto_0074 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0075
     * @tc.name      VerifyCode_InsertInto_0075
     * @tc.desc      insertInto(codeText=" abc ", text="   ") returns " abc    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0075 begin`);
      const actual: string = insertInto(' abc ', '   ');
      logInfo(`insertInto(codeText=" abc ", text="   "): actual=${actual}`);
      expect(actual).assertEqual(' abc    ');
      logInfo(`${BUNDLE}InsertInto_0075 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0076
     * @tc.name      VerifyCode_InsertInto_0076
     * @tc.desc      insertInto(codeText=" abc ", text="  ") returns " abc   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0076 begin`);
      const actual: string = insertInto(' abc ', '  ');
      logInfo(`insertInto(codeText=" abc ", text="  "): actual=${actual}`);
      expect(actual).assertEqual(' abc   ');
      logInfo(`${BUNDLE}InsertInto_0076 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0077
     * @tc.name      VerifyCode_InsertInto_0077
     * @tc.desc      insertInto(codeText=" abc ", text=" 123 ") returns " abc  123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0077 begin`);
      const actual: string = insertInto(' abc ', ' 123 ');
      logInfo(`insertInto(codeText=" abc ", text=" 123 "): actual=${actual}`);
      expect(actual).assertEqual(' abc  123 ');
      logInfo(`${BUNDLE}InsertInto_0077 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0078
     * @tc.name      VerifyCode_InsertInto_0078
     * @tc.desc      insertInto(codeText="abcabc", text="Hello") returns "abcabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0078 begin`);
      const actual: string = insertInto('abcabc', 'Hello');
      logInfo(`insertInto(codeText="abcabc", text="Hello"): actual=${actual}`);
      expect(actual).assertEqual('abcabc');
      logInfo(`${BUNDLE}InsertInto_0078 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0079
     * @tc.name      VerifyCode_InsertInto_0079
     * @tc.desc      insertInto(codeText="abc_1", text="Hello") returns "abc_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0079 begin`);
      const actual: string = insertInto('abc_1', 'Hello');
      logInfo(`insertInto(codeText="abc_1", text="Hello"): actual=${actual}`);
      expect(actual).assertEqual('abc_1');
      logInfo(`${BUNDLE}InsertInto_0079 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0080
     * @tc.name      VerifyCode_InsertInto_0080
     * @tc.desc      insertInto(codeText="abc_1", text="123") returns "abc_1123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0080 begin`);
      const actual: string = insertInto('abc_1', '123');
      logInfo(`insertInto(codeText="abc_1", text="123"): actual=${actual}`);
      expect(actual).assertEqual('abc_1123');
      logInfo(`${BUNDLE}InsertInto_0080 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0081
     * @tc.name      VerifyCode_InsertInto_0081
     * @tc.desc      insertInto(codeText="abc_1", text="   ") returns "abc_1   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0081 begin`);
      const actual: string = insertInto('abc_1', '   ');
      logInfo(`insertInto(codeText="abc_1", text="   "): actual=${actual}`);
      expect(actual).assertEqual('abc_1   ');
      logInfo(`${BUNDLE}InsertInto_0081 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0082
     * @tc.name      VerifyCode_InsertInto_0082
     * @tc.desc      insertInto(codeText="abc_1", text="  ") returns "abc_1  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0082 begin`);
      const actual: string = insertInto('abc_1', '  ');
      logInfo(`insertInto(codeText="abc_1", text="  "): actual=${actual}`);
      expect(actual).assertEqual('abc_1  ');
      logInfo(`${BUNDLE}InsertInto_0082 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0083
     * @tc.name      VerifyCode_InsertInto_0083
     * @tc.desc      insertInto(codeText="abc_1", text=" 123 ") returns "abc_1 123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0083 begin`);
      const actual: string = insertInto('abc_1', ' 123 ');
      logInfo(`insertInto(codeText="abc_1", text=" 123 "): actual=${actual}`);
      expect(actual).assertEqual('abc_1 123 ');
      logInfo(`${BUNDLE}InsertInto_0083 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0084
     * @tc.name      VerifyCode_InsertInto_0084
     * @tc.desc      insertInto(codeText="xabc", text="Hello") returns "xabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0084 begin`);
      const actual: string = insertInto('xabc', 'Hello');
      logInfo(`insertInto(codeText="xabc", text="Hello"): actual=${actual}`);
      expect(actual).assertEqual('xabc');
      logInfo(`${BUNDLE}InsertInto_0084 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0085
     * @tc.name      VerifyCode_InsertInto_0085
     * @tc.desc      insertInto(codeText="xabc", text="   ") returns "xabc   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0085 begin`);
      const actual: string = insertInto('xabc', '   ');
      logInfo(`insertInto(codeText="xabc", text="   "): actual=${actual}`);
      expect(actual).assertEqual('xabc   ');
      logInfo(`${BUNDLE}InsertInto_0085 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0086
     * @tc.name      VerifyCode_InsertInto_0086
     * @tc.desc      insertInto(codeText="xabc", text="  ") returns "xabc  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0086 begin`);
      const actual: string = insertInto('xabc', '  ');
      logInfo(`insertInto(codeText="xabc", text="  "): actual=${actual}`);
      expect(actual).assertEqual('xabc  ');
      logInfo(`${BUNDLE}InsertInto_0086 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0087
     * @tc.name      VerifyCode_InsertInto_0087
     * @tc.desc      insertInto(codeText="xabc", text=" 123 ") returns "xabc 123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0087 begin`);
      const actual: string = insertInto('xabc', ' 123 ');
      logInfo(`insertInto(codeText="xabc", text=" 123 "): actual=${actual}`);
      expect(actual).assertEqual('xabc 123 ');
      logInfo(`${BUNDLE}InsertInto_0087 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0088
     * @tc.name      VerifyCode_InsertInto_0088
     * @tc.desc      insertInto(codeText=" Hello World ", text="Hello") returns " Hello World "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0088 begin`);
      const actual: string = insertInto(' Hello World ', 'Hello');
      logInfo(`insertInto(codeText=" Hello World ", text...: actual=${actual}`);
      expect(actual).assertEqual(' Hello World ');
      logInfo(`${BUNDLE}InsertInto_0088 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0089
     * @tc.name      VerifyCode_InsertInto_0089
     * @tc.desc      insertInto(codeText="Hello WorldHello World", text="Hello") returns "Hello WorldHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0089 begin`);
      const actual: string = insertInto('Hello WorldHello World', 'Hello');
      logInfo(`insertInto(codeText="Hello WorldHello Wor...: actual=${actual}`);
      expect(actual).assertEqual('Hello WorldHello World');
      logInfo(`${BUNDLE}InsertInto_0089 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0090
     * @tc.name      VerifyCode_InsertInto_0090
     * @tc.desc      insertInto(codeText="Hello World_1", text="Hello") returns "Hello World_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0090 begin`);
      const actual: string = insertInto('Hello World_1', 'Hello');
      logInfo(`insertInto(codeText="Hello World_1", text...: actual=${actual}`);
      expect(actual).assertEqual('Hello World_1');
      logInfo(`${BUNDLE}InsertInto_0090 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0091
     * @tc.name      VerifyCode_InsertInto_0091
     * @tc.desc      insertInto(codeText="123456", text="hello world") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0091 begin`);
      const actual: string = insertInto('123456', 'hello world');
      logInfo(`insertInto(codeText="123456", text="hello...: actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0091 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0092
     * @tc.name      VerifyCode_InsertInto_0092
     * @tc.desc      insertInto(codeText="123456", text="") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0092 begin`);
      const actual: string = insertInto('123456', '');
      logInfo(`insertInto(codeText="123456", text=""): actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0092 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0093
     * @tc.name      VerifyCode_InsertInto_0093
     * @tc.desc      insertInto(codeText="123456", text=" ") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0093 begin`);
      const actual: string = insertInto('123456', ' ');
      logInfo(`insertInto(codeText="123456", text=" "): actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0093 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0094
     * @tc.name      VerifyCode_InsertInto_0094
     * @tc.desc      insertInto(codeText="123456", text="A") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0094 begin`);
      const actual: string = insertInto('123456', 'A');
      logInfo(`insertInto(codeText="123456", text="A"): actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0094 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0095
     * @tc.name      VerifyCode_InsertInto_0095
     * @tc.desc      insertInto(codeText="123456", text="Sample Title 123") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0095 begin`);
      const actual: string = insertInto('123456', 'Sample Title 123');
      logInfo(`insertInto(codeText="123456", text="Sampl...: actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0095 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0096
     * @tc.name      VerifyCode_InsertInto_0096
     * @tc.desc      insertInto(codeText="123456", text="??") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0096 begin`);
      const actual: string = insertInto('123456', '\u4e2d\u6587');
      logInfo(`insertInto(codeText="123456", text="??"): actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0096 end`);
    });
  });
}
