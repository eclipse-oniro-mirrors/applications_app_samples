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
export default function insertInto5Test(): void {
  describe('InsertInto5Test', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0385
     * @tc.name      VerifyCode_InsertInto_0385
     * @tc.desc      insertInto(codeText="a", text="AA") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0385', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0385 begin`);
      const actual: string = insertInto('a', 'AA');
      logInfo(`insertInto(codeText="a", text="AA"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0385 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0386
     * @tc.name      VerifyCode_InsertInto_0386
     * @tc.desc      insertInto(codeText="a", text="A_1") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0386', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0386 begin`);
      const actual: string = insertInto('a', 'A_1');
      logInfo(`insertInto(codeText="a", text="A_1"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0386 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0387
     * @tc.name      VerifyCode_InsertInto_0387
     * @tc.desc      insertInto(codeText="a", text="xA") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0387 begin`);
      const actual: string = insertInto('a', 'xA');
      logInfo(`insertInto(codeText="a", text="xA"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0387 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0388
     * @tc.name      VerifyCode_InsertInto_0388
     * @tc.desc      insertInto(codeText="a", text=" Sample Title 123 ") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0388 begin`);
      const actual: string = insertInto('a', ' Sample Title 123 ');
      logInfo(`insertInto(codeText="a", text=" Sample Ti...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0388 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0389
     * @tc.name      VerifyCode_InsertInto_0389
     * @tc.desc      insertInto(codeText="a", text="Sample Title 123Sample Title 123") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0389 begin`);
      const actual: string = insertInto('a', 'Sample Title 123Sample Title 123');
      logInfo(`insertInto(codeText="a", text="Sample Tit...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0389 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0390
     * @tc.name      VerifyCode_InsertInto_0390
     * @tc.desc      insertInto(codeText="a", text="Sample Title 123_1") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0390 begin`);
      const actual: string = insertInto('a', 'Sample Title 123_1');
      logInfo(`insertInto(codeText="a", text="Sample Tit...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0390 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0391
     * @tc.name      VerifyCode_InsertInto_0391
     * @tc.desc      insertInto(codeText="a", text="xSample Title 123") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0391', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0391 begin`);
      const actual: string = insertInto('a', 'xSample Title 123');
      logInfo(`insertInto(codeText="a", text="xSample Ti...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0391 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0392
     * @tc.name      VerifyCode_InsertInto_0392
     * @tc.desc      insertInto(codeText="a", text=" ?? ") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0392', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0392 begin`);
      const actual: string = insertInto('a', ' \u4e2d\u6587 ');
      logInfo(`insertInto(codeText="a", text=" ?? "): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0392 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0393
     * @tc.name      VerifyCode_InsertInto_0393
     * @tc.desc      insertInto(codeText="a", text="????") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0393', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0393 begin`);
      const actual: string = insertInto('a', '\u4e2d\u6587\u4e2d\u6587');
      logInfo(`insertInto(codeText="a", text="????"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0393 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0394
     * @tc.name      VerifyCode_InsertInto_0394
     * @tc.desc      insertInto(codeText="a", text="??_1") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0394', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0394 begin`);
      const actual: string = insertInto('a', '\u4e2d\u6587_1');
      logInfo(`insertInto(codeText="a", text="??_1"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0394 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0395
     * @tc.name      VerifyCode_InsertInto_0395
     * @tc.desc      insertInto(codeText="a", text="x??") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0395', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0395 begin`);
      const actual: string = insertInto('a', 'x\u4e2d\u6587');
      logInfo(`insertInto(codeText="a", text="x??"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0395 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0396
     * @tc.name      VerifyCode_InsertInto_0396
     * @tc.desc      insertInto(codeText="a", text=" a ") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0396', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0396 begin`);
      const actual: string = insertInto('a', ' a ');
      logInfo(`insertInto(codeText="a", text=" a "): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0396 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0397
     * @tc.name      VerifyCode_InsertInto_0397
     * @tc.desc      insertInto(codeText="a", text="aa") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0397', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0397 begin`);
      const actual: string = insertInto('a', 'aa');
      logInfo(`insertInto(codeText="a", text="aa"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0397 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0398
     * @tc.name      VerifyCode_InsertInto_0398
     * @tc.desc      insertInto(codeText="a", text="a_1") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0398', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0398 begin`);
      const actual: string = insertInto('a', 'a_1');
      logInfo(`insertInto(codeText="a", text="a_1"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0398 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0399
     * @tc.name      VerifyCode_InsertInto_0399
     * @tc.desc      insertInto(codeText="a", text="xa") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0399', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0399 begin`);
      const actual: string = insertInto('a', 'xa');
      logInfo(`insertInto(codeText="a", text="xa"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0399 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0400
     * @tc.name      VerifyCode_InsertInto_0400
     * @tc.desc      insertInto(codeText="a", text=" abc ") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0400 begin`);
      const actual: string = insertInto('a', ' abc ');
      logInfo(`insertInto(codeText="a", text=" abc "): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0400 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0401
     * @tc.name      VerifyCode_InsertInto_0401
     * @tc.desc      insertInto(codeText="a", text="abcabc") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0401 begin`);
      const actual: string = insertInto('a', 'abcabc');
      logInfo(`insertInto(codeText="a", text="abcabc"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0401 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0402
     * @tc.name      VerifyCode_InsertInto_0402
     * @tc.desc      insertInto(codeText="a", text="abc_1") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0402 begin`);
      const actual: string = insertInto('a', 'abc_1');
      logInfo(`insertInto(codeText="a", text="abc_1"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0402 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0403
     * @tc.name      VerifyCode_InsertInto_0403
     * @tc.desc      insertInto(codeText="a", text="xabc") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0403 begin`);
      const actual: string = insertInto('a', 'xabc');
      logInfo(`insertInto(codeText="a", text="xabc"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0403 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0404
     * @tc.name      VerifyCode_InsertInto_0404
     * @tc.desc      insertInto(codeText="a", text=" Hello World ") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0404 begin`);
      const actual: string = insertInto('a', ' Hello World ');
      logInfo(`insertInto(codeText="a", text=" Hello Wor...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0404 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0405
     * @tc.name      VerifyCode_InsertInto_0405
     * @tc.desc      insertInto(codeText="a", text="Hello WorldHello World") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0405 begin`);
      const actual: string = insertInto('a', 'Hello WorldHello World');
      logInfo(`insertInto(codeText="a", text="Hello Worl...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0405 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0406
     * @tc.name      VerifyCode_InsertInto_0406
     * @tc.desc      insertInto(codeText="a", text="Hello World_1") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0406 begin`);
      const actual: string = insertInto('a', 'Hello World_1');
      logInfo(`insertInto(codeText="a", text="Hello Worl...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0406 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0407
     * @tc.name      VerifyCode_InsertInto_0407
     * @tc.desc      insertInto(codeText="a", text="xHello World") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0407 begin`);
      const actual: string = insertInto('a', 'xHello World');
      logInfo(`insertInto(codeText="a", text="xHello Wor...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0407 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0408
     * @tc.name      VerifyCode_InsertInto_0408
     * @tc.desc      insertInto(codeText="abc", text="hello world") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0408 begin`);
      const actual: string = insertInto('abc', 'hello world');
      logInfo(`insertInto(codeText="abc", text="hello wo...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0408 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0409
     * @tc.name      VerifyCode_InsertInto_0409
     * @tc.desc      insertInto(codeText="abc", text="") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0409 begin`);
      const actual: string = insertInto('abc', '');
      logInfo(`insertInto(codeText="abc", text=""): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0409 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0410
     * @tc.name      VerifyCode_InsertInto_0410
     * @tc.desc      insertInto(codeText="abc", text=" ") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0410 begin`);
      const actual: string = insertInto('abc', ' ');
      logInfo(`insertInto(codeText="abc", text=" "): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0410 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0411
     * @tc.name      VerifyCode_InsertInto_0411
     * @tc.desc      insertInto(codeText="abc", text="A") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0411 begin`);
      const actual: string = insertInto('abc', 'A');
      logInfo(`insertInto(codeText="abc", text="A"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0411 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0412
     * @tc.name      VerifyCode_InsertInto_0412
     * @tc.desc      insertInto(codeText="abc", text="Sample Title 123") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0412 begin`);
      const actual: string = insertInto('abc', 'Sample Title 123');
      logInfo(`insertInto(codeText="abc", text="Sample T...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0412 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0413
     * @tc.name      VerifyCode_InsertInto_0413
     * @tc.desc      insertInto(codeText="abc", text="??") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0413 begin`);
      const actual: string = insertInto('abc', '\u4e2d\u6587');
      logInfo(`insertInto(codeText="abc", text="??"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0413 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0414
     * @tc.name      VerifyCode_InsertInto_0414
     * @tc.desc      insertInto(codeText="abc", text="a") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0414 begin`);
      const actual: string = insertInto('abc', 'a');
      logInfo(`insertInto(codeText="abc", text="a"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0414 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0415
     * @tc.name      VerifyCode_InsertInto_0415
     * @tc.desc      insertInto(codeText="abc", text="abc") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0415 begin`);
      const actual: string = insertInto('abc', 'abc');
      logInfo(`insertInto(codeText="abc", text="abc"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0415 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0416
     * @tc.name      VerifyCode_InsertInto_0416
     * @tc.desc      insertInto(codeText="abc", text="Hello World") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0416 begin`);
      const actual: string = insertInto('abc', 'Hello World');
      logInfo(`insertInto(codeText="abc", text="Hello Wo...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0416 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0417
     * @tc.name      VerifyCode_InsertInto_0417
     * @tc.desc      insertInto(codeText="abc", text="123") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0417 begin`);
      const actual: string = insertInto('abc', '123');
      logInfo(`insertInto(codeText="abc", text="123"): actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0417 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0418
     * @tc.name      VerifyCode_InsertInto_0418
     * @tc.desc      insertInto(codeText="abc", text=" Hello ") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0418 begin`);
      const actual: string = insertInto('abc', ' Hello ');
      logInfo(`insertInto(codeText="abc", text=" Hello "): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0418 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0419
     * @tc.name      VerifyCode_InsertInto_0419
     * @tc.desc      insertInto(codeText="abc", text="HelloHello") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0419 begin`);
      const actual: string = insertInto('abc', 'HelloHello');
      logInfo(`insertInto(codeText="abc", text="HelloHel...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0419 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0420
     * @tc.name      VerifyCode_InsertInto_0420
     * @tc.desc      insertInto(codeText="abc", text="Hello_1") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0420 begin`);
      const actual: string = insertInto('abc', 'Hello_1');
      logInfo(`insertInto(codeText="abc", text="Hello_1"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0420 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0421
     * @tc.name      VerifyCode_InsertInto_0421
     * @tc.desc      insertInto(codeText="abc", text="xHello") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0421 begin`);
      const actual: string = insertInto('abc', 'xHello');
      logInfo(`insertInto(codeText="abc", text="xHello"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0421 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0422
     * @tc.name      VerifyCode_InsertInto_0422
     * @tc.desc      insertInto(codeText="abc", text=" hello world ") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0422 begin`);
      const actual: string = insertInto('abc', ' hello world ');
      logInfo(`insertInto(codeText="abc", text=" hello w...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0422 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0423
     * @tc.name      VerifyCode_InsertInto_0423
     * @tc.desc      insertInto(codeText="abc", text="hello worldhello world") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0423 begin`);
      const actual: string = insertInto('abc', 'hello worldhello world');
      logInfo(`insertInto(codeText="abc", text="hello wo...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0423 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0424
     * @tc.name      VerifyCode_InsertInto_0424
     * @tc.desc      insertInto(codeText="abc", text="hello world_1") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0424 begin`);
      const actual: string = insertInto('abc', 'hello world_1');
      logInfo(`insertInto(codeText="abc", text="hello wo...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0424 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0425
     * @tc.name      VerifyCode_InsertInto_0425
     * @tc.desc      insertInto(codeText="abc", text="xhello world") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0425 begin`);
      const actual: string = insertInto('abc', 'xhello world');
      logInfo(`insertInto(codeText="abc", text="xhello w...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0425 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0426
     * @tc.name      VerifyCode_InsertInto_0426
     * @tc.desc      insertInto(codeText="abc", text=" _1") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0426 begin`);
      const actual: string = insertInto('abc', ' _1');
      logInfo(`insertInto(codeText="abc", text=" _1"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0426 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0427
     * @tc.name      VerifyCode_InsertInto_0427
     * @tc.desc      insertInto(codeText="abc", text="x ") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0427 begin`);
      const actual: string = insertInto('abc', 'x ');
      logInfo(`insertInto(codeText="abc", text="x "): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0427 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0428
     * @tc.name      VerifyCode_InsertInto_0428
     * @tc.desc      insertInto(codeText="abc", text=" A ") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0428 begin`);
      const actual: string = insertInto('abc', ' A ');
      logInfo(`insertInto(codeText="abc", text=" A "): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0428 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0429
     * @tc.name      VerifyCode_InsertInto_0429
     * @tc.desc      insertInto(codeText="abc", text="AA") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0429 begin`);
      const actual: string = insertInto('abc', 'AA');
      logInfo(`insertInto(codeText="abc", text="AA"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0429 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0430
     * @tc.name      VerifyCode_InsertInto_0430
     * @tc.desc      insertInto(codeText="abc", text="A_1") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0430 begin`);
      const actual: string = insertInto('abc', 'A_1');
      logInfo(`insertInto(codeText="abc", text="A_1"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0430 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0431
     * @tc.name      VerifyCode_InsertInto_0431
     * @tc.desc      insertInto(codeText="abc", text="xA") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0431 begin`);
      const actual: string = insertInto('abc', 'xA');
      logInfo(`insertInto(codeText="abc", text="xA"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0431 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0432
     * @tc.name      VerifyCode_InsertInto_0432
     * @tc.desc      insertInto(codeText="abc", text=" Sample Title 123 ") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0432 begin`);
      const actual: string = insertInto('abc', ' Sample Title 123 ');
      logInfo(`insertInto(codeText="abc", text=" Sample ...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0432 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0433
     * @tc.name      VerifyCode_InsertInto_0433
     * @tc.desc      insertInto(codeText="abc", text="Sample Title 123Sample Title 123") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0433 begin`);
      const actual: string = insertInto('abc', 'Sample Title 123Sample Title 123');
      logInfo(`insertInto(codeText="abc", text="Sample T...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0433 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0434
     * @tc.name      VerifyCode_InsertInto_0434
     * @tc.desc      insertInto(codeText="abc", text="Sample Title 123_1") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0434 begin`);
      const actual: string = insertInto('abc', 'Sample Title 123_1');
      logInfo(`insertInto(codeText="abc", text="Sample T...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0434 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0435
     * @tc.name      VerifyCode_InsertInto_0435
     * @tc.desc      insertInto(codeText="abc", text="xSample Title 123") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0435 begin`);
      const actual: string = insertInto('abc', 'xSample Title 123');
      logInfo(`insertInto(codeText="abc", text="xSample ...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0435 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0436
     * @tc.name      VerifyCode_InsertInto_0436
     * @tc.desc      insertInto(codeText="abc", text=" ?? ") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0436', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0436 begin`);
      const actual: string = insertInto('abc', ' \u4e2d\u6587 ');
      logInfo(`insertInto(codeText="abc", text=" ?? "): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0436 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0437
     * @tc.name      VerifyCode_InsertInto_0437
     * @tc.desc      insertInto(codeText="abc", text="????") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0437', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0437 begin`);
      const actual: string = insertInto('abc', '\u4e2d\u6587\u4e2d\u6587');
      logInfo(`insertInto(codeText="abc", text="????"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0437 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0438
     * @tc.name      VerifyCode_InsertInto_0438
     * @tc.desc      insertInto(codeText="abc", text="??_1") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0438', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0438 begin`);
      const actual: string = insertInto('abc', '\u4e2d\u6587_1');
      logInfo(`insertInto(codeText="abc", text="??_1"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0438 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0439
     * @tc.name      VerifyCode_InsertInto_0439
     * @tc.desc      insertInto(codeText="abc", text="x??") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0439', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0439 begin`);
      const actual: string = insertInto('abc', 'x\u4e2d\u6587');
      logInfo(`insertInto(codeText="abc", text="x??"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0439 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0440
     * @tc.name      VerifyCode_InsertInto_0440
     * @tc.desc      insertInto(codeText="abc", text=" a ") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0440', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0440 begin`);
      const actual: string = insertInto('abc', ' a ');
      logInfo(`insertInto(codeText="abc", text=" a "): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0440 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0441
     * @tc.name      VerifyCode_InsertInto_0441
     * @tc.desc      insertInto(codeText="abc", text="aa") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0441', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0441 begin`);
      const actual: string = insertInto('abc', 'aa');
      logInfo(`insertInto(codeText="abc", text="aa"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0441 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0442
     * @tc.name      VerifyCode_InsertInto_0442
     * @tc.desc      insertInto(codeText="abc", text="a_1") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0442', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0442 begin`);
      const actual: string = insertInto('abc', 'a_1');
      logInfo(`insertInto(codeText="abc", text="a_1"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0442 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0443
     * @tc.name      VerifyCode_InsertInto_0443
     * @tc.desc      insertInto(codeText="abc", text="xa") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0443', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0443 begin`);
      const actual: string = insertInto('abc', 'xa');
      logInfo(`insertInto(codeText="abc", text="xa"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0443 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0444
     * @tc.name      VerifyCode_InsertInto_0444
     * @tc.desc      insertInto(codeText="abc", text=" abc ") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0444', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0444 begin`);
      const actual: string = insertInto('abc', ' abc ');
      logInfo(`insertInto(codeText="abc", text=" abc "): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0444 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0445
     * @tc.name      VerifyCode_InsertInto_0445
     * @tc.desc      insertInto(codeText="abc", text="abcabc") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0445', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0445 begin`);
      const actual: string = insertInto('abc', 'abcabc');
      logInfo(`insertInto(codeText="abc", text="abcabc"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0445 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0446
     * @tc.name      VerifyCode_InsertInto_0446
     * @tc.desc      insertInto(codeText="abc", text="abc_1") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0446', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0446 begin`);
      const actual: string = insertInto('abc', 'abc_1');
      logInfo(`insertInto(codeText="abc", text="abc_1"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0446 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0447
     * @tc.name      VerifyCode_InsertInto_0447
     * @tc.desc      insertInto(codeText="abc", text="xabc") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0447', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0447 begin`);
      const actual: string = insertInto('abc', 'xabc');
      logInfo(`insertInto(codeText="abc", text="xabc"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0447 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0448
     * @tc.name      VerifyCode_InsertInto_0448
     * @tc.desc      insertInto(codeText="abc", text=" Hello World ") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0448', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0448 begin`);
      const actual: string = insertInto('abc', ' Hello World ');
      logInfo(`insertInto(codeText="abc", text=" Hello W...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0448 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0449
     * @tc.name      VerifyCode_InsertInto_0449
     * @tc.desc      insertInto(codeText="abc", text="Hello WorldHello World") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0449', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0449 begin`);
      const actual: string = insertInto('abc', 'Hello WorldHello World');
      logInfo(`insertInto(codeText="abc", text="Hello Wo...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0449 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0450
     * @tc.name      VerifyCode_InsertInto_0450
     * @tc.desc      insertInto(codeText="abc", text="Hello World_1") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0450', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0450 begin`);
      const actual: string = insertInto('abc', 'Hello World_1');
      logInfo(`insertInto(codeText="abc", text="Hello Wo...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0450 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0451
     * @tc.name      VerifyCode_InsertInto_0451
     * @tc.desc      insertInto(codeText="abc", text="xHello World") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0451', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0451 begin`);
      const actual: string = insertInto('abc', 'xHello World');
      logInfo(`insertInto(codeText="abc", text="xHello W...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}InsertInto_0451 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0452
     * @tc.name      VerifyCode_InsertInto_0452
     * @tc.desc      insertInto(codeText="Hello World", text="hello world") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0452', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0452 begin`);
      const actual: string = insertInto('Hello World', 'hello world');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0452 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0453
     * @tc.name      VerifyCode_InsertInto_0453
     * @tc.desc      insertInto(codeText="Hello World", text="") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0453', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0453 begin`);
      const actual: string = insertInto('Hello World', '');
      logInfo(`insertInto(codeText="Hello World", text=""): actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0453 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0454
     * @tc.name      VerifyCode_InsertInto_0454
     * @tc.desc      insertInto(codeText="Hello World", text=" ") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0454', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0454 begin`);
      const actual: string = insertInto('Hello World', ' ');
      logInfo(`insertInto(codeText="Hello World", text=" "): actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0454 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0455
     * @tc.name      VerifyCode_InsertInto_0455
     * @tc.desc      insertInto(codeText="Hello World", text="A") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0455', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0455 begin`);
      const actual: string = insertInto('Hello World', 'A');
      logInfo(`insertInto(codeText="Hello World", text="A"): actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0455 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0456
     * @tc.name      VerifyCode_InsertInto_0456
     * @tc.desc      insertInto(codeText="Hello World", text="Sample Title 123") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0456', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0456 begin`);
      const actual: string = insertInto('Hello World', 'Sample Title 123');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0456 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0457
     * @tc.name      VerifyCode_InsertInto_0457
     * @tc.desc      insertInto(codeText="Hello World", text="??") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0457', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0457 begin`);
      const actual: string = insertInto('Hello World', '\u4e2d\u6587');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0457 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0458
     * @tc.name      VerifyCode_InsertInto_0458
     * @tc.desc      insertInto(codeText="Hello World", text="a") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0458', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0458 begin`);
      const actual: string = insertInto('Hello World', 'a');
      logInfo(`insertInto(codeText="Hello World", text="a"): actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0458 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0459
     * @tc.name      VerifyCode_InsertInto_0459
     * @tc.desc      insertInto(codeText="Hello World", text="abc") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0459', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0459 begin`);
      const actual: string = insertInto('Hello World', 'abc');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0459 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0460
     * @tc.name      VerifyCode_InsertInto_0460
     * @tc.desc      insertInto(codeText="Hello World", text="Hello World") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0460', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0460 begin`);
      const actual: string = insertInto('Hello World', 'Hello World');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0460 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0461
     * @tc.name      VerifyCode_InsertInto_0461
     * @tc.desc      insertInto(codeText="Hello World", text="123") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0461', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0461 begin`);
      const actual: string = insertInto('Hello World', '123');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0461 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0462
     * @tc.name      VerifyCode_InsertInto_0462
     * @tc.desc      insertInto(codeText="Hello World", text=" Hello ") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0462', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0462 begin`);
      const actual: string = insertInto('Hello World', ' Hello ');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0462 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0463
     * @tc.name      VerifyCode_InsertInto_0463
     * @tc.desc      insertInto(codeText="Hello World", text="HelloHello") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0463', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0463 begin`);
      const actual: string = insertInto('Hello World', 'HelloHello');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0463 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0464
     * @tc.name      VerifyCode_InsertInto_0464
     * @tc.desc      insertInto(codeText="Hello World", text="Hello_1") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0464', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0464 begin`);
      const actual: string = insertInto('Hello World', 'Hello_1');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0464 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0465
     * @tc.name      VerifyCode_InsertInto_0465
     * @tc.desc      insertInto(codeText="Hello World", text="xHello") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0465', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0465 begin`);
      const actual: string = insertInto('Hello World', 'xHello');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0465 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0466
     * @tc.name      VerifyCode_InsertInto_0466
     * @tc.desc      insertInto(codeText="Hello World", text=" hello world ") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0466', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0466 begin`);
      const actual: string = insertInto('Hello World', ' hello world ');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0466 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0467
     * @tc.name      VerifyCode_InsertInto_0467
     * @tc.desc      insertInto(codeText="Hello World", text="hello worldhello world") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0467', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0467 begin`);
      const actual: string = insertInto('Hello World', 'hello worldhello world');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0467 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0468
     * @tc.name      VerifyCode_InsertInto_0468
     * @tc.desc      insertInto(codeText="Hello World", text="hello world_1") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0468', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0468 begin`);
      const actual: string = insertInto('Hello World', 'hello world_1');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0468 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0469
     * @tc.name      VerifyCode_InsertInto_0469
     * @tc.desc      insertInto(codeText="Hello World", text="xhello world") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0469', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0469 begin`);
      const actual: string = insertInto('Hello World', 'xhello world');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0469 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0470
     * @tc.name      VerifyCode_InsertInto_0470
     * @tc.desc      insertInto(codeText="Hello World", text="   ") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0470', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0470 begin`);
      const actual: string = insertInto('Hello World', '   ');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0470 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0471
     * @tc.name      VerifyCode_InsertInto_0471
     * @tc.desc      insertInto(codeText="Hello World", text="  ") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0471', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0471 begin`);
      const actual: string = insertInto('Hello World', '  ');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0471 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0472
     * @tc.name      VerifyCode_InsertInto_0472
     * @tc.desc      insertInto(codeText="Hello World", text=" _1") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0472', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0472 begin`);
      const actual: string = insertInto('Hello World', ' _1');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0472 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0473
     * @tc.name      VerifyCode_InsertInto_0473
     * @tc.desc      insertInto(codeText="Hello World", text="x ") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0473', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0473 begin`);
      const actual: string = insertInto('Hello World', 'x ');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0473 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0474
     * @tc.name      VerifyCode_InsertInto_0474
     * @tc.desc      insertInto(codeText="Hello World", text=" A ") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0474', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0474 begin`);
      const actual: string = insertInto('Hello World', ' A ');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0474 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0475
     * @tc.name      VerifyCode_InsertInto_0475
     * @tc.desc      insertInto(codeText="Hello World", text="AA") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0475', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0475 begin`);
      const actual: string = insertInto('Hello World', 'AA');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0475 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0476
     * @tc.name      VerifyCode_InsertInto_0476
     * @tc.desc      insertInto(codeText="Hello World", text="A_1") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0476', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0476 begin`);
      const actual: string = insertInto('Hello World', 'A_1');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0476 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0477
     * @tc.name      VerifyCode_InsertInto_0477
     * @tc.desc      insertInto(codeText="Hello World", text="xA") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0477', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0477 begin`);
      const actual: string = insertInto('Hello World', 'xA');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0477 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0478
     * @tc.name      VerifyCode_InsertInto_0478
     * @tc.desc      insertInto(codeText="Hello World", text=" Sample Title 123 ") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0478', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0478 begin`);
      const actual: string = insertInto('Hello World', ' Sample Title 123 ');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0478 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0479
     * @tc.name      VerifyCode_InsertInto_0479
     * @tc.desc      insertInto(codeText="Hello World", text="Sample Title 123Sample Title 123") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0479', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0479 begin`);
      const actual: string = insertInto('Hello World', 'Sample Title 123Sample Title 123');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0479 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0480
     * @tc.name      VerifyCode_InsertInto_0480
     * @tc.desc      insertInto(codeText="Hello World", text="Sample Title 123_1") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0480', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0480 begin`);
      const actual: string = insertInto('Hello World', 'Sample Title 123_1');
      logInfo(`insertInto(codeText="Hello World", text="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}InsertInto_0480 end`);
    });
  });
}
