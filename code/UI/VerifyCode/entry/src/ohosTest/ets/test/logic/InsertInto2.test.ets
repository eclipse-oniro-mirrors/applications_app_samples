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
export default function insertInto2Test(): void {
  describe('InsertInto2Test', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0097
     * @tc.name      VerifyCode_InsertInto_0097
     * @tc.desc      insertInto(codeText="123456", text="a") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0097 begin`);
      const actual: string = insertInto('123456', 'a');
      logInfo(`insertInto(codeText="123456", text="a"): actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0097 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0098
     * @tc.name      VerifyCode_InsertInto_0098
     * @tc.desc      insertInto(codeText="123456", text="abc") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0098 begin`);
      const actual: string = insertInto('123456', 'abc');
      logInfo(`insertInto(codeText="123456", text="abc"): actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0098 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0099
     * @tc.name      VerifyCode_InsertInto_0099
     * @tc.desc      insertInto(codeText="123456", text="Hello World") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0099 begin`);
      const actual: string = insertInto('123456', 'Hello World');
      logInfo(`insertInto(codeText="123456", text="Hello...: actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0099 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0100
     * @tc.name      VerifyCode_InsertInto_0100
     * @tc.desc      insertInto(codeText="123456", text="123") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0100 begin`);
      const actual: string = insertInto('123456', '123');
      logInfo(`insertInto(codeText="123456", text="123"): actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0100 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0101
     * @tc.name      VerifyCode_InsertInto_0101
     * @tc.desc      insertInto(codeText="123456", text=" Hello ") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0101 begin`);
      const actual: string = insertInto('123456', ' Hello ');
      logInfo(`insertInto(codeText="123456", text=" Hell...: actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0101 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0102
     * @tc.name      VerifyCode_InsertInto_0102
     * @tc.desc      insertInto(codeText="123456", text="HelloHello") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0102 begin`);
      const actual: string = insertInto('123456', 'HelloHello');
      logInfo(`insertInto(codeText="123456", text="Hello...: actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0102 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0103
     * @tc.name      VerifyCode_InsertInto_0103
     * @tc.desc      insertInto(codeText="123456", text="Hello_1") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0103 begin`);
      const actual: string = insertInto('123456', 'Hello_1');
      logInfo(`insertInto(codeText="123456", text="Hello...: actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0103 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0104
     * @tc.name      VerifyCode_InsertInto_0104
     * @tc.desc      insertInto(codeText="123456", text="xHello") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0104 begin`);
      const actual: string = insertInto('123456', 'xHello');
      logInfo(`insertInto(codeText="123456", text="xHello"): actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0104 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0105
     * @tc.name      VerifyCode_InsertInto_0105
     * @tc.desc      insertInto(codeText="123456", text=" hello world ") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0105 begin`);
      const actual: string = insertInto('123456', ' hello world ');
      logInfo(`insertInto(codeText="123456", text=" hell...: actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0105 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0106
     * @tc.name      VerifyCode_InsertInto_0106
     * @tc.desc      insertInto(codeText="123456", text="hello worldhello world") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0106 begin`);
      const actual: string = insertInto('123456', 'hello worldhello world');
      logInfo(`insertInto(codeText="123456", text="hello...: actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0106 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0107
     * @tc.name      VerifyCode_InsertInto_0107
     * @tc.desc      insertInto(codeText="123456", text="hello world_1") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0107 begin`);
      const actual: string = insertInto('123456', 'hello world_1');
      logInfo(`insertInto(codeText="123456", text="hello...: actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0107 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0108
     * @tc.name      VerifyCode_InsertInto_0108
     * @tc.desc      insertInto(codeText="123456", text="xhello world") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0108 begin`);
      const actual: string = insertInto('123456', 'xhello world');
      logInfo(`insertInto(codeText="123456", text="xhell...: actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0108 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0109
     * @tc.name      VerifyCode_InsertInto_0109
     * @tc.desc      insertInto(codeText="123456", text="   ") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0109 begin`);
      const actual: string = insertInto('123456', '   ');
      logInfo(`insertInto(codeText="123456", text="   "): actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0109 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0110
     * @tc.name      VerifyCode_InsertInto_0110
     * @tc.desc      insertInto(codeText="123456", text="  ") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0110 begin`);
      const actual: string = insertInto('123456', '  ');
      logInfo(`insertInto(codeText="123456", text="  "): actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0110 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0111
     * @tc.name      VerifyCode_InsertInto_0111
     * @tc.desc      insertInto(codeText="123456", text=" _1") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0111 begin`);
      const actual: string = insertInto('123456', ' _1');
      logInfo(`insertInto(codeText="123456", text=" _1"): actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0111 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0112
     * @tc.name      VerifyCode_InsertInto_0112
     * @tc.desc      insertInto(codeText="123456", text="x ") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0112 begin`);
      const actual: string = insertInto('123456', 'x ');
      logInfo(`insertInto(codeText="123456", text="x "): actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0112 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0113
     * @tc.name      VerifyCode_InsertInto_0113
     * @tc.desc      insertInto(codeText="123456", text=" A ") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0113 begin`);
      const actual: string = insertInto('123456', ' A ');
      logInfo(`insertInto(codeText="123456", text=" A "): actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0113 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0114
     * @tc.name      VerifyCode_InsertInto_0114
     * @tc.desc      insertInto(codeText="123456", text="AA") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0114 begin`);
      const actual: string = insertInto('123456', 'AA');
      logInfo(`insertInto(codeText="123456", text="AA"): actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0114 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0115
     * @tc.name      VerifyCode_InsertInto_0115
     * @tc.desc      insertInto(codeText="123456", text="A_1") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0115 begin`);
      const actual: string = insertInto('123456', 'A_1');
      logInfo(`insertInto(codeText="123456", text="A_1"): actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0115 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0116
     * @tc.name      VerifyCode_InsertInto_0116
     * @tc.desc      insertInto(codeText="123456", text="xA") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0116 begin`);
      const actual: string = insertInto('123456', 'xA');
      logInfo(`insertInto(codeText="123456", text="xA"): actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0116 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0117
     * @tc.name      VerifyCode_InsertInto_0117
     * @tc.desc      insertInto(codeText="123456", text=" Sample Title 123 ") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0117 begin`);
      const actual: string = insertInto('123456', ' Sample Title 123 ');
      logInfo(`insertInto(codeText="123456", text=" Samp...: actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0117 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0118
     * @tc.name      VerifyCode_InsertInto_0118
     * @tc.desc      insertInto(codeText="123456", text="Sample Title 123Sample Title 123") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0118 begin`);
      const actual: string = insertInto('123456', 'Sample Title 123Sample Title 123');
      logInfo(`insertInto(codeText="123456", text="Sampl...: actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0118 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0119
     * @tc.name      VerifyCode_InsertInto_0119
     * @tc.desc      insertInto(codeText="123456", text="Sample Title 123_1") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0119 begin`);
      const actual: string = insertInto('123456', 'Sample Title 123_1');
      logInfo(`insertInto(codeText="123456", text="Sampl...: actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0119 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0120
     * @tc.name      VerifyCode_InsertInto_0120
     * @tc.desc      insertInto(codeText="123456", text="xSample Title 123") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0120 begin`);
      const actual: string = insertInto('123456', 'xSample Title 123');
      logInfo(`insertInto(codeText="123456", text="xSamp...: actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0120 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0121
     * @tc.name      VerifyCode_InsertInto_0121
     * @tc.desc      insertInto(codeText="123456", text=" ?? ") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0121 begin`);
      const actual: string = insertInto('123456', ' \u4e2d\u6587 ');
      logInfo(`insertInto(codeText="123456", text=" ?? "): actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0121 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0122
     * @tc.name      VerifyCode_InsertInto_0122
     * @tc.desc      insertInto(codeText="123456", text="????") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0122 begin`);
      const actual: string = insertInto('123456', '\u4e2d\u6587\u4e2d\u6587');
      logInfo(`insertInto(codeText="123456", text="????"): actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0122 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0123
     * @tc.name      VerifyCode_InsertInto_0123
     * @tc.desc      insertInto(codeText="123456", text="??_1") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0123 begin`);
      const actual: string = insertInto('123456', '\u4e2d\u6587_1');
      logInfo(`insertInto(codeText="123456", text="??_1"): actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0123 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0124
     * @tc.name      VerifyCode_InsertInto_0124
     * @tc.desc      insertInto(codeText="123456", text="x??") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0124 begin`);
      const actual: string = insertInto('123456', 'x\u4e2d\u6587');
      logInfo(`insertInto(codeText="123456", text="x??"): actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0124 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0125
     * @tc.name      VerifyCode_InsertInto_0125
     * @tc.desc      insertInto(codeText="123456", text=" a ") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0125 begin`);
      const actual: string = insertInto('123456', ' a ');
      logInfo(`insertInto(codeText="123456", text=" a "): actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0125 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0126
     * @tc.name      VerifyCode_InsertInto_0126
     * @tc.desc      insertInto(codeText="123456", text="aa") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0126 begin`);
      const actual: string = insertInto('123456', 'aa');
      logInfo(`insertInto(codeText="123456", text="aa"): actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0126 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0127
     * @tc.name      VerifyCode_InsertInto_0127
     * @tc.desc      insertInto(codeText="123456", text="a_1") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0127 begin`);
      const actual: string = insertInto('123456', 'a_1');
      logInfo(`insertInto(codeText="123456", text="a_1"): actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0127 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0128
     * @tc.name      VerifyCode_InsertInto_0128
     * @tc.desc      insertInto(codeText="123456", text="xa") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0128 begin`);
      const actual: string = insertInto('123456', 'xa');
      logInfo(`insertInto(codeText="123456", text="xa"): actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0128 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0129
     * @tc.name      VerifyCode_InsertInto_0129
     * @tc.desc      insertInto(codeText="123456", text=" abc ") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0129 begin`);
      const actual: string = insertInto('123456', ' abc ');
      logInfo(`insertInto(codeText="123456", text=" abc "): actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0129 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0130
     * @tc.name      VerifyCode_InsertInto_0130
     * @tc.desc      insertInto(codeText="123456", text="abcabc") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0130 begin`);
      const actual: string = insertInto('123456', 'abcabc');
      logInfo(`insertInto(codeText="123456", text="abcabc"): actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0130 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0131
     * @tc.name      VerifyCode_InsertInto_0131
     * @tc.desc      insertInto(codeText="123456", text="abc_1") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0131 begin`);
      const actual: string = insertInto('123456', 'abc_1');
      logInfo(`insertInto(codeText="123456", text="abc_1"): actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0131 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0132
     * @tc.name      VerifyCode_InsertInto_0132
     * @tc.desc      insertInto(codeText="123456", text="xabc") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0132 begin`);
      const actual: string = insertInto('123456', 'xabc');
      logInfo(`insertInto(codeText="123456", text="xabc"): actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0132 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0133
     * @tc.name      VerifyCode_InsertInto_0133
     * @tc.desc      insertInto(codeText="123456", text=" Hello World ") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0133 begin`);
      const actual: string = insertInto('123456', ' Hello World ');
      logInfo(`insertInto(codeText="123456", text=" Hell...: actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0133 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0134
     * @tc.name      VerifyCode_InsertInto_0134
     * @tc.desc      insertInto(codeText="123456", text="Hello WorldHello World") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0134 begin`);
      const actual: string = insertInto('123456', 'Hello WorldHello World');
      logInfo(`insertInto(codeText="123456", text="Hello...: actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0134 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0135
     * @tc.name      VerifyCode_InsertInto_0135
     * @tc.desc      insertInto(codeText="123456", text="Hello World_1") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0135 begin`);
      const actual: string = insertInto('123456', 'Hello World_1');
      logInfo(`insertInto(codeText="123456", text="Hello...: actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0135 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0136
     * @tc.name      VerifyCode_InsertInto_0136
     * @tc.desc      insertInto(codeText="123456", text="xHello World") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0136 begin`);
      const actual: string = insertInto('123456', 'xHello World');
      logInfo(`insertInto(codeText="123456", text="xHell...: actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0136 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0137
     * @tc.name      VerifyCode_InsertInto_0137
     * @tc.desc      insertInto(codeText="123456", text=" 123 ") returns "123456"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0137 begin`);
      const actual: string = insertInto('123456', ' 123 ');
      logInfo(`insertInto(codeText="123456", text=" 123 "): actual=${actual}`);
      expect(actual).assertEqual('123456');
      logInfo(`${BUNDLE}InsertInto_0137 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0138
     * @tc.name      VerifyCode_InsertInto_0138
     * @tc.desc      insertInto(codeText="000000", text="hello world") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0138 begin`);
      const actual: string = insertInto('000000', 'hello world');
      logInfo(`insertInto(codeText="000000", text="hello...: actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0138 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0139
     * @tc.name      VerifyCode_InsertInto_0139
     * @tc.desc      insertInto(codeText="000000", text="") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0139 begin`);
      const actual: string = insertInto('000000', '');
      logInfo(`insertInto(codeText="000000", text=""): actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0139 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0140
     * @tc.name      VerifyCode_InsertInto_0140
     * @tc.desc      insertInto(codeText="000000", text=" ") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0140 begin`);
      const actual: string = insertInto('000000', ' ');
      logInfo(`insertInto(codeText="000000", text=" "): actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0140 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0141
     * @tc.name      VerifyCode_InsertInto_0141
     * @tc.desc      insertInto(codeText="000000", text="A") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0141 begin`);
      const actual: string = insertInto('000000', 'A');
      logInfo(`insertInto(codeText="000000", text="A"): actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0141 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0142
     * @tc.name      VerifyCode_InsertInto_0142
     * @tc.desc      insertInto(codeText="000000", text="Sample Title 123") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0142 begin`);
      const actual: string = insertInto('000000', 'Sample Title 123');
      logInfo(`insertInto(codeText="000000", text="Sampl...: actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0142 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0143
     * @tc.name      VerifyCode_InsertInto_0143
     * @tc.desc      insertInto(codeText="000000", text="??") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0143 begin`);
      const actual: string = insertInto('000000', '\u4e2d\u6587');
      logInfo(`insertInto(codeText="000000", text="??"): actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0143 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0144
     * @tc.name      VerifyCode_InsertInto_0144
     * @tc.desc      insertInto(codeText="000000", text="a") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0144 begin`);
      const actual: string = insertInto('000000', 'a');
      logInfo(`insertInto(codeText="000000", text="a"): actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0144 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0145
     * @tc.name      VerifyCode_InsertInto_0145
     * @tc.desc      insertInto(codeText="000000", text="abc") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0145 begin`);
      const actual: string = insertInto('000000', 'abc');
      logInfo(`insertInto(codeText="000000", text="abc"): actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0145 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0146
     * @tc.name      VerifyCode_InsertInto_0146
     * @tc.desc      insertInto(codeText="000000", text="Hello World") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0146 begin`);
      const actual: string = insertInto('000000', 'Hello World');
      logInfo(`insertInto(codeText="000000", text="Hello...: actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0146 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0147
     * @tc.name      VerifyCode_InsertInto_0147
     * @tc.desc      insertInto(codeText="000000", text="123") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0147 begin`);
      const actual: string = insertInto('000000', '123');
      logInfo(`insertInto(codeText="000000", text="123"): actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0147 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0148
     * @tc.name      VerifyCode_InsertInto_0148
     * @tc.desc      insertInto(codeText="000000", text=" Hello ") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0148 begin`);
      const actual: string = insertInto('000000', ' Hello ');
      logInfo(`insertInto(codeText="000000", text=" Hell...: actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0148 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0149
     * @tc.name      VerifyCode_InsertInto_0149
     * @tc.desc      insertInto(codeText="000000", text="HelloHello") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0149 begin`);
      const actual: string = insertInto('000000', 'HelloHello');
      logInfo(`insertInto(codeText="000000", text="Hello...: actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0149 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0150
     * @tc.name      VerifyCode_InsertInto_0150
     * @tc.desc      insertInto(codeText="000000", text="Hello_1") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0150 begin`);
      const actual: string = insertInto('000000', 'Hello_1');
      logInfo(`insertInto(codeText="000000", text="Hello...: actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0150 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0151
     * @tc.name      VerifyCode_InsertInto_0151
     * @tc.desc      insertInto(codeText="000000", text="xHello") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0151 begin`);
      const actual: string = insertInto('000000', 'xHello');
      logInfo(`insertInto(codeText="000000", text="xHello"): actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0151 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0152
     * @tc.name      VerifyCode_InsertInto_0152
     * @tc.desc      insertInto(codeText="000000", text=" hello world ") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0152 begin`);
      const actual: string = insertInto('000000', ' hello world ');
      logInfo(`insertInto(codeText="000000", text=" hell...: actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0152 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0153
     * @tc.name      VerifyCode_InsertInto_0153
     * @tc.desc      insertInto(codeText="000000", text="hello worldhello world") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0153 begin`);
      const actual: string = insertInto('000000', 'hello worldhello world');
      logInfo(`insertInto(codeText="000000", text="hello...: actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0153 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0154
     * @tc.name      VerifyCode_InsertInto_0154
     * @tc.desc      insertInto(codeText="000000", text="hello world_1") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0154 begin`);
      const actual: string = insertInto('000000', 'hello world_1');
      logInfo(`insertInto(codeText="000000", text="hello...: actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0154 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0155
     * @tc.name      VerifyCode_InsertInto_0155
     * @tc.desc      insertInto(codeText="000000", text="xhello world") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0155 begin`);
      const actual: string = insertInto('000000', 'xhello world');
      logInfo(`insertInto(codeText="000000", text="xhell...: actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0155 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0156
     * @tc.name      VerifyCode_InsertInto_0156
     * @tc.desc      insertInto(codeText="000000", text="   ") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0156 begin`);
      const actual: string = insertInto('000000', '   ');
      logInfo(`insertInto(codeText="000000", text="   "): actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0156 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0157
     * @tc.name      VerifyCode_InsertInto_0157
     * @tc.desc      insertInto(codeText="000000", text="  ") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0157 begin`);
      const actual: string = insertInto('000000', '  ');
      logInfo(`insertInto(codeText="000000", text="  "): actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0157 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0158
     * @tc.name      VerifyCode_InsertInto_0158
     * @tc.desc      insertInto(codeText="000000", text=" _1") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0158 begin`);
      const actual: string = insertInto('000000', ' _1');
      logInfo(`insertInto(codeText="000000", text=" _1"): actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0158 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0159
     * @tc.name      VerifyCode_InsertInto_0159
     * @tc.desc      insertInto(codeText="000000", text="x ") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0159 begin`);
      const actual: string = insertInto('000000', 'x ');
      logInfo(`insertInto(codeText="000000", text="x "): actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0159 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0160
     * @tc.name      VerifyCode_InsertInto_0160
     * @tc.desc      insertInto(codeText="000000", text=" A ") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0160 begin`);
      const actual: string = insertInto('000000', ' A ');
      logInfo(`insertInto(codeText="000000", text=" A "): actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0160 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0161
     * @tc.name      VerifyCode_InsertInto_0161
     * @tc.desc      insertInto(codeText="000000", text="AA") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0161 begin`);
      const actual: string = insertInto('000000', 'AA');
      logInfo(`insertInto(codeText="000000", text="AA"): actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0161 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0162
     * @tc.name      VerifyCode_InsertInto_0162
     * @tc.desc      insertInto(codeText="000000", text="A_1") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0162 begin`);
      const actual: string = insertInto('000000', 'A_1');
      logInfo(`insertInto(codeText="000000", text="A_1"): actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0162 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0163
     * @tc.name      VerifyCode_InsertInto_0163
     * @tc.desc      insertInto(codeText="000000", text="xA") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0163 begin`);
      const actual: string = insertInto('000000', 'xA');
      logInfo(`insertInto(codeText="000000", text="xA"): actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0163 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0164
     * @tc.name      VerifyCode_InsertInto_0164
     * @tc.desc      insertInto(codeText="000000", text=" Sample Title 123 ") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0164 begin`);
      const actual: string = insertInto('000000', ' Sample Title 123 ');
      logInfo(`insertInto(codeText="000000", text=" Samp...: actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0164 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0165
     * @tc.name      VerifyCode_InsertInto_0165
     * @tc.desc      insertInto(codeText="000000", text="Sample Title 123Sample Title 123") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0165 begin`);
      const actual: string = insertInto('000000', 'Sample Title 123Sample Title 123');
      logInfo(`insertInto(codeText="000000", text="Sampl...: actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0165 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0166
     * @tc.name      VerifyCode_InsertInto_0166
     * @tc.desc      insertInto(codeText="000000", text="Sample Title 123_1") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0166 begin`);
      const actual: string = insertInto('000000', 'Sample Title 123_1');
      logInfo(`insertInto(codeText="000000", text="Sampl...: actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0166 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0167
     * @tc.name      VerifyCode_InsertInto_0167
     * @tc.desc      insertInto(codeText="000000", text="xSample Title 123") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0167 begin`);
      const actual: string = insertInto('000000', 'xSample Title 123');
      logInfo(`insertInto(codeText="000000", text="xSamp...: actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0167 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0168
     * @tc.name      VerifyCode_InsertInto_0168
     * @tc.desc      insertInto(codeText="000000", text=" ?? ") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0168 begin`);
      const actual: string = insertInto('000000', ' \u4e2d\u6587 ');
      logInfo(`insertInto(codeText="000000", text=" ?? "): actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0168 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0169
     * @tc.name      VerifyCode_InsertInto_0169
     * @tc.desc      insertInto(codeText="000000", text="????") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0169 begin`);
      const actual: string = insertInto('000000', '\u4e2d\u6587\u4e2d\u6587');
      logInfo(`insertInto(codeText="000000", text="????"): actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0169 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0170
     * @tc.name      VerifyCode_InsertInto_0170
     * @tc.desc      insertInto(codeText="000000", text="??_1") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0170 begin`);
      const actual: string = insertInto('000000', '\u4e2d\u6587_1');
      logInfo(`insertInto(codeText="000000", text="??_1"): actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0170 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0171
     * @tc.name      VerifyCode_InsertInto_0171
     * @tc.desc      insertInto(codeText="000000", text="x??") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0171 begin`);
      const actual: string = insertInto('000000', 'x\u4e2d\u6587');
      logInfo(`insertInto(codeText="000000", text="x??"): actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0171 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0172
     * @tc.name      VerifyCode_InsertInto_0172
     * @tc.desc      insertInto(codeText="000000", text=" a ") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0172 begin`);
      const actual: string = insertInto('000000', ' a ');
      logInfo(`insertInto(codeText="000000", text=" a "): actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0172 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0173
     * @tc.name      VerifyCode_InsertInto_0173
     * @tc.desc      insertInto(codeText="000000", text="aa") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0173 begin`);
      const actual: string = insertInto('000000', 'aa');
      logInfo(`insertInto(codeText="000000", text="aa"): actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0173 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0174
     * @tc.name      VerifyCode_InsertInto_0174
     * @tc.desc      insertInto(codeText="000000", text="a_1") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0174 begin`);
      const actual: string = insertInto('000000', 'a_1');
      logInfo(`insertInto(codeText="000000", text="a_1"): actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0174 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0175
     * @tc.name      VerifyCode_InsertInto_0175
     * @tc.desc      insertInto(codeText="000000", text="xa") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0175 begin`);
      const actual: string = insertInto('000000', 'xa');
      logInfo(`insertInto(codeText="000000", text="xa"): actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0175 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0176
     * @tc.name      VerifyCode_InsertInto_0176
     * @tc.desc      insertInto(codeText="000000", text=" abc ") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0176 begin`);
      const actual: string = insertInto('000000', ' abc ');
      logInfo(`insertInto(codeText="000000", text=" abc "): actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0176 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0177
     * @tc.name      VerifyCode_InsertInto_0177
     * @tc.desc      insertInto(codeText="000000", text="abcabc") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0177 begin`);
      const actual: string = insertInto('000000', 'abcabc');
      logInfo(`insertInto(codeText="000000", text="abcabc"): actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0177 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0178
     * @tc.name      VerifyCode_InsertInto_0178
     * @tc.desc      insertInto(codeText="000000", text="abc_1") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0178 begin`);
      const actual: string = insertInto('000000', 'abc_1');
      logInfo(`insertInto(codeText="000000", text="abc_1"): actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0178 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0179
     * @tc.name      VerifyCode_InsertInto_0179
     * @tc.desc      insertInto(codeText="000000", text="xabc") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0179 begin`);
      const actual: string = insertInto('000000', 'xabc');
      logInfo(`insertInto(codeText="000000", text="xabc"): actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0179 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0180
     * @tc.name      VerifyCode_InsertInto_0180
     * @tc.desc      insertInto(codeText="000000", text=" Hello World ") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0180 begin`);
      const actual: string = insertInto('000000', ' Hello World ');
      logInfo(`insertInto(codeText="000000", text=" Hell...: actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0180 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0181
     * @tc.name      VerifyCode_InsertInto_0181
     * @tc.desc      insertInto(codeText="000000", text="Hello WorldHello World") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0181 begin`);
      const actual: string = insertInto('000000', 'Hello WorldHello World');
      logInfo(`insertInto(codeText="000000", text="Hello...: actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0181 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0182
     * @tc.name      VerifyCode_InsertInto_0182
     * @tc.desc      insertInto(codeText="000000", text="Hello World_1") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0182 begin`);
      const actual: string = insertInto('000000', 'Hello World_1');
      logInfo(`insertInto(codeText="000000", text="Hello...: actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0182 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0183
     * @tc.name      VerifyCode_InsertInto_0183
     * @tc.desc      insertInto(codeText="000000", text="xHello World") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0183 begin`);
      const actual: string = insertInto('000000', 'xHello World');
      logInfo(`insertInto(codeText="000000", text="xHell...: actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0183 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0184
     * @tc.name      VerifyCode_InsertInto_0184
     * @tc.desc      insertInto(codeText="000000", text=" 123 ") returns "000000"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0184 begin`);
      const actual: string = insertInto('000000', ' 123 ');
      logInfo(`insertInto(codeText="000000", text=" 123 "): actual=${actual}`);
      expect(actual).assertEqual('000000');
      logInfo(`${BUNDLE}InsertInto_0184 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0185
     * @tc.name      VerifyCode_InsertInto_0185
     * @tc.desc      insertInto(codeText="12345", text="hello world") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0185 begin`);
      const actual: string = insertInto('12345', 'hello world');
      logInfo(`insertInto(codeText="12345", text="hello ...: actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0185 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0186
     * @tc.name      VerifyCode_InsertInto_0186
     * @tc.desc      insertInto(codeText="12345", text="") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('VerifyCode_InsertInto_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}InsertInto_0186 begin`);
      const actual: string = insertInto('12345', '');
      logInfo(`insertInto(codeText="12345", text=""): actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0186 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0187
     * @tc.name      VerifyCode_InsertInto_0187
     * @tc.desc      insertInto(codeText="12345", text=" ") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0187 begin`);
      const actual: string = insertInto('12345', ' ');
      logInfo(`insertInto(codeText="12345", text=" "): actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0187 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0188
     * @tc.name      VerifyCode_InsertInto_0188
     * @tc.desc      insertInto(codeText="12345", text="A") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0188 begin`);
      const actual: string = insertInto('12345', 'A');
      logInfo(`insertInto(codeText="12345", text="A"): actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0188 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0189
     * @tc.name      VerifyCode_InsertInto_0189
     * @tc.desc      insertInto(codeText="12345", text="Sample Title 123") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0189 begin`);
      const actual: string = insertInto('12345', 'Sample Title 123');
      logInfo(`insertInto(codeText="12345", text="Sample...: actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0189 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0190
     * @tc.name      VerifyCode_InsertInto_0190
     * @tc.desc      insertInto(codeText="12345", text="??") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0190 begin`);
      const actual: string = insertInto('12345', '\u4e2d\u6587');
      logInfo(`insertInto(codeText="12345", text="??"): actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0190 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0191
     * @tc.name      VerifyCode_InsertInto_0191
     * @tc.desc      insertInto(codeText="12345", text="a") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0191 begin`);
      const actual: string = insertInto('12345', 'a');
      logInfo(`insertInto(codeText="12345", text="a"): actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0191 end`);
    });

    /**
     * @tc.number    SUB_VERIFYCODE_INSERT_INTO_0192
     * @tc.name      VerifyCode_InsertInto_0192
     * @tc.desc      insertInto(codeText="12345", text="abc") returns "12345"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('VerifyCode_InsertInto_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}InsertInto_0192 begin`);
      const actual: string = insertInto('12345', 'abc');
      logInfo(`insertInto(codeText="12345", text="abc"): actual=${actual}`);
      expect(actual).assertEqual('12345');
      logInfo(`${BUNDLE}InsertInto_0192 end`);
    });
  });
}
