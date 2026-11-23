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
export default function insertInto3Test(): void {
  describe('InsertInto3Test', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0193
     * @tc.name      VerifyCode_InsertInto_0193
     * @tc.desc      insertInto(codeText="12345", text="Hello World") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0193 begin`);
      const actual: string = insertInto('12345', 'Hello World');
      logInfo(`insertInto(codeText="12345", text="Hello ...: actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0193 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0194
     * @tc.name      VerifyCode_InsertInto_0194
     * @tc.desc      insertInto(codeText="12345", text=" Hello ") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0194 begin`);
      const actual: string = insertInto('12345', ' Hello ');
      logInfo(`insertInto(codeText="12345", text=" Hello "): actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0194 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0195
     * @tc.name      VerifyCode_InsertInto_0195
     * @tc.desc      insertInto(codeText="12345", text="HelloHello") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0195 begin`);
      const actual: string = insertInto('12345', 'HelloHello');
      logInfo(`insertInto(codeText="12345", text="HelloH...: actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0195 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0196
     * @tc.name      VerifyCode_InsertInto_0196
     * @tc.desc      insertInto(codeText="12345", text="Hello_1") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0196 begin`);
      const actual: string = insertInto('12345', 'Hello_1');
      logInfo(`insertInto(codeText="12345", text="Hello_1"): actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0196 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0197
     * @tc.name      VerifyCode_InsertInto_0197
     * @tc.desc      insertInto(codeText="12345", text="xHello") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0197 begin`);
      const actual: string = insertInto('12345', 'xHello');
      logInfo(`insertInto(codeText="12345", text="xHello"): actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0197 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0198
     * @tc.name      VerifyCode_InsertInto_0198
     * @tc.desc      insertInto(codeText="12345", text=" hello world ") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0198 begin`);
      const actual: string = insertInto('12345', ' hello world ');
      logInfo(`insertInto(codeText="12345", text=" hello...: actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0198 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0199
     * @tc.name      VerifyCode_InsertInto_0199
     * @tc.desc      insertInto(codeText="12345", text="hello worldhello world") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0199 begin`);
      const actual: string = insertInto('12345', 'hello worldhello world');
      logInfo(`insertInto(codeText="12345", text="hello ...: actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0199 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0200
     * @tc.name      VerifyCode_InsertInto_0200
     * @tc.desc      insertInto(codeText="12345", text="hello world_1") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0200 begin`);
      const actual: string = insertInto('12345', 'hello world_1');
      logInfo(`insertInto(codeText="12345", text="hello ...: actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0200 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0201
     * @tc.name      VerifyCode_InsertInto_0201
     * @tc.desc      insertInto(codeText="12345", text="xhello world") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0201 begin`);
      const actual: string = insertInto('12345', 'xhello world');
      logInfo(`insertInto(codeText="12345", text="xhello...: actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0201 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0202
     * @tc.name      VerifyCode_InsertInto_0202
     * @tc.desc      insertInto(codeText="12345", text=" _1") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0202 begin`);
      const actual: string = insertInto('12345', ' _1');
      logInfo(`insertInto(codeText="12345", text=" _1"): actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0202 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0203
     * @tc.name      VerifyCode_InsertInto_0203
     * @tc.desc      insertInto(codeText="12345", text="x ") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0203 begin`);
      const actual: string = insertInto('12345', 'x ');
      logInfo(`insertInto(codeText="12345", text="x "): actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0203 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0204
     * @tc.name      VerifyCode_InsertInto_0204
     * @tc.desc      insertInto(codeText="12345", text=" A ") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0204 begin`);
      const actual: string = insertInto('12345', ' A ');
      logInfo(`insertInto(codeText="12345", text=" A "): actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0204 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0205
     * @tc.name      VerifyCode_InsertInto_0205
     * @tc.desc      insertInto(codeText="12345", text="AA") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0205 begin`);
      const actual: string = insertInto('12345', 'AA');
      logInfo(`insertInto(codeText="12345", text="AA"): actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0205 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0206
     * @tc.name      VerifyCode_InsertInto_0206
     * @tc.desc      insertInto(codeText="12345", text="A_1") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0206 begin`);
      const actual: string = insertInto('12345', 'A_1');
      logInfo(`insertInto(codeText="12345", text="A_1"): actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0206 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0207
     * @tc.name      VerifyCode_InsertInto_0207
     * @tc.desc      insertInto(codeText="12345", text="xA") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0207 begin`);
      const actual: string = insertInto('12345', 'xA');
      logInfo(`insertInto(codeText="12345", text="xA"): actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0207 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0208
     * @tc.name      VerifyCode_InsertInto_0208
     * @tc.desc      insertInto(codeText="12345", text=" Sample Title 123 ") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0208 begin`);
      const actual: string = insertInto('12345', ' Sample Title 123 ');
      logInfo(`insertInto(codeText="12345", text=" Sampl...: actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0208 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0209
     * @tc.name      VerifyCode_InsertInto_0209
     * @tc.desc      insertInto(codeText="12345", text="Sample Title 123Sample Title 123") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0209 begin`);
      const actual: string = insertInto('12345', 'Sample Title 123Sample Title 123');
      logInfo(`insertInto(codeText="12345", text="Sample...: actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0209 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0210
     * @tc.name      VerifyCode_InsertInto_0210
     * @tc.desc      insertInto(codeText="12345", text="Sample Title 123_1") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0210 begin`);
      const actual: string = insertInto('12345', 'Sample Title 123_1');
      logInfo(`insertInto(codeText="12345", text="Sample...: actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0210 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0211
     * @tc.name      VerifyCode_InsertInto_0211
     * @tc.desc      insertInto(codeText="12345", text="xSample Title 123") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0211 begin`);
      const actual: string = insertInto('12345', 'xSample Title 123');
      logInfo(`insertInto(codeText="12345", text="xSampl...: actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0211 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0212
     * @tc.name      VerifyCode_InsertInto_0212
     * @tc.desc      insertInto(codeText="12345", text=" ?? ") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0212 begin`);
      const actual: string = insertInto('12345', ' \u4e2d\u6587 ');
      logInfo(`insertInto(codeText="12345", text=" ?? "): actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0212 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0213
     * @tc.name      VerifyCode_InsertInto_0213
     * @tc.desc      insertInto(codeText="12345", text="????") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0213 begin`);
      const actual: string = insertInto('12345', '\u4e2d\u6587\u4e2d\u6587');
      logInfo(`insertInto(codeText="12345", text="????"): actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0213 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0214
     * @tc.name      VerifyCode_InsertInto_0214
     * @tc.desc      insertInto(codeText="12345", text="??_1") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0214 begin`);
      const actual: string = insertInto('12345', '\u4e2d\u6587_1');
      logInfo(`insertInto(codeText="12345", text="??_1"): actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0214 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0215
     * @tc.name      VerifyCode_InsertInto_0215
     * @tc.desc      insertInto(codeText="12345", text="x??") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0215 begin`);
      const actual: string = insertInto('12345', 'x\u4e2d\u6587');
      logInfo(`insertInto(codeText="12345", text="x??"): actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0215 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0216
     * @tc.name      VerifyCode_InsertInto_0216
     * @tc.desc      insertInto(codeText="12345", text=" a ") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0216 begin`);
      const actual: string = insertInto('12345', ' a ');
      logInfo(`insertInto(codeText="12345", text=" a "): actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0216 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0217
     * @tc.name      VerifyCode_InsertInto_0217
     * @tc.desc      insertInto(codeText="12345", text="aa") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0217 begin`);
      const actual: string = insertInto('12345', 'aa');
      logInfo(`insertInto(codeText="12345", text="aa"): actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0217 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0218
     * @tc.name      VerifyCode_InsertInto_0218
     * @tc.desc      insertInto(codeText="12345", text="a_1") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0218 begin`);
      const actual: string = insertInto('12345', 'a_1');
      logInfo(`insertInto(codeText="12345", text="a_1"): actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0218 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0219
     * @tc.name      VerifyCode_InsertInto_0219
     * @tc.desc      insertInto(codeText="12345", text="xa") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0219 begin`);
      const actual: string = insertInto('12345', 'xa');
      logInfo(`insertInto(codeText="12345", text="xa"): actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0219 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0220
     * @tc.name      VerifyCode_InsertInto_0220
     * @tc.desc      insertInto(codeText="12345", text=" abc ") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0220 begin`);
      const actual: string = insertInto('12345', ' abc ');
      logInfo(`insertInto(codeText="12345", text=" abc "): actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0220 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0221
     * @tc.name      VerifyCode_InsertInto_0221
     * @tc.desc      insertInto(codeText="12345", text="abcabc") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0221 begin`);
      const actual: string = insertInto('12345', 'abcabc');
      logInfo(`insertInto(codeText="12345", text="abcabc"): actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0221 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0222
     * @tc.name      VerifyCode_InsertInto_0222
     * @tc.desc      insertInto(codeText="12345", text="abc_1") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0222 begin`);
      const actual: string = insertInto('12345', 'abc_1');
      logInfo(`insertInto(codeText="12345", text="abc_1"): actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0222 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0223
     * @tc.name      VerifyCode_InsertInto_0223
     * @tc.desc      insertInto(codeText="12345", text="xabc") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0223 begin`);
      const actual: string = insertInto('12345', 'xabc');
      logInfo(`insertInto(codeText="12345", text="xabc"): actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0223 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0224
     * @tc.name      VerifyCode_InsertInto_0224
     * @tc.desc      insertInto(codeText="12345", text=" Hello World ") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0224 begin`);
      const actual: string = insertInto('12345', ' Hello World ');
      logInfo(`insertInto(codeText="12345", text=" Hello...: actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0224 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0225
     * @tc.name      VerifyCode_InsertInto_0225
     * @tc.desc      insertInto(codeText="12345", text="Hello WorldHello World") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0225 begin`);
      const actual: string = insertInto('12345', 'Hello WorldHello World');
      logInfo(`insertInto(codeText="12345", text="Hello ...: actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0225 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0226
     * @tc.name      VerifyCode_InsertInto_0226
     * @tc.desc      insertInto(codeText="12345", text="Hello World_1") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0226 begin`);
      const actual: string = insertInto('12345', 'Hello World_1');
      logInfo(`insertInto(codeText="12345", text="Hello ...: actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0226 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0227
     * @tc.name      VerifyCode_InsertInto_0227
     * @tc.desc      insertInto(codeText="12345", text="xHello World") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0227 begin`);
      const actual: string = insertInto('12345', 'xHello World');
      logInfo(`insertInto(codeText="12345", text="xHello...: actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0227 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0228
     * @tc.name      VerifyCode_InsertInto_0228
     * @tc.desc      insertInto(codeText="1234567", text="hello world") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0228 begin`);
      const actual: string = insertInto('1234567', 'hello world');
      logInfo(`insertInto(codeText="1234567", text="hell...: actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0228 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0229
     * @tc.name      VerifyCode_InsertInto_0229
     * @tc.desc      insertInto(codeText="1234567", text="") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0229 begin`);
      const actual: string = insertInto('1234567', '');
      logInfo(`insertInto(codeText="1234567", text=""): actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0229 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0230
     * @tc.name      VerifyCode_InsertInto_0230
     * @tc.desc      insertInto(codeText="1234567", text=" ") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0230 begin`);
      const actual: string = insertInto('1234567', ' ');
      logInfo(`insertInto(codeText="1234567", text=" "): actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0230 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0231
     * @tc.name      VerifyCode_InsertInto_0231
     * @tc.desc      insertInto(codeText="1234567", text="A") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0231 begin`);
      const actual: string = insertInto('1234567', 'A');
      logInfo(`insertInto(codeText="1234567", text="A"): actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0231 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0232
     * @tc.name      VerifyCode_InsertInto_0232
     * @tc.desc      insertInto(codeText="1234567", text="Sample Title 123") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0232 begin`);
      const actual: string = insertInto('1234567', 'Sample Title 123');
      logInfo(`insertInto(codeText="1234567", text="Samp...: actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0232 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0233
     * @tc.name      VerifyCode_InsertInto_0233
     * @tc.desc      insertInto(codeText="1234567", text="??") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0233 begin`);
      const actual: string = insertInto('1234567', '\u4e2d\u6587');
      logInfo(`insertInto(codeText="1234567", text="??"): actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0233 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0234
     * @tc.name      VerifyCode_InsertInto_0234
     * @tc.desc      insertInto(codeText="1234567", text="a") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0234 begin`);
      const actual: string = insertInto('1234567', 'a');
      logInfo(`insertInto(codeText="1234567", text="a"): actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0234 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0235
     * @tc.name      VerifyCode_InsertInto_0235
     * @tc.desc      insertInto(codeText="1234567", text="abc") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0235 begin`);
      const actual: string = insertInto('1234567', 'abc');
      logInfo(`insertInto(codeText="1234567", text="abc"): actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0235 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0236
     * @tc.name      VerifyCode_InsertInto_0236
     * @tc.desc      insertInto(codeText="1234567", text="Hello World") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0236 begin`);
      const actual: string = insertInto('1234567', 'Hello World');
      logInfo(`insertInto(codeText="1234567", text="Hell...: actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0236 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0237
     * @tc.name      VerifyCode_InsertInto_0237
     * @tc.desc      insertInto(codeText="1234567", text="123") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0237 begin`);
      const actual: string = insertInto('1234567', '123');
      logInfo(`insertInto(codeText="1234567", text="123"): actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0237 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0238
     * @tc.name      VerifyCode_InsertInto_0238
     * @tc.desc      insertInto(codeText="1234567", text=" Hello ") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0238 begin`);
      const actual: string = insertInto('1234567', ' Hello ');
      logInfo(`insertInto(codeText="1234567", text=" Hel...: actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0238 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0239
     * @tc.name      VerifyCode_InsertInto_0239
     * @tc.desc      insertInto(codeText="1234567", text="HelloHello") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0239 begin`);
      const actual: string = insertInto('1234567', 'HelloHello');
      logInfo(`insertInto(codeText="1234567", text="Hell...: actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0239 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0240
     * @tc.name      VerifyCode_InsertInto_0240
     * @tc.desc      insertInto(codeText="1234567", text="Hello_1") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0240 begin`);
      const actual: string = insertInto('1234567', 'Hello_1');
      logInfo(`insertInto(codeText="1234567", text="Hell...: actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0240 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0241
     * @tc.name      VerifyCode_InsertInto_0241
     * @tc.desc      insertInto(codeText="1234567", text="xHello") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0241 begin`);
      const actual: string = insertInto('1234567', 'xHello');
      logInfo(`insertInto(codeText="1234567", text="xHel...: actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0241 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0242
     * @tc.name      VerifyCode_InsertInto_0242
     * @tc.desc      insertInto(codeText="1234567", text=" hello world ") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0242 begin`);
      const actual: string = insertInto('1234567', ' hello world ');
      logInfo(`insertInto(codeText="1234567", text=" hel...: actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0242 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0243
     * @tc.name      VerifyCode_InsertInto_0243
     * @tc.desc      insertInto(codeText="1234567", text="hello worldhello world") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0243 begin`);
      const actual: string = insertInto('1234567', 'hello worldhello world');
      logInfo(`insertInto(codeText="1234567", text="hell...: actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0243 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0244
     * @tc.name      VerifyCode_InsertInto_0244
     * @tc.desc      insertInto(codeText="1234567", text="hello world_1") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0244 begin`);
      const actual: string = insertInto('1234567', 'hello world_1');
      logInfo(`insertInto(codeText="1234567", text="hell...: actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0244 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0245
     * @tc.name      VerifyCode_InsertInto_0245
     * @tc.desc      insertInto(codeText="1234567", text="xhello world") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0245 begin`);
      const actual: string = insertInto('1234567', 'xhello world');
      logInfo(`insertInto(codeText="1234567", text="xhel...: actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0245 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0246
     * @tc.name      VerifyCode_InsertInto_0246
     * @tc.desc      insertInto(codeText="1234567", text="   ") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0246 begin`);
      const actual: string = insertInto('1234567', '   ');
      logInfo(`insertInto(codeText="1234567", text="   "): actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0246 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0247
     * @tc.name      VerifyCode_InsertInto_0247
     * @tc.desc      insertInto(codeText="1234567", text="  ") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0247 begin`);
      const actual: string = insertInto('1234567', '  ');
      logInfo(`insertInto(codeText="1234567", text="  "): actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0247 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0248
     * @tc.name      VerifyCode_InsertInto_0248
     * @tc.desc      insertInto(codeText="1234567", text=" _1") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0248 begin`);
      const actual: string = insertInto('1234567', ' _1');
      logInfo(`insertInto(codeText="1234567", text=" _1"): actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0248 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0249
     * @tc.name      VerifyCode_InsertInto_0249
     * @tc.desc      insertInto(codeText="1234567", text="x ") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0249 begin`);
      const actual: string = insertInto('1234567', 'x ');
      logInfo(`insertInto(codeText="1234567", text="x "): actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0249 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0250
     * @tc.name      VerifyCode_InsertInto_0250
     * @tc.desc      insertInto(codeText="1234567", text=" A ") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0250 begin`);
      const actual: string = insertInto('1234567', ' A ');
      logInfo(`insertInto(codeText="1234567", text=" A "): actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0250 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0251
     * @tc.name      VerifyCode_InsertInto_0251
     * @tc.desc      insertInto(codeText="1234567", text="AA") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0251 begin`);
      const actual: string = insertInto('1234567', 'AA');
      logInfo(`insertInto(codeText="1234567", text="AA"): actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0251 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0252
     * @tc.name      VerifyCode_InsertInto_0252
     * @tc.desc      insertInto(codeText="1234567", text="A_1") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0252 begin`);
      const actual: string = insertInto('1234567', 'A_1');
      logInfo(`insertInto(codeText="1234567", text="A_1"): actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0252 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0253
     * @tc.name      VerifyCode_InsertInto_0253
     * @tc.desc      insertInto(codeText="1234567", text="xA") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0253 begin`);
      const actual: string = insertInto('1234567', 'xA');
      logInfo(`insertInto(codeText="1234567", text="xA"): actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0253 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0254
     * @tc.name      VerifyCode_InsertInto_0254
     * @tc.desc      insertInto(codeText="1234567", text=" Sample Title 123 ") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0254 begin`);
      const actual: string = insertInto('1234567', ' Sample Title 123 ');
      logInfo(`insertInto(codeText="1234567", text=" Sam...: actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0254 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0255
     * @tc.name      VerifyCode_InsertInto_0255
     * @tc.desc      insertInto(codeText="1234567", text="Sample Title 123Sample Title 123") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0255 begin`);
      const actual: string = insertInto('1234567', 'Sample Title 123Sample Title 123');
      logInfo(`insertInto(codeText="1234567", text="Samp...: actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0255 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0256
     * @tc.name      VerifyCode_InsertInto_0256
     * @tc.desc      insertInto(codeText="1234567", text="Sample Title 123_1") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0256 begin`);
      const actual: string = insertInto('1234567', 'Sample Title 123_1');
      logInfo(`insertInto(codeText="1234567", text="Samp...: actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0256 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0257
     * @tc.name      VerifyCode_InsertInto_0257
     * @tc.desc      insertInto(codeText="1234567", text="xSample Title 123") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0257 begin`);
      const actual: string = insertInto('1234567', 'xSample Title 123');
      logInfo(`insertInto(codeText="1234567", text="xSam...: actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0257 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0258
     * @tc.name      VerifyCode_InsertInto_0258
     * @tc.desc      insertInto(codeText="1234567", text=" ?? ") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0258 begin`);
      const actual: string = insertInto('1234567', ' \u4e2d\u6587 ');
      logInfo(`insertInto(codeText="1234567", text=" ?? "): actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0258 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0259
     * @tc.name      VerifyCode_InsertInto_0259
     * @tc.desc      insertInto(codeText="1234567", text="????") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0259 begin`);
      const actual: string = insertInto('1234567', '\u4e2d\u6587\u4e2d\u6587');
      logInfo(`insertInto(codeText="1234567", text="????"): actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0259 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0260
     * @tc.name      VerifyCode_InsertInto_0260
     * @tc.desc      insertInto(codeText="1234567", text="??_1") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0260 begin`);
      const actual: string = insertInto('1234567', '\u4e2d\u6587_1');
      logInfo(`insertInto(codeText="1234567", text="??_1"): actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0260 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0261
     * @tc.name      VerifyCode_InsertInto_0261
     * @tc.desc      insertInto(codeText="1234567", text="x??") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0261 begin`);
      const actual: string = insertInto('1234567', 'x\u4e2d\u6587');
      logInfo(`insertInto(codeText="1234567", text="x??"): actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0261 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0262
     * @tc.name      VerifyCode_InsertInto_0262
     * @tc.desc      insertInto(codeText="1234567", text=" a ") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0262 begin`);
      const actual: string = insertInto('1234567', ' a ');
      logInfo(`insertInto(codeText="1234567", text=" a "): actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0262 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0263
     * @tc.name      VerifyCode_InsertInto_0263
     * @tc.desc      insertInto(codeText="1234567", text="aa") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0263 begin`);
      const actual: string = insertInto('1234567', 'aa');
      logInfo(`insertInto(codeText="1234567", text="aa"): actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0263 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0264
     * @tc.name      VerifyCode_InsertInto_0264
     * @tc.desc      insertInto(codeText="1234567", text="a_1") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0264 begin`);
      const actual: string = insertInto('1234567', 'a_1');
      logInfo(`insertInto(codeText="1234567", text="a_1"): actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0264 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0265
     * @tc.name      VerifyCode_InsertInto_0265
     * @tc.desc      insertInto(codeText="1234567", text="xa") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0265 begin`);
      const actual: string = insertInto('1234567', 'xa');
      logInfo(`insertInto(codeText="1234567", text="xa"): actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0265 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0266
     * @tc.name      VerifyCode_InsertInto_0266
     * @tc.desc      insertInto(codeText="1234567", text=" abc ") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0266 begin`);
      const actual: string = insertInto('1234567', ' abc ');
      logInfo(`insertInto(codeText="1234567", text=" abc "): actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0266 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0267
     * @tc.name      VerifyCode_InsertInto_0267
     * @tc.desc      insertInto(codeText="1234567", text="abcabc") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0267 begin`);
      const actual: string = insertInto('1234567', 'abcabc');
      logInfo(`insertInto(codeText="1234567", text="abca...: actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0267 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0268
     * @tc.name      VerifyCode_InsertInto_0268
     * @tc.desc      insertInto(codeText="1234567", text="abc_1") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0268 begin`);
      const actual: string = insertInto('1234567', 'abc_1');
      logInfo(`insertInto(codeText="1234567", text="abc_1"): actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0268 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0269
     * @tc.name      VerifyCode_InsertInto_0269
     * @tc.desc      insertInto(codeText="1234567", text="xabc") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0269 begin`);
      const actual: string = insertInto('1234567', 'xabc');
      logInfo(`insertInto(codeText="1234567", text="xabc"): actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0269 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0270
     * @tc.name      VerifyCode_InsertInto_0270
     * @tc.desc      insertInto(codeText="1234567", text=" Hello World ") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0270 begin`);
      const actual: string = insertInto('1234567', ' Hello World ');
      logInfo(`insertInto(codeText="1234567", text=" Hel...: actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0270 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0271
     * @tc.name      VerifyCode_InsertInto_0271
     * @tc.desc      insertInto(codeText="1234567", text="Hello WorldHello World") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0271 begin`);
      const actual: string = insertInto('1234567', 'Hello WorldHello World');
      logInfo(`insertInto(codeText="1234567", text="Hell...: actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0271 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0272
     * @tc.name      VerifyCode_InsertInto_0272
     * @tc.desc      insertInto(codeText="1234567", text="Hello World_1") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0272 begin`);
      const actual: string = insertInto('1234567', 'Hello World_1');
      logInfo(`insertInto(codeText="1234567", text="Hell...: actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0272 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0273
     * @tc.name      VerifyCode_InsertInto_0273
     * @tc.desc      insertInto(codeText="1234567", text="xHello World") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0273 begin`);
      const actual: string = insertInto('1234567', 'xHello World');
      logInfo(`insertInto(codeText="1234567", text="xHel...: actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0273 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0274
     * @tc.name      VerifyCode_InsertInto_0274
     * @tc.desc      insertInto(codeText="1234567", text=" 123 ") returns "1234567"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0274 begin`);
      const actual: string = insertInto('1234567', ' 123 ');
      logInfo(`insertInto(codeText="1234567", text=" 123 "): actual=${actual}`);
      expect(actual).assertEqual('1234567');
      logInfo(`${BUNDLE}InsertInto_0274 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0275
     * @tc.name      VerifyCode_InsertInto_0275
     * @tc.desc      insertInto(codeText="abc123", text="hello world") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0275 begin`);
      const actual: string = insertInto('abc123', 'hello world');
      logInfo(`insertInto(codeText="abc123", text="hello...: actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0275 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0276
     * @tc.name      VerifyCode_InsertInto_0276
     * @tc.desc      insertInto(codeText="abc123", text="") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0276 begin`);
      const actual: string = insertInto('abc123', '');
      logInfo(`insertInto(codeText="abc123", text=""): actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0276 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0277
     * @tc.name      VerifyCode_InsertInto_0277
     * @tc.desc      insertInto(codeText="abc123", text=" ") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0277 begin`);
      const actual: string = insertInto('abc123', ' ');
      logInfo(`insertInto(codeText="abc123", text=" "): actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0277 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0278
     * @tc.name      VerifyCode_InsertInto_0278
     * @tc.desc      insertInto(codeText="abc123", text="A") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0278 begin`);
      const actual: string = insertInto('abc123', 'A');
      logInfo(`insertInto(codeText="abc123", text="A"): actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0278 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0279
     * @tc.name      VerifyCode_InsertInto_0279
     * @tc.desc      insertInto(codeText="abc123", text="Sample Title 123") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0279 begin`);
      const actual: string = insertInto('abc123', 'Sample Title 123');
      logInfo(`insertInto(codeText="abc123", text="Sampl...: actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0279 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0280
     * @tc.name      VerifyCode_InsertInto_0280
     * @tc.desc      insertInto(codeText="abc123", text="??") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0280 begin`);
      const actual: string = insertInto('abc123', '\u4e2d\u6587');
      logInfo(`insertInto(codeText="abc123", text="??"): actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0280 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0281
     * @tc.name      VerifyCode_InsertInto_0281
     * @tc.desc      insertInto(codeText="abc123", text="a") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0281 begin`);
      const actual: string = insertInto('abc123', 'a');
      logInfo(`insertInto(codeText="abc123", text="a"): actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0281 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0282
     * @tc.name      VerifyCode_InsertInto_0282
     * @tc.desc      insertInto(codeText="abc123", text="abc") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0282 begin`);
      const actual: string = insertInto('abc123', 'abc');
      logInfo(`insertInto(codeText="abc123", text="abc"): actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0282 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0283
     * @tc.name      VerifyCode_InsertInto_0283
     * @tc.desc      insertInto(codeText="abc123", text="Hello World") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0283 begin`);
      const actual: string = insertInto('abc123', 'Hello World');
      logInfo(`insertInto(codeText="abc123", text="Hello...: actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0283 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0284
     * @tc.name      VerifyCode_InsertInto_0284
     * @tc.desc      insertInto(codeText="abc123", text="123") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0284 begin`);
      const actual: string = insertInto('abc123', '123');
      logInfo(`insertInto(codeText="abc123", text="123"): actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0284 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0285
     * @tc.name      VerifyCode_InsertInto_0285
     * @tc.desc      insertInto(codeText="abc123", text=" Hello ") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0285 begin`);
      const actual: string = insertInto('abc123', ' Hello ');
      logInfo(`insertInto(codeText="abc123", text=" Hell...: actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0285 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0286
     * @tc.name      VerifyCode_InsertInto_0286
     * @tc.desc      insertInto(codeText="abc123", text="HelloHello") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0286 begin`);
      const actual: string = insertInto('abc123', 'HelloHello');
      logInfo(`insertInto(codeText="abc123", text="Hello...: actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0286 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0287
     * @tc.name      VerifyCode_InsertInto_0287
     * @tc.desc      insertInto(codeText="abc123", text="Hello_1") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0287 begin`);
      const actual: string = insertInto('abc123', 'Hello_1');
      logInfo(`insertInto(codeText="abc123", text="Hello...: actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0287 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0288
     * @tc.name      VerifyCode_InsertInto_0288
     * @tc.desc      insertInto(codeText="abc123", text="xHello") returns "abc123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0288 begin`);
      const actual: string = insertInto('abc123', 'xHello');
      logInfo(`insertInto(codeText="abc123", text="xHello"): actual=${actual}`);
      expect(actual).assertEqual('abc123');
      logInfo(`${BUNDLE}InsertInto_0288 end`);
    });
  });
}
