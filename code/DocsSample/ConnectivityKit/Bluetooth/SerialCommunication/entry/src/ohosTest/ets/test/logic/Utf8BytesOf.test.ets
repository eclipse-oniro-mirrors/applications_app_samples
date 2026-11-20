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
import { utf8BytesOf } from '../model/SppSerialLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SerialCommunication]';
const BUNDLE: string = 'SerialCommunication_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for utf8BytesOf (85 cases). */
export default function utf8BytesOfTest(): void {
  describe('Utf8BytesOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0001
     * @tc.name      SerialCommunication_Utf8BytesOf_0001
     * @tc.desc      utf8BytesOf(text="Hello") returns [72,101,108,108,111]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_Utf8BytesOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0001 begin`);
      const actual: number[] = utf8BytesOf('Hello');
      logInfo(`utf8BytesOf(text="Hello"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`utf8BytesOf(text="Hello"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[72,101,108,108,111]');
      logInfo(`${BUNDLE}Utf8BytesOf_0001 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0002
     * @tc.name      SerialCommunication_Utf8BytesOf_0002
     * @tc.desc      utf8BytesOf(text="hello world") returns [104,101,108,108,111,32,119,111,114,108,100]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_Utf8BytesOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0002 begin`);
      const actual: number[] = utf8BytesOf('hello world');
      logInfo(`utf8BytesOf(text="hello world"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`utf8BytesOf(text="hello world"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[104,101,108,108,111,32,119,111,114,108,100]');
      logInfo(`${BUNDLE}Utf8BytesOf_0002 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0003
     * @tc.name      SerialCommunication_Utf8BytesOf_0003
     * @tc.desc      utf8BytesOf(text="") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_Utf8BytesOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0003 begin`);
      const actual: number[] = utf8BytesOf('');
      logInfo(`utf8BytesOf(text=""): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}Utf8BytesOf_0003 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0004
     * @tc.name      SerialCommunication_Utf8BytesOf_0004
     * @tc.desc      utf8BytesOf(text=" ") returns [32]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0004 begin`);
      const actual: number[] = utf8BytesOf(' ');
      logInfo(`utf8BytesOf(text=" "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`utf8BytesOf(text=" "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[32]');
      logInfo(`${BUNDLE}Utf8BytesOf_0004 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0005
     * @tc.name      SerialCommunication_Utf8BytesOf_0005
     * @tc.desc      utf8BytesOf(text="A") returns [65]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0005 begin`);
      const actual: number[] = utf8BytesOf('A');
      logInfo(`utf8BytesOf(text="A"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`utf8BytesOf(text="A"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[65]');
      logInfo(`${BUNDLE}Utf8BytesOf_0005 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0006
     * @tc.name      SerialCommunication_Utf8BytesOf_0006
     * @tc.desc      utf8BytesOf(text="Sample Title 123") returns [83,97,109,112,108,101,32,84,105,116,108,101,32,49,...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0006 begin`);
      const actual: number[] = utf8BytesOf('Sample Title 123');
      logInfo(`utf8BytesOf(text="Sample Title 123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`utf8BytesOf(text="Sample Title 123"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[83,97,109,112,108,101,32,84,105,116,108,101,32,49,50,51]');
      logInfo(`${BUNDLE}Utf8BytesOf_0006 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0007
     * @tc.name      SerialCommunication_Utf8BytesOf_0007
     * @tc.desc      utf8BytesOf(text="??") returns [228,184,173,230,150,135]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0007 begin`);
      const actual: number[] = utf8BytesOf('\u4e2d\u6587');
      logInfo(`utf8BytesOf(text="??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`utf8BytesOf(text="??"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[228,184,173,230,150,135]');
      logInfo(`${BUNDLE}Utf8BytesOf_0007 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0008
     * @tc.name      SerialCommunication_Utf8BytesOf_0008
     * @tc.desc      utf8BytesOf(text="a") returns [97]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0008 begin`);
      const actual: number[] = utf8BytesOf('a');
      logInfo(`utf8BytesOf(text="a"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`utf8BytesOf(text="a"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[97]');
      logInfo(`${BUNDLE}Utf8BytesOf_0008 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0009
     * @tc.name      SerialCommunication_Utf8BytesOf_0009
     * @tc.desc      utf8BytesOf(text="abc") returns [97,98,99]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0009 begin`);
      const actual: number[] = utf8BytesOf('abc');
      logInfo(`utf8BytesOf(text="abc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`utf8BytesOf(text="abc"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[97,98,99]');
      logInfo(`${BUNDLE}Utf8BytesOf_0009 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0010
     * @tc.name      SerialCommunication_Utf8BytesOf_0010
     * @tc.desc      utf8BytesOf(text="Hello World") returns [72,101,108,108,111,32,87,111,114,108,100]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0010 begin`);
      const actual: number[] = utf8BytesOf('Hello World');
      logInfo(`utf8BytesOf(text="Hello World"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`utf8BytesOf(text="Hello World"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[72,101,108,108,111,32,87,111,114,108,100]');
      logInfo(`${BUNDLE}Utf8BytesOf_0010 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0011
     * @tc.name      SerialCommunication_Utf8BytesOf_0011
     * @tc.desc      utf8BytesOf(text="123") returns [49,50,51]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0011 begin`);
      const actual: number[] = utf8BytesOf('123');
      logInfo(`utf8BytesOf(text="123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`utf8BytesOf(text="123"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[49,50,51]');
      logInfo(`${BUNDLE}Utf8BytesOf_0011 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0012
     * @tc.name      SerialCommunication_Utf8BytesOf_0012
     * @tc.desc      utf8BytesOf(text=" Hello ") returns [32,72,101,108,108,111,32]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_Utf8BytesOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0012 begin`);
      const actual: number[] = utf8BytesOf(' Hello ');
      logInfo(`utf8BytesOf(text=" Hello "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`utf8BytesOf(text=" Hello "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[32,72,101,108,108,111,32]');
      logInfo(`${BUNDLE}Utf8BytesOf_0012 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0013
     * @tc.name      SerialCommunication_Utf8BytesOf_0013
     * @tc.desc      utf8BytesOf(text="HelloHello") returns [72,101,108,108,111,72,101,108,108,111]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0013 begin`);
      const actual: number[] = utf8BytesOf('HelloHello');
      logInfo(`utf8BytesOf(text="HelloHello"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(10);
      logInfo(`utf8BytesOf(text="HelloHello"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[72,101,108,108,111,72,101,108,108,111]');
      logInfo(`${BUNDLE}Utf8BytesOf_0013 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0014
     * @tc.name      SerialCommunication_Utf8BytesOf_0014
     * @tc.desc      utf8BytesOf(text="Hello_1") returns [72,101,108,108,111,95,49]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0014 begin`);
      const actual: number[] = utf8BytesOf('Hello_1');
      logInfo(`utf8BytesOf(text="Hello_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`utf8BytesOf(text="Hello_1"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[72,101,108,108,111,95,49]');
      logInfo(`${BUNDLE}Utf8BytesOf_0014 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0015
     * @tc.name      SerialCommunication_Utf8BytesOf_0015
     * @tc.desc      utf8BytesOf(text="xHello") returns [120,72,101,108,108,111]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_Utf8BytesOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0015 begin`);
      const actual: number[] = utf8BytesOf('xHello');
      logInfo(`utf8BytesOf(text="xHello"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`utf8BytesOf(text="xHello"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[120,72,101,108,108,111]');
      logInfo(`${BUNDLE}Utf8BytesOf_0015 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0016
     * @tc.name      SerialCommunication_Utf8BytesOf_0016
     * @tc.desc      utf8BytesOf(text=" hello world ") returns [32,104,101,108,108,111,32,119,111,114,108,100,32]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_Utf8BytesOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0016 begin`);
      const actual: number[] = utf8BytesOf(' hello world ');
      logInfo(`utf8BytesOf(text=" hello world "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(13);
      logInfo(`utf8BytesOf(text=" hello world "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[32,104,101,108,108,111,32,119,111,114,108,100,32]');
      logInfo(`${BUNDLE}Utf8BytesOf_0016 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0017
     * @tc.name      SerialCommunication_Utf8BytesOf_0017
     * @tc.desc      utf8BytesOf(text="hello worldhello world") returns [108,111,32,119,111,114,108,100]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0017 begin`);
      const actual: number[] = utf8BytesOf('hello worldhello world');
      logInfo(`utf8BytesOf(text="hello worldhello world"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(22);
      logInfo(`utf8BytesOf(text="hello worldhello world"): JSON.stringify(ac...${JSON.stringify(actual.slice(0, 14))}`);
      expect(JSON.stringify(actual.slice(0, 14)))
        .assertEqual('[104,101,108,108,111,32,119,111,114,108,100,104,101,108]');
      logInfo(`utf8BytesOf(text="hello worldhello world"): JSON.stringify(a...${JSON.stringify(actual.slice(14, 22))}`);
      expect(JSON.stringify(actual.slice(14, 22))).assertEqual('[108,111,32,119,111,114,108,100]');
      logInfo(`${BUNDLE}Utf8BytesOf_0017 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0018
     * @tc.name      SerialCommunication_Utf8BytesOf_0018
     * @tc.desc      utf8BytesOf(text="hello world_1") returns [104,101,108,108,111,32,119,111,114,108,100,95,49]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0018 begin`);
      const actual: number[] = utf8BytesOf('hello world_1');
      logInfo(`utf8BytesOf(text="hello world_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(13);
      logInfo(`utf8BytesOf(text="hello world_1"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[104,101,108,108,111,32,119,111,114,108,100,95,49]');
      logInfo(`${BUNDLE}Utf8BytesOf_0018 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0019
     * @tc.name      SerialCommunication_Utf8BytesOf_0019
     * @tc.desc      utf8BytesOf(text="xhello world") returns [120,104,101,108,108,111,32,119,111,114,108,100]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_Utf8BytesOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0019 begin`);
      const actual: number[] = utf8BytesOf('xhello world');
      logInfo(`utf8BytesOf(text="xhello world"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(12);
      logInfo(`utf8BytesOf(text="xhello world"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[120,104,101,108,108,111,32,119,111,114,108,100]');
      logInfo(`${BUNDLE}Utf8BytesOf_0019 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0020
     * @tc.name      SerialCommunication_Utf8BytesOf_0020
     * @tc.desc      utf8BytesOf(text="   ") returns [32,32,32]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_Utf8BytesOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0020 begin`);
      const actual: number[] = utf8BytesOf('   ');
      logInfo(`utf8BytesOf(text="   "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`utf8BytesOf(text="   "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[32,32,32]');
      logInfo(`${BUNDLE}Utf8BytesOf_0020 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0021
     * @tc.name      SerialCommunication_Utf8BytesOf_0021
     * @tc.desc      utf8BytesOf(text="  ") returns [32,32]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0021 begin`);
      const actual: number[] = utf8BytesOf('  ');
      logInfo(`utf8BytesOf(text="  "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`utf8BytesOf(text="  "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[32,32]');
      logInfo(`${BUNDLE}Utf8BytesOf_0021 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0022
     * @tc.name      SerialCommunication_Utf8BytesOf_0022
     * @tc.desc      utf8BytesOf(text=" _1") returns [32,95,49]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0022 begin`);
      const actual: number[] = utf8BytesOf(' _1');
      logInfo(`utf8BytesOf(text=" _1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`utf8BytesOf(text=" _1"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[32,95,49]');
      logInfo(`${BUNDLE}Utf8BytesOf_0022 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0023
     * @tc.name      SerialCommunication_Utf8BytesOf_0023
     * @tc.desc      utf8BytesOf(text="x ") returns [120,32]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_Utf8BytesOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0023 begin`);
      const actual: number[] = utf8BytesOf('x ');
      logInfo(`utf8BytesOf(text="x "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`utf8BytesOf(text="x "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[120,32]');
      logInfo(`${BUNDLE}Utf8BytesOf_0023 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0024
     * @tc.name      SerialCommunication_Utf8BytesOf_0024
     * @tc.desc      utf8BytesOf(text=" A ") returns [32,65,32]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_Utf8BytesOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0024 begin`);
      const actual: number[] = utf8BytesOf(' A ');
      logInfo(`utf8BytesOf(text=" A "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`utf8BytesOf(text=" A "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[32,65,32]');
      logInfo(`${BUNDLE}Utf8BytesOf_0024 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0025
     * @tc.name      SerialCommunication_Utf8BytesOf_0025
     * @tc.desc      utf8BytesOf(text="AA") returns [65,65]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0025 begin`);
      const actual: number[] = utf8BytesOf('AA');
      logInfo(`utf8BytesOf(text="AA"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`utf8BytesOf(text="AA"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[65,65]');
      logInfo(`${BUNDLE}Utf8BytesOf_0025 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0026
     * @tc.name      SerialCommunication_Utf8BytesOf_0026
     * @tc.desc      utf8BytesOf(text="A_1") returns [65,95,49]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0026 begin`);
      const actual: number[] = utf8BytesOf('A_1');
      logInfo(`utf8BytesOf(text="A_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`utf8BytesOf(text="A_1"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[65,95,49]');
      logInfo(`${BUNDLE}Utf8BytesOf_0026 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0027
     * @tc.name      SerialCommunication_Utf8BytesOf_0027
     * @tc.desc      utf8BytesOf(text="xA") returns [120,65]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_Utf8BytesOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0027 begin`);
      const actual: number[] = utf8BytesOf('xA');
      logInfo(`utf8BytesOf(text="xA"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`utf8BytesOf(text="xA"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[120,65]');
      logInfo(`${BUNDLE}Utf8BytesOf_0027 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0028
     * @tc.name      SerialCommunication_Utf8BytesOf_0028
     * @tc.desc      utf8BytesOf(text=" Sample Title 123 ") returns [32,83,97,109,112,108,101,32,84,105,116,108,101,3...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_Utf8BytesOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0028 begin`);
      const actual: number[] = utf8BytesOf(' Sample Title 123 ');
      logInfo(`utf8BytesOf(text=" Sample Title 123 "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(18);
      logInfo(`utf8BytesOf(text=" Sample Title 123 "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[32,83,97,109,112,108,101,32,84,105,116,108,101,32,49,50,51,32]');
      logInfo(`${BUNDLE}Utf8BytesOf_0028 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0029
     * @tc.name      SerialCommunication_Utf8BytesOf_0029
     * @tc.desc      utf8BytesOf(text="Sample Title 123Sample Title 123") returns [50,51]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0029 begin`);
      const actual: number[] = utf8BytesOf('Sample Title 123Sample Title 123');
      logInfo(`utf8BytesOf(text="Sample Title 123Sample ...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(32);
      logInfo(`utf8BytesOf(text="Sample Title 123Sample ...: JSON.stringify(...${JSON.stringify(actual.slice(0, 15))}`);
      expect(JSON.stringify(actual.slice(0, 15))).assertEqual('[83,97,109,112,108,101,32,84,105,116,108,101,32,49,50]');
      logInfo(`utf8BytesOf(text="Sample Title 123Sample ...: JSON.stringify...${JSON.stringify(actual.slice(15, 30))}`);
      expect(JSON.stringify(actual.slice(15, 30)))
        .assertEqual('[51,83,97,109,112,108,101,32,84,105,116,108,101,32,49]');
      logInfo(`utf8BytesOf(text="Sample Title 123Sample ...: JSON.stringify...${JSON.stringify(actual.slice(30, 32))}`);
      expect(JSON.stringify(actual.slice(30, 32))).assertEqual('[50,51]');
      logInfo(`${BUNDLE}Utf8BytesOf_0029 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0030
     * @tc.name      SerialCommunication_Utf8BytesOf_0030
     * @tc.desc      utf8BytesOf(text="Sample Title 123_1") returns [83,97,109,112,108,101,32,84,105,116,108,101,32,4...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0030 begin`);
      const actual: number[] = utf8BytesOf('Sample Title 123_1');
      logInfo(`utf8BytesOf(text="Sample Title 123_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(18);
      logInfo(`utf8BytesOf(text="Sample Title 123_1"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[83,97,109,112,108,101,32,84,105,116,108,101,32,49,50,51,95,49]');
      logInfo(`${BUNDLE}Utf8BytesOf_0030 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0031
     * @tc.name      SerialCommunication_Utf8BytesOf_0031
     * @tc.desc      utf8BytesOf(text="xSample Title 123") returns [120,83,97,109,112,108,101,32,84,105,116,108,101,3...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_Utf8BytesOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0031 begin`);
      const actual: number[] = utf8BytesOf('xSample Title 123');
      logInfo(`utf8BytesOf(text="xSample Title 123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(17);
      logInfo(`utf8BytesOf(text="xSample Title 123"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[120,83,97,109,112,108,101,32,84,105,116,108,101,32,49,50,51]');
      logInfo(`${BUNDLE}Utf8BytesOf_0031 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0032
     * @tc.name      SerialCommunication_Utf8BytesOf_0032
     * @tc.desc      utf8BytesOf(text=" ?? ") returns [32,228,184,173,230,150,135,32]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_Utf8BytesOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0032 begin`);
      const actual: number[] = utf8BytesOf(' \u4e2d\u6587 ');
      logInfo(`utf8BytesOf(text=" ?? "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`utf8BytesOf(text=" ?? "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[32,228,184,173,230,150,135,32]');
      logInfo(`${BUNDLE}Utf8BytesOf_0032 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0033
     * @tc.name      SerialCommunication_Utf8BytesOf_0033
     * @tc.desc      utf8BytesOf(text="????") returns [228,184,173,230,150,135,228,184,173,230,150,135]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0033 begin`);
      const actual: number[] = utf8BytesOf('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`utf8BytesOf(text="????"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(12);
      logInfo(`utf8BytesOf(text="????"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[228,184,173,230,150,135,228,184,173,230,150,135]');
      logInfo(`${BUNDLE}Utf8BytesOf_0033 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0034
     * @tc.name      SerialCommunication_Utf8BytesOf_0034
     * @tc.desc      utf8BytesOf(text="??_1") returns [228,184,173,230,150,135,95,49]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0034 begin`);
      const actual: number[] = utf8BytesOf('\u4e2d\u6587_1');
      logInfo(`utf8BytesOf(text="??_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`utf8BytesOf(text="??_1"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[228,184,173,230,150,135,95,49]');
      logInfo(`${BUNDLE}Utf8BytesOf_0034 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0035
     * @tc.name      SerialCommunication_Utf8BytesOf_0035
     * @tc.desc      utf8BytesOf(text="x??") returns [120,228,184,173,230,150,135]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_Utf8BytesOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0035 begin`);
      const actual: number[] = utf8BytesOf('x\u4e2d\u6587');
      logInfo(`utf8BytesOf(text="x??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`utf8BytesOf(text="x??"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[120,228,184,173,230,150,135]');
      logInfo(`${BUNDLE}Utf8BytesOf_0035 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0036
     * @tc.name      SerialCommunication_Utf8BytesOf_0036
     * @tc.desc      utf8BytesOf(text=" a ") returns [32,97,32]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_Utf8BytesOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0036 begin`);
      const actual: number[] = utf8BytesOf(' a ');
      logInfo(`utf8BytesOf(text=" a "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`utf8BytesOf(text=" a "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[32,97,32]');
      logInfo(`${BUNDLE}Utf8BytesOf_0036 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0037
     * @tc.name      SerialCommunication_Utf8BytesOf_0037
     * @tc.desc      utf8BytesOf(text="aa") returns [97,97]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0037 begin`);
      const actual: number[] = utf8BytesOf('aa');
      logInfo(`utf8BytesOf(text="aa"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`utf8BytesOf(text="aa"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[97,97]');
      logInfo(`${BUNDLE}Utf8BytesOf_0037 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0038
     * @tc.name      SerialCommunication_Utf8BytesOf_0038
     * @tc.desc      utf8BytesOf(text="a_1") returns [97,95,49]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0038 begin`);
      const actual: number[] = utf8BytesOf('a_1');
      logInfo(`utf8BytesOf(text="a_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`utf8BytesOf(text="a_1"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[97,95,49]');
      logInfo(`${BUNDLE}Utf8BytesOf_0038 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0039
     * @tc.name      SerialCommunication_Utf8BytesOf_0039
     * @tc.desc      utf8BytesOf(text="xa") returns [120,97]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_Utf8BytesOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0039 begin`);
      const actual: number[] = utf8BytesOf('xa');
      logInfo(`utf8BytesOf(text="xa"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`utf8BytesOf(text="xa"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[120,97]');
      logInfo(`${BUNDLE}Utf8BytesOf_0039 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0040
     * @tc.name      SerialCommunication_Utf8BytesOf_0040
     * @tc.desc      utf8BytesOf(text=" abc ") returns [32,97,98,99,32]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_Utf8BytesOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0040 begin`);
      const actual: number[] = utf8BytesOf(' abc ');
      logInfo(`utf8BytesOf(text=" abc "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`utf8BytesOf(text=" abc "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[32,97,98,99,32]');
      logInfo(`${BUNDLE}Utf8BytesOf_0040 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0041
     * @tc.name      SerialCommunication_Utf8BytesOf_0041
     * @tc.desc      utf8BytesOf(text="abcabc") returns [97,98,99,97,98,99]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0041 begin`);
      const actual: number[] = utf8BytesOf('abcabc');
      logInfo(`utf8BytesOf(text="abcabc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`utf8BytesOf(text="abcabc"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[97,98,99,97,98,99]');
      logInfo(`${BUNDLE}Utf8BytesOf_0041 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0042
     * @tc.name      SerialCommunication_Utf8BytesOf_0042
     * @tc.desc      utf8BytesOf(text="abc_1") returns [97,98,99,95,49]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0042 begin`);
      const actual: number[] = utf8BytesOf('abc_1');
      logInfo(`utf8BytesOf(text="abc_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`utf8BytesOf(text="abc_1"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[97,98,99,95,49]');
      logInfo(`${BUNDLE}Utf8BytesOf_0042 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0043
     * @tc.name      SerialCommunication_Utf8BytesOf_0043
     * @tc.desc      utf8BytesOf(text="xabc") returns [120,97,98,99]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_Utf8BytesOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0043 begin`);
      const actual: number[] = utf8BytesOf('xabc');
      logInfo(`utf8BytesOf(text="xabc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`utf8BytesOf(text="xabc"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[120,97,98,99]');
      logInfo(`${BUNDLE}Utf8BytesOf_0043 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0044
     * @tc.name      SerialCommunication_Utf8BytesOf_0044
     * @tc.desc      utf8BytesOf(text=" Hello World ") returns [32,72,101,108,108,111,32,87,111,114,108,100,32]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_Utf8BytesOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0044 begin`);
      const actual: number[] = utf8BytesOf(' Hello World ');
      logInfo(`utf8BytesOf(text=" Hello World "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(13);
      logInfo(`utf8BytesOf(text=" Hello World "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[32,72,101,108,108,111,32,87,111,114,108,100,32]');
      logInfo(`${BUNDLE}Utf8BytesOf_0044 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0045
     * @tc.name      SerialCommunication_Utf8BytesOf_0045
     * @tc.desc      utf8BytesOf(text="Hello WorldHello World") returns [108,111,32,87,111,114,108,100]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0045 begin`);
      const actual: number[] = utf8BytesOf('Hello WorldHello World');
      logInfo(`utf8BytesOf(text="Hello WorldHello World"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(22);
      logInfo(`utf8BytesOf(text="Hello WorldHello World"): JSON.stringify(ac...${JSON.stringify(actual.slice(0, 14))}`);
      expect(JSON.stringify(actual.slice(0, 14))).assertEqual('[72,101,108,108,111,32,87,111,114,108,100,72,101,108]');
      logInfo(`utf8BytesOf(text="Hello WorldHello World"): JSON.stringify(a...${JSON.stringify(actual.slice(14, 22))}`);
      expect(JSON.stringify(actual.slice(14, 22))).assertEqual('[108,111,32,87,111,114,108,100]');
      logInfo(`${BUNDLE}Utf8BytesOf_0045 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0046
     * @tc.name      SerialCommunication_Utf8BytesOf_0046
     * @tc.desc      utf8BytesOf(text="Hello World_1") returns [72,101,108,108,111,32,87,111,114,108,100,95,49]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0046 begin`);
      const actual: number[] = utf8BytesOf('Hello World_1');
      logInfo(`utf8BytesOf(text="Hello World_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(13);
      logInfo(`utf8BytesOf(text="Hello World_1"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[72,101,108,108,111,32,87,111,114,108,100,95,49]');
      logInfo(`${BUNDLE}Utf8BytesOf_0046 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0047
     * @tc.name      SerialCommunication_Utf8BytesOf_0047
     * @tc.desc      utf8BytesOf(text="xHello World") returns [120,72,101,108,108,111,32,87,111,114,108,100]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_Utf8BytesOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0047 begin`);
      const actual: number[] = utf8BytesOf('xHello World');
      logInfo(`utf8BytesOf(text="xHello World"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(12);
      logInfo(`utf8BytesOf(text="xHello World"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[120,72,101,108,108,111,32,87,111,114,108,100]');
      logInfo(`${BUNDLE}Utf8BytesOf_0047 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0048
     * @tc.name      SerialCommunication_Utf8BytesOf_0048
     * @tc.desc      utf8BytesOf(text=" 123 ") returns [32,49,50,51,32]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_Utf8BytesOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0048 begin`);
      const actual: number[] = utf8BytesOf(' 123 ');
      logInfo(`utf8BytesOf(text=" 123 "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`utf8BytesOf(text=" 123 "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[32,49,50,51,32]');
      logInfo(`${BUNDLE}Utf8BytesOf_0048 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0049
     * @tc.name      SerialCommunication_Utf8BytesOf_0049
     * @tc.desc      utf8BytesOf(text="123123") returns [49,50,51,49,50,51]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0049 begin`);
      const actual: number[] = utf8BytesOf('123123');
      logInfo(`utf8BytesOf(text="123123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`utf8BytesOf(text="123123"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[49,50,51,49,50,51]');
      logInfo(`${BUNDLE}Utf8BytesOf_0049 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0050
     * @tc.name      SerialCommunication_Utf8BytesOf_0050
     * @tc.desc      utf8BytesOf(text="123_1") returns [49,50,51,95,49]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0050 begin`);
      const actual: number[] = utf8BytesOf('123_1');
      logInfo(`utf8BytesOf(text="123_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`utf8BytesOf(text="123_1"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[49,50,51,95,49]');
      logInfo(`${BUNDLE}Utf8BytesOf_0050 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0051
     * @tc.name      SerialCommunication_Utf8BytesOf_0051
     * @tc.desc      utf8BytesOf(text="x123") returns [120,49,50,51]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_Utf8BytesOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0051 begin`);
      const actual: number[] = utf8BytesOf('x123');
      logInfo(`utf8BytesOf(text="x123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`utf8BytesOf(text="x123"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[120,49,50,51]');
      logInfo(`${BUNDLE}Utf8BytesOf_0051 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0052
     * @tc.name      SerialCommunication_Utf8BytesOf_0052
     * @tc.desc      utf8BytesOf(text="h8rKuDdWweL") returns [104,56,114,75,117,68,100,87,119,101,76]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0052 begin`);
      const actual: number[] = utf8BytesOf('h8rKuDdWweL');
      logInfo(`utf8BytesOf(text="h8rKuDdWweL"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`utf8BytesOf(text="h8rKuDdWweL"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[104,56,114,75,117,68,100,87,119,101,76]');
      logInfo(`${BUNDLE}Utf8BytesOf_0052 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0053
     * @tc.name      SerialCommunication_Utf8BytesOf_0053
     * @tc.desc      utf8BytesOf(text="rvBShWu") returns [114,118,66,83,104,87,117]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0053 begin`);
      const actual: number[] = utf8BytesOf('rvBShWu');
      logInfo(`utf8BytesOf(text="rvBShWu"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`utf8BytesOf(text="rvBShWu"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[114,118,66,83,104,87,117]');
      logInfo(`${BUNDLE}Utf8BytesOf_0053 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0054
     * @tc.name      SerialCommunication_Utf8BytesOf_0054
     * @tc.desc      utf8BytesOf(text="cUSwbke") returns [99,85,83,119,98,107,101]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0054 begin`);
      const actual: number[] = utf8BytesOf('cUSwbke');
      logInfo(`utf8BytesOf(text="cUSwbke"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`utf8BytesOf(text="cUSwbke"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[99,85,83,119,98,107,101]');
      logInfo(`${BUNDLE}Utf8BytesOf_0054 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0055
     * @tc.name      SerialCommunication_Utf8BytesOf_0055
     * @tc.desc      utf8BytesOf(text="E95SNzQQAzc") returns [69,57,53,83,78,122,81,81,65,122,99]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0055 begin`);
      const actual: number[] = utf8BytesOf('E95SNzQQAzc');
      logInfo(`utf8BytesOf(text="E95SNzQQAzc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`utf8BytesOf(text="E95SNzQQAzc"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[69,57,53,83,78,122,81,81,65,122,99]');
      logInfo(`${BUNDLE}Utf8BytesOf_0055 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0056
     * @tc.name      SerialCommunication_Utf8BytesOf_0056
     * @tc.desc      utf8BytesOf(text="uJFqtsbgpX") returns [117,74,70,113,116,115,98,103,112,88]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0056 begin`);
      const actual: number[] = utf8BytesOf('uJFqtsbgpX');
      logInfo(`utf8BytesOf(text="uJFqtsbgpX"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(10);
      logInfo(`utf8BytesOf(text="uJFqtsbgpX"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[117,74,70,113,116,115,98,103,112,88]');
      logInfo(`${BUNDLE}Utf8BytesOf_0056 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0057
     * @tc.name      SerialCommunication_Utf8BytesOf_0057
     * @tc.desc      utf8BytesOf(text="ytlIqGm6N") returns [121,116,108,73,113,71,109,54,78]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0057 begin`);
      const actual: number[] = utf8BytesOf('ytlIqGm6N');
      logInfo(`utf8BytesOf(text="ytlIqGm6N"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(9);
      logInfo(`utf8BytesOf(text="ytlIqGm6N"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[121,116,108,73,113,71,109,54,78]');
      logInfo(`${BUNDLE}Utf8BytesOf_0057 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0058
     * @tc.name      SerialCommunication_Utf8BytesOf_0058
     * @tc.desc      utf8BytesOf(text="sbI") returns [115,98,73]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0058 begin`);
      const actual: number[] = utf8BytesOf('sbI');
      logInfo(`utf8BytesOf(text="sbI"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`utf8BytesOf(text="sbI"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[115,98,73]');
      logInfo(`${BUNDLE}Utf8BytesOf_0058 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0059
     * @tc.name      SerialCommunication_Utf8BytesOf_0059
     * @tc.desc      utf8BytesOf(text="XrWD4kIcee8c") returns [88,114,87,68,52,107,73,99,101,101,56,99]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0059 begin`);
      const actual: number[] = utf8BytesOf('XrWD4kIcee8c');
      logInfo(`utf8BytesOf(text="XrWD4kIcee8c"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(12);
      logInfo(`utf8BytesOf(text="XrWD4kIcee8c"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[88,114,87,68,52,107,73,99,101,101,56,99]');
      logInfo(`${BUNDLE}Utf8BytesOf_0059 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0060
     * @tc.name      SerialCommunication_Utf8BytesOf_0060
     * @tc.desc      utf8BytesOf(text="pH5lx6eQ") returns [112,72,53,108,120,54,101,81]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0060 begin`);
      const actual: number[] = utf8BytesOf('pH5lx6eQ');
      logInfo(`utf8BytesOf(text="pH5lx6eQ"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`utf8BytesOf(text="pH5lx6eQ"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[112,72,53,108,120,54,101,81]');
      logInfo(`${BUNDLE}Utf8BytesOf_0060 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0061
     * @tc.name      SerialCommunication_Utf8BytesOf_0061
     * @tc.desc      utf8BytesOf(text="ssTg6sUZBuAF") returns [115,115,84,103,54,115,85,90,66,117,65,70]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0061 begin`);
      const actual: number[] = utf8BytesOf('ssTg6sUZBuAF');
      logInfo(`utf8BytesOf(text="ssTg6sUZBuAF"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(12);
      logInfo(`utf8BytesOf(text="ssTg6sUZBuAF"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[115,115,84,103,54,115,85,90,66,117,65,70]');
      logInfo(`${BUNDLE}Utf8BytesOf_0061 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0062
     * @tc.name      SerialCommunication_Utf8BytesOf_0062
     * @tc.desc      utf8BytesOf(text="zDvu4a1w5dz") returns [122,68,118,117,52,97,49,119,53,100,122]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0062 begin`);
      const actual: number[] = utf8BytesOf('zDvu4a1w5dz');
      logInfo(`utf8BytesOf(text="zDvu4a1w5dz"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`utf8BytesOf(text="zDvu4a1w5dz"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[122,68,118,117,52,97,49,119,53,100,122]');
      logInfo(`${BUNDLE}Utf8BytesOf_0062 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0063
     * @tc.name      SerialCommunication_Utf8BytesOf_0063
     * @tc.desc      utf8BytesOf(text="FBNTMNXUDx") returns [70,66,78,84,77,78,88,85,68,120]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0063 begin`);
      const actual: number[] = utf8BytesOf('FBNTMNXUDx');
      logInfo(`utf8BytesOf(text="FBNTMNXUDx"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(10);
      logInfo(`utf8BytesOf(text="FBNTMNXUDx"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[70,66,78,84,77,78,88,85,68,120]');
      logInfo(`${BUNDLE}Utf8BytesOf_0063 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0064
     * @tc.name      SerialCommunication_Utf8BytesOf_0064
     * @tc.desc      utf8BytesOf(text="qxEdCOO6r") returns [113,120,69,100,67,79,79,54,114]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0064 begin`);
      const actual: number[] = utf8BytesOf('qxEdCOO6r');
      logInfo(`utf8BytesOf(text="qxEdCOO6r"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(9);
      logInfo(`utf8BytesOf(text="qxEdCOO6r"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[113,120,69,100,67,79,79,54,114]');
      logInfo(`${BUNDLE}Utf8BytesOf_0064 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0065
     * @tc.name      SerialCommunication_Utf8BytesOf_0065
     * @tc.desc      utf8BytesOf(text="Q") returns [81]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0065 begin`);
      const actual: number[] = utf8BytesOf('Q');
      logInfo(`utf8BytesOf(text="Q"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`utf8BytesOf(text="Q"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[81]');
      logInfo(`${BUNDLE}Utf8BytesOf_0065 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0066
     * @tc.name      SerialCommunication_Utf8BytesOf_0066
     * @tc.desc      utf8BytesOf(text="HeJtTa") returns [72,101,74,116,84,97]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0066 begin`);
      const actual: number[] = utf8BytesOf('HeJtTa');
      logInfo(`utf8BytesOf(text="HeJtTa"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`utf8BytesOf(text="HeJtTa"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[72,101,74,116,84,97]');
      logInfo(`${BUNDLE}Utf8BytesOf_0066 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0067
     * @tc.name      SerialCommunication_Utf8BytesOf_0067
     * @tc.desc      utf8BytesOf(text="rbh2rDS") returns [114,98,104,50,114,68,83]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0067 begin`);
      const actual: number[] = utf8BytesOf('rbh2rDS');
      logInfo(`utf8BytesOf(text="rbh2rDS"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`utf8BytesOf(text="rbh2rDS"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[114,98,104,50,114,68,83]');
      logInfo(`${BUNDLE}Utf8BytesOf_0067 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0068
     * @tc.name      SerialCommunication_Utf8BytesOf_0068
     * @tc.desc      utf8BytesOf(text="3TzRFfxB") returns [51,84,122,82,70,102,120,66]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0068 begin`);
      const actual: number[] = utf8BytesOf('3TzRFfxB');
      logInfo(`utf8BytesOf(text="3TzRFfxB"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`utf8BytesOf(text="3TzRFfxB"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[51,84,122,82,70,102,120,66]');
      logInfo(`${BUNDLE}Utf8BytesOf_0068 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0069
     * @tc.name      SerialCommunication_Utf8BytesOf_0069
     * @tc.desc      utf8BytesOf(text="UiXqTmA") returns [85,105,88,113,84,109,65]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0069 begin`);
      const actual: number[] = utf8BytesOf('UiXqTmA');
      logInfo(`utf8BytesOf(text="UiXqTmA"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`utf8BytesOf(text="UiXqTmA"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[85,105,88,113,84,109,65]');
      logInfo(`${BUNDLE}Utf8BytesOf_0069 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0070
     * @tc.name      SerialCommunication_Utf8BytesOf_0070
     * @tc.desc      utf8BytesOf(text="WMFgClN7r") returns [87,77,70,103,67,108,78,55,114]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0070 begin`);
      const actual: number[] = utf8BytesOf('WMFgClN7r');
      logInfo(`utf8BytesOf(text="WMFgClN7r"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(9);
      logInfo(`utf8BytesOf(text="WMFgClN7r"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[87,77,70,103,67,108,78,55,114]');
      logInfo(`${BUNDLE}Utf8BytesOf_0070 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0071
     * @tc.name      SerialCommunication_Utf8BytesOf_0071
     * @tc.desc      utf8BytesOf(text="6") returns [54]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0071 begin`);
      const actual: number[] = utf8BytesOf('6');
      logInfo(`utf8BytesOf(text="6"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`utf8BytesOf(text="6"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[54]');
      logInfo(`${BUNDLE}Utf8BytesOf_0071 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0072
     * @tc.name      SerialCommunication_Utf8BytesOf_0072
     * @tc.desc      utf8BytesOf(text="OkLDEwtit") returns [79,107,76,68,69,119,116,105,116]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0072 begin`);
      const actual: number[] = utf8BytesOf('OkLDEwtit');
      logInfo(`utf8BytesOf(text="OkLDEwtit"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(9);
      logInfo(`utf8BytesOf(text="OkLDEwtit"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[79,107,76,68,69,119,116,105,116]');
      logInfo(`${BUNDLE}Utf8BytesOf_0072 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0073
     * @tc.name      SerialCommunication_Utf8BytesOf_0073
     * @tc.desc      utf8BytesOf(text="Gh0ay0SEkNJ") returns [71,104,48,97,121,48,83,69,107,78,74]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0073 begin`);
      const actual: number[] = utf8BytesOf('Gh0ay0SEkNJ');
      logInfo(`utf8BytesOf(text="Gh0ay0SEkNJ"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`utf8BytesOf(text="Gh0ay0SEkNJ"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[71,104,48,97,121,48,83,69,107,78,74]');
      logInfo(`${BUNDLE}Utf8BytesOf_0073 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0074
     * @tc.name      SerialCommunication_Utf8BytesOf_0074
     * @tc.desc      utf8BytesOf(text="truXGTjDMdXc") returns [116,114,117,88,71,84,106,68,77,100,88,99]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0074 begin`);
      const actual: number[] = utf8BytesOf('truXGTjDMdXc');
      logInfo(`utf8BytesOf(text="truXGTjDMdXc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(12);
      logInfo(`utf8BytesOf(text="truXGTjDMdXc"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[116,114,117,88,71,84,106,68,77,100,88,99]');
      logInfo(`${BUNDLE}Utf8BytesOf_0074 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0075
     * @tc.name      SerialCommunication_Utf8BytesOf_0075
     * @tc.desc      utf8BytesOf(text="bOCok0XSBu") returns [98,79,67,111,107,48,88,83,66,117]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0075 begin`);
      const actual: number[] = utf8BytesOf('bOCok0XSBu');
      logInfo(`utf8BytesOf(text="bOCok0XSBu"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(10);
      logInfo(`utf8BytesOf(text="bOCok0XSBu"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[98,79,67,111,107,48,88,83,66,117]');
      logInfo(`${BUNDLE}Utf8BytesOf_0075 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0076
     * @tc.name      SerialCommunication_Utf8BytesOf_0076
     * @tc.desc      utf8BytesOf(text="kZ6By") returns [107,90,54,66,121]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0076 begin`);
      const actual: number[] = utf8BytesOf('kZ6By');
      logInfo(`utf8BytesOf(text="kZ6By"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`utf8BytesOf(text="kZ6By"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[107,90,54,66,121]');
      logInfo(`${BUNDLE}Utf8BytesOf_0076 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0077
     * @tc.name      SerialCommunication_Utf8BytesOf_0077
     * @tc.desc      utf8BytesOf(text="0") returns [48]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0077 begin`);
      const actual: number[] = utf8BytesOf('0');
      logInfo(`utf8BytesOf(text="0"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`utf8BytesOf(text="0"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[48]');
      logInfo(`${BUNDLE}Utf8BytesOf_0077 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0078
     * @tc.name      SerialCommunication_Utf8BytesOf_0078
     * @tc.desc      utf8BytesOf(text="XYTV1w") returns [88,89,84,86,49,119]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0078 begin`);
      const actual: number[] = utf8BytesOf('XYTV1w');
      logInfo(`utf8BytesOf(text="XYTV1w"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`utf8BytesOf(text="XYTV1w"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[88,89,84,86,49,119]');
      logInfo(`${BUNDLE}Utf8BytesOf_0078 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0079
     * @tc.name      SerialCommunication_Utf8BytesOf_0079
     * @tc.desc      utf8BytesOf(text="8e1Ni") returns [56,101,49,78,105]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0079 begin`);
      const actual: number[] = utf8BytesOf('8e1Ni');
      logInfo(`utf8BytesOf(text="8e1Ni"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`utf8BytesOf(text="8e1Ni"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[56,101,49,78,105]');
      logInfo(`${BUNDLE}Utf8BytesOf_0079 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0080
     * @tc.name      SerialCommunication_Utf8BytesOf_0080
     * @tc.desc      utf8BytesOf(text="fIjeNjzQkv") returns [102,73,106,101,78,106,122,81,107,118]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0080 begin`);
      const actual: number[] = utf8BytesOf('fIjeNjzQkv');
      logInfo(`utf8BytesOf(text="fIjeNjzQkv"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(10);
      logInfo(`utf8BytesOf(text="fIjeNjzQkv"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[102,73,106,101,78,106,122,81,107,118]');
      logInfo(`${BUNDLE}Utf8BytesOf_0080 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0081
     * @tc.name      SerialCommunication_Utf8BytesOf_0081
     * @tc.desc      utf8BytesOf(text="16nW0nS") returns [49,54,110,87,48,110,83]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0081 begin`);
      const actual: number[] = utf8BytesOf('16nW0nS');
      logInfo(`utf8BytesOf(text="16nW0nS"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`utf8BytesOf(text="16nW0nS"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[49,54,110,87,48,110,83]');
      logInfo(`${BUNDLE}Utf8BytesOf_0081 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0082
     * @tc.name      SerialCommunication_Utf8BytesOf_0082
     * @tc.desc      utf8BytesOf(text="zj8eq") returns [122,106,56,101,113]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0082 begin`);
      const actual: number[] = utf8BytesOf('zj8eq');
      logInfo(`utf8BytesOf(text="zj8eq"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`utf8BytesOf(text="zj8eq"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[122,106,56,101,113]');
      logInfo(`${BUNDLE}Utf8BytesOf_0082 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0083
     * @tc.name      SerialCommunication_Utf8BytesOf_0083
     * @tc.desc      utf8BytesOf(text="SYeCDHRHh") returns [83,89,101,67,68,72,82,72,104]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0083 begin`);
      const actual: number[] = utf8BytesOf('SYeCDHRHh');
      logInfo(`utf8BytesOf(text="SYeCDHRHh"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(9);
      logInfo(`utf8BytesOf(text="SYeCDHRHh"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[83,89,101,67,68,72,82,72,104]');
      logInfo(`${BUNDLE}Utf8BytesOf_0083 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0084
     * @tc.name      SerialCommunication_Utf8BytesOf_0084
     * @tc.desc      utf8BytesOf(text="HLGeMq") returns [72,76,71,101,77,113]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0084 begin`);
      const actual: number[] = utf8BytesOf('HLGeMq');
      logInfo(`utf8BytesOf(text="HLGeMq"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`utf8BytesOf(text="HLGeMq"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[72,76,71,101,77,113]');
      logInfo(`${BUNDLE}Utf8BytesOf_0084 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_UTF8_BYTES_OF_0085
     * @tc.name      SerialCommunication_Utf8BytesOf_0085
     * @tc.desc      utf8BytesOf(text="iOvIg690G") returns [105,79,118,73,103,54,57,48,71]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_Utf8BytesOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}Utf8BytesOf_0085 begin`);
      const actual: number[] = utf8BytesOf('iOvIg690G');
      logInfo(`utf8BytesOf(text="iOvIg690G"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(9);
      logInfo(`utf8BytesOf(text="iOvIg690G"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[105,79,118,73,103,54,57,48,71]');
      logInfo(`${BUNDLE}Utf8BytesOf_0085 end`);
    });
  });
}
