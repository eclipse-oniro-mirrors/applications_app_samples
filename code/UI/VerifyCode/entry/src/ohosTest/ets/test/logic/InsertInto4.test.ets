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
export default function insertInto4Test(): void {
  describe('InsertInto4Test', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0289
     * @tc.name      VerifyCode_InsertInto_0289
     * @tc.desc      insertInto(codeText="abc123", text=" hello world ") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0289 begin`);
      const actual: string = insertInto('abc123', ' hello world ');
      logInfo(`insertInto(codeText="abc123", text=" hell...: actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0289 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0290
     * @tc.name      VerifyCode_InsertInto_0290
     * @tc.desc      insertInto(codeText="abc123", text="hello worldhello world") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0290 begin`);
      const actual: string = insertInto('abc123', 'hello worldhello world');
      logInfo(`insertInto(codeText="abc123", text="hello...: actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0290 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0291
     * @tc.name      VerifyCode_InsertInto_0291
     * @tc.desc      insertInto(codeText="abc123", text="hello world_1") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0291 begin`);
      const actual: string = insertInto('abc123', 'hello world_1');
      logInfo(`insertInto(codeText="abc123", text="hello...: actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0291 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0292
     * @tc.name      VerifyCode_InsertInto_0292
     * @tc.desc      insertInto(codeText="abc123", text="xhello world") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0292 begin`);
      const actual: string = insertInto('abc123', 'xhello world');
      logInfo(`insertInto(codeText="abc123", text="xhell...: actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0292 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0293
     * @tc.name      VerifyCode_InsertInto_0293
     * @tc.desc      insertInto(codeText="abc123", text="   ") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0293 begin`);
      const actual: string = insertInto('abc123', '   ');
      logInfo(`insertInto(codeText="abc123", text="   "): actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0293 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0294
     * @tc.name      VerifyCode_InsertInto_0294
     * @tc.desc      insertInto(codeText="abc123", text="  ") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0294 begin`);
      const actual: string = insertInto('abc123', '  ');
      logInfo(`insertInto(codeText="abc123", text="  "): actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0294 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0295
     * @tc.name      VerifyCode_InsertInto_0295
     * @tc.desc      insertInto(codeText="abc123", text=" _1") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0295 begin`);
      const actual: string = insertInto('abc123', ' _1');
      logInfo(`insertInto(codeText="abc123", text=" _1"): actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0295 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0296
     * @tc.name      VerifyCode_InsertInto_0296
     * @tc.desc      insertInto(codeText="abc123", text="x ") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0296 begin`);
      const actual: string = insertInto('abc123', 'x ');
      logInfo(`insertInto(codeText="abc123", text="x "): actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0296 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0297
     * @tc.name      VerifyCode_InsertInto_0297
     * @tc.desc      insertInto(codeText="abc123", text=" A ") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0297 begin`);
      const actual: string = insertInto('abc123', ' A ');
      logInfo(`insertInto(codeText="abc123", text=" A "): actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0297 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0298
     * @tc.name      VerifyCode_InsertInto_0298
     * @tc.desc      insertInto(codeText="abc123", text="AA") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0298 begin`);
      const actual: string = insertInto('abc123', 'AA');
      logInfo(`insertInto(codeText="abc123", text="AA"): actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0298 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0299
     * @tc.name      VerifyCode_InsertInto_0299
     * @tc.desc      insertInto(codeText="abc123", text="A_1") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0299 begin`);
      const actual: string = insertInto('abc123', 'A_1');
      logInfo(`insertInto(codeText="abc123", text="A_1"): actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0299 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0300
     * @tc.name      VerifyCode_InsertInto_0300
     * @tc.desc      insertInto(codeText="abc123", text="xA") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0300 begin`);
      const actual: string = insertInto('abc123', 'xA');
      logInfo(`insertInto(codeText="abc123", text="xA"): actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0300 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0301
     * @tc.name      VerifyCode_InsertInto_0301
     * @tc.desc      insertInto(codeText="abc123", text=" Sample Title 123 ") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0301 begin`);
      const actual: string = insertInto('abc123', ' Sample Title 123 ');
      logInfo(`insertInto(codeText="abc123", text=" Samp...: actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0301 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0302
     * @tc.name      VerifyCode_InsertInto_0302
     * @tc.desc      insertInto(codeText="abc123", text="Sample Title 123Sample Title 123") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0302 begin`);
      const actual: string = insertInto('abc123', 'Sample Title 123Sample Title 123');
      logInfo(`insertInto(codeText="abc123", text="Sampl...: actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0302 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0303
     * @tc.name      VerifyCode_InsertInto_0303
     * @tc.desc      insertInto(codeText="abc123", text="Sample Title 123_1") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0303 begin`);
      const actual: string = insertInto('abc123', 'Sample Title 123_1');
      logInfo(`insertInto(codeText="abc123", text="Sampl...: actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0303 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0304
     * @tc.name      VerifyCode_InsertInto_0304
     * @tc.desc      insertInto(codeText="abc123", text="xSample Title 123") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0304 begin`);
      const actual: string = insertInto('abc123', 'xSample Title 123');
      logInfo(`insertInto(codeText="abc123", text="xSamp...: actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0304 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0305
     * @tc.name      VerifyCode_InsertInto_0305
     * @tc.desc      insertInto(codeText="abc123", text=" ?? ") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0305 begin`);
      const actual: string = insertInto('abc123', ' \u4e2d\u6587 ');
      logInfo(`insertInto(codeText="abc123", text=" ?? "): actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0305 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0306
     * @tc.name      VerifyCode_InsertInto_0306
     * @tc.desc      insertInto(codeText="abc123", text="????") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0306 begin`);
      const actual: string = insertInto('abc123', '\u4e2d\u6587\u4e2d\u6587');
      logInfo(`insertInto(codeText="abc123", text="????"): actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0306 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0307
     * @tc.name      VerifyCode_InsertInto_0307
     * @tc.desc      insertInto(codeText="abc123", text="??_1") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0307 begin`);
      const actual: string = insertInto('abc123', '\u4e2d\u6587_1');
      logInfo(`insertInto(codeText="abc123", text="??_1"): actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0307 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0308
     * @tc.name      VerifyCode_InsertInto_0308
     * @tc.desc      insertInto(codeText="abc123", text="x??") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0308 begin`);
      const actual: string = insertInto('abc123', 'x\u4e2d\u6587');
      logInfo(`insertInto(codeText="abc123", text="x??"): actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0308 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0309
     * @tc.name      VerifyCode_InsertInto_0309
     * @tc.desc      insertInto(codeText="abc123", text=" a ") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0309 begin`);
      const actual: string = insertInto('abc123', ' a ');
      logInfo(`insertInto(codeText="abc123", text=" a "): actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0309 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0310
     * @tc.name      VerifyCode_InsertInto_0310
     * @tc.desc      insertInto(codeText="abc123", text="aa") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0310 begin`);
      const actual: string = insertInto('abc123', 'aa');
      logInfo(`insertInto(codeText="abc123", text="aa"): actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0310 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0311
     * @tc.name      VerifyCode_InsertInto_0311
     * @tc.desc      insertInto(codeText="abc123", text="a_1") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0311 begin`);
      const actual: string = insertInto('abc123', 'a_1');
      logInfo(`insertInto(codeText="abc123", text="a_1"): actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0311 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0312
     * @tc.name      VerifyCode_InsertInto_0312
     * @tc.desc      insertInto(codeText="abc123", text="xa") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0312 begin`);
      const actual: string = insertInto('abc123', 'xa');
      logInfo(`insertInto(codeText="abc123", text="xa"): actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0312 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0313
     * @tc.name      VerifyCode_InsertInto_0313
     * @tc.desc      insertInto(codeText="abc123", text=" abc ") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0313 begin`);
      const actual: string = insertInto('abc123', ' abc ');
      logInfo(`insertInto(codeText="abc123", text=" abc "): actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0313 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0314
     * @tc.name      VerifyCode_InsertInto_0314
     * @tc.desc      insertInto(codeText="abc123", text="abcabc") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0314 begin`);
      const actual: string = insertInto('abc123', 'abcabc');
      logInfo(`insertInto(codeText="abc123", text="abcabc"): actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0314 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0315
     * @tc.name      VerifyCode_InsertInto_0315
     * @tc.desc      insertInto(codeText="abc123", text="abc_1") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0315 begin`);
      const actual: string = insertInto('abc123', 'abc_1');
      logInfo(`insertInto(codeText="abc123", text="abc_1"): actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0315 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0316
     * @tc.name      VerifyCode_InsertInto_0316
     * @tc.desc      insertInto(codeText="abc123", text="xabc") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0316 begin`);
      const actual: string = insertInto('abc123', 'xabc');
      logInfo(`insertInto(codeText="abc123", text="xabc"): actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0316 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0317
     * @tc.name      VerifyCode_InsertInto_0317
     * @tc.desc      insertInto(codeText="abc123", text=" Hello World ") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0317 begin`);
      const actual: string = insertInto('abc123', ' Hello World ');
      logInfo(`insertInto(codeText="abc123", text=" Hell...: actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0317 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0318
     * @tc.name      VerifyCode_InsertInto_0318
     * @tc.desc      insertInto(codeText="abc123", text="Hello WorldHello World") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0318 begin`);
      const actual: string = insertInto('abc123', 'Hello WorldHello World');
      logInfo(`insertInto(codeText="abc123", text="Hello...: actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0318 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0319
     * @tc.name      VerifyCode_InsertInto_0319
     * @tc.desc      insertInto(codeText="abc123", text="Hello World_1") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0319 begin`);
      const actual: string = insertInto('abc123', 'Hello World_1');
      logInfo(`insertInto(codeText="abc123", text="Hello...: actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0319 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0320
     * @tc.name      VerifyCode_InsertInto_0320
     * @tc.desc      insertInto(codeText="abc123", text="xHello World") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0320 begin`);
      const actual: string = insertInto('abc123', 'xHello World');
      logInfo(`insertInto(codeText="abc123", text="xHell...: actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0320 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0321
     * @tc.name      VerifyCode_InsertInto_0321
     * @tc.desc      insertInto(codeText="abc123", text=" 123 ") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0321 begin`);
      const actual: string = insertInto('abc123', ' 123 ');
      logInfo(`insertInto(codeText="abc123", text=" 123 "): actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0321 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0322
     * @tc.name      VerifyCode_InsertInto_0322
     * @tc.desc      insertInto(codeText="", text="hello world") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0322 begin`);
      const actual: string = insertInto('', 'hello world');
      logInfo(`insertInto(codeText="", text="hello world"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0322 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0323
     * @tc.name      VerifyCode_InsertInto_0323
     * @tc.desc      insertInto(codeText="", text="") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0323 begin`);
      const actual: string = insertInto('', '');
      logInfo(`insertInto(codeText="", text=""): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0323 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0324
     * @tc.name      VerifyCode_InsertInto_0324
     * @tc.desc      insertInto(codeText="", text=" ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0324 begin`);
      const actual: string = insertInto('', ' ');
      logInfo(`insertInto(codeText="", text=" "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0324 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0325
     * @tc.name      VerifyCode_InsertInto_0325
     * @tc.desc      insertInto(codeText="", text="A") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0325 begin`);
      const actual: string = insertInto('', 'A');
      logInfo(`insertInto(codeText="", text="A"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0325 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0326
     * @tc.name      VerifyCode_InsertInto_0326
     * @tc.desc      insertInto(codeText="", text="Sample Title 123") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0326 begin`);
      const actual: string = insertInto('', 'Sample Title 123');
      logInfo(`insertInto(codeText="", text="Sample Titl...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0326 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0327
     * @tc.name      VerifyCode_InsertInto_0327
     * @tc.desc      insertInto(codeText="", text="??") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0327 begin`);
      const actual: string = insertInto('', '\u4e2d\u6587');
      logInfo(`insertInto(codeText="", text="??"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0327 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0328
     * @tc.name      VerifyCode_InsertInto_0328
     * @tc.desc      insertInto(codeText="", text="a") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0328 begin`);
      const actual: string = insertInto('', 'a');
      logInfo(`insertInto(codeText="", text="a"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0328 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0329
     * @tc.name      VerifyCode_InsertInto_0329
     * @tc.desc      insertInto(codeText="", text="abc") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0329 begin`);
      const actual: string = insertInto('', 'abc');
      logInfo(`insertInto(codeText="", text="abc"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0329 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0330
     * @tc.name      VerifyCode_InsertInto_0330
     * @tc.desc      insertInto(codeText="", text="Hello World") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0330 begin`);
      const actual: string = insertInto('', 'Hello World');
      logInfo(`insertInto(codeText="", text="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0330 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0331
     * @tc.name      VerifyCode_InsertInto_0331
     * @tc.desc      insertInto(codeText="", text=" Hello ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0331 begin`);
      const actual: string = insertInto('', ' Hello ');
      logInfo(`insertInto(codeText="", text=" Hello "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0331 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0332
     * @tc.name      VerifyCode_InsertInto_0332
     * @tc.desc      insertInto(codeText="", text="HelloHello") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0332 begin`);
      const actual: string = insertInto('', 'HelloHello');
      logInfo(`insertInto(codeText="", text="HelloHello"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0332 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0333
     * @tc.name      VerifyCode_InsertInto_0333
     * @tc.desc      insertInto(codeText="", text="Hello_1") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0333 begin`);
      const actual: string = insertInto('', 'Hello_1');
      logInfo(`insertInto(codeText="", text="Hello_1"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0333 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0334
     * @tc.name      VerifyCode_InsertInto_0334
     * @tc.desc      insertInto(codeText="", text="xHello") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0334 begin`);
      const actual: string = insertInto('', 'xHello');
      logInfo(`insertInto(codeText="", text="xHello"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0334 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0335
     * @tc.name      VerifyCode_InsertInto_0335
     * @tc.desc      insertInto(codeText="", text=" hello world ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0335 begin`);
      const actual: string = insertInto('', ' hello world ');
      logInfo(`insertInto(codeText="", text=" hello worl...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0335 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0336
     * @tc.name      VerifyCode_InsertInto_0336
     * @tc.desc      insertInto(codeText="", text="hello worldhello world") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0336 begin`);
      const actual: string = insertInto('', 'hello worldhello world');
      logInfo(`insertInto(codeText="", text="hello world...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0336 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0337
     * @tc.name      VerifyCode_InsertInto_0337
     * @tc.desc      insertInto(codeText="", text="hello world_1") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0337 begin`);
      const actual: string = insertInto('', 'hello world_1');
      logInfo(`insertInto(codeText="", text="hello world...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0337 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0338
     * @tc.name      VerifyCode_InsertInto_0338
     * @tc.desc      insertInto(codeText="", text="xhello world") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0338 begin`);
      const actual: string = insertInto('', 'xhello world');
      logInfo(`insertInto(codeText="", text="xhello world"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0338 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0339
     * @tc.name      VerifyCode_InsertInto_0339
     * @tc.desc      insertInto(codeText="", text=" _1") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0339 begin`);
      const actual: string = insertInto('', ' _1');
      logInfo(`insertInto(codeText="", text=" _1"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0339 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0340
     * @tc.name      VerifyCode_InsertInto_0340
     * @tc.desc      insertInto(codeText="", text="x ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0340 begin`);
      const actual: string = insertInto('', 'x ');
      logInfo(`insertInto(codeText="", text="x "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0340 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0341
     * @tc.name      VerifyCode_InsertInto_0341
     * @tc.desc      insertInto(codeText="", text=" A ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0341 begin`);
      const actual: string = insertInto('', ' A ');
      logInfo(`insertInto(codeText="", text=" A "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0341 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0342
     * @tc.name      VerifyCode_InsertInto_0342
     * @tc.desc      insertInto(codeText="", text="AA") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0342 begin`);
      const actual: string = insertInto('', 'AA');
      logInfo(`insertInto(codeText="", text="AA"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0342 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0343
     * @tc.name      VerifyCode_InsertInto_0343
     * @tc.desc      insertInto(codeText="", text="A_1") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0343 begin`);
      const actual: string = insertInto('', 'A_1');
      logInfo(`insertInto(codeText="", text="A_1"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0343 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0344
     * @tc.name      VerifyCode_InsertInto_0344
     * @tc.desc      insertInto(codeText="", text="xA") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0344 begin`);
      const actual: string = insertInto('', 'xA');
      logInfo(`insertInto(codeText="", text="xA"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0344 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0345
     * @tc.name      VerifyCode_InsertInto_0345
     * @tc.desc      insertInto(codeText="", text=" Sample Title 123 ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0345 begin`);
      const actual: string = insertInto('', ' Sample Title 123 ');
      logInfo(`insertInto(codeText="", text=" Sample Tit...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0345 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0346
     * @tc.name      VerifyCode_InsertInto_0346
     * @tc.desc      insertInto(codeText="", text="Sample Title 123Sample Title 123") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0346 begin`);
      const actual: string = insertInto('', 'Sample Title 123Sample Title 123');
      logInfo(`insertInto(codeText="", text="Sample Titl...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0346 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0347
     * @tc.name      VerifyCode_InsertInto_0347
     * @tc.desc      insertInto(codeText="", text="Sample Title 123_1") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0347 begin`);
      const actual: string = insertInto('', 'Sample Title 123_1');
      logInfo(`insertInto(codeText="", text="Sample Titl...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0347 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0348
     * @tc.name      VerifyCode_InsertInto_0348
     * @tc.desc      insertInto(codeText="", text="xSample Title 123") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0348 begin`);
      const actual: string = insertInto('', 'xSample Title 123');
      logInfo(`insertInto(codeText="", text="xSample Tit...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0348 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0349
     * @tc.name      VerifyCode_InsertInto_0349
     * @tc.desc      insertInto(codeText="", text=" ?? ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0349 begin`);
      const actual: string = insertInto('', ' \u4e2d\u6587 ');
      logInfo(`insertInto(codeText="", text=" ?? "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0349 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0350
     * @tc.name      VerifyCode_InsertInto_0350
     * @tc.desc      insertInto(codeText="", text="????") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0350 begin`);
      const actual: string = insertInto('', '\u4e2d\u6587\u4e2d\u6587');
      logInfo(`insertInto(codeText="", text="????"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0350 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0351
     * @tc.name      VerifyCode_InsertInto_0351
     * @tc.desc      insertInto(codeText="", text="??_1") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0351 begin`);
      const actual: string = insertInto('', '\u4e2d\u6587_1');
      logInfo(`insertInto(codeText="", text="??_1"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0351 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0352
     * @tc.name      VerifyCode_InsertInto_0352
     * @tc.desc      insertInto(codeText="", text="x??") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0352 begin`);
      const actual: string = insertInto('', 'x\u4e2d\u6587');
      logInfo(`insertInto(codeText="", text="x??"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0352 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0353
     * @tc.name      VerifyCode_InsertInto_0353
     * @tc.desc      insertInto(codeText="", text=" a ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0353 begin`);
      const actual: string = insertInto('', ' a ');
      logInfo(`insertInto(codeText="", text=" a "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0353 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0354
     * @tc.name      VerifyCode_InsertInto_0354
     * @tc.desc      insertInto(codeText="", text="aa") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0354 begin`);
      const actual: string = insertInto('', 'aa');
      logInfo(`insertInto(codeText="", text="aa"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0354 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0355
     * @tc.name      VerifyCode_InsertInto_0355
     * @tc.desc      insertInto(codeText="", text="a_1") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0355 begin`);
      const actual: string = insertInto('', 'a_1');
      logInfo(`insertInto(codeText="", text="a_1"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0355 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0356
     * @tc.name      VerifyCode_InsertInto_0356
     * @tc.desc      insertInto(codeText="", text="xa") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0356 begin`);
      const actual: string = insertInto('', 'xa');
      logInfo(`insertInto(codeText="", text="xa"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0356 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0357
     * @tc.name      VerifyCode_InsertInto_0357
     * @tc.desc      insertInto(codeText="", text=" abc ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0357 begin`);
      const actual: string = insertInto('', ' abc ');
      logInfo(`insertInto(codeText="", text=" abc "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0357 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0358
     * @tc.name      VerifyCode_InsertInto_0358
     * @tc.desc      insertInto(codeText="", text="abcabc") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0358 begin`);
      const actual: string = insertInto('', 'abcabc');
      logInfo(`insertInto(codeText="", text="abcabc"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0358 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0359
     * @tc.name      VerifyCode_InsertInto_0359
     * @tc.desc      insertInto(codeText="", text="abc_1") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0359 begin`);
      const actual: string = insertInto('', 'abc_1');
      logInfo(`insertInto(codeText="", text="abc_1"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0359 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0360
     * @tc.name      VerifyCode_InsertInto_0360
     * @tc.desc      insertInto(codeText="", text="xabc") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0360 begin`);
      const actual: string = insertInto('', 'xabc');
      logInfo(`insertInto(codeText="", text="xabc"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0360 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0361
     * @tc.name      VerifyCode_InsertInto_0361
     * @tc.desc      insertInto(codeText="", text=" Hello World ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0361 begin`);
      const actual: string = insertInto('', ' Hello World ');
      logInfo(`insertInto(codeText="", text=" Hello Worl...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0361 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0362
     * @tc.name      VerifyCode_InsertInto_0362
     * @tc.desc      insertInto(codeText="", text="Hello WorldHello World") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0362 begin`);
      const actual: string = insertInto('', 'Hello WorldHello World');
      logInfo(`insertInto(codeText="", text="Hello World...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0362 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0363
     * @tc.name      VerifyCode_InsertInto_0363
     * @tc.desc      insertInto(codeText="", text="Hello World_1") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0363 begin`);
      const actual: string = insertInto('', 'Hello World_1');
      logInfo(`insertInto(codeText="", text="Hello World...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0363 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0364
     * @tc.name      VerifyCode_InsertInto_0364
     * @tc.desc      insertInto(codeText="", text="xHello World") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0364 begin`);
      const actual: string = insertInto('', 'xHello World');
      logInfo(`insertInto(codeText="", text="xHello World"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}InsertInto_0364 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0365
     * @tc.name      VerifyCode_InsertInto_0365
     * @tc.desc      insertInto(codeText="a", text="hello world") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0365 begin`);
      const actual: string = insertInto('a', 'hello world');
      logInfo(`insertInto(codeText="a", text="hello world"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0365 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0366
     * @tc.name      VerifyCode_InsertInto_0366
     * @tc.desc      insertInto(codeText="a", text="") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0366 begin`);
      const actual: string = insertInto('a', '');
      logInfo(`insertInto(codeText="a", text=""): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0366 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0367
     * @tc.name      VerifyCode_InsertInto_0367
     * @tc.desc      insertInto(codeText="a", text=" ") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0367 begin`);
      const actual: string = insertInto('a', ' ');
      logInfo(`insertInto(codeText="a", text=" "): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0367 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0368
     * @tc.name      VerifyCode_InsertInto_0368
     * @tc.desc      insertInto(codeText="a", text="A") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0368 begin`);
      const actual: string = insertInto('a', 'A');
      logInfo(`insertInto(codeText="a", text="A"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0368 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0369
     * @tc.name      VerifyCode_InsertInto_0369
     * @tc.desc      insertInto(codeText="a", text="Sample Title 123") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0369 begin`);
      const actual: string = insertInto('a', 'Sample Title 123');
      logInfo(`insertInto(codeText="a", text="Sample Tit...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0369 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0370
     * @tc.name      VerifyCode_InsertInto_0370
     * @tc.desc      insertInto(codeText="a", text="??") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0370 begin`);
      const actual: string = insertInto('a', '\u4e2d\u6587');
      logInfo(`insertInto(codeText="a", text="??"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0370 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0371
     * @tc.name      VerifyCode_InsertInto_0371
     * @tc.desc      insertInto(codeText="a", text="a") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0371 begin`);
      const actual: string = insertInto('a', 'a');
      logInfo(`insertInto(codeText="a", text="a"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0371 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0372
     * @tc.name      VerifyCode_InsertInto_0372
     * @tc.desc      insertInto(codeText="a", text="abc") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0372 begin`);
      const actual: string = insertInto('a', 'abc');
      logInfo(`insertInto(codeText="a", text="abc"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0372 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0373
     * @tc.name      VerifyCode_InsertInto_0373
     * @tc.desc      insertInto(codeText="a", text="Hello World") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0373', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0373 begin`);
      const actual: string = insertInto('a', 'Hello World');
      logInfo(`insertInto(codeText="a", text="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0373 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0374
     * @tc.name      VerifyCode_InsertInto_0374
     * @tc.desc      insertInto(codeText="a", text=" Hello ") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0374', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0374 begin`);
      const actual: string = insertInto('a', ' Hello ');
      logInfo(`insertInto(codeText="a", text=" Hello "): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0374 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0375
     * @tc.name      VerifyCode_InsertInto_0375
     * @tc.desc      insertInto(codeText="a", text="HelloHello") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0375', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0375 begin`);
      const actual: string = insertInto('a', 'HelloHello');
      logInfo(`insertInto(codeText="a", text="HelloHello"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0375 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0376
     * @tc.name      VerifyCode_InsertInto_0376
     * @tc.desc      insertInto(codeText="a", text="Hello_1") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0376', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0376 begin`);
      const actual: string = insertInto('a', 'Hello_1');
      logInfo(`insertInto(codeText="a", text="Hello_1"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0376 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0377
     * @tc.name      VerifyCode_InsertInto_0377
     * @tc.desc      insertInto(codeText="a", text="xHello") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0377', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0377 begin`);
      const actual: string = insertInto('a', 'xHello');
      logInfo(`insertInto(codeText="a", text="xHello"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0377 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0378
     * @tc.name      VerifyCode_InsertInto_0378
     * @tc.desc      insertInto(codeText="a", text=" hello world ") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0378', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0378 begin`);
      const actual: string = insertInto('a', ' hello world ');
      logInfo(`insertInto(codeText="a", text=" hello wor...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0378 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0379
     * @tc.name      VerifyCode_InsertInto_0379
     * @tc.desc      insertInto(codeText="a", text="hello worldhello world") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0379', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0379 begin`);
      const actual: string = insertInto('a', 'hello worldhello world');
      logInfo(`insertInto(codeText="a", text="hello worl...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0379 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0380
     * @tc.name      VerifyCode_InsertInto_0380
     * @tc.desc      insertInto(codeText="a", text="hello world_1") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0380', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0380 begin`);
      const actual: string = insertInto('a', 'hello world_1');
      logInfo(`insertInto(codeText="a", text="hello worl...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0380 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0381
     * @tc.name      VerifyCode_InsertInto_0381
     * @tc.desc      insertInto(codeText="a", text="xhello world") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0381', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0381 begin`);
      const actual: string = insertInto('a', 'xhello world');
      logInfo(`insertInto(codeText="a", text="xhello wor...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0381 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0382
     * @tc.name      VerifyCode_InsertInto_0382
     * @tc.desc      insertInto(codeText="a", text=" _1") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0382', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0382 begin`);
      const actual: string = insertInto('a', ' _1');
      logInfo(`insertInto(codeText="a", text=" _1"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0382 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0383
     * @tc.name      VerifyCode_InsertInto_0383
     * @tc.desc      insertInto(codeText="a", text="x ") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0383', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0383 begin`);
      const actual: string = insertInto('a', 'x ');
      logInfo(`insertInto(codeText="a", text="x "): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0383 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0384
     * @tc.name      VerifyCode_InsertInto_0384
     * @tc.desc      insertInto(codeText="a", text=" A ") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0384', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0384 begin`);
      const actual: string = insertInto('a', ' A ');
      logInfo(`insertInto(codeText="a", text=" A "): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}InsertInto_0384 end`);
    });
  });
}
