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

/** Logic checks for exceptionMessageOf (96 cases). */
export default function exceptionMessageOf2Test(): void {
  describe('ExceptionMessageOf2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0097
     * @tc.name      SerialCommunication_ExceptionMessageOf_0097
     * @tc.desc      exceptionMessageOf(code=500, message="Hello") returns "errCode: 500, errMessage: Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0097 begin`);
      const actual: string = exceptionMessageOf(500, 'Hello');
      logInfo(`exceptionMessageOf(code=500, message="Hel...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 500, errMessage: Hello');
      logInfo(`${BUNDLE}ExceptionMessageOf_0097 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0098
     * @tc.name      SerialCommunication_ExceptionMessageOf_0098
     * @tc.desc      exceptionMessageOf(code=500, message="hello world") returns "errCode: 500, errMessage: hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0098 begin`);
      const actual: string = exceptionMessageOf(500, 'hello world');
      logInfo(`exceptionMessageOf(code=500, message="hel...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 500, errMessage: hello world');
      logInfo(`${BUNDLE}ExceptionMessageOf_0098 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0099
     * @tc.name      SerialCommunication_ExceptionMessageOf_0099
     * @tc.desc      exceptionMessageOf(code=500, message="") returns "errCode: 500, errMessage: "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0099 begin`);
      const actual: string = exceptionMessageOf(500, '');
      logInfo(`exceptionMessageOf(code=500, message=""): actual=${actual}`);
      expect(actual).assertEqual('errCode: 500, errMessage: ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0099 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0100
     * @tc.name      SerialCommunication_ExceptionMessageOf_0100
     * @tc.desc      exceptionMessageOf(code=500, message=" ") returns "errCode: 500, errMessage:  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0100 begin`);
      const actual: string = exceptionMessageOf(500, ' ');
      logInfo(`exceptionMessageOf(code=500, message=" "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 500, errMessage:  ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0100 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0101
     * @tc.name      SerialCommunication_ExceptionMessageOf_0101
     * @tc.desc      exceptionMessageOf(code=500, message="A") returns "errCode: 500, errMessage: A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0101 begin`);
      const actual: string = exceptionMessageOf(500, 'A');
      logInfo(`exceptionMessageOf(code=500, message="A"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 500, errMessage: A');
      logInfo(`${BUNDLE}ExceptionMessageOf_0101 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0102
     * @tc.name      SerialCommunication_ExceptionMessageOf_0102
     * @tc.desc      exceptionMessageOf(code=500, message="Sample Title 123") returns "errCode: 500, errMessage: Samp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0102 begin`);
      const actual: string = exceptionMessageOf(500, 'Sample Title 123');
      logInfo(`exceptionMessageOf(code=500, message="Sam...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 500, errMessage: Sample Title 123');
      logInfo(`${BUNDLE}ExceptionMessageOf_0102 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0103
     * @tc.name      SerialCommunication_ExceptionMessageOf_0103
     * @tc.desc      exceptionMessageOf(code=500, message="??") returns "errCode: 500, errMessage: ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0103 begin`);
      const actual: string = exceptionMessageOf(500, '\u4e2d\u6587');
      logInfo(`exceptionMessageOf(code=500, message="??"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 500, errMessage: \u4e2d\u6587');
      logInfo(`${BUNDLE}ExceptionMessageOf_0103 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0104
     * @tc.name      SerialCommunication_ExceptionMessageOf_0104
     * @tc.desc      exceptionMessageOf(code=500, message="a") returns "errCode: 500, errMessage: a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0104 begin`);
      const actual: string = exceptionMessageOf(500, 'a');
      logInfo(`exceptionMessageOf(code=500, message="a"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 500, errMessage: a');
      logInfo(`${BUNDLE}ExceptionMessageOf_0104 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0105
     * @tc.name      SerialCommunication_ExceptionMessageOf_0105
     * @tc.desc      exceptionMessageOf(code=500, message="abc") returns "errCode: 500, errMessage: abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0105 begin`);
      const actual: string = exceptionMessageOf(500, 'abc');
      logInfo(`exceptionMessageOf(code=500, message="abc"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 500, errMessage: abc');
      logInfo(`${BUNDLE}ExceptionMessageOf_0105 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0106
     * @tc.name      SerialCommunication_ExceptionMessageOf_0106
     * @tc.desc      exceptionMessageOf(code=500, message="Hello World") returns "errCode: 500, errMessage: Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0106 begin`);
      const actual: string = exceptionMessageOf(500, 'Hello World');
      logInfo(`exceptionMessageOf(code=500, message="Hel...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 500, errMessage: Hello World');
      logInfo(`${BUNDLE}ExceptionMessageOf_0106 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0107
     * @tc.name      SerialCommunication_ExceptionMessageOf_0107
     * @tc.desc      exceptionMessageOf(code=500, message="123") returns "errCode: 500, errMessage: 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0107 begin`);
      const actual: string = exceptionMessageOf(500, '123');
      logInfo(`exceptionMessageOf(code=500, message="123"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 500, errMessage: 123');
      logInfo(`${BUNDLE}ExceptionMessageOf_0107 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0108
     * @tc.name      SerialCommunication_ExceptionMessageOf_0108
     * @tc.desc      exceptionMessageOf(code=500, message=" Hello ") returns "errCode: 500, errMessage:  Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0108 begin`);
      const actual: string = exceptionMessageOf(500, ' Hello ');
      logInfo(`exceptionMessageOf(code=500, message=" He...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 500, errMessage:  Hello ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0108 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0109
     * @tc.name      SerialCommunication_ExceptionMessageOf_0109
     * @tc.desc      exceptionMessageOf(code=500, message="HelloHello") returns "errCode: 500, errMessage: HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0109 begin`);
      const actual: string = exceptionMessageOf(500, 'HelloHello');
      logInfo(`exceptionMessageOf(code=500, message="Hel...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 500, errMessage: HelloHello');
      logInfo(`${BUNDLE}ExceptionMessageOf_0109 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0110
     * @tc.name      SerialCommunication_ExceptionMessageOf_0110
     * @tc.desc      exceptionMessageOf(code=500, message="Hello_1") returns "errCode: 500, errMessage: Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0110 begin`);
      const actual: string = exceptionMessageOf(500, 'Hello_1');
      logInfo(`exceptionMessageOf(code=500, message="Hel...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 500, errMessage: Hello_1');
      logInfo(`${BUNDLE}ExceptionMessageOf_0110 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0111
     * @tc.name      SerialCommunication_ExceptionMessageOf_0111
     * @tc.desc      exceptionMessageOf(code=500, message="xHello") returns "errCode: 500, errMessage: xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0111 begin`);
      const actual: string = exceptionMessageOf(500, 'xHello');
      logInfo(`exceptionMessageOf(code=500, message="xHe...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 500, errMessage: xHello');
      logInfo(`${BUNDLE}ExceptionMessageOf_0111 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0112
     * @tc.name      SerialCommunication_ExceptionMessageOf_0112
     * @tc.desc      exceptionMessageOf(code=500, message=" hello world ") returns "errCode: 500, errMessage:  hello ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0112 begin`);
      const actual: string = exceptionMessageOf(500, ' hello world ');
      logInfo(`exceptionMessageOf(code=500, message=" he...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 500, errMessage:  hello world ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0112 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0113
     * @tc.name      SerialCommunication_ExceptionMessageOf_0113
     * @tc.desc      exceptionMessageOf(code=500, message="hello worldhello world") returns "errCode: 500, errMessage...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0113 begin`);
      const actual: string = exceptionMessageOf(500, 'hello worldhello world');
      logInfo(`exceptionMessageOf(code=500, message="hel...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 500, errMessage: hello worldhello world');
      logInfo(`${BUNDLE}ExceptionMessageOf_0113 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0114
     * @tc.name      SerialCommunication_ExceptionMessageOf_0114
     * @tc.desc      exceptionMessageOf(code=500, message="hello world_1") returns "errCode: 500, errMessage: hello w...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0114 begin`);
      const actual: string = exceptionMessageOf(500, 'hello world_1');
      logInfo(`exceptionMessageOf(code=500, message="hel...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 500, errMessage: hello world_1');
      logInfo(`${BUNDLE}ExceptionMessageOf_0114 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0115
     * @tc.name      SerialCommunication_ExceptionMessageOf_0115
     * @tc.desc      exceptionMessageOf(code=500, message="xhello world") returns "errCode: 500, errMessage: xhello w...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0115 begin`);
      const actual: string = exceptionMessageOf(500, 'xhello world');
      logInfo(`exceptionMessageOf(code=500, message="xhe...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 500, errMessage: xhello world');
      logInfo(`${BUNDLE}ExceptionMessageOf_0115 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0116
     * @tc.name      SerialCommunication_ExceptionMessageOf_0116
     * @tc.desc      exceptionMessageOf(code=500, message="   ") returns "errCode: 500, errMessage:    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0116 begin`);
      const actual: string = exceptionMessageOf(500, '   ');
      logInfo(`exceptionMessageOf(code=500, message="   "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 500, errMessage:    ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0116 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0117
     * @tc.name      SerialCommunication_ExceptionMessageOf_0117
     * @tc.desc      exceptionMessageOf(code=500, message="  ") returns "errCode: 500, errMessage:   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0117 begin`);
      const actual: string = exceptionMessageOf(500, '  ');
      logInfo(`exceptionMessageOf(code=500, message="  "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 500, errMessage:   ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0117 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0118
     * @tc.name      SerialCommunication_ExceptionMessageOf_0118
     * @tc.desc      exceptionMessageOf(code=500, message=" _1") returns "errCode: 500, errMessage:  _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0118 begin`);
      const actual: string = exceptionMessageOf(500, ' _1');
      logInfo(`exceptionMessageOf(code=500, message=" _1"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 500, errMessage:  _1');
      logInfo(`${BUNDLE}ExceptionMessageOf_0118 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0119
     * @tc.name      SerialCommunication_ExceptionMessageOf_0119
     * @tc.desc      exceptionMessageOf(code=500, message="x ") returns "errCode: 500, errMessage: x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0119 begin`);
      const actual: string = exceptionMessageOf(500, 'x ');
      logInfo(`exceptionMessageOf(code=500, message="x "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 500, errMessage: x ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0119 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0120
     * @tc.name      SerialCommunication_ExceptionMessageOf_0120
     * @tc.desc      exceptionMessageOf(code=500, message=" A ") returns "errCode: 500, errMessage:  A "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0120 begin`);
      const actual: string = exceptionMessageOf(500, ' A ');
      logInfo(`exceptionMessageOf(code=500, message=" A "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 500, errMessage:  A ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0120 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0121
     * @tc.name      SerialCommunication_ExceptionMessageOf_0121
     * @tc.desc      exceptionMessageOf(code=-1, message="Hello") returns "errCode: -1, errMessage: Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0121 begin`);
      const actual: string = exceptionMessageOf(-1, 'Hello');
      logInfo(`exceptionMessageOf(code=-1, message="Hello"): actual=${actual}`);
      expect(actual).assertEqual('errCode: -1, errMessage: Hello');
      logInfo(`${BUNDLE}ExceptionMessageOf_0121 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0122
     * @tc.name      SerialCommunication_ExceptionMessageOf_0122
     * @tc.desc      exceptionMessageOf(code=-1, message="hello world") returns "errCode: -1, errMessage: hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0122 begin`);
      const actual: string = exceptionMessageOf(-1, 'hello world');
      logInfo(`exceptionMessageOf(code=-1, message="hell...: actual=${actual}`);
      expect(actual).assertEqual('errCode: -1, errMessage: hello world');
      logInfo(`${BUNDLE}ExceptionMessageOf_0122 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0123
     * @tc.name      SerialCommunication_ExceptionMessageOf_0123
     * @tc.desc      exceptionMessageOf(code=-1, message="") returns "errCode: -1, errMessage: "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0123 begin`);
      const actual: string = exceptionMessageOf(-1, '');
      logInfo(`exceptionMessageOf(code=-1, message=""): actual=${actual}`);
      expect(actual).assertEqual('errCode: -1, errMessage: ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0123 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0124
     * @tc.name      SerialCommunication_ExceptionMessageOf_0124
     * @tc.desc      exceptionMessageOf(code=-1, message=" ") returns "errCode: -1, errMessage:  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0124 begin`);
      const actual: string = exceptionMessageOf(-1, ' ');
      logInfo(`exceptionMessageOf(code=-1, message=" "): actual=${actual}`);
      expect(actual).assertEqual('errCode: -1, errMessage:  ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0124 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0125
     * @tc.name      SerialCommunication_ExceptionMessageOf_0125
     * @tc.desc      exceptionMessageOf(code=-1, message="A") returns "errCode: -1, errMessage: A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0125 begin`);
      const actual: string = exceptionMessageOf(-1, 'A');
      logInfo(`exceptionMessageOf(code=-1, message="A"): actual=${actual}`);
      expect(actual).assertEqual('errCode: -1, errMessage: A');
      logInfo(`${BUNDLE}ExceptionMessageOf_0125 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0126
     * @tc.name      SerialCommunication_ExceptionMessageOf_0126
     * @tc.desc      exceptionMessageOf(code=-1, message="Sample Title 123") returns "errCode: -1, errMessage: Sample...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0126 begin`);
      const actual: string = exceptionMessageOf(-1, 'Sample Title 123');
      logInfo(`exceptionMessageOf(code=-1, message="Samp...: actual=${actual}`);
      expect(actual).assertEqual('errCode: -1, errMessage: Sample Title 123');
      logInfo(`${BUNDLE}ExceptionMessageOf_0126 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0127
     * @tc.name      SerialCommunication_ExceptionMessageOf_0127
     * @tc.desc      exceptionMessageOf(code=-1, message="??") returns "errCode: -1, errMessage: ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0127 begin`);
      const actual: string = exceptionMessageOf(-1, '\u4e2d\u6587');
      logInfo(`exceptionMessageOf(code=-1, message="??"): actual=${actual}`);
      expect(actual).assertEqual('errCode: -1, errMessage: \u4e2d\u6587');
      logInfo(`${BUNDLE}ExceptionMessageOf_0127 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0128
     * @tc.name      SerialCommunication_ExceptionMessageOf_0128
     * @tc.desc      exceptionMessageOf(code=-1, message="a") returns "errCode: -1, errMessage: a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0128 begin`);
      const actual: string = exceptionMessageOf(-1, 'a');
      logInfo(`exceptionMessageOf(code=-1, message="a"): actual=${actual}`);
      expect(actual).assertEqual('errCode: -1, errMessage: a');
      logInfo(`${BUNDLE}ExceptionMessageOf_0128 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0129
     * @tc.name      SerialCommunication_ExceptionMessageOf_0129
     * @tc.desc      exceptionMessageOf(code=-1, message="abc") returns "errCode: -1, errMessage: abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0129 begin`);
      const actual: string = exceptionMessageOf(-1, 'abc');
      logInfo(`exceptionMessageOf(code=-1, message="abc"): actual=${actual}`);
      expect(actual).assertEqual('errCode: -1, errMessage: abc');
      logInfo(`${BUNDLE}ExceptionMessageOf_0129 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0130
     * @tc.name      SerialCommunication_ExceptionMessageOf_0130
     * @tc.desc      exceptionMessageOf(code=-1, message="Hello World") returns "errCode: -1, errMessage: Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0130 begin`);
      const actual: string = exceptionMessageOf(-1, 'Hello World');
      logInfo(`exceptionMessageOf(code=-1, message="Hell...: actual=${actual}`);
      expect(actual).assertEqual('errCode: -1, errMessage: Hello World');
      logInfo(`${BUNDLE}ExceptionMessageOf_0130 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0131
     * @tc.name      SerialCommunication_ExceptionMessageOf_0131
     * @tc.desc      exceptionMessageOf(code=-1, message="123") returns "errCode: -1, errMessage: 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0131 begin`);
      const actual: string = exceptionMessageOf(-1, '123');
      logInfo(`exceptionMessageOf(code=-1, message="123"): actual=${actual}`);
      expect(actual).assertEqual('errCode: -1, errMessage: 123');
      logInfo(`${BUNDLE}ExceptionMessageOf_0131 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0132
     * @tc.name      SerialCommunication_ExceptionMessageOf_0132
     * @tc.desc      exceptionMessageOf(code=-1, message=" Hello ") returns "errCode: -1, errMessage:  Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0132 begin`);
      const actual: string = exceptionMessageOf(-1, ' Hello ');
      logInfo(`exceptionMessageOf(code=-1, message=" Hel...: actual=${actual}`);
      expect(actual).assertEqual('errCode: -1, errMessage:  Hello ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0132 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0133
     * @tc.name      SerialCommunication_ExceptionMessageOf_0133
     * @tc.desc      exceptionMessageOf(code=-1, message="HelloHello") returns "errCode: -1, errMessage: HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0133 begin`);
      const actual: string = exceptionMessageOf(-1, 'HelloHello');
      logInfo(`exceptionMessageOf(code=-1, message="Hell...: actual=${actual}`);
      expect(actual).assertEqual('errCode: -1, errMessage: HelloHello');
      logInfo(`${BUNDLE}ExceptionMessageOf_0133 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0134
     * @tc.name      SerialCommunication_ExceptionMessageOf_0134
     * @tc.desc      exceptionMessageOf(code=-1, message="Hello_1") returns "errCode: -1, errMessage: Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0134 begin`);
      const actual: string = exceptionMessageOf(-1, 'Hello_1');
      logInfo(`exceptionMessageOf(code=-1, message="Hell...: actual=${actual}`);
      expect(actual).assertEqual('errCode: -1, errMessage: Hello_1');
      logInfo(`${BUNDLE}ExceptionMessageOf_0134 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0135
     * @tc.name      SerialCommunication_ExceptionMessageOf_0135
     * @tc.desc      exceptionMessageOf(code=-1, message="xHello") returns "errCode: -1, errMessage: xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0135 begin`);
      const actual: string = exceptionMessageOf(-1, 'xHello');
      logInfo(`exceptionMessageOf(code=-1, message="xHel...: actual=${actual}`);
      expect(actual).assertEqual('errCode: -1, errMessage: xHello');
      logInfo(`${BUNDLE}ExceptionMessageOf_0135 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0136
     * @tc.name      SerialCommunication_ExceptionMessageOf_0136
     * @tc.desc      exceptionMessageOf(code=-1, message=" hello world ") returns "errCode: -1, errMessage:  hello wo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0136 begin`);
      const actual: string = exceptionMessageOf(-1, ' hello world ');
      logInfo(`exceptionMessageOf(code=-1, message=" hel...: actual=${actual}`);
      expect(actual).assertEqual('errCode: -1, errMessage:  hello world ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0136 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0137
     * @tc.name      SerialCommunication_ExceptionMessageOf_0137
     * @tc.desc      exceptionMessageOf(code=-1, message="hello worldhello world") returns "errCode: -1, errMessage: ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0137 begin`);
      const actual: string = exceptionMessageOf(-1, 'hello worldhello world');
      logInfo(`exceptionMessageOf(code=-1, message="hell...: actual=${actual}`);
      expect(actual).assertEqual('errCode: -1, errMessage: hello worldhello world');
      logInfo(`${BUNDLE}ExceptionMessageOf_0137 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0138
     * @tc.name      SerialCommunication_ExceptionMessageOf_0138
     * @tc.desc      exceptionMessageOf(code=-1, message="hello world_1") returns "errCode: -1, errMessage: hello wor...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0138 begin`);
      const actual: string = exceptionMessageOf(-1, 'hello world_1');
      logInfo(`exceptionMessageOf(code=-1, message="hell...: actual=${actual}`);
      expect(actual).assertEqual('errCode: -1, errMessage: hello world_1');
      logInfo(`${BUNDLE}ExceptionMessageOf_0138 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0139
     * @tc.name      SerialCommunication_ExceptionMessageOf_0139
     * @tc.desc      exceptionMessageOf(code=-1, message="xhello world") returns "errCode: -1, errMessage: xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0139 begin`);
      const actual: string = exceptionMessageOf(-1, 'xhello world');
      logInfo(`exceptionMessageOf(code=-1, message="xhel...: actual=${actual}`);
      expect(actual).assertEqual('errCode: -1, errMessage: xhello world');
      logInfo(`${BUNDLE}ExceptionMessageOf_0139 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0140
     * @tc.name      SerialCommunication_ExceptionMessageOf_0140
     * @tc.desc      exceptionMessageOf(code=-1, message="   ") returns "errCode: -1, errMessage:    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0140 begin`);
      const actual: string = exceptionMessageOf(-1, '   ');
      logInfo(`exceptionMessageOf(code=-1, message="   "): actual=${actual}`);
      expect(actual).assertEqual('errCode: -1, errMessage:    ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0140 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0141
     * @tc.name      SerialCommunication_ExceptionMessageOf_0141
     * @tc.desc      exceptionMessageOf(code=-1, message="  ") returns "errCode: -1, errMessage:   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0141 begin`);
      const actual: string = exceptionMessageOf(-1, '  ');
      logInfo(`exceptionMessageOf(code=-1, message="  "): actual=${actual}`);
      expect(actual).assertEqual('errCode: -1, errMessage:   ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0141 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0142
     * @tc.name      SerialCommunication_ExceptionMessageOf_0142
     * @tc.desc      exceptionMessageOf(code=-1, message=" _1") returns "errCode: -1, errMessage:  _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0142 begin`);
      const actual: string = exceptionMessageOf(-1, ' _1');
      logInfo(`exceptionMessageOf(code=-1, message=" _1"): actual=${actual}`);
      expect(actual).assertEqual('errCode: -1, errMessage:  _1');
      logInfo(`${BUNDLE}ExceptionMessageOf_0142 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0143
     * @tc.name      SerialCommunication_ExceptionMessageOf_0143
     * @tc.desc      exceptionMessageOf(code=-1, message="x ") returns "errCode: -1, errMessage: x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0143 begin`);
      const actual: string = exceptionMessageOf(-1, 'x ');
      logInfo(`exceptionMessageOf(code=-1, message="x "): actual=${actual}`);
      expect(actual).assertEqual('errCode: -1, errMessage: x ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0143 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0144
     * @tc.name      SerialCommunication_ExceptionMessageOf_0144
     * @tc.desc      exceptionMessageOf(code=-1, message=" A ") returns "errCode: -1, errMessage:  A "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0144 begin`);
      const actual: string = exceptionMessageOf(-1, ' A ');
      logInfo(`exceptionMessageOf(code=-1, message=" A "): actual=${actual}`);
      expect(actual).assertEqual('errCode: -1, errMessage:  A ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0144 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0145
     * @tc.name      SerialCommunication_ExceptionMessageOf_0145
     * @tc.desc      exceptionMessageOf(code=1, message="Hello") returns "errCode: 1, errMessage: Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0145 begin`);
      const actual: string = exceptionMessageOf(1, 'Hello');
      logInfo(`exceptionMessageOf(code=1, message="Hello"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 1, errMessage: Hello');
      logInfo(`${BUNDLE}ExceptionMessageOf_0145 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0146
     * @tc.name      SerialCommunication_ExceptionMessageOf_0146
     * @tc.desc      exceptionMessageOf(code=1, message="hello world") returns "errCode: 1, errMessage: hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0146 begin`);
      const actual: string = exceptionMessageOf(1, 'hello world');
      logInfo(`exceptionMessageOf(code=1, message="hello...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 1, errMessage: hello world');
      logInfo(`${BUNDLE}ExceptionMessageOf_0146 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0147
     * @tc.name      SerialCommunication_ExceptionMessageOf_0147
     * @tc.desc      exceptionMessageOf(code=1, message="") returns "errCode: 1, errMessage: "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0147 begin`);
      const actual: string = exceptionMessageOf(1, '');
      logInfo(`exceptionMessageOf(code=1, message=""): actual=${actual}`);
      expect(actual).assertEqual('errCode: 1, errMessage: ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0147 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0148
     * @tc.name      SerialCommunication_ExceptionMessageOf_0148
     * @tc.desc      exceptionMessageOf(code=1, message=" ") returns "errCode: 1, errMessage:  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0148 begin`);
      const actual: string = exceptionMessageOf(1, ' ');
      logInfo(`exceptionMessageOf(code=1, message=" "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 1, errMessage:  ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0148 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0149
     * @tc.name      SerialCommunication_ExceptionMessageOf_0149
     * @tc.desc      exceptionMessageOf(code=1, message="A") returns "errCode: 1, errMessage: A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0149 begin`);
      const actual: string = exceptionMessageOf(1, 'A');
      logInfo(`exceptionMessageOf(code=1, message="A"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 1, errMessage: A');
      logInfo(`${BUNDLE}ExceptionMessageOf_0149 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0150
     * @tc.name      SerialCommunication_ExceptionMessageOf_0150
     * @tc.desc      exceptionMessageOf(code=1, message="Sample Title 123") returns "errCode: 1, errMessage: Sample T...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0150 begin`);
      const actual: string = exceptionMessageOf(1, 'Sample Title 123');
      logInfo(`exceptionMessageOf(code=1, message="Sampl...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 1, errMessage: Sample Title 123');
      logInfo(`${BUNDLE}ExceptionMessageOf_0150 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0151
     * @tc.name      SerialCommunication_ExceptionMessageOf_0151
     * @tc.desc      exceptionMessageOf(code=1, message="??") returns "errCode: 1, errMessage: ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0151 begin`);
      const actual: string = exceptionMessageOf(1, '\u4e2d\u6587');
      logInfo(`exceptionMessageOf(code=1, message="??"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 1, errMessage: \u4e2d\u6587');
      logInfo(`${BUNDLE}ExceptionMessageOf_0151 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0152
     * @tc.name      SerialCommunication_ExceptionMessageOf_0152
     * @tc.desc      exceptionMessageOf(code=1, message="a") returns "errCode: 1, errMessage: a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0152 begin`);
      const actual: string = exceptionMessageOf(1, 'a');
      logInfo(`exceptionMessageOf(code=1, message="a"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 1, errMessage: a');
      logInfo(`${BUNDLE}ExceptionMessageOf_0152 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0153
     * @tc.name      SerialCommunication_ExceptionMessageOf_0153
     * @tc.desc      exceptionMessageOf(code=1, message="abc") returns "errCode: 1, errMessage: abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0153 begin`);
      const actual: string = exceptionMessageOf(1, 'abc');
      logInfo(`exceptionMessageOf(code=1, message="abc"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 1, errMessage: abc');
      logInfo(`${BUNDLE}ExceptionMessageOf_0153 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0154
     * @tc.name      SerialCommunication_ExceptionMessageOf_0154
     * @tc.desc      exceptionMessageOf(code=1, message="Hello World") returns "errCode: 1, errMessage: Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0154 begin`);
      const actual: string = exceptionMessageOf(1, 'Hello World');
      logInfo(`exceptionMessageOf(code=1, message="Hello...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 1, errMessage: Hello World');
      logInfo(`${BUNDLE}ExceptionMessageOf_0154 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0155
     * @tc.name      SerialCommunication_ExceptionMessageOf_0155
     * @tc.desc      exceptionMessageOf(code=1, message="123") returns "errCode: 1, errMessage: 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0155 begin`);
      const actual: string = exceptionMessageOf(1, '123');
      logInfo(`exceptionMessageOf(code=1, message="123"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 1, errMessage: 123');
      logInfo(`${BUNDLE}ExceptionMessageOf_0155 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0156
     * @tc.name      SerialCommunication_ExceptionMessageOf_0156
     * @tc.desc      exceptionMessageOf(code=1, message=" Hello ") returns "errCode: 1, errMessage:  Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0156 begin`);
      const actual: string = exceptionMessageOf(1, ' Hello ');
      logInfo(`exceptionMessageOf(code=1, message=" Hell...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 1, errMessage:  Hello ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0156 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0157
     * @tc.name      SerialCommunication_ExceptionMessageOf_0157
     * @tc.desc      exceptionMessageOf(code=1, message="HelloHello") returns "errCode: 1, errMessage: HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0157 begin`);
      const actual: string = exceptionMessageOf(1, 'HelloHello');
      logInfo(`exceptionMessageOf(code=1, message="Hello...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 1, errMessage: HelloHello');
      logInfo(`${BUNDLE}ExceptionMessageOf_0157 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0158
     * @tc.name      SerialCommunication_ExceptionMessageOf_0158
     * @tc.desc      exceptionMessageOf(code=1, message="Hello_1") returns "errCode: 1, errMessage: Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0158 begin`);
      const actual: string = exceptionMessageOf(1, 'Hello_1');
      logInfo(`exceptionMessageOf(code=1, message="Hello...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 1, errMessage: Hello_1');
      logInfo(`${BUNDLE}ExceptionMessageOf_0158 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0159
     * @tc.name      SerialCommunication_ExceptionMessageOf_0159
     * @tc.desc      exceptionMessageOf(code=1, message="xHello") returns "errCode: 1, errMessage: xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0159 begin`);
      const actual: string = exceptionMessageOf(1, 'xHello');
      logInfo(`exceptionMessageOf(code=1, message="xHello"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 1, errMessage: xHello');
      logInfo(`${BUNDLE}ExceptionMessageOf_0159 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0160
     * @tc.name      SerialCommunication_ExceptionMessageOf_0160
     * @tc.desc      exceptionMessageOf(code=1, message=" hello world ") returns "errCode: 1, errMessage:  hello world "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0160 begin`);
      const actual: string = exceptionMessageOf(1, ' hello world ');
      logInfo(`exceptionMessageOf(code=1, message=" hell...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 1, errMessage:  hello world ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0160 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0161
     * @tc.name      SerialCommunication_ExceptionMessageOf_0161
     * @tc.desc      exceptionMessageOf(code=1, message="hello worldhello world") returns "errCode: 1, errMessage: he...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0161 begin`);
      const actual: string = exceptionMessageOf(1, 'hello worldhello world');
      logInfo(`exceptionMessageOf(code=1, message="hello...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 1, errMessage: hello worldhello world');
      logInfo(`${BUNDLE}ExceptionMessageOf_0161 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0162
     * @tc.name      SerialCommunication_ExceptionMessageOf_0162
     * @tc.desc      exceptionMessageOf(code=1, message="hello world_1") returns "errCode: 1, errMessage: hello world_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0162 begin`);
      const actual: string = exceptionMessageOf(1, 'hello world_1');
      logInfo(`exceptionMessageOf(code=1, message="hello...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 1, errMessage: hello world_1');
      logInfo(`${BUNDLE}ExceptionMessageOf_0162 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0163
     * @tc.name      SerialCommunication_ExceptionMessageOf_0163
     * @tc.desc      exceptionMessageOf(code=1, message="xhello world") returns "errCode: 1, errMessage: xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0163 begin`);
      const actual: string = exceptionMessageOf(1, 'xhello world');
      logInfo(`exceptionMessageOf(code=1, message="xhell...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 1, errMessage: xhello world');
      logInfo(`${BUNDLE}ExceptionMessageOf_0163 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0164
     * @tc.name      SerialCommunication_ExceptionMessageOf_0164
     * @tc.desc      exceptionMessageOf(code=1, message="   ") returns "errCode: 1, errMessage:    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0164 begin`);
      const actual: string = exceptionMessageOf(1, '   ');
      logInfo(`exceptionMessageOf(code=1, message="   "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 1, errMessage:    ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0164 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0165
     * @tc.name      SerialCommunication_ExceptionMessageOf_0165
     * @tc.desc      exceptionMessageOf(code=1, message="  ") returns "errCode: 1, errMessage:   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0165 begin`);
      const actual: string = exceptionMessageOf(1, '  ');
      logInfo(`exceptionMessageOf(code=1, message="  "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 1, errMessage:   ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0165 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0166
     * @tc.name      SerialCommunication_ExceptionMessageOf_0166
     * @tc.desc      exceptionMessageOf(code=1, message=" _1") returns "errCode: 1, errMessage:  _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0166 begin`);
      const actual: string = exceptionMessageOf(1, ' _1');
      logInfo(`exceptionMessageOf(code=1, message=" _1"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 1, errMessage:  _1');
      logInfo(`${BUNDLE}ExceptionMessageOf_0166 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0167
     * @tc.name      SerialCommunication_ExceptionMessageOf_0167
     * @tc.desc      exceptionMessageOf(code=1, message="x ") returns "errCode: 1, errMessage: x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0167 begin`);
      const actual: string = exceptionMessageOf(1, 'x ');
      logInfo(`exceptionMessageOf(code=1, message="x "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 1, errMessage: x ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0167 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0168
     * @tc.name      SerialCommunication_ExceptionMessageOf_0168
     * @tc.desc      exceptionMessageOf(code=1, message=" A ") returns "errCode: 1, errMessage:  A "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0168 begin`);
      const actual: string = exceptionMessageOf(1, ' A ');
      logInfo(`exceptionMessageOf(code=1, message=" A "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 1, errMessage:  A ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0168 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0169
     * @tc.name      SerialCommunication_ExceptionMessageOf_0169
     * @tc.desc      exceptionMessageOf(code=2, message="Hello") returns "errCode: 2, errMessage: Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0169 begin`);
      const actual: string = exceptionMessageOf(2, 'Hello');
      logInfo(`exceptionMessageOf(code=2, message="Hello"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 2, errMessage: Hello');
      logInfo(`${BUNDLE}ExceptionMessageOf_0169 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0170
     * @tc.name      SerialCommunication_ExceptionMessageOf_0170
     * @tc.desc      exceptionMessageOf(code=2, message="hello world") returns "errCode: 2, errMessage: hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0170 begin`);
      const actual: string = exceptionMessageOf(2, 'hello world');
      logInfo(`exceptionMessageOf(code=2, message="hello...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 2, errMessage: hello world');
      logInfo(`${BUNDLE}ExceptionMessageOf_0170 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0171
     * @tc.name      SerialCommunication_ExceptionMessageOf_0171
     * @tc.desc      exceptionMessageOf(code=2, message="") returns "errCode: 2, errMessage: "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0171 begin`);
      const actual: string = exceptionMessageOf(2, '');
      logInfo(`exceptionMessageOf(code=2, message=""): actual=${actual}`);
      expect(actual).assertEqual('errCode: 2, errMessage: ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0171 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0172
     * @tc.name      SerialCommunication_ExceptionMessageOf_0172
     * @tc.desc      exceptionMessageOf(code=2, message=" ") returns "errCode: 2, errMessage:  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0172 begin`);
      const actual: string = exceptionMessageOf(2, ' ');
      logInfo(`exceptionMessageOf(code=2, message=" "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 2, errMessage:  ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0172 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0173
     * @tc.name      SerialCommunication_ExceptionMessageOf_0173
     * @tc.desc      exceptionMessageOf(code=2, message="A") returns "errCode: 2, errMessage: A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0173 begin`);
      const actual: string = exceptionMessageOf(2, 'A');
      logInfo(`exceptionMessageOf(code=2, message="A"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 2, errMessage: A');
      logInfo(`${BUNDLE}ExceptionMessageOf_0173 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0174
     * @tc.name      SerialCommunication_ExceptionMessageOf_0174
     * @tc.desc      exceptionMessageOf(code=2, message="Sample Title 123") returns "errCode: 2, errMessage: Sample T...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0174 begin`);
      const actual: string = exceptionMessageOf(2, 'Sample Title 123');
      logInfo(`exceptionMessageOf(code=2, message="Sampl...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 2, errMessage: Sample Title 123');
      logInfo(`${BUNDLE}ExceptionMessageOf_0174 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0175
     * @tc.name      SerialCommunication_ExceptionMessageOf_0175
     * @tc.desc      exceptionMessageOf(code=2, message="??") returns "errCode: 2, errMessage: ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0175 begin`);
      const actual: string = exceptionMessageOf(2, '\u4e2d\u6587');
      logInfo(`exceptionMessageOf(code=2, message="??"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 2, errMessage: \u4e2d\u6587');
      logInfo(`${BUNDLE}ExceptionMessageOf_0175 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0176
     * @tc.name      SerialCommunication_ExceptionMessageOf_0176
     * @tc.desc      exceptionMessageOf(code=2, message="a") returns "errCode: 2, errMessage: a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0176 begin`);
      const actual: string = exceptionMessageOf(2, 'a');
      logInfo(`exceptionMessageOf(code=2, message="a"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 2, errMessage: a');
      logInfo(`${BUNDLE}ExceptionMessageOf_0176 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0177
     * @tc.name      SerialCommunication_ExceptionMessageOf_0177
     * @tc.desc      exceptionMessageOf(code=2, message="abc") returns "errCode: 2, errMessage: abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0177 begin`);
      const actual: string = exceptionMessageOf(2, 'abc');
      logInfo(`exceptionMessageOf(code=2, message="abc"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 2, errMessage: abc');
      logInfo(`${BUNDLE}ExceptionMessageOf_0177 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0178
     * @tc.name      SerialCommunication_ExceptionMessageOf_0178
     * @tc.desc      exceptionMessageOf(code=2, message="Hello World") returns "errCode: 2, errMessage: Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0178 begin`);
      const actual: string = exceptionMessageOf(2, 'Hello World');
      logInfo(`exceptionMessageOf(code=2, message="Hello...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 2, errMessage: Hello World');
      logInfo(`${BUNDLE}ExceptionMessageOf_0178 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0179
     * @tc.name      SerialCommunication_ExceptionMessageOf_0179
     * @tc.desc      exceptionMessageOf(code=2, message="123") returns "errCode: 2, errMessage: 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0179 begin`);
      const actual: string = exceptionMessageOf(2, '123');
      logInfo(`exceptionMessageOf(code=2, message="123"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 2, errMessage: 123');
      logInfo(`${BUNDLE}ExceptionMessageOf_0179 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0180
     * @tc.name      SerialCommunication_ExceptionMessageOf_0180
     * @tc.desc      exceptionMessageOf(code=2, message=" Hello ") returns "errCode: 2, errMessage:  Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0180 begin`);
      const actual: string = exceptionMessageOf(2, ' Hello ');
      logInfo(`exceptionMessageOf(code=2, message=" Hell...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 2, errMessage:  Hello ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0180 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0181
     * @tc.name      SerialCommunication_ExceptionMessageOf_0181
     * @tc.desc      exceptionMessageOf(code=2, message="HelloHello") returns "errCode: 2, errMessage: HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0181 begin`);
      const actual: string = exceptionMessageOf(2, 'HelloHello');
      logInfo(`exceptionMessageOf(code=2, message="Hello...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 2, errMessage: HelloHello');
      logInfo(`${BUNDLE}ExceptionMessageOf_0181 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0182
     * @tc.name      SerialCommunication_ExceptionMessageOf_0182
     * @tc.desc      exceptionMessageOf(code=2, message="Hello_1") returns "errCode: 2, errMessage: Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0182 begin`);
      const actual: string = exceptionMessageOf(2, 'Hello_1');
      logInfo(`exceptionMessageOf(code=2, message="Hello...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 2, errMessage: Hello_1');
      logInfo(`${BUNDLE}ExceptionMessageOf_0182 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0183
     * @tc.name      SerialCommunication_ExceptionMessageOf_0183
     * @tc.desc      exceptionMessageOf(code=2, message="xHello") returns "errCode: 2, errMessage: xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0183 begin`);
      const actual: string = exceptionMessageOf(2, 'xHello');
      logInfo(`exceptionMessageOf(code=2, message="xHello"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 2, errMessage: xHello');
      logInfo(`${BUNDLE}ExceptionMessageOf_0183 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0184
     * @tc.name      SerialCommunication_ExceptionMessageOf_0184
     * @tc.desc      exceptionMessageOf(code=2, message=" hello world ") returns "errCode: 2, errMessage:  hello world "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0184 begin`);
      const actual: string = exceptionMessageOf(2, ' hello world ');
      logInfo(`exceptionMessageOf(code=2, message=" hell...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 2, errMessage:  hello world ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0184 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0185
     * @tc.name      SerialCommunication_ExceptionMessageOf_0185
     * @tc.desc      exceptionMessageOf(code=2, message="hello worldhello world") returns "errCode: 2, errMessage: he...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0185 begin`);
      const actual: string = exceptionMessageOf(2, 'hello worldhello world');
      logInfo(`exceptionMessageOf(code=2, message="hello...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 2, errMessage: hello worldhello world');
      logInfo(`${BUNDLE}ExceptionMessageOf_0185 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0186
     * @tc.name      SerialCommunication_ExceptionMessageOf_0186
     * @tc.desc      exceptionMessageOf(code=2, message="hello world_1") returns "errCode: 2, errMessage: hello world_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0186 begin`);
      const actual: string = exceptionMessageOf(2, 'hello world_1');
      logInfo(`exceptionMessageOf(code=2, message="hello...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 2, errMessage: hello world_1');
      logInfo(`${BUNDLE}ExceptionMessageOf_0186 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0187
     * @tc.name      SerialCommunication_ExceptionMessageOf_0187
     * @tc.desc      exceptionMessageOf(code=2, message="xhello world") returns "errCode: 2, errMessage: xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0187 begin`);
      const actual: string = exceptionMessageOf(2, 'xhello world');
      logInfo(`exceptionMessageOf(code=2, message="xhell...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 2, errMessage: xhello world');
      logInfo(`${BUNDLE}ExceptionMessageOf_0187 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0188
     * @tc.name      SerialCommunication_ExceptionMessageOf_0188
     * @tc.desc      exceptionMessageOf(code=2, message="   ") returns "errCode: 2, errMessage:    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0188 begin`);
      const actual: string = exceptionMessageOf(2, '   ');
      logInfo(`exceptionMessageOf(code=2, message="   "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 2, errMessage:    ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0188 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0189
     * @tc.name      SerialCommunication_ExceptionMessageOf_0189
     * @tc.desc      exceptionMessageOf(code=2, message="  ") returns "errCode: 2, errMessage:   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0189 begin`);
      const actual: string = exceptionMessageOf(2, '  ');
      logInfo(`exceptionMessageOf(code=2, message="  "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 2, errMessage:   ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0189 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0190
     * @tc.name      SerialCommunication_ExceptionMessageOf_0190
     * @tc.desc      exceptionMessageOf(code=2, message=" _1") returns "errCode: 2, errMessage:  _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0190 begin`);
      const actual: string = exceptionMessageOf(2, ' _1');
      logInfo(`exceptionMessageOf(code=2, message=" _1"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 2, errMessage:  _1');
      logInfo(`${BUNDLE}ExceptionMessageOf_0190 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0191
     * @tc.name      SerialCommunication_ExceptionMessageOf_0191
     * @tc.desc      exceptionMessageOf(code=2, message="x ") returns "errCode: 2, errMessage: x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0191 begin`);
      const actual: string = exceptionMessageOf(2, 'x ');
      logInfo(`exceptionMessageOf(code=2, message="x "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 2, errMessage: x ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0191 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0192
     * @tc.name      SerialCommunication_ExceptionMessageOf_0192
     * @tc.desc      exceptionMessageOf(code=2, message=" A ") returns "errCode: 2, errMessage:  A "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0192 begin`);
      const actual: string = exceptionMessageOf(2, ' A ');
      logInfo(`exceptionMessageOf(code=2, message=" A "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 2, errMessage:  A ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0192 end`);
    });
  });
}
