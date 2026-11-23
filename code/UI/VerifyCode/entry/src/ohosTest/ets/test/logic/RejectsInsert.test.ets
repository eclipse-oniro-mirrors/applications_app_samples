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
import { rejectsInsert } from '../model/VerifyCodeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_VerifyCode]';
const BUNDLE: string = 'VerifyCode_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for rejectsInsert (50 cases). */
export default function rejectsInsertTest(): void {
  describe('RejectsInsertTest', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0001
     * @tc.name      VerifyCode_RejectsInsert_0001
     * @tc.desc      rejectsInsert(codeText=" ", text=" ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VerifyCode_RejectsInsert_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RejectsInsert_0001 begin`);
      const actual: boolean = rejectsInsert(' ', ' ');
      logInfo(`rejectsInsert(codeText=" ", text=" "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0001 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0002
     * @tc.name      VerifyCode_RejectsInsert_0002
     * @tc.desc      rejectsInsert(codeText=" ", text="") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('VerifyCode_RejectsInsert_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RejectsInsert_0002 begin`);
      const actual: boolean = rejectsInsert(' ', '');
      logInfo(`rejectsInsert(codeText=" ", text=""): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}RejectsInsert_0002 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0003
     * @tc.name      VerifyCode_RejectsInsert_0003
     * @tc.desc      rejectsInsert(codeText=" ", text=" x") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_RejectsInsert_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RejectsInsert_0003 begin`);
      const actual: boolean = rejectsInsert(' ', ' x');
      logInfo(`rejectsInsert(codeText=" ", text=" x"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0003 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0004
     * @tc.name      VerifyCode_RejectsInsert_0004
     * @tc.desc      rejectsInsert(codeText=" ", text="Hello") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_RejectsInsert_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RejectsInsert_0004 begin`);
      const actual: boolean = rejectsInsert(' ', 'Hello');
      logInfo(`rejectsInsert(codeText=" ", text="Hello"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0004 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0005
     * @tc.name      VerifyCode_RejectsInsert_0005
     * @tc.desc      rejectsInsert(codeText=" ", text="hello world") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_RejectsInsert_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RejectsInsert_0005 begin`);
      const actual: boolean = rejectsInsert(' ', 'hello world');
      logInfo(`rejectsInsert(codeText=" ", text="hello w...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0005 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0006
     * @tc.name      VerifyCode_RejectsInsert_0006
     * @tc.desc      rejectsInsert(codeText=" ", text="A") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_RejectsInsert_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RejectsInsert_0006 begin`);
      const actual: boolean = rejectsInsert(' ', 'A');
      logInfo(`rejectsInsert(codeText=" ", text="A"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0006 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0007
     * @tc.name      VerifyCode_RejectsInsert_0007
     * @tc.desc      rejectsInsert(codeText=" ", text="Sample Title 123") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_RejectsInsert_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RejectsInsert_0007 begin`);
      const actual: boolean = rejectsInsert(' ', 'Sample Title 123');
      logInfo(`rejectsInsert(codeText=" ", text="Sample ...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0007 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0008
     * @tc.name      VerifyCode_RejectsInsert_0008
     * @tc.desc      rejectsInsert(codeText=" ", text="??") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_RejectsInsert_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RejectsInsert_0008 begin`);
      const actual: boolean = rejectsInsert(' ', '\u4e2d\u6587');
      logInfo(`rejectsInsert(codeText=" ", text="??"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0008 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0009
     * @tc.name      VerifyCode_RejectsInsert_0009
     * @tc.desc      rejectsInsert(codeText=" ", text="a") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_RejectsInsert_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RejectsInsert_0009 begin`);
      const actual: boolean = rejectsInsert(' ', 'a');
      logInfo(`rejectsInsert(codeText=" ", text="a"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0009 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0010
     * @tc.name      VerifyCode_RejectsInsert_0010
     * @tc.desc      rejectsInsert(codeText=" ", text="abc") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_RejectsInsert_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RejectsInsert_0010 begin`);
      const actual: boolean = rejectsInsert(' ', 'abc');
      logInfo(`rejectsInsert(codeText=" ", text="abc"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0010 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0011
     * @tc.name      VerifyCode_RejectsInsert_0011
     * @tc.desc      rejectsInsert(codeText=" ", text="Hello World") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_RejectsInsert_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RejectsInsert_0011 begin`);
      const actual: boolean = rejectsInsert(' ', 'Hello World');
      logInfo(`rejectsInsert(codeText=" ", text="Hello W...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0011 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0012
     * @tc.name      VerifyCode_RejectsInsert_0012
     * @tc.desc      rejectsInsert(codeText=" ", text="123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_RejectsInsert_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RejectsInsert_0012 begin`);
      const actual: boolean = rejectsInsert(' ', '123');
      logInfo(`rejectsInsert(codeText=" ", text="123"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}RejectsInsert_0012 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0013
     * @tc.name      VerifyCode_RejectsInsert_0013
     * @tc.desc      rejectsInsert(codeText=" ", text="   ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_RejectsInsert_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RejectsInsert_0013 begin`);
      const actual: boolean = rejectsInsert(' ', '   ');
      logInfo(`rejectsInsert(codeText=" ", text="   "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}RejectsInsert_0013 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0014
     * @tc.name      VerifyCode_RejectsInsert_0014
     * @tc.desc      rejectsInsert(codeText=" ", text="  ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_RejectsInsert_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RejectsInsert_0014 begin`);
      const actual: boolean = rejectsInsert(' ', '  ');
      logInfo(`rejectsInsert(codeText=" ", text="  "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}RejectsInsert_0014 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0015
     * @tc.name      VerifyCode_RejectsInsert_0015
     * @tc.desc      rejectsInsert(codeText=" ", text=" _1") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_RejectsInsert_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RejectsInsert_0015 begin`);
      const actual: boolean = rejectsInsert(' ', ' _1');
      logInfo(`rejectsInsert(codeText=" ", text=" _1"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0015 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0016
     * @tc.name      VerifyCode_RejectsInsert_0016
     * @tc.desc      rejectsInsert(codeText=" ", text="x ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_RejectsInsert_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RejectsInsert_0016 begin`);
      const actual: boolean = rejectsInsert(' ', 'x ');
      logInfo(`rejectsInsert(codeText=" ", text="x "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0016 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0017
     * @tc.name      VerifyCode_RejectsInsert_0017
     * @tc.desc      rejectsInsert(codeText=" ", text="  x ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_RejectsInsert_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RejectsInsert_0017 begin`);
      const actual: boolean = rejectsInsert(' ', '  x ');
      logInfo(`rejectsInsert(codeText=" ", text="  x "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0017 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0018
     * @tc.name      VerifyCode_RejectsInsert_0018
     * @tc.desc      rejectsInsert(codeText=" ", text=" x x") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_RejectsInsert_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RejectsInsert_0018 begin`);
      const actual: boolean = rejectsInsert(' ', ' x x');
      logInfo(`rejectsInsert(codeText=" ", text=" x x"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0018 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0019
     * @tc.name      VerifyCode_RejectsInsert_0019
     * @tc.desc      rejectsInsert(codeText=" ", text=" x_1") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_RejectsInsert_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RejectsInsert_0019 begin`);
      const actual: boolean = rejectsInsert(' ', ' x_1');
      logInfo(`rejectsInsert(codeText=" ", text=" x_1"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0019 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0020
     * @tc.name      VerifyCode_RejectsInsert_0020
     * @tc.desc      rejectsInsert(codeText=" ", text="x x") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_RejectsInsert_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RejectsInsert_0020 begin`);
      const actual: boolean = rejectsInsert(' ', 'x x');
      logInfo(`rejectsInsert(codeText=" ", text="x x"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0020 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0021
     * @tc.name      VerifyCode_RejectsInsert_0021
     * @tc.desc      rejectsInsert(codeText=" ", text=" Hello ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_RejectsInsert_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RejectsInsert_0021 begin`);
      const actual: boolean = rejectsInsert(' ', ' Hello ');
      logInfo(`rejectsInsert(codeText=" ", text=" Hello "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0021 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0022
     * @tc.name      VerifyCode_RejectsInsert_0022
     * @tc.desc      rejectsInsert(codeText=" ", text="HelloHello") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_RejectsInsert_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RejectsInsert_0022 begin`);
      const actual: boolean = rejectsInsert(' ', 'HelloHello');
      logInfo(`rejectsInsert(codeText=" ", text="HelloHe...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0022 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0023
     * @tc.name      VerifyCode_RejectsInsert_0023
     * @tc.desc      rejectsInsert(codeText=" ", text="Hello_1") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_RejectsInsert_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RejectsInsert_0023 begin`);
      const actual: boolean = rejectsInsert(' ', 'Hello_1');
      logInfo(`rejectsInsert(codeText=" ", text="Hello_1"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0023 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0024
     * @tc.name      VerifyCode_RejectsInsert_0024
     * @tc.desc      rejectsInsert(codeText=" ", text="xHello") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_RejectsInsert_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RejectsInsert_0024 begin`);
      const actual: boolean = rejectsInsert(' ', 'xHello');
      logInfo(`rejectsInsert(codeText=" ", text="xHello"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0024 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0025
     * @tc.name      VerifyCode_RejectsInsert_0025
     * @tc.desc      rejectsInsert(codeText=" ", text=" hello world ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_RejectsInsert_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RejectsInsert_0025 begin`);
      const actual: boolean = rejectsInsert(' ', ' hello world ');
      logInfo(`rejectsInsert(codeText=" ", text=" hello ...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0025 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0026
     * @tc.name      VerifyCode_RejectsInsert_0026
     * @tc.desc      rejectsInsert(codeText=" ", text="hello worldhello world") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_RejectsInsert_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RejectsInsert_0026 begin`);
      const actual: boolean = rejectsInsert(' ', 'hello worldhello world');
      logInfo(`rejectsInsert(codeText=" ", text="hello w...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0026 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0027
     * @tc.name      VerifyCode_RejectsInsert_0027
     * @tc.desc      rejectsInsert(codeText=" ", text="hello world_1") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_RejectsInsert_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RejectsInsert_0027 begin`);
      const actual: boolean = rejectsInsert(' ', 'hello world_1');
      logInfo(`rejectsInsert(codeText=" ", text="hello w...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0027 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0028
     * @tc.name      VerifyCode_RejectsInsert_0028
     * @tc.desc      rejectsInsert(codeText=" ", text="xhello world") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_RejectsInsert_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RejectsInsert_0028 begin`);
      const actual: boolean = rejectsInsert(' ', 'xhello world');
      logInfo(`rejectsInsert(codeText=" ", text="xhello ...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0028 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0029
     * @tc.name      VerifyCode_RejectsInsert_0029
     * @tc.desc      rejectsInsert(codeText=" ", text=" A ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_RejectsInsert_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RejectsInsert_0029 begin`);
      const actual: boolean = rejectsInsert(' ', ' A ');
      logInfo(`rejectsInsert(codeText=" ", text=" A "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0029 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0030
     * @tc.name      VerifyCode_RejectsInsert_0030
     * @tc.desc      rejectsInsert(codeText=" ", text="AA") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_RejectsInsert_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RejectsInsert_0030 begin`);
      const actual: boolean = rejectsInsert(' ', 'AA');
      logInfo(`rejectsInsert(codeText=" ", text="AA"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0030 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0031
     * @tc.name      VerifyCode_RejectsInsert_0031
     * @tc.desc      rejectsInsert(codeText=" ", text="A_1") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_RejectsInsert_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RejectsInsert_0031 begin`);
      const actual: boolean = rejectsInsert(' ', 'A_1');
      logInfo(`rejectsInsert(codeText=" ", text="A_1"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0031 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0032
     * @tc.name      VerifyCode_RejectsInsert_0032
     * @tc.desc      rejectsInsert(codeText=" ", text="xA") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_RejectsInsert_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RejectsInsert_0032 begin`);
      const actual: boolean = rejectsInsert(' ', 'xA');
      logInfo(`rejectsInsert(codeText=" ", text="xA"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0032 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0033
     * @tc.name      VerifyCode_RejectsInsert_0033
     * @tc.desc      rejectsInsert(codeText=" ", text=" Sample Title 123 ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_RejectsInsert_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RejectsInsert_0033 begin`);
      const actual: boolean = rejectsInsert(' ', ' Sample Title 123 ');
      logInfo(`rejectsInsert(codeText=" ", text=" Sample...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0033 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0034
     * @tc.name      VerifyCode_RejectsInsert_0034
     * @tc.desc      rejectsInsert(codeText=" ", text="Sample Title 123Sample Title 123") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_RejectsInsert_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RejectsInsert_0034 begin`);
      const actual: boolean = rejectsInsert(' ', 'Sample Title 123Sample Title 123');
      logInfo(`rejectsInsert(codeText=" ", text="Sample ...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0034 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0035
     * @tc.name      VerifyCode_RejectsInsert_0035
     * @tc.desc      rejectsInsert(codeText=" ", text="Sample Title 123_1") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_RejectsInsert_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RejectsInsert_0035 begin`);
      const actual: boolean = rejectsInsert(' ', 'Sample Title 123_1');
      logInfo(`rejectsInsert(codeText=" ", text="Sample ...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0035 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0036
     * @tc.name      VerifyCode_RejectsInsert_0036
     * @tc.desc      rejectsInsert(codeText=" ", text="xSample Title 123") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_RejectsInsert_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RejectsInsert_0036 begin`);
      const actual: boolean = rejectsInsert(' ', 'xSample Title 123');
      logInfo(`rejectsInsert(codeText=" ", text="xSample...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0036 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0037
     * @tc.name      VerifyCode_RejectsInsert_0037
     * @tc.desc      rejectsInsert(codeText=" ", text=" ?? ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_RejectsInsert_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RejectsInsert_0037 begin`);
      const actual: boolean = rejectsInsert(' ', ' \u4e2d\u6587 ');
      logInfo(`rejectsInsert(codeText=" ", text=" ?? "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0037 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0038
     * @tc.name      VerifyCode_RejectsInsert_0038
     * @tc.desc      rejectsInsert(codeText=" ", text="????") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_RejectsInsert_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RejectsInsert_0038 begin`);
      const actual: boolean = rejectsInsert(' ', '\u4e2d\u6587\u4e2d\u6587');
      logInfo(`rejectsInsert(codeText=" ", text="????"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0038 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0039
     * @tc.name      VerifyCode_RejectsInsert_0039
     * @tc.desc      rejectsInsert(codeText=" ", text="??_1") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_RejectsInsert_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RejectsInsert_0039 begin`);
      const actual: boolean = rejectsInsert(' ', '\u4e2d\u6587_1');
      logInfo(`rejectsInsert(codeText=" ", text="??_1"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0039 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0040
     * @tc.name      VerifyCode_RejectsInsert_0040
     * @tc.desc      rejectsInsert(codeText=" ", text="x??") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_RejectsInsert_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RejectsInsert_0040 begin`);
      const actual: boolean = rejectsInsert(' ', 'x\u4e2d\u6587');
      logInfo(`rejectsInsert(codeText=" ", text="x??"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0040 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0041
     * @tc.name      VerifyCode_RejectsInsert_0041
     * @tc.desc      rejectsInsert(codeText=" ", text=" a ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_RejectsInsert_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RejectsInsert_0041 begin`);
      const actual: boolean = rejectsInsert(' ', ' a ');
      logInfo(`rejectsInsert(codeText=" ", text=" a "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0041 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0042
     * @tc.name      VerifyCode_RejectsInsert_0042
     * @tc.desc      rejectsInsert(codeText=" ", text="aa") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_RejectsInsert_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RejectsInsert_0042 begin`);
      const actual: boolean = rejectsInsert(' ', 'aa');
      logInfo(`rejectsInsert(codeText=" ", text="aa"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0042 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0043
     * @tc.name      VerifyCode_RejectsInsert_0043
     * @tc.desc      rejectsInsert(codeText=" ", text="a_1") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_RejectsInsert_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RejectsInsert_0043 begin`);
      const actual: boolean = rejectsInsert(' ', 'a_1');
      logInfo(`rejectsInsert(codeText=" ", text="a_1"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0043 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0044
     * @tc.name      VerifyCode_RejectsInsert_0044
     * @tc.desc      rejectsInsert(codeText=" ", text="xa") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_RejectsInsert_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RejectsInsert_0044 begin`);
      const actual: boolean = rejectsInsert(' ', 'xa');
      logInfo(`rejectsInsert(codeText=" ", text="xa"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0044 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0045
     * @tc.name      VerifyCode_RejectsInsert_0045
     * @tc.desc      rejectsInsert(codeText=" ", text=" abc ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_RejectsInsert_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RejectsInsert_0045 begin`);
      const actual: boolean = rejectsInsert(' ', ' abc ');
      logInfo(`rejectsInsert(codeText=" ", text=" abc "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0045 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0046
     * @tc.name      VerifyCode_RejectsInsert_0046
     * @tc.desc      rejectsInsert(codeText=" ", text="abcabc") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_RejectsInsert_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RejectsInsert_0046 begin`);
      const actual: boolean = rejectsInsert(' ', 'abcabc');
      logInfo(`rejectsInsert(codeText=" ", text="abcabc"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0046 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0047
     * @tc.name      VerifyCode_RejectsInsert_0047
     * @tc.desc      rejectsInsert(codeText=" ", text="abc_1") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('VerifyCode_RejectsInsert_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}RejectsInsert_0047 begin`);
      const actual: boolean = rejectsInsert(' ', 'abc_1');
      logInfo(`rejectsInsert(codeText=" ", text="abc_1"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0047 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0048
     * @tc.name      VerifyCode_RejectsInsert_0048
     * @tc.desc      rejectsInsert(codeText=" ", text="xabc") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_RejectsInsert_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RejectsInsert_0048 begin`);
      const actual: boolean = rejectsInsert(' ', 'xabc');
      logInfo(`rejectsInsert(codeText=" ", text="xabc"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0048 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0049
     * @tc.name      VerifyCode_RejectsInsert_0049
     * @tc.desc      rejectsInsert(codeText=" x", text=" ") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_RejectsInsert_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RejectsInsert_0049 begin`);
      const actual: boolean = rejectsInsert(' x', ' ');
      logInfo(`rejectsInsert(codeText=" x", text=" "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0049 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_REJECTS_INSERT_0050
     * @tc.name      VerifyCode_RejectsInsert_0050
     * @tc.desc      rejectsInsert(codeText=" x", text=" x") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_RejectsInsert_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RejectsInsert_0050 begin`);
      const actual: boolean = rejectsInsert(' x', ' x');
      logInfo(`rejectsInsert(codeText=" x", text=" x"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RejectsInsert_0050 end`);
    });
  });
}
