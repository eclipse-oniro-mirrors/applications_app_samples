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
export default function exceptionMessageOfTest(): void {
  describe('ExceptionMessageOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0001
     * @tc.name      SerialCommunication_ExceptionMessageOf_0001
     * @tc.desc      exceptionMessageOf(code=0, message="Hello") returns "errCode: 0, errMessage: Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_ExceptionMessageOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0001 begin`);
      const actual: string = exceptionMessageOf(0, 'Hello');
      logInfo(`exceptionMessageOf(code=0, message="Hello"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 0, errMessage: Hello');
      logInfo(`${BUNDLE}ExceptionMessageOf_0001 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0002
     * @tc.name      SerialCommunication_ExceptionMessageOf_0002
     * @tc.desc      exceptionMessageOf(code=0, message="hello world") returns "errCode: 0, errMessage: hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_ExceptionMessageOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0002 begin`);
      const actual: string = exceptionMessageOf(0, 'hello world');
      logInfo(`exceptionMessageOf(code=0, message="hello...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 0, errMessage: hello world');
      logInfo(`${BUNDLE}ExceptionMessageOf_0002 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0003
     * @tc.name      SerialCommunication_ExceptionMessageOf_0003
     * @tc.desc      exceptionMessageOf(code=0, message="") returns "errCode: 0, errMessage: "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0003 begin`);
      const actual: string = exceptionMessageOf(0, '');
      logInfo(`exceptionMessageOf(code=0, message=""): actual=${actual}`);
      expect(actual).assertEqual('errCode: 0, errMessage: ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0003 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0004
     * @tc.name      SerialCommunication_ExceptionMessageOf_0004
     * @tc.desc      exceptionMessageOf(code=0, message=" ") returns "errCode: 0, errMessage:  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0004 begin`);
      const actual: string = exceptionMessageOf(0, ' ');
      logInfo(`exceptionMessageOf(code=0, message=" "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 0, errMessage:  ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0004 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0005
     * @tc.name      SerialCommunication_ExceptionMessageOf_0005
     * @tc.desc      exceptionMessageOf(code=0, message="A") returns "errCode: 0, errMessage: A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0005 begin`);
      const actual: string = exceptionMessageOf(0, 'A');
      logInfo(`exceptionMessageOf(code=0, message="A"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 0, errMessage: A');
      logInfo(`${BUNDLE}ExceptionMessageOf_0005 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0006
     * @tc.name      SerialCommunication_ExceptionMessageOf_0006
     * @tc.desc      exceptionMessageOf(code=0, message="Sample Title 123") returns "errCode: 0, errMessage: Sample T...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0006 begin`);
      const actual: string = exceptionMessageOf(0, 'Sample Title 123');
      logInfo(`exceptionMessageOf(code=0, message="Sampl...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 0, errMessage: Sample Title 123');
      logInfo(`${BUNDLE}ExceptionMessageOf_0006 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0007
     * @tc.name      SerialCommunication_ExceptionMessageOf_0007
     * @tc.desc      exceptionMessageOf(code=0, message="??") returns "errCode: 0, errMessage: ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0007 begin`);
      const actual: string = exceptionMessageOf(0, '\u4e2d\u6587');
      logInfo(`exceptionMessageOf(code=0, message="??"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 0, errMessage: \u4e2d\u6587');
      logInfo(`${BUNDLE}ExceptionMessageOf_0007 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0008
     * @tc.name      SerialCommunication_ExceptionMessageOf_0008
     * @tc.desc      exceptionMessageOf(code=0, message="a") returns "errCode: 0, errMessage: a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0008 begin`);
      const actual: string = exceptionMessageOf(0, 'a');
      logInfo(`exceptionMessageOf(code=0, message="a"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 0, errMessage: a');
      logInfo(`${BUNDLE}ExceptionMessageOf_0008 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0009
     * @tc.name      SerialCommunication_ExceptionMessageOf_0009
     * @tc.desc      exceptionMessageOf(code=0, message="abc") returns "errCode: 0, errMessage: abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0009 begin`);
      const actual: string = exceptionMessageOf(0, 'abc');
      logInfo(`exceptionMessageOf(code=0, message="abc"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 0, errMessage: abc');
      logInfo(`${BUNDLE}ExceptionMessageOf_0009 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0010
     * @tc.name      SerialCommunication_ExceptionMessageOf_0010
     * @tc.desc      exceptionMessageOf(code=0, message="Hello World") returns "errCode: 0, errMessage: Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0010 begin`);
      const actual: string = exceptionMessageOf(0, 'Hello World');
      logInfo(`exceptionMessageOf(code=0, message="Hello...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 0, errMessage: Hello World');
      logInfo(`${BUNDLE}ExceptionMessageOf_0010 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0011
     * @tc.name      SerialCommunication_ExceptionMessageOf_0011
     * @tc.desc      exceptionMessageOf(code=0, message="123") returns "errCode: 0, errMessage: 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0011 begin`);
      const actual: string = exceptionMessageOf(0, '123');
      logInfo(`exceptionMessageOf(code=0, message="123"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 0, errMessage: 123');
      logInfo(`${BUNDLE}ExceptionMessageOf_0011 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0012
     * @tc.name      SerialCommunication_ExceptionMessageOf_0012
     * @tc.desc      exceptionMessageOf(code=0, message=" Hello ") returns "errCode: 0, errMessage:  Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0012 begin`);
      const actual: string = exceptionMessageOf(0, ' Hello ');
      logInfo(`exceptionMessageOf(code=0, message=" Hell...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 0, errMessage:  Hello ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0012 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0013
     * @tc.name      SerialCommunication_ExceptionMessageOf_0013
     * @tc.desc      exceptionMessageOf(code=0, message="HelloHello") returns "errCode: 0, errMessage: HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0013 begin`);
      const actual: string = exceptionMessageOf(0, 'HelloHello');
      logInfo(`exceptionMessageOf(code=0, message="Hello...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 0, errMessage: HelloHello');
      logInfo(`${BUNDLE}ExceptionMessageOf_0013 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0014
     * @tc.name      SerialCommunication_ExceptionMessageOf_0014
     * @tc.desc      exceptionMessageOf(code=0, message="Hello_1") returns "errCode: 0, errMessage: Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0014 begin`);
      const actual: string = exceptionMessageOf(0, 'Hello_1');
      logInfo(`exceptionMessageOf(code=0, message="Hello...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 0, errMessage: Hello_1');
      logInfo(`${BUNDLE}ExceptionMessageOf_0014 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0015
     * @tc.name      SerialCommunication_ExceptionMessageOf_0015
     * @tc.desc      exceptionMessageOf(code=0, message="xHello") returns "errCode: 0, errMessage: xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0015 begin`);
      const actual: string = exceptionMessageOf(0, 'xHello');
      logInfo(`exceptionMessageOf(code=0, message="xHello"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 0, errMessage: xHello');
      logInfo(`${BUNDLE}ExceptionMessageOf_0015 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0016
     * @tc.name      SerialCommunication_ExceptionMessageOf_0016
     * @tc.desc      exceptionMessageOf(code=0, message=" hello world ") returns "errCode: 0, errMessage:  hello world "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0016 begin`);
      const actual: string = exceptionMessageOf(0, ' hello world ');
      logInfo(`exceptionMessageOf(code=0, message=" hell...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 0, errMessage:  hello world ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0016 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0017
     * @tc.name      SerialCommunication_ExceptionMessageOf_0017
     * @tc.desc      exceptionMessageOf(code=0, message="hello worldhello world") returns "errCode: 0, errMessage: he...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0017 begin`);
      const actual: string = exceptionMessageOf(0, 'hello worldhello world');
      logInfo(`exceptionMessageOf(code=0, message="hello...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 0, errMessage: hello worldhello world');
      logInfo(`${BUNDLE}ExceptionMessageOf_0017 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0018
     * @tc.name      SerialCommunication_ExceptionMessageOf_0018
     * @tc.desc      exceptionMessageOf(code=0, message="hello world_1") returns "errCode: 0, errMessage: hello world_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0018 begin`);
      const actual: string = exceptionMessageOf(0, 'hello world_1');
      logInfo(`exceptionMessageOf(code=0, message="hello...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 0, errMessage: hello world_1');
      logInfo(`${BUNDLE}ExceptionMessageOf_0018 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0019
     * @tc.name      SerialCommunication_ExceptionMessageOf_0019
     * @tc.desc      exceptionMessageOf(code=0, message="xhello world") returns "errCode: 0, errMessage: xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0019 begin`);
      const actual: string = exceptionMessageOf(0, 'xhello world');
      logInfo(`exceptionMessageOf(code=0, message="xhell...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 0, errMessage: xhello world');
      logInfo(`${BUNDLE}ExceptionMessageOf_0019 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0020
     * @tc.name      SerialCommunication_ExceptionMessageOf_0020
     * @tc.desc      exceptionMessageOf(code=0, message="   ") returns "errCode: 0, errMessage:    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0020 begin`);
      const actual: string = exceptionMessageOf(0, '   ');
      logInfo(`exceptionMessageOf(code=0, message="   "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 0, errMessage:    ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0020 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0021
     * @tc.name      SerialCommunication_ExceptionMessageOf_0021
     * @tc.desc      exceptionMessageOf(code=0, message="  ") returns "errCode: 0, errMessage:   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0021 begin`);
      const actual: string = exceptionMessageOf(0, '  ');
      logInfo(`exceptionMessageOf(code=0, message="  "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 0, errMessage:   ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0021 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0022
     * @tc.name      SerialCommunication_ExceptionMessageOf_0022
     * @tc.desc      exceptionMessageOf(code=0, message=" _1") returns "errCode: 0, errMessage:  _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0022 begin`);
      const actual: string = exceptionMessageOf(0, ' _1');
      logInfo(`exceptionMessageOf(code=0, message=" _1"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 0, errMessage:  _1');
      logInfo(`${BUNDLE}ExceptionMessageOf_0022 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0023
     * @tc.name      SerialCommunication_ExceptionMessageOf_0023
     * @tc.desc      exceptionMessageOf(code=0, message="x ") returns "errCode: 0, errMessage: x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0023 begin`);
      const actual: string = exceptionMessageOf(0, 'x ');
      logInfo(`exceptionMessageOf(code=0, message="x "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 0, errMessage: x ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0023 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0024
     * @tc.name      SerialCommunication_ExceptionMessageOf_0024
     * @tc.desc      exceptionMessageOf(code=0, message=" A ") returns "errCode: 0, errMessage:  A "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0024 begin`);
      const actual: string = exceptionMessageOf(0, ' A ');
      logInfo(`exceptionMessageOf(code=0, message=" A "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 0, errMessage:  A ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0024 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0025
     * @tc.name      SerialCommunication_ExceptionMessageOf_0025
     * @tc.desc      exceptionMessageOf(code=200, message="Hello") returns "errCode: 200, errMessage: Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0025 begin`);
      const actual: string = exceptionMessageOf(200, 'Hello');
      logInfo(`exceptionMessageOf(code=200, message="Hel...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 200, errMessage: Hello');
      logInfo(`${BUNDLE}ExceptionMessageOf_0025 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0026
     * @tc.name      SerialCommunication_ExceptionMessageOf_0026
     * @tc.desc      exceptionMessageOf(code=200, message="hello world") returns "errCode: 200, errMessage: hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0026 begin`);
      const actual: string = exceptionMessageOf(200, 'hello world');
      logInfo(`exceptionMessageOf(code=200, message="hel...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 200, errMessage: hello world');
      logInfo(`${BUNDLE}ExceptionMessageOf_0026 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0027
     * @tc.name      SerialCommunication_ExceptionMessageOf_0027
     * @tc.desc      exceptionMessageOf(code=200, message="") returns "errCode: 200, errMessage: "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0027 begin`);
      const actual: string = exceptionMessageOf(200, '');
      logInfo(`exceptionMessageOf(code=200, message=""): actual=${actual}`);
      expect(actual).assertEqual('errCode: 200, errMessage: ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0027 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0028
     * @tc.name      SerialCommunication_ExceptionMessageOf_0028
     * @tc.desc      exceptionMessageOf(code=200, message=" ") returns "errCode: 200, errMessage:  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0028 begin`);
      const actual: string = exceptionMessageOf(200, ' ');
      logInfo(`exceptionMessageOf(code=200, message=" "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 200, errMessage:  ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0028 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0029
     * @tc.name      SerialCommunication_ExceptionMessageOf_0029
     * @tc.desc      exceptionMessageOf(code=200, message="A") returns "errCode: 200, errMessage: A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0029 begin`);
      const actual: string = exceptionMessageOf(200, 'A');
      logInfo(`exceptionMessageOf(code=200, message="A"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 200, errMessage: A');
      logInfo(`${BUNDLE}ExceptionMessageOf_0029 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0030
     * @tc.name      SerialCommunication_ExceptionMessageOf_0030
     * @tc.desc      exceptionMessageOf(code=200, message="Sample Title 123") returns "errCode: 200, errMessage: Samp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0030 begin`);
      const actual: string = exceptionMessageOf(200, 'Sample Title 123');
      logInfo(`exceptionMessageOf(code=200, message="Sam...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 200, errMessage: Sample Title 123');
      logInfo(`${BUNDLE}ExceptionMessageOf_0030 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0031
     * @tc.name      SerialCommunication_ExceptionMessageOf_0031
     * @tc.desc      exceptionMessageOf(code=200, message="??") returns "errCode: 200, errMessage: ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0031 begin`);
      const actual: string = exceptionMessageOf(200, '\u4e2d\u6587');
      logInfo(`exceptionMessageOf(code=200, message="??"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 200, errMessage: \u4e2d\u6587');
      logInfo(`${BUNDLE}ExceptionMessageOf_0031 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0032
     * @tc.name      SerialCommunication_ExceptionMessageOf_0032
     * @tc.desc      exceptionMessageOf(code=200, message="a") returns "errCode: 200, errMessage: a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0032 begin`);
      const actual: string = exceptionMessageOf(200, 'a');
      logInfo(`exceptionMessageOf(code=200, message="a"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 200, errMessage: a');
      logInfo(`${BUNDLE}ExceptionMessageOf_0032 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0033
     * @tc.name      SerialCommunication_ExceptionMessageOf_0033
     * @tc.desc      exceptionMessageOf(code=200, message="abc") returns "errCode: 200, errMessage: abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0033 begin`);
      const actual: string = exceptionMessageOf(200, 'abc');
      logInfo(`exceptionMessageOf(code=200, message="abc"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 200, errMessage: abc');
      logInfo(`${BUNDLE}ExceptionMessageOf_0033 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0034
     * @tc.name      SerialCommunication_ExceptionMessageOf_0034
     * @tc.desc      exceptionMessageOf(code=200, message="Hello World") returns "errCode: 200, errMessage: Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0034 begin`);
      const actual: string = exceptionMessageOf(200, 'Hello World');
      logInfo(`exceptionMessageOf(code=200, message="Hel...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 200, errMessage: Hello World');
      logInfo(`${BUNDLE}ExceptionMessageOf_0034 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0035
     * @tc.name      SerialCommunication_ExceptionMessageOf_0035
     * @tc.desc      exceptionMessageOf(code=200, message="123") returns "errCode: 200, errMessage: 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0035 begin`);
      const actual: string = exceptionMessageOf(200, '123');
      logInfo(`exceptionMessageOf(code=200, message="123"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 200, errMessage: 123');
      logInfo(`${BUNDLE}ExceptionMessageOf_0035 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0036
     * @tc.name      SerialCommunication_ExceptionMessageOf_0036
     * @tc.desc      exceptionMessageOf(code=200, message=" Hello ") returns "errCode: 200, errMessage:  Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0036 begin`);
      const actual: string = exceptionMessageOf(200, ' Hello ');
      logInfo(`exceptionMessageOf(code=200, message=" He...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 200, errMessage:  Hello ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0036 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0037
     * @tc.name      SerialCommunication_ExceptionMessageOf_0037
     * @tc.desc      exceptionMessageOf(code=200, message="HelloHello") returns "errCode: 200, errMessage: HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0037 begin`);
      const actual: string = exceptionMessageOf(200, 'HelloHello');
      logInfo(`exceptionMessageOf(code=200, message="Hel...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 200, errMessage: HelloHello');
      logInfo(`${BUNDLE}ExceptionMessageOf_0037 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0038
     * @tc.name      SerialCommunication_ExceptionMessageOf_0038
     * @tc.desc      exceptionMessageOf(code=200, message="Hello_1") returns "errCode: 200, errMessage: Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0038 begin`);
      const actual: string = exceptionMessageOf(200, 'Hello_1');
      logInfo(`exceptionMessageOf(code=200, message="Hel...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 200, errMessage: Hello_1');
      logInfo(`${BUNDLE}ExceptionMessageOf_0038 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0039
     * @tc.name      SerialCommunication_ExceptionMessageOf_0039
     * @tc.desc      exceptionMessageOf(code=200, message="xHello") returns "errCode: 200, errMessage: xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0039 begin`);
      const actual: string = exceptionMessageOf(200, 'xHello');
      logInfo(`exceptionMessageOf(code=200, message="xHe...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 200, errMessage: xHello');
      logInfo(`${BUNDLE}ExceptionMessageOf_0039 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0040
     * @tc.name      SerialCommunication_ExceptionMessageOf_0040
     * @tc.desc      exceptionMessageOf(code=200, message=" hello world ") returns "errCode: 200, errMessage:  hello ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0040 begin`);
      const actual: string = exceptionMessageOf(200, ' hello world ');
      logInfo(`exceptionMessageOf(code=200, message=" he...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 200, errMessage:  hello world ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0040 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0041
     * @tc.name      SerialCommunication_ExceptionMessageOf_0041
     * @tc.desc      exceptionMessageOf(code=200, message="hello worldhello world") returns "errCode: 200, errMessage...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0041 begin`);
      const actual: string = exceptionMessageOf(200, 'hello worldhello world');
      logInfo(`exceptionMessageOf(code=200, message="hel...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 200, errMessage: hello worldhello world');
      logInfo(`${BUNDLE}ExceptionMessageOf_0041 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0042
     * @tc.name      SerialCommunication_ExceptionMessageOf_0042
     * @tc.desc      exceptionMessageOf(code=200, message="hello world_1") returns "errCode: 200, errMessage: hello w...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0042 begin`);
      const actual: string = exceptionMessageOf(200, 'hello world_1');
      logInfo(`exceptionMessageOf(code=200, message="hel...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 200, errMessage: hello world_1');
      logInfo(`${BUNDLE}ExceptionMessageOf_0042 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0043
     * @tc.name      SerialCommunication_ExceptionMessageOf_0043
     * @tc.desc      exceptionMessageOf(code=200, message="xhello world") returns "errCode: 200, errMessage: xhello w...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0043 begin`);
      const actual: string = exceptionMessageOf(200, 'xhello world');
      logInfo(`exceptionMessageOf(code=200, message="xhe...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 200, errMessage: xhello world');
      logInfo(`${BUNDLE}ExceptionMessageOf_0043 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0044
     * @tc.name      SerialCommunication_ExceptionMessageOf_0044
     * @tc.desc      exceptionMessageOf(code=200, message="   ") returns "errCode: 200, errMessage:    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0044 begin`);
      const actual: string = exceptionMessageOf(200, '   ');
      logInfo(`exceptionMessageOf(code=200, message="   "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 200, errMessage:    ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0044 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0045
     * @tc.name      SerialCommunication_ExceptionMessageOf_0045
     * @tc.desc      exceptionMessageOf(code=200, message="  ") returns "errCode: 200, errMessage:   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0045 begin`);
      const actual: string = exceptionMessageOf(200, '  ');
      logInfo(`exceptionMessageOf(code=200, message="  "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 200, errMessage:   ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0045 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0046
     * @tc.name      SerialCommunication_ExceptionMessageOf_0046
     * @tc.desc      exceptionMessageOf(code=200, message=" _1") returns "errCode: 200, errMessage:  _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0046 begin`);
      const actual: string = exceptionMessageOf(200, ' _1');
      logInfo(`exceptionMessageOf(code=200, message=" _1"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 200, errMessage:  _1');
      logInfo(`${BUNDLE}ExceptionMessageOf_0046 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0047
     * @tc.name      SerialCommunication_ExceptionMessageOf_0047
     * @tc.desc      exceptionMessageOf(code=200, message="x ") returns "errCode: 200, errMessage: x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0047 begin`);
      const actual: string = exceptionMessageOf(200, 'x ');
      logInfo(`exceptionMessageOf(code=200, message="x "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 200, errMessage: x ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0047 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0048
     * @tc.name      SerialCommunication_ExceptionMessageOf_0048
     * @tc.desc      exceptionMessageOf(code=200, message=" A ") returns "errCode: 200, errMessage:  A "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0048 begin`);
      const actual: string = exceptionMessageOf(200, ' A ');
      logInfo(`exceptionMessageOf(code=200, message=" A "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 200, errMessage:  A ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0048 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0049
     * @tc.name      SerialCommunication_ExceptionMessageOf_0049
     * @tc.desc      exceptionMessageOf(code=401, message="Hello") returns "errCode: 401, errMessage: Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0049 begin`);
      const actual: string = exceptionMessageOf(401, 'Hello');
      logInfo(`exceptionMessageOf(code=401, message="Hel...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 401, errMessage: Hello');
      logInfo(`${BUNDLE}ExceptionMessageOf_0049 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0050
     * @tc.name      SerialCommunication_ExceptionMessageOf_0050
     * @tc.desc      exceptionMessageOf(code=401, message="hello world") returns "errCode: 401, errMessage: hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0050 begin`);
      const actual: string = exceptionMessageOf(401, 'hello world');
      logInfo(`exceptionMessageOf(code=401, message="hel...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 401, errMessage: hello world');
      logInfo(`${BUNDLE}ExceptionMessageOf_0050 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0051
     * @tc.name      SerialCommunication_ExceptionMessageOf_0051
     * @tc.desc      exceptionMessageOf(code=401, message="") returns "errCode: 401, errMessage: "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0051 begin`);
      const actual: string = exceptionMessageOf(401, '');
      logInfo(`exceptionMessageOf(code=401, message=""): actual=${actual}`);
      expect(actual).assertEqual('errCode: 401, errMessage: ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0051 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0052
     * @tc.name      SerialCommunication_ExceptionMessageOf_0052
     * @tc.desc      exceptionMessageOf(code=401, message=" ") returns "errCode: 401, errMessage:  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0052 begin`);
      const actual: string = exceptionMessageOf(401, ' ');
      logInfo(`exceptionMessageOf(code=401, message=" "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 401, errMessage:  ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0052 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0053
     * @tc.name      SerialCommunication_ExceptionMessageOf_0053
     * @tc.desc      exceptionMessageOf(code=401, message="A") returns "errCode: 401, errMessage: A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0053 begin`);
      const actual: string = exceptionMessageOf(401, 'A');
      logInfo(`exceptionMessageOf(code=401, message="A"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 401, errMessage: A');
      logInfo(`${BUNDLE}ExceptionMessageOf_0053 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0054
     * @tc.name      SerialCommunication_ExceptionMessageOf_0054
     * @tc.desc      exceptionMessageOf(code=401, message="Sample Title 123") returns "errCode: 401, errMessage: Samp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0054 begin`);
      const actual: string = exceptionMessageOf(401, 'Sample Title 123');
      logInfo(`exceptionMessageOf(code=401, message="Sam...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 401, errMessage: Sample Title 123');
      logInfo(`${BUNDLE}ExceptionMessageOf_0054 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0055
     * @tc.name      SerialCommunication_ExceptionMessageOf_0055
     * @tc.desc      exceptionMessageOf(code=401, message="??") returns "errCode: 401, errMessage: ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0055 begin`);
      const actual: string = exceptionMessageOf(401, '\u4e2d\u6587');
      logInfo(`exceptionMessageOf(code=401, message="??"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 401, errMessage: \u4e2d\u6587');
      logInfo(`${BUNDLE}ExceptionMessageOf_0055 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0056
     * @tc.name      SerialCommunication_ExceptionMessageOf_0056
     * @tc.desc      exceptionMessageOf(code=401, message="a") returns "errCode: 401, errMessage: a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0056 begin`);
      const actual: string = exceptionMessageOf(401, 'a');
      logInfo(`exceptionMessageOf(code=401, message="a"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 401, errMessage: a');
      logInfo(`${BUNDLE}ExceptionMessageOf_0056 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0057
     * @tc.name      SerialCommunication_ExceptionMessageOf_0057
     * @tc.desc      exceptionMessageOf(code=401, message="abc") returns "errCode: 401, errMessage: abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0057 begin`);
      const actual: string = exceptionMessageOf(401, 'abc');
      logInfo(`exceptionMessageOf(code=401, message="abc"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 401, errMessage: abc');
      logInfo(`${BUNDLE}ExceptionMessageOf_0057 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0058
     * @tc.name      SerialCommunication_ExceptionMessageOf_0058
     * @tc.desc      exceptionMessageOf(code=401, message="Hello World") returns "errCode: 401, errMessage: Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0058 begin`);
      const actual: string = exceptionMessageOf(401, 'Hello World');
      logInfo(`exceptionMessageOf(code=401, message="Hel...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 401, errMessage: Hello World');
      logInfo(`${BUNDLE}ExceptionMessageOf_0058 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0059
     * @tc.name      SerialCommunication_ExceptionMessageOf_0059
     * @tc.desc      exceptionMessageOf(code=401, message="123") returns "errCode: 401, errMessage: 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0059 begin`);
      const actual: string = exceptionMessageOf(401, '123');
      logInfo(`exceptionMessageOf(code=401, message="123"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 401, errMessage: 123');
      logInfo(`${BUNDLE}ExceptionMessageOf_0059 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0060
     * @tc.name      SerialCommunication_ExceptionMessageOf_0060
     * @tc.desc      exceptionMessageOf(code=401, message=" Hello ") returns "errCode: 401, errMessage:  Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0060 begin`);
      const actual: string = exceptionMessageOf(401, ' Hello ');
      logInfo(`exceptionMessageOf(code=401, message=" He...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 401, errMessage:  Hello ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0060 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0061
     * @tc.name      SerialCommunication_ExceptionMessageOf_0061
     * @tc.desc      exceptionMessageOf(code=401, message="HelloHello") returns "errCode: 401, errMessage: HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0061 begin`);
      const actual: string = exceptionMessageOf(401, 'HelloHello');
      logInfo(`exceptionMessageOf(code=401, message="Hel...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 401, errMessage: HelloHello');
      logInfo(`${BUNDLE}ExceptionMessageOf_0061 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0062
     * @tc.name      SerialCommunication_ExceptionMessageOf_0062
     * @tc.desc      exceptionMessageOf(code=401, message="Hello_1") returns "errCode: 401, errMessage: Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0062 begin`);
      const actual: string = exceptionMessageOf(401, 'Hello_1');
      logInfo(`exceptionMessageOf(code=401, message="Hel...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 401, errMessage: Hello_1');
      logInfo(`${BUNDLE}ExceptionMessageOf_0062 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0063
     * @tc.name      SerialCommunication_ExceptionMessageOf_0063
     * @tc.desc      exceptionMessageOf(code=401, message="xHello") returns "errCode: 401, errMessage: xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0063 begin`);
      const actual: string = exceptionMessageOf(401, 'xHello');
      logInfo(`exceptionMessageOf(code=401, message="xHe...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 401, errMessage: xHello');
      logInfo(`${BUNDLE}ExceptionMessageOf_0063 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0064
     * @tc.name      SerialCommunication_ExceptionMessageOf_0064
     * @tc.desc      exceptionMessageOf(code=401, message=" hello world ") returns "errCode: 401, errMessage:  hello ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0064 begin`);
      const actual: string = exceptionMessageOf(401, ' hello world ');
      logInfo(`exceptionMessageOf(code=401, message=" he...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 401, errMessage:  hello world ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0064 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0065
     * @tc.name      SerialCommunication_ExceptionMessageOf_0065
     * @tc.desc      exceptionMessageOf(code=401, message="hello worldhello world") returns "errCode: 401, errMessage...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0065 begin`);
      const actual: string = exceptionMessageOf(401, 'hello worldhello world');
      logInfo(`exceptionMessageOf(code=401, message="hel...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 401, errMessage: hello worldhello world');
      logInfo(`${BUNDLE}ExceptionMessageOf_0065 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0066
     * @tc.name      SerialCommunication_ExceptionMessageOf_0066
     * @tc.desc      exceptionMessageOf(code=401, message="hello world_1") returns "errCode: 401, errMessage: hello w...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0066 begin`);
      const actual: string = exceptionMessageOf(401, 'hello world_1');
      logInfo(`exceptionMessageOf(code=401, message="hel...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 401, errMessage: hello world_1');
      logInfo(`${BUNDLE}ExceptionMessageOf_0066 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0067
     * @tc.name      SerialCommunication_ExceptionMessageOf_0067
     * @tc.desc      exceptionMessageOf(code=401, message="xhello world") returns "errCode: 401, errMessage: xhello w...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0067 begin`);
      const actual: string = exceptionMessageOf(401, 'xhello world');
      logInfo(`exceptionMessageOf(code=401, message="xhe...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 401, errMessage: xhello world');
      logInfo(`${BUNDLE}ExceptionMessageOf_0067 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0068
     * @tc.name      SerialCommunication_ExceptionMessageOf_0068
     * @tc.desc      exceptionMessageOf(code=401, message="   ") returns "errCode: 401, errMessage:    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0068 begin`);
      const actual: string = exceptionMessageOf(401, '   ');
      logInfo(`exceptionMessageOf(code=401, message="   "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 401, errMessage:    ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0068 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0069
     * @tc.name      SerialCommunication_ExceptionMessageOf_0069
     * @tc.desc      exceptionMessageOf(code=401, message="  ") returns "errCode: 401, errMessage:   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0069 begin`);
      const actual: string = exceptionMessageOf(401, '  ');
      logInfo(`exceptionMessageOf(code=401, message="  "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 401, errMessage:   ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0069 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0070
     * @tc.name      SerialCommunication_ExceptionMessageOf_0070
     * @tc.desc      exceptionMessageOf(code=401, message=" _1") returns "errCode: 401, errMessage:  _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0070 begin`);
      const actual: string = exceptionMessageOf(401, ' _1');
      logInfo(`exceptionMessageOf(code=401, message=" _1"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 401, errMessage:  _1');
      logInfo(`${BUNDLE}ExceptionMessageOf_0070 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0071
     * @tc.name      SerialCommunication_ExceptionMessageOf_0071
     * @tc.desc      exceptionMessageOf(code=401, message="x ") returns "errCode: 401, errMessage: x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0071 begin`);
      const actual: string = exceptionMessageOf(401, 'x ');
      logInfo(`exceptionMessageOf(code=401, message="x "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 401, errMessage: x ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0071 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0072
     * @tc.name      SerialCommunication_ExceptionMessageOf_0072
     * @tc.desc      exceptionMessageOf(code=401, message=" A ") returns "errCode: 401, errMessage:  A "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0072 begin`);
      const actual: string = exceptionMessageOf(401, ' A ');
      logInfo(`exceptionMessageOf(code=401, message=" A "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 401, errMessage:  A ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0072 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0073
     * @tc.name      SerialCommunication_ExceptionMessageOf_0073
     * @tc.desc      exceptionMessageOf(code=404, message="Hello") returns "errCode: 404, errMessage: Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0073 begin`);
      const actual: string = exceptionMessageOf(404, 'Hello');
      logInfo(`exceptionMessageOf(code=404, message="Hel...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 404, errMessage: Hello');
      logInfo(`${BUNDLE}ExceptionMessageOf_0073 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0074
     * @tc.name      SerialCommunication_ExceptionMessageOf_0074
     * @tc.desc      exceptionMessageOf(code=404, message="hello world") returns "errCode: 404, errMessage: hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0074 begin`);
      const actual: string = exceptionMessageOf(404, 'hello world');
      logInfo(`exceptionMessageOf(code=404, message="hel...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 404, errMessage: hello world');
      logInfo(`${BUNDLE}ExceptionMessageOf_0074 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0075
     * @tc.name      SerialCommunication_ExceptionMessageOf_0075
     * @tc.desc      exceptionMessageOf(code=404, message="") returns "errCode: 404, errMessage: "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0075 begin`);
      const actual: string = exceptionMessageOf(404, '');
      logInfo(`exceptionMessageOf(code=404, message=""): actual=${actual}`);
      expect(actual).assertEqual('errCode: 404, errMessage: ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0075 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0076
     * @tc.name      SerialCommunication_ExceptionMessageOf_0076
     * @tc.desc      exceptionMessageOf(code=404, message=" ") returns "errCode: 404, errMessage:  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0076 begin`);
      const actual: string = exceptionMessageOf(404, ' ');
      logInfo(`exceptionMessageOf(code=404, message=" "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 404, errMessage:  ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0076 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0077
     * @tc.name      SerialCommunication_ExceptionMessageOf_0077
     * @tc.desc      exceptionMessageOf(code=404, message="A") returns "errCode: 404, errMessage: A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0077 begin`);
      const actual: string = exceptionMessageOf(404, 'A');
      logInfo(`exceptionMessageOf(code=404, message="A"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 404, errMessage: A');
      logInfo(`${BUNDLE}ExceptionMessageOf_0077 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0078
     * @tc.name      SerialCommunication_ExceptionMessageOf_0078
     * @tc.desc      exceptionMessageOf(code=404, message="Sample Title 123") returns "errCode: 404, errMessage: Samp...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0078 begin`);
      const actual: string = exceptionMessageOf(404, 'Sample Title 123');
      logInfo(`exceptionMessageOf(code=404, message="Sam...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 404, errMessage: Sample Title 123');
      logInfo(`${BUNDLE}ExceptionMessageOf_0078 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0079
     * @tc.name      SerialCommunication_ExceptionMessageOf_0079
     * @tc.desc      exceptionMessageOf(code=404, message="??") returns "errCode: 404, errMessage: ??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0079 begin`);
      const actual: string = exceptionMessageOf(404, '\u4e2d\u6587');
      logInfo(`exceptionMessageOf(code=404, message="??"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 404, errMessage: \u4e2d\u6587');
      logInfo(`${BUNDLE}ExceptionMessageOf_0079 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0080
     * @tc.name      SerialCommunication_ExceptionMessageOf_0080
     * @tc.desc      exceptionMessageOf(code=404, message="a") returns "errCode: 404, errMessage: a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0080 begin`);
      const actual: string = exceptionMessageOf(404, 'a');
      logInfo(`exceptionMessageOf(code=404, message="a"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 404, errMessage: a');
      logInfo(`${BUNDLE}ExceptionMessageOf_0080 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0081
     * @tc.name      SerialCommunication_ExceptionMessageOf_0081
     * @tc.desc      exceptionMessageOf(code=404, message="abc") returns "errCode: 404, errMessage: abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0081 begin`);
      const actual: string = exceptionMessageOf(404, 'abc');
      logInfo(`exceptionMessageOf(code=404, message="abc"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 404, errMessage: abc');
      logInfo(`${BUNDLE}ExceptionMessageOf_0081 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0082
     * @tc.name      SerialCommunication_ExceptionMessageOf_0082
     * @tc.desc      exceptionMessageOf(code=404, message="Hello World") returns "errCode: 404, errMessage: Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0082 begin`);
      const actual: string = exceptionMessageOf(404, 'Hello World');
      logInfo(`exceptionMessageOf(code=404, message="Hel...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 404, errMessage: Hello World');
      logInfo(`${BUNDLE}ExceptionMessageOf_0082 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0083
     * @tc.name      SerialCommunication_ExceptionMessageOf_0083
     * @tc.desc      exceptionMessageOf(code=404, message="123") returns "errCode: 404, errMessage: 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0083 begin`);
      const actual: string = exceptionMessageOf(404, '123');
      logInfo(`exceptionMessageOf(code=404, message="123"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 404, errMessage: 123');
      logInfo(`${BUNDLE}ExceptionMessageOf_0083 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0084
     * @tc.name      SerialCommunication_ExceptionMessageOf_0084
     * @tc.desc      exceptionMessageOf(code=404, message=" Hello ") returns "errCode: 404, errMessage:  Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0084 begin`);
      const actual: string = exceptionMessageOf(404, ' Hello ');
      logInfo(`exceptionMessageOf(code=404, message=" He...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 404, errMessage:  Hello ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0084 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0085
     * @tc.name      SerialCommunication_ExceptionMessageOf_0085
     * @tc.desc      exceptionMessageOf(code=404, message="HelloHello") returns "errCode: 404, errMessage: HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0085 begin`);
      const actual: string = exceptionMessageOf(404, 'HelloHello');
      logInfo(`exceptionMessageOf(code=404, message="Hel...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 404, errMessage: HelloHello');
      logInfo(`${BUNDLE}ExceptionMessageOf_0085 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0086
     * @tc.name      SerialCommunication_ExceptionMessageOf_0086
     * @tc.desc      exceptionMessageOf(code=404, message="Hello_1") returns "errCode: 404, errMessage: Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0086 begin`);
      const actual: string = exceptionMessageOf(404, 'Hello_1');
      logInfo(`exceptionMessageOf(code=404, message="Hel...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 404, errMessage: Hello_1');
      logInfo(`${BUNDLE}ExceptionMessageOf_0086 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0087
     * @tc.name      SerialCommunication_ExceptionMessageOf_0087
     * @tc.desc      exceptionMessageOf(code=404, message="xHello") returns "errCode: 404, errMessage: xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0087 begin`);
      const actual: string = exceptionMessageOf(404, 'xHello');
      logInfo(`exceptionMessageOf(code=404, message="xHe...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 404, errMessage: xHello');
      logInfo(`${BUNDLE}ExceptionMessageOf_0087 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0088
     * @tc.name      SerialCommunication_ExceptionMessageOf_0088
     * @tc.desc      exceptionMessageOf(code=404, message=" hello world ") returns "errCode: 404, errMessage:  hello ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0088 begin`);
      const actual: string = exceptionMessageOf(404, ' hello world ');
      logInfo(`exceptionMessageOf(code=404, message=" he...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 404, errMessage:  hello world ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0088 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0089
     * @tc.name      SerialCommunication_ExceptionMessageOf_0089
     * @tc.desc      exceptionMessageOf(code=404, message="hello worldhello world") returns "errCode: 404, errMessage...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0089 begin`);
      const actual: string = exceptionMessageOf(404, 'hello worldhello world');
      logInfo(`exceptionMessageOf(code=404, message="hel...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 404, errMessage: hello worldhello world');
      logInfo(`${BUNDLE}ExceptionMessageOf_0089 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0090
     * @tc.name      SerialCommunication_ExceptionMessageOf_0090
     * @tc.desc      exceptionMessageOf(code=404, message="hello world_1") returns "errCode: 404, errMessage: hello w...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0090 begin`);
      const actual: string = exceptionMessageOf(404, 'hello world_1');
      logInfo(`exceptionMessageOf(code=404, message="hel...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 404, errMessage: hello world_1');
      logInfo(`${BUNDLE}ExceptionMessageOf_0090 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0091
     * @tc.name      SerialCommunication_ExceptionMessageOf_0091
     * @tc.desc      exceptionMessageOf(code=404, message="xhello world") returns "errCode: 404, errMessage: xhello w...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0091 begin`);
      const actual: string = exceptionMessageOf(404, 'xhello world');
      logInfo(`exceptionMessageOf(code=404, message="xhe...: actual=${actual}`);
      expect(actual).assertEqual('errCode: 404, errMessage: xhello world');
      logInfo(`${BUNDLE}ExceptionMessageOf_0091 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0092
     * @tc.name      SerialCommunication_ExceptionMessageOf_0092
     * @tc.desc      exceptionMessageOf(code=404, message="   ") returns "errCode: 404, errMessage:    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0092 begin`);
      const actual: string = exceptionMessageOf(404, '   ');
      logInfo(`exceptionMessageOf(code=404, message="   "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 404, errMessage:    ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0092 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0093
     * @tc.name      SerialCommunication_ExceptionMessageOf_0093
     * @tc.desc      exceptionMessageOf(code=404, message="  ") returns "errCode: 404, errMessage:   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0093 begin`);
      const actual: string = exceptionMessageOf(404, '  ');
      logInfo(`exceptionMessageOf(code=404, message="  "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 404, errMessage:   ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0093 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0094
     * @tc.name      SerialCommunication_ExceptionMessageOf_0094
     * @tc.desc      exceptionMessageOf(code=404, message=" _1") returns "errCode: 404, errMessage:  _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ExceptionMessageOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0094 begin`);
      const actual: string = exceptionMessageOf(404, ' _1');
      logInfo(`exceptionMessageOf(code=404, message=" _1"): actual=${actual}`);
      expect(actual).assertEqual('errCode: 404, errMessage:  _1');
      logInfo(`${BUNDLE}ExceptionMessageOf_0094 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0095
     * @tc.name      SerialCommunication_ExceptionMessageOf_0095
     * @tc.desc      exceptionMessageOf(code=404, message="x ") returns "errCode: 404, errMessage: x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0095 begin`);
      const actual: string = exceptionMessageOf(404, 'x ');
      logInfo(`exceptionMessageOf(code=404, message="x "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 404, errMessage: x ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0095 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_EXCEPTION_MESSAGE_OF_0096
     * @tc.name      SerialCommunication_ExceptionMessageOf_0096
     * @tc.desc      exceptionMessageOf(code=404, message=" A ") returns "errCode: 404, errMessage:  A "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_ExceptionMessageOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ExceptionMessageOf_0096 begin`);
      const actual: string = exceptionMessageOf(404, ' A ');
      logInfo(`exceptionMessageOf(code=404, message=" A "): actual=${actual}`);
      expect(actual).assertEqual('errCode: 404, errMessage:  A ');
      logInfo(`${BUNDLE}ExceptionMessageOf_0096 end`);
    });
  });
}
