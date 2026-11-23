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
export default function insertInto6Test(): void {
  describe('InsertInto6Test', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0481
     * @tc.name      VerifyCode_InsertInto_0481
     * @tc.desc      insertInto(codeText="Hello World", text="xSample Title 123") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0481', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0481 begin`);
      const actual: string = insertInto('Hello World', 'xSample Title 123');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0481 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0482
     * @tc.name      VerifyCode_InsertInto_0482
     * @tc.desc      insertInto(codeText="Hello World", text=" ?? ") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0482', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0482 begin`);
      const actual: string = insertInto('Hello World', ' \u4e2d\u6587 ');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0482 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0483
     * @tc.name      VerifyCode_InsertInto_0483
     * @tc.desc      insertInto(codeText="Hello World", text="????") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0483', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0483 begin`);
      const actual: string = insertInto('Hello World', '\u4e2d\u6587\u4e2d\u6587');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0483 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0484
     * @tc.name      VerifyCode_InsertInto_0484
     * @tc.desc      insertInto(codeText="Hello World", text="??_1") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0484', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0484 begin`);
      const actual: string = insertInto('Hello World', '\u4e2d\u6587_1');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0484 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0485
     * @tc.name      VerifyCode_InsertInto_0485
     * @tc.desc      insertInto(codeText="Hello World", text="x??") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0485', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0485 begin`);
      const actual: string = insertInto('Hello World', 'x\u4e2d\u6587');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0485 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0486
     * @tc.name      VerifyCode_InsertInto_0486
     * @tc.desc      insertInto(codeText="Hello World", text=" a ") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0486', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0486 begin`);
      const actual: string = insertInto('Hello World', ' a ');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0486 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0487
     * @tc.name      VerifyCode_InsertInto_0487
     * @tc.desc      insertInto(codeText="Hello World", text="aa") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0487', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0487 begin`);
      const actual: string = insertInto('Hello World', 'aa');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0487 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0488
     * @tc.name      VerifyCode_InsertInto_0488
     * @tc.desc      insertInto(codeText="Hello World", text="a_1") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0488', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0488 begin`);
      const actual: string = insertInto('Hello World', 'a_1');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0488 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0489
     * @tc.name      VerifyCode_InsertInto_0489
     * @tc.desc      insertInto(codeText="Hello World", text="xa") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0489', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0489 begin`);
      const actual: string = insertInto('Hello World', 'xa');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0489 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0490
     * @tc.name      VerifyCode_InsertInto_0490
     * @tc.desc      insertInto(codeText="Hello World", text=" abc ") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0490', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0490 begin`);
      const actual: string = insertInto('Hello World', ' abc ');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0490 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0491
     * @tc.name      VerifyCode_InsertInto_0491
     * @tc.desc      insertInto(codeText="Hello World", text="abcabc") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0491', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0491 begin`);
      const actual: string = insertInto('Hello World', 'abcabc');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0491 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0492
     * @tc.name      VerifyCode_InsertInto_0492
     * @tc.desc      insertInto(codeText="Hello World", text="abc_1") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0492', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0492 begin`);
      const actual: string = insertInto('Hello World', 'abc_1');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0492 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0493
     * @tc.name      VerifyCode_InsertInto_0493
     * @tc.desc      insertInto(codeText="Hello World", text="xabc") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0493', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0493 begin`);
      const actual: string = insertInto('Hello World', 'xabc');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0493 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0494
     * @tc.name      VerifyCode_InsertInto_0494
     * @tc.desc      insertInto(codeText="Hello World", text=" Hello World ") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0494', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0494 begin`);
      const actual: string = insertInto('Hello World', ' Hello World ');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0494 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0495
     * @tc.name      VerifyCode_InsertInto_0495
     * @tc.desc      insertInto(codeText="Hello World", text="Hello WorldHello World") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0495', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0495 begin`);
      const actual: string = insertInto('Hello World', 'Hello WorldHello World');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0495 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0496
     * @tc.name      VerifyCode_InsertInto_0496
     * @tc.desc      insertInto(codeText="Hello World", text="Hello World_1") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0496', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0496 begin`);
      const actual: string = insertInto('Hello World', 'Hello World_1');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0496 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0497
     * @tc.name      VerifyCode_InsertInto_0497
     * @tc.desc      insertInto(codeText="Hello World", text="xHello World") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0497', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0497 begin`);
      const actual: string = insertInto('Hello World', 'xHello World');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0497 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0498
     * @tc.name      VerifyCode_InsertInto_0498
     * @tc.desc      insertInto(codeText="Hello World", text=" 123 ") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0498', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0498 begin`);
      const actual: string = insertInto('Hello World', ' 123 ');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0498 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0499
     * @tc.name      VerifyCode_InsertInto_0499
     * @tc.desc      insertInto(codeText=" ", text="hello world") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0499', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0499 begin`);
      const actual: string = insertInto(' ', 'hello world');
      logInfo(`insertInto(codeText=" ", text="hello world"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0499 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0500
     * @tc.name      VerifyCode_InsertInto_0500
     * @tc.desc      insertInto(codeText=" ", text="") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0500 begin`);
      const actual: string = insertInto(' ', '');
      logInfo(`insertInto(codeText=" ", text=""): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0500 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0501
     * @tc.name      VerifyCode_InsertInto_0501
     * @tc.desc      insertInto(codeText=" ", text=" ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0501', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0501 begin`);
      const actual: string = insertInto(' ', ' ');
      logInfo(`insertInto(codeText=" ", text=" "): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0501 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0502
     * @tc.name      VerifyCode_InsertInto_0502
     * @tc.desc      insertInto(codeText=" ", text="A") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0502', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0502 begin`);
      const actual: string = insertInto(' ', 'A');
      logInfo(`insertInto(codeText=" ", text="A"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0502 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0503
     * @tc.name      VerifyCode_InsertInto_0503
     * @tc.desc      insertInto(codeText=" ", text="Sample Title 123") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0503', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0503 begin`);
      const actual: string = insertInto(' ', 'Sample Title 123');
      logInfo(`insertInto(codeText=" ", text="Sample Tit...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0503 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0504
     * @tc.name      VerifyCode_InsertInto_0504
     * @tc.desc      insertInto(codeText=" ", text="??") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0504', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0504 begin`);
      const actual: string = insertInto(' ', '\u4e2d\u6587');
      logInfo(`insertInto(codeText=" ", text="??"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0504 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0505
     * @tc.name      VerifyCode_InsertInto_0505
     * @tc.desc      insertInto(codeText=" ", text="a") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0505', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0505 begin`);
      const actual: string = insertInto(' ', 'a');
      logInfo(`insertInto(codeText=" ", text="a"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0505 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0506
     * @tc.name      VerifyCode_InsertInto_0506
     * @tc.desc      insertInto(codeText=" ", text="abc") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0506', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0506 begin`);
      const actual: string = insertInto(' ', 'abc');
      logInfo(`insertInto(codeText=" ", text="abc"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0506 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0507
     * @tc.name      VerifyCode_InsertInto_0507
     * @tc.desc      insertInto(codeText=" ", text="Hello World") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0507', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0507 begin`);
      const actual: string = insertInto(' ', 'Hello World');
      logInfo(`insertInto(codeText=" ", text="Hello World"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0507 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0508
     * @tc.name      VerifyCode_InsertInto_0508
     * @tc.desc      insertInto(codeText=" ", text=" Hello ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0508', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0508 begin`);
      const actual: string = insertInto(' ', ' Hello ');
      logInfo(`insertInto(codeText=" ", text=" Hello "): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0508 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0509
     * @tc.name      VerifyCode_InsertInto_0509
     * @tc.desc      insertInto(codeText=" ", text="HelloHello") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0509', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0509 begin`);
      const actual: string = insertInto(' ', 'HelloHello');
      logInfo(`insertInto(codeText=" ", text="HelloHello"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0509 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0510
     * @tc.name      VerifyCode_InsertInto_0510
     * @tc.desc      insertInto(codeText=" ", text="Hello_1") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0510 begin`);
      const actual: string = insertInto(' ', 'Hello_1');
      logInfo(`insertInto(codeText=" ", text="Hello_1"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0510 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0511
     * @tc.name      VerifyCode_InsertInto_0511
     * @tc.desc      insertInto(codeText=" ", text="xHello") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0511', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0511 begin`);
      const actual: string = insertInto(' ', 'xHello');
      logInfo(`insertInto(codeText=" ", text="xHello"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0511 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0512
     * @tc.name      VerifyCode_InsertInto_0512
     * @tc.desc      insertInto(codeText=" ", text=" hello world ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0512', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0512 begin`);
      const actual: string = insertInto(' ', ' hello world ');
      logInfo(`insertInto(codeText=" ", text=" hello wor...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0512 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0513
     * @tc.name      VerifyCode_InsertInto_0513
     * @tc.desc      insertInto(codeText=" ", text="hello worldhello world") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0513', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0513 begin`);
      const actual: string = insertInto(' ', 'hello worldhello world');
      logInfo(`insertInto(codeText=" ", text="hello worl...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0513 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0514
     * @tc.name      VerifyCode_InsertInto_0514
     * @tc.desc      insertInto(codeText=" ", text="hello world_1") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0514', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0514 begin`);
      const actual: string = insertInto(' ', 'hello world_1');
      logInfo(`insertInto(codeText=" ", text="hello worl...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0514 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0515
     * @tc.name      VerifyCode_InsertInto_0515
     * @tc.desc      insertInto(codeText=" ", text="xhello world") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0515', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0515 begin`);
      const actual: string = insertInto(' ', 'xhello world');
      logInfo(`insertInto(codeText=" ", text="xhello wor...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0515 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0516
     * @tc.name      VerifyCode_InsertInto_0516
     * @tc.desc      insertInto(codeText=" ", text="  ") returns "   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0516', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0516 begin`);
      const actual: string = insertInto(' ', '  ');
      logInfo(`insertInto(codeText=" ", text="  "): actual=${actual}`);
      expect(actual).assertEqual('   ');
      logInfo(`${BUNDLE}InsertInto_0516 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0517
     * @tc.name      VerifyCode_InsertInto_0517
     * @tc.desc      insertInto(codeText=" ", text=" _1") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0517', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0517 begin`);
      const actual: string = insertInto(' ', ' _1');
      logInfo(`insertInto(codeText=" ", text=" _1"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0517 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0518
     * @tc.name      VerifyCode_InsertInto_0518
     * @tc.desc      insertInto(codeText=" ", text="x ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0518', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0518 begin`);
      const actual: string = insertInto(' ', 'x ');
      logInfo(`insertInto(codeText=" ", text="x "): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0518 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0519
     * @tc.name      VerifyCode_InsertInto_0519
     * @tc.desc      insertInto(codeText=" ", text=" A ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0519', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0519 begin`);
      const actual: string = insertInto(' ', ' A ');
      logInfo(`insertInto(codeText=" ", text=" A "): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0519 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0520
     * @tc.name      VerifyCode_InsertInto_0520
     * @tc.desc      insertInto(codeText=" ", text="AA") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0520', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0520 begin`);
      const actual: string = insertInto(' ', 'AA');
      logInfo(`insertInto(codeText=" ", text="AA"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0520 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0521
     * @tc.name      VerifyCode_InsertInto_0521
     * @tc.desc      insertInto(codeText=" ", text="A_1") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0521', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0521 begin`);
      const actual: string = insertInto(' ', 'A_1');
      logInfo(`insertInto(codeText=" ", text="A_1"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0521 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0522
     * @tc.name      VerifyCode_InsertInto_0522
     * @tc.desc      insertInto(codeText=" ", text="xA") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0522', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0522 begin`);
      const actual: string = insertInto(' ', 'xA');
      logInfo(`insertInto(codeText=" ", text="xA"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0522 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0523
     * @tc.name      VerifyCode_InsertInto_0523
     * @tc.desc      insertInto(codeText=" ", text=" Sample Title 123 ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0523', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0523 begin`);
      const actual: string = insertInto(' ', ' Sample Title 123 ');
      logInfo(`insertInto(codeText=" ", text=" Sample Ti...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0523 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0524
     * @tc.name      VerifyCode_InsertInto_0524
     * @tc.desc      insertInto(codeText=" ", text="Sample Title 123Sample Title 123") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0524', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0524 begin`);
      const actual: string = insertInto(' ', 'Sample Title 123Sample Title 123');
      logInfo(`insertInto(codeText=" ", text="Sample Tit...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0524 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0525
     * @tc.name      VerifyCode_InsertInto_0525
     * @tc.desc      insertInto(codeText=" ", text="Sample Title 123_1") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0525', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0525 begin`);
      const actual: string = insertInto(' ', 'Sample Title 123_1');
      logInfo(`insertInto(codeText=" ", text="Sample Tit...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0525 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0526
     * @tc.name      VerifyCode_InsertInto_0526
     * @tc.desc      insertInto(codeText=" ", text="xSample Title 123") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0526', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0526 begin`);
      const actual: string = insertInto(' ', 'xSample Title 123');
      logInfo(`insertInto(codeText=" ", text="xSample Ti...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0526 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0527
     * @tc.name      VerifyCode_InsertInto_0527
     * @tc.desc      insertInto(codeText=" ", text=" ?? ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0527', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0527 begin`);
      const actual: string = insertInto(' ', ' \u4e2d\u6587 ');
      logInfo(`insertInto(codeText=" ", text=" ?? "): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0527 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0528
     * @tc.name      VerifyCode_InsertInto_0528
     * @tc.desc      insertInto(codeText=" ", text="????") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0528', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0528 begin`);
      const actual: string = insertInto(' ', '\u4e2d\u6587\u4e2d\u6587');
      logInfo(`insertInto(codeText=" ", text="????"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0528 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0529
     * @tc.name      VerifyCode_InsertInto_0529
     * @tc.desc      insertInto(codeText=" ", text="??_1") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0529', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0529 begin`);
      const actual: string = insertInto(' ', '\u4e2d\u6587_1');
      logInfo(`insertInto(codeText=" ", text="??_1"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0529 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0530
     * @tc.name      VerifyCode_InsertInto_0530
     * @tc.desc      insertInto(codeText=" ", text="x??") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0530', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0530 begin`);
      const actual: string = insertInto(' ', 'x\u4e2d\u6587');
      logInfo(`insertInto(codeText=" ", text="x??"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0530 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0531
     * @tc.name      VerifyCode_InsertInto_0531
     * @tc.desc      insertInto(codeText=" ", text=" a ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0531', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0531 begin`);
      const actual: string = insertInto(' ', ' a ');
      logInfo(`insertInto(codeText=" ", text=" a "): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0531 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0532
     * @tc.name      VerifyCode_InsertInto_0532
     * @tc.desc      insertInto(codeText=" ", text="aa") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0532', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0532 begin`);
      const actual: string = insertInto(' ', 'aa');
      logInfo(`insertInto(codeText=" ", text="aa"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0532 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0533
     * @tc.name      VerifyCode_InsertInto_0533
     * @tc.desc      insertInto(codeText=" ", text="a_1") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0533', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0533 begin`);
      const actual: string = insertInto(' ', 'a_1');
      logInfo(`insertInto(codeText=" ", text="a_1"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0533 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0534
     * @tc.name      VerifyCode_InsertInto_0534
     * @tc.desc      insertInto(codeText=" ", text="xa") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0534', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0534 begin`);
      const actual: string = insertInto(' ', 'xa');
      logInfo(`insertInto(codeText=" ", text="xa"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0534 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0535
     * @tc.name      VerifyCode_InsertInto_0535
     * @tc.desc      insertInto(codeText=" ", text=" abc ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0535', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0535 begin`);
      const actual: string = insertInto(' ', ' abc ');
      logInfo(`insertInto(codeText=" ", text=" abc "): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0535 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0536
     * @tc.name      VerifyCode_InsertInto_0536
     * @tc.desc      insertInto(codeText=" ", text="abcabc") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0536', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0536 begin`);
      const actual: string = insertInto(' ', 'abcabc');
      logInfo(`insertInto(codeText=" ", text="abcabc"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0536 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0537
     * @tc.name      VerifyCode_InsertInto_0537
     * @tc.desc      insertInto(codeText=" ", text="abc_1") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0537', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0537 begin`);
      const actual: string = insertInto(' ', 'abc_1');
      logInfo(`insertInto(codeText=" ", text="abc_1"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0537 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0538
     * @tc.name      VerifyCode_InsertInto_0538
     * @tc.desc      insertInto(codeText=" ", text="xabc") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0538', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0538 begin`);
      const actual: string = insertInto(' ', 'xabc');
      logInfo(`insertInto(codeText=" ", text="xabc"): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0538 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0539
     * @tc.name      VerifyCode_InsertInto_0539
     * @tc.desc      insertInto(codeText=" ", text=" Hello World ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0539', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0539 begin`);
      const actual: string = insertInto(' ', ' Hello World ');
      logInfo(`insertInto(codeText=" ", text=" Hello Wor...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0539 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0540
     * @tc.name      VerifyCode_InsertInto_0540
     * @tc.desc      insertInto(codeText=" ", text="Hello WorldHello World") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0540', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0540 begin`);
      const actual: string = insertInto(' ', 'Hello WorldHello World');
      logInfo(`insertInto(codeText=" ", text="Hello Worl...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0540 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0541
     * @tc.name      VerifyCode_InsertInto_0541
     * @tc.desc      insertInto(codeText=" ", text="Hello World_1") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0541', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0541 begin`);
      const actual: string = insertInto(' ', 'Hello World_1');
      logInfo(`insertInto(codeText=" ", text="Hello Worl...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0541 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0542
     * @tc.name      VerifyCode_InsertInto_0542
     * @tc.desc      insertInto(codeText=" ", text="xHello World") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0542', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0542 begin`);
      const actual: string = insertInto(' ', 'xHello World');
      logInfo(`insertInto(codeText=" ", text="xHello Wor...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}InsertInto_0542 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0543
     * @tc.name      VerifyCode_InsertInto_0543
     * @tc.desc      insertInto(codeText="123", text="Hello") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0543', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0543 begin`);
      const actual: string = insertInto('123', 'Hello');
      logInfo(`insertInto(codeText="123", text="Hello"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0543 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0544
     * @tc.name      VerifyCode_InsertInto_0544
     * @tc.desc      insertInto(codeText="123", text="hello world") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0544', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0544 begin`);
      const actual: string = insertInto('123', 'hello world');
      logInfo(`insertInto(codeText="123", text="hello wo...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0544 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0545
     * @tc.name      VerifyCode_InsertInto_0545
     * @tc.desc      insertInto(codeText="123", text="") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0545', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0545 begin`);
      const actual: string = insertInto('123', '');
      logInfo(`insertInto(codeText="123", text=""): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0545 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0546
     * @tc.name      VerifyCode_InsertInto_0546
     * @tc.desc      insertInto(codeText="123", text=" ") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0546', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0546 begin`);
      const actual: string = insertInto('123', ' ');
      logInfo(`insertInto(codeText="123", text=" "): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0546 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0547
     * @tc.name      VerifyCode_InsertInto_0547
     * @tc.desc      insertInto(codeText="123", text="A") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0547', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0547 begin`);
      const actual: string = insertInto('123', 'A');
      logInfo(`insertInto(codeText="123", text="A"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0547 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0548
     * @tc.name      VerifyCode_InsertInto_0548
     * @tc.desc      insertInto(codeText="123", text="Sample Title 123") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0548', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0548 begin`);
      const actual: string = insertInto('123', 'Sample Title 123');
      logInfo(`insertInto(codeText="123", text="Sample T...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0548 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0549
     * @tc.name      VerifyCode_InsertInto_0549
     * @tc.desc      insertInto(codeText="123", text="??") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0549', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0549 begin`);
      const actual: string = insertInto('123', '\u4e2d\u6587');
      logInfo(`insertInto(codeText="123", text="??"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0549 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0550
     * @tc.name      VerifyCode_InsertInto_0550
     * @tc.desc      insertInto(codeText="123", text="a") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0550', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0550 begin`);
      const actual: string = insertInto('123', 'a');
      logInfo(`insertInto(codeText="123", text="a"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0550 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0551
     * @tc.name      VerifyCode_InsertInto_0551
     * @tc.desc      insertInto(codeText="123", text="abc") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0551', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0551 begin`);
      const actual: string = insertInto('123', 'abc');
      logInfo(`insertInto(codeText="123", text="abc"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0551 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0552
     * @tc.name      VerifyCode_InsertInto_0552
     * @tc.desc      insertInto(codeText="123", text="Hello World") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0552', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0552 begin`);
      const actual: string = insertInto('123', 'Hello World');
      logInfo(`insertInto(codeText="123", text="Hello Wo...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0552 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0553
     * @tc.name      VerifyCode_InsertInto_0553
     * @tc.desc      insertInto(codeText="123", text=" Hello ") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0553', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0553 begin`);
      const actual: string = insertInto('123', ' Hello ');
      logInfo(`insertInto(codeText="123", text=" Hello "): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0553 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0554
     * @tc.name      VerifyCode_InsertInto_0554
     * @tc.desc      insertInto(codeText="123", text="HelloHello") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0554', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0554 begin`);
      const actual: string = insertInto('123', 'HelloHello');
      logInfo(`insertInto(codeText="123", text="HelloHel...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0554 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0555
     * @tc.name      VerifyCode_InsertInto_0555
     * @tc.desc      insertInto(codeText="123", text="Hello_1") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0555', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0555 begin`);
      const actual: string = insertInto('123', 'Hello_1');
      logInfo(`insertInto(codeText="123", text="Hello_1"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0555 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0556
     * @tc.name      VerifyCode_InsertInto_0556
     * @tc.desc      insertInto(codeText="123", text="xHello") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0556', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0556 begin`);
      const actual: string = insertInto('123', 'xHello');
      logInfo(`insertInto(codeText="123", text="xHello"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0556 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0557
     * @tc.name      VerifyCode_InsertInto_0557
     * @tc.desc      insertInto(codeText="123", text=" hello world ") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0557', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0557 begin`);
      const actual: string = insertInto('123', ' hello world ');
      logInfo(`insertInto(codeText="123", text=" hello w...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0557 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0558
     * @tc.name      VerifyCode_InsertInto_0558
     * @tc.desc      insertInto(codeText="123", text="hello worldhello world") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0558', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0558 begin`);
      const actual: string = insertInto('123', 'hello worldhello world');
      logInfo(`insertInto(codeText="123", text="hello wo...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0558 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0559
     * @tc.name      VerifyCode_InsertInto_0559
     * @tc.desc      insertInto(codeText="123", text="hello world_1") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0559', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0559 begin`);
      const actual: string = insertInto('123', 'hello world_1');
      logInfo(`insertInto(codeText="123", text="hello wo...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0559 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0560
     * @tc.name      VerifyCode_InsertInto_0560
     * @tc.desc      insertInto(codeText="123", text="xhello world") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0560', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0560 begin`);
      const actual: string = insertInto('123', 'xhello world');
      logInfo(`insertInto(codeText="123", text="xhello w...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0560 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0561
     * @tc.name      VerifyCode_InsertInto_0561
     * @tc.desc      insertInto(codeText="123", text=" _1") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0561', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0561 begin`);
      const actual: string = insertInto('123', ' _1');
      logInfo(`insertInto(codeText="123", text=" _1"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0561 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0562
     * @tc.name      VerifyCode_InsertInto_0562
     * @tc.desc      insertInto(codeText="123", text="x ") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0562', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0562 begin`);
      const actual: string = insertInto('123', 'x ');
      logInfo(`insertInto(codeText="123", text="x "): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0562 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0563
     * @tc.name      VerifyCode_InsertInto_0563
     * @tc.desc      insertInto(codeText="123", text=" A ") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0563', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0563 begin`);
      const actual: string = insertInto('123', ' A ');
      logInfo(`insertInto(codeText="123", text=" A "): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0563 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0564
     * @tc.name      VerifyCode_InsertInto_0564
     * @tc.desc      insertInto(codeText="123", text="AA") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0564', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0564 begin`);
      const actual: string = insertInto('123', 'AA');
      logInfo(`insertInto(codeText="123", text="AA"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0564 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0565
     * @tc.name      VerifyCode_InsertInto_0565
     * @tc.desc      insertInto(codeText="123", text="A_1") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0565', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0565 begin`);
      const actual: string = insertInto('123', 'A_1');
      logInfo(`insertInto(codeText="123", text="A_1"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0565 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0566
     * @tc.name      VerifyCode_InsertInto_0566
     * @tc.desc      insertInto(codeText="123", text="xA") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0566', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0566 begin`);
      const actual: string = insertInto('123', 'xA');
      logInfo(`insertInto(codeText="123", text="xA"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0566 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0567
     * @tc.name      VerifyCode_InsertInto_0567
     * @tc.desc      insertInto(codeText="123", text=" Sample Title 123 ") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0567', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0567 begin`);
      const actual: string = insertInto('123', ' Sample Title 123 ');
      logInfo(`insertInto(codeText="123", text=" Sample ...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0567 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0568
     * @tc.name      VerifyCode_InsertInto_0568
     * @tc.desc      insertInto(codeText="123", text="Sample Title 123Sample Title 123") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0568', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0568 begin`);
      const actual: string = insertInto('123', 'Sample Title 123Sample Title 123');
      logInfo(`insertInto(codeText="123", text="Sample T...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0568 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0569
     * @tc.name      VerifyCode_InsertInto_0569
     * @tc.desc      insertInto(codeText="123", text="Sample Title 123_1") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0569', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0569 begin`);
      const actual: string = insertInto('123', 'Sample Title 123_1');
      logInfo(`insertInto(codeText="123", text="Sample T...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0569 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0570
     * @tc.name      VerifyCode_InsertInto_0570
     * @tc.desc      insertInto(codeText="123", text="xSample Title 123") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0570', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0570 begin`);
      const actual: string = insertInto('123', 'xSample Title 123');
      logInfo(`insertInto(codeText="123", text="xSample ...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0570 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0571
     * @tc.name      VerifyCode_InsertInto_0571
     * @tc.desc      insertInto(codeText="123", text=" ?? ") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0571', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0571 begin`);
      const actual: string = insertInto('123', ' \u4e2d\u6587 ');
      logInfo(`insertInto(codeText="123", text=" ?? "): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0571 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0572
     * @tc.name      VerifyCode_InsertInto_0572
     * @tc.desc      insertInto(codeText="123", text="????") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0572', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0572 begin`);
      const actual: string = insertInto('123', '\u4e2d\u6587\u4e2d\u6587');
      logInfo(`insertInto(codeText="123", text="????"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0572 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0573
     * @tc.name      VerifyCode_InsertInto_0573
     * @tc.desc      insertInto(codeText="123", text="??_1") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0573', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0573 begin`);
      const actual: string = insertInto('123', '\u4e2d\u6587_1');
      logInfo(`insertInto(codeText="123", text="??_1"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0573 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0574
     * @tc.name      VerifyCode_InsertInto_0574
     * @tc.desc      insertInto(codeText="123", text="x??") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0574', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0574 begin`);
      const actual: string = insertInto('123', 'x\u4e2d\u6587');
      logInfo(`insertInto(codeText="123", text="x??"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0574 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0575
     * @tc.name      VerifyCode_InsertInto_0575
     * @tc.desc      insertInto(codeText="123", text=" a ") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0575', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0575 begin`);
      const actual: string = insertInto('123', ' a ');
      logInfo(`insertInto(codeText="123", text=" a "): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0575 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0576
     * @tc.name      VerifyCode_InsertInto_0576
     * @tc.desc      insertInto(codeText="123", text="aa") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0576', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0576 begin`);
      const actual: string = insertInto('123', 'aa');
      logInfo(`insertInto(codeText="123", text="aa"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}InsertInto_0576 end`);
    });
  });
}
