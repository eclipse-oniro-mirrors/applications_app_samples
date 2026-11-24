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
import { yieldToEventLoop } from '../YieldToEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { exceptionMessageOf } from '../model/SppSerialLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SerialCommunication]';
const BUNDLE: string = 'SerialCommunication_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for exceptionMessageOf (41 cases). */
export default function exceptionMessageOf3Test(): void {
  describe('ExceptionMessageOf3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0193
     * @tc.name      SerialCommunication_ExceptionMessageOf_0193
     * @tc.desc      exceptionMessageOf(code=3, message="Hello") returns "errCode: 3, errMessage: Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0193 begin`);
      const actual: string = exceptionMessageOf(3, 'Hello');
      logInfo(`exceptionMessageOf(code=3, message="Hello"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 3, errMessage: Hello');
      logInfo(`${BUNDLE}ExceptionMessageOf_0193 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0194
     * @tc.name      SerialCommunication_ExceptionMessageOf_0194
     * @tc.desc      exceptionMessageOf(code=3, message="hello world") returns "errCode: 3, errMessage: hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0194 begin`);
      const actual: string = exceptionMessageOf(3, 'hello world');
      logInfo(`exceptionMessageOf(code=3, message="hello...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 3, errMessage: hello world');
      logInfo(`${BUNDLE}ExceptionMessageOf_0194 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0195
     * @tc.name      SerialCommunication_ExceptionMessageOf_0195
     * @tc.desc      exceptionMessageOf(code=3, message="") returns "errCode: 3, errMessage: "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0195 begin`);
      const actual: string = exceptionMessageOf(3, '');
      logInfo(`exceptionMessageOf(code=3, message=""): actual=${actual}`);
      expect(actual).assertEqual('errCode: 3, errMessage: ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0195 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0196
     * @tc.name      SerialCommunication_ExceptionMessageOf_0196
     * @tc.desc      exceptionMessageOf(code=3, message=" ") returns "errCode: 3, errMessage:  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0196 begin`);
      const actual: string = exceptionMessageOf(3, ' ');
      logInfo(`exceptionMessageOf(code=3, message=" "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 3, errMessage:  ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0196 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0197
     * @tc.name      SerialCommunication_ExceptionMessageOf_0197
     * @tc.desc      exceptionMessageOf(code=3, message="A") returns "errCode: 3, errMessage: A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0197 begin`);
      const actual: string = exceptionMessageOf(3, 'A');
      logInfo(`exceptionMessageOf(code=3, message="A"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 3, errMessage: A');
      logInfo(`${BUNDLE}ExceptionMessageOf_0197 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0198
     * @tc.name      SerialCommunication_ExceptionMessageOf_0198
     * @tc.desc      exceptionMessageOf(code=3, message="Sample Title 123") returns "errCode: 3, errMessage: Sample T...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0198 begin`);
      const actual: string = exceptionMessageOf(3, 'Sample Title 123');
      logInfo(`exceptionMessageOf(code=3, message="Sampl...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 3, errMessage: Sample Title 123');
      logInfo(`${BUNDLE}ExceptionMessageOf_0198 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0199
     * @tc.name      SerialCommunication_ExceptionMessageOf_0199
     * @tc.desc      exceptionMessageOf(code=3, message="??") returns "errCode: 3, errMessage: ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0199 begin`);
      const actual: string = exceptionMessageOf(3, '\u4e2d\u6587');
      logInfo(`exceptionMessageOf(code=3, message="??"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 3, errMessage: \u4e2d\u6587');
      logInfo(`${BUNDLE}ExceptionMessageOf_0199 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0200
     * @tc.name      SerialCommunication_ExceptionMessageOf_0200
     * @tc.desc      exceptionMessageOf(code=3, message="a") returns "errCode: 3, errMessage: a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0200 begin`);
      const actual: string = exceptionMessageOf(3, 'a');
      logInfo(`exceptionMessageOf(code=3, message="a"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 3, errMessage: a');
      logInfo(`${BUNDLE}ExceptionMessageOf_0200 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0201
     * @tc.name      SerialCommunication_ExceptionMessageOf_0201
     * @tc.desc      exceptionMessageOf(code=3, message="abc") returns "errCode: 3, errMessage: abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0201 begin`);
      const actual: string = exceptionMessageOf(3, 'abc');
      logInfo(`exceptionMessageOf(code=3, message="abc"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 3, errMessage: abc');
      logInfo(`${BUNDLE}ExceptionMessageOf_0201 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0202
     * @tc.name      SerialCommunication_ExceptionMessageOf_0202
     * @tc.desc      exceptionMessageOf(code=3, message="Hello World") returns "errCode: 3, errMessage: Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0202 begin`);
      const actual: string = exceptionMessageOf(3, 'Hello World');
      logInfo(`exceptionMessageOf(code=3, message="Hello...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 3, errMessage: Hello World');
      logInfo(`${BUNDLE}ExceptionMessageOf_0202 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0203
     * @tc.name      SerialCommunication_ExceptionMessageOf_0203
     * @tc.desc      exceptionMessageOf(code=3, message="123") returns "errCode: 3, errMessage: 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0203 begin`);
      const actual: string = exceptionMessageOf(3, '123');
      logInfo(`exceptionMessageOf(code=3, message="123"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 3, errMessage: 123');
      logInfo(`${BUNDLE}ExceptionMessageOf_0203 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0204
     * @tc.name      SerialCommunication_ExceptionMessageOf_0204
     * @tc.desc      exceptionMessageOf(code=3, message=" Hello ") returns "errCode: 3, errMessage:  Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0204 begin`);
      const actual: string = exceptionMessageOf(3, ' Hello ');
      logInfo(`exceptionMessageOf(code=3, message=" Hell...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 3, errMessage:  Hello ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0204 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0205
     * @tc.name      SerialCommunication_ExceptionMessageOf_0205
     * @tc.desc      exceptionMessageOf(code=3, message="HelloHello") returns "errCode: 3, errMessage: HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0205 begin`);
      const actual: string = exceptionMessageOf(3, 'HelloHello');
      logInfo(`exceptionMessageOf(code=3, message="Hello...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 3, errMessage: HelloHello');
      logInfo(`${BUNDLE}ExceptionMessageOf_0205 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0206
     * @tc.name      SerialCommunication_ExceptionMessageOf_0206
     * @tc.desc      exceptionMessageOf(code=3, message="Hello_1") returns "errCode: 3, errMessage: Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0206 begin`);
      const actual: string = exceptionMessageOf(3, 'Hello_1');
      logInfo(`exceptionMessageOf(code=3, message="Hello...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 3, errMessage: Hello_1');
      logInfo(`${BUNDLE}ExceptionMessageOf_0206 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0207
     * @tc.name      SerialCommunication_ExceptionMessageOf_0207
     * @tc.desc      exceptionMessageOf(code=3, message="xHello") returns "errCode: 3, errMessage: xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0207 begin`);
      const actual: string = exceptionMessageOf(3, 'xHello');
      logInfo(`exceptionMessageOf(code=3, message="xHello"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 3, errMessage: xHello');
      logInfo(`${BUNDLE}ExceptionMessageOf_0207 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0208
     * @tc.name      SerialCommunication_ExceptionMessageOf_0208
     * @tc.desc      exceptionMessageOf(code=3, message=" hello world ") returns "errCode: 3, errMessage:  hello world "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0208 begin`);
      const actual: string = exceptionMessageOf(3, ' hello world ');
      logInfo(`exceptionMessageOf(code=3, message=" hell...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 3, errMessage:  hello world ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0208 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0209
     * @tc.name      SerialCommunication_ExceptionMessageOf_0209
     * @tc.desc      exceptionMessageOf(code=3, message="hello worldhello world") returns "errCode: 3, errMessage: he...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0209 begin`);
      const actual: string = exceptionMessageOf(3, 'hello worldhello world');
      logInfo(`exceptionMessageOf(code=3, message="hello...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 3, errMessage: hello worldhello world');
      logInfo(`${BUNDLE}ExceptionMessageOf_0209 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0210
     * @tc.name      SerialCommunication_ExceptionMessageOf_0210
     * @tc.desc      exceptionMessageOf(code=3, message="hello world_1") returns "errCode: 3, errMessage: hello world_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0210 begin`);
      const actual: string = exceptionMessageOf(3, 'hello world_1');
      logInfo(`exceptionMessageOf(code=3, message="hello...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 3, errMessage: hello world_1');
      logInfo(`${BUNDLE}ExceptionMessageOf_0210 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0211
     * @tc.name      SerialCommunication_ExceptionMessageOf_0211
     * @tc.desc      exceptionMessageOf(code=3, message="xhello world") returns "errCode: 3, errMessage: xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0211 begin`);
      const actual: string = exceptionMessageOf(3, 'xhello world');
      logInfo(`exceptionMessageOf(code=3, message="xhell...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 3, errMessage: xhello world');
      logInfo(`${BUNDLE}ExceptionMessageOf_0211 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0212
     * @tc.name      SerialCommunication_ExceptionMessageOf_0212
     * @tc.desc      exceptionMessageOf(code=3, message="   ") returns "errCode: 3, errMessage:    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0212 begin`);
      const actual: string = exceptionMessageOf(3, '   ');
      logInfo(`exceptionMessageOf(code=3, message="   "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 3, errMessage:    ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0212 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0213
     * @tc.name      SerialCommunication_ExceptionMessageOf_0213
     * @tc.desc      exceptionMessageOf(code=3, message="  ") returns "errCode: 3, errMessage:   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0213 begin`);
      const actual: string = exceptionMessageOf(3, '  ');
      logInfo(`exceptionMessageOf(code=3, message="  "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 3, errMessage:   ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0213 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0214
     * @tc.name      SerialCommunication_ExceptionMessageOf_0214
     * @tc.desc      exceptionMessageOf(code=3, message=" _1") returns "errCode: 3, errMessage:  _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0214 begin`);
      const actual: string = exceptionMessageOf(3, ' _1');
      logInfo(`exceptionMessageOf(code=3, message=" _1"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 3, errMessage:  _1');
      logInfo(`${BUNDLE}ExceptionMessageOf_0214 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0215
     * @tc.name      SerialCommunication_ExceptionMessageOf_0215
     * @tc.desc      exceptionMessageOf(code=3, message="x ") returns "errCode: 3, errMessage: x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0215 begin`);
      const actual: string = exceptionMessageOf(3, 'x ');
      logInfo(`exceptionMessageOf(code=3, message="x "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 3, errMessage: x ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0215 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0216
     * @tc.name      SerialCommunication_ExceptionMessageOf_0216
     * @tc.desc      exceptionMessageOf(code=3, message=" A ") returns "errCode: 3, errMessage:  A "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0216 begin`);
      const actual: string = exceptionMessageOf(3, ' A ');
      logInfo(`exceptionMessageOf(code=3, message=" A "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 3, errMessage:  A ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0216 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0217
     * @tc.name      SerialCommunication_ExceptionMessageOf_0217
     * @tc.desc      exceptionMessageOf(code=10, message="Hello") returns "errCode: 10, errMessage: Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0217 begin`);
      const actual: string = exceptionMessageOf(10, 'Hello');
      logInfo(`exceptionMessageOf(code=10, message="Hello"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 10, errMessage: Hello');
      logInfo(`${BUNDLE}ExceptionMessageOf_0217 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0218
     * @tc.name      SerialCommunication_ExceptionMessageOf_0218
     * @tc.desc      exceptionMessageOf(code=10, message="hello world") returns "errCode: 10, errMessage: hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0218 begin`);
      const actual: string = exceptionMessageOf(10, 'hello world');
      logInfo(`exceptionMessageOf(code=10, message="hell...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 10, errMessage: hello world');
      logInfo(`${BUNDLE}ExceptionMessageOf_0218 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0219
     * @tc.name      SerialCommunication_ExceptionMessageOf_0219
     * @tc.desc      exceptionMessageOf(code=10, message="") returns "errCode: 10, errMessage: "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0219 begin`);
      const actual: string = exceptionMessageOf(10, '');
      logInfo(`exceptionMessageOf(code=10, message=""): actual=${actual}`);
      expect(actual).assertEqual('errCode: 10, errMessage: ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0219 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0220
     * @tc.name      SerialCommunication_ExceptionMessageOf_0220
     * @tc.desc      exceptionMessageOf(code=10, message=" ") returns "errCode: 10, errMessage:  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0220 begin`);
      const actual: string = exceptionMessageOf(10, ' ');
      logInfo(`exceptionMessageOf(code=10, message=" "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 10, errMessage:  ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0220 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0221
     * @tc.name      SerialCommunication_ExceptionMessageOf_0221
     * @tc.desc      exceptionMessageOf(code=10, message="A") returns "errCode: 10, errMessage: A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0221 begin`);
      const actual: string = exceptionMessageOf(10, 'A');
      logInfo(`exceptionMessageOf(code=10, message="A"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 10, errMessage: A');
      logInfo(`${BUNDLE}ExceptionMessageOf_0221 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0222
     * @tc.name      SerialCommunication_ExceptionMessageOf_0222
     * @tc.desc      exceptionMessageOf(code=10, message="Sample Title 123") returns "errCode: 10, errMessage: Sample...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0222 begin`);
      const actual: string = exceptionMessageOf(10, 'Sample Title 123');
      logInfo(`exceptionMessageOf(code=10, message="Samp...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 10, errMessage: Sample Title 123');
      logInfo(`${BUNDLE}ExceptionMessageOf_0222 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0223
     * @tc.name      SerialCommunication_ExceptionMessageOf_0223
     * @tc.desc      exceptionMessageOf(code=10, message="??") returns "errCode: 10, errMessage: ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0223 begin`);
      const actual: string = exceptionMessageOf(10, '\u4e2d\u6587');
      logInfo(`exceptionMessageOf(code=10, message="??"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 10, errMessage: \u4e2d\u6587');
      logInfo(`${BUNDLE}ExceptionMessageOf_0223 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0224
     * @tc.name      SerialCommunication_ExceptionMessageOf_0224
     * @tc.desc      exceptionMessageOf(code=10, message="a") returns "errCode: 10, errMessage: a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0224 begin`);
      const actual: string = exceptionMessageOf(10, 'a');
      logInfo(`exceptionMessageOf(code=10, message="a"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 10, errMessage: a');
      logInfo(`${BUNDLE}ExceptionMessageOf_0224 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0225
     * @tc.name      SerialCommunication_ExceptionMessageOf_0225
     * @tc.desc      exceptionMessageOf(code=10, message="abc") returns "errCode: 10, errMessage: abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0225 begin`);
      const actual: string = exceptionMessageOf(10, 'abc');
      logInfo(`exceptionMessageOf(code=10, message="abc"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 10, errMessage: abc');
      logInfo(`${BUNDLE}ExceptionMessageOf_0225 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0226
     * @tc.name      SerialCommunication_ExceptionMessageOf_0226
     * @tc.desc      exceptionMessageOf(code=10, message="Hello World") returns "errCode: 10, errMessage: Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0226 begin`);
      const actual: string = exceptionMessageOf(10, 'Hello World');
      logInfo(`exceptionMessageOf(code=10, message="Hell...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 10, errMessage: Hello World');
      logInfo(`${BUNDLE}ExceptionMessageOf_0226 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0227
     * @tc.name      SerialCommunication_ExceptionMessageOf_0227
     * @tc.desc      exceptionMessageOf(code=10, message="123") returns "errCode: 10, errMessage: 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0227 begin`);
      const actual: string = exceptionMessageOf(10, '123');
      logInfo(`exceptionMessageOf(code=10, message="123"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 10, errMessage: 123');
      logInfo(`${BUNDLE}ExceptionMessageOf_0227 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0228
     * @tc.name      SerialCommunication_ExceptionMessageOf_0228
     * @tc.desc      exceptionMessageOf(code=10, message=" Hello ") returns "errCode: 10, errMessage:  Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0228 begin`);
      const actual: string = exceptionMessageOf(10, ' Hello ');
      logInfo(`exceptionMessageOf(code=10, message=" Hel...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 10, errMessage:  Hello ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0228 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0229
     * @tc.name      SerialCommunication_ExceptionMessageOf_0229
     * @tc.desc      exceptionMessageOf(code=10, message="HelloHello") returns "errCode: 10, errMessage: HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0229 begin`);
      const actual: string = exceptionMessageOf(10, 'HelloHello');
      logInfo(`exceptionMessageOf(code=10, message="Hell...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 10, errMessage: HelloHello');
      logInfo(`${BUNDLE}ExceptionMessageOf_0229 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0230
     * @tc.name      SerialCommunication_ExceptionMessageOf_0230
     * @tc.desc      exceptionMessageOf(code=10, message="Hello_1") returns "errCode: 10, errMessage: Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0230 begin`);
      const actual: string = exceptionMessageOf(10, 'Hello_1');
      logInfo(`exceptionMessageOf(code=10, message="Hell...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 10, errMessage: Hello_1');
      logInfo(`${BUNDLE}ExceptionMessageOf_0230 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0231
     * @tc.name      SerialCommunication_ExceptionMessageOf_0231
     * @tc.desc      exceptionMessageOf(code=10, message="xHello") returns "errCode: 10, errMessage: xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0231 begin`);
      const actual: string = exceptionMessageOf(10, 'xHello');
      logInfo(`exceptionMessageOf(code=10, message="xHel...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 10, errMessage: xHello');
      logInfo(`${BUNDLE}ExceptionMessageOf_0231 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0232
     * @tc.name      SerialCommunication_ExceptionMessageOf_0232
     * @tc.desc      exceptionMessageOf(code=10, message=" hello world ") returns "errCode: 10, errMessage:  hello wo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0232 begin`);
      const actual: string = exceptionMessageOf(10, ' hello world ');
      logInfo(`exceptionMessageOf(code=10, message=" hel...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 10, errMessage:  hello world ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0232 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0233
     * @tc.name      SerialCommunication_ExceptionMessageOf_0233
     * @tc.desc      exceptionMessageOf(code=10, message="hello worldhello world") returns "errCode: 10, errMessage: ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0233 begin`);
      const actual: string = exceptionMessageOf(10, 'hello worldhello world');
      logInfo(`exceptionMessageOf(code=10, message="hell...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 10, errMessage: hello worldhello world');
      logInfo(`${BUNDLE}ExceptionMessageOf_0233 end`);
    });
  });
}
