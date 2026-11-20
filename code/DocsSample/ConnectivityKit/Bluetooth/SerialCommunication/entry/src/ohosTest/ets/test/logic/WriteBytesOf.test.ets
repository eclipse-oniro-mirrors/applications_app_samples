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
import { writeBytesOf } from '../model/SppSerialLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SerialCommunication]';
const BUNDLE: string = 'SerialCommunication_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for writeBytesOf (85 cases). */
export default function writeBytesOfTest(): void {
  describe('WriteBytesOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0001
     * @tc.name      SerialCommunication_WriteBytesOf_0001
     * @tc.desc      writeBytesOf(text="Hello") returns [72,101,108,108,111]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_WriteBytesOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0001 begin`);
      const actual: number[] = writeBytesOf('Hello');
      logInfo(`writeBytesOf(text="Hello"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`writeBytesOf(text="Hello"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[72,101,108,108,111]');
      logInfo(`${BUNDLE}WriteBytesOf_0001 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0002
     * @tc.name      SerialCommunication_WriteBytesOf_0002
     * @tc.desc      writeBytesOf(text="hello world") returns [104,101,108,108,111,32,119,111,114,108,100]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_WriteBytesOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0002 begin`);
      const actual: number[] = writeBytesOf('hello world');
      logInfo(`writeBytesOf(text="hello world"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`writeBytesOf(text="hello world"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[104,101,108,108,111,32,119,111,114,108,100]');
      logInfo(`${BUNDLE}WriteBytesOf_0002 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0003
     * @tc.name      SerialCommunication_WriteBytesOf_0003
     * @tc.desc      writeBytesOf(text="") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WriteBytesOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0003 begin`);
      const actual: number[] = writeBytesOf('');
      logInfo(`writeBytesOf(text=""): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}WriteBytesOf_0003 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0004
     * @tc.name      SerialCommunication_WriteBytesOf_0004
     * @tc.desc      writeBytesOf(text=" ") returns [32]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0004 begin`);
      const actual: number[] = writeBytesOf(' ');
      logInfo(`writeBytesOf(text=" "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`writeBytesOf(text=" "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[32]');
      logInfo(`${BUNDLE}WriteBytesOf_0004 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0005
     * @tc.name      SerialCommunication_WriteBytesOf_0005
     * @tc.desc      writeBytesOf(text="A") returns [65]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0005 begin`);
      const actual: number[] = writeBytesOf('A');
      logInfo(`writeBytesOf(text="A"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`writeBytesOf(text="A"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[65]');
      logInfo(`${BUNDLE}WriteBytesOf_0005 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0006
     * @tc.name      SerialCommunication_WriteBytesOf_0006
     * @tc.desc      writeBytesOf(text="Sample Title 123") returns [83,97,109,112,108,101,32,84,105,116,108,101,32,49...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0006 begin`);
      const actual: number[] = writeBytesOf('Sample Title 123');
      logInfo(`writeBytesOf(text="Sample Title 123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(16);
      logInfo(`writeBytesOf(text="Sample Title 123"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[83,97,109,112,108,101,32,84,105,116,108,101,32,49,50,51]');
      logInfo(`${BUNDLE}WriteBytesOf_0006 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0007
     * @tc.name      SerialCommunication_WriteBytesOf_0007
     * @tc.desc      writeBytesOf(text="??") returns [0,0]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0007 begin`);
      const actual: number[] = writeBytesOf('\u4e2d\u6587');
      logInfo(`writeBytesOf(text="??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`writeBytesOf(text="??"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[0,0]');
      logInfo(`${BUNDLE}WriteBytesOf_0007 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0008
     * @tc.name      SerialCommunication_WriteBytesOf_0008
     * @tc.desc      writeBytesOf(text="a") returns [97]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0008 begin`);
      const actual: number[] = writeBytesOf('a');
      logInfo(`writeBytesOf(text="a"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`writeBytesOf(text="a"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[97]');
      logInfo(`${BUNDLE}WriteBytesOf_0008 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0009
     * @tc.name      SerialCommunication_WriteBytesOf_0009
     * @tc.desc      writeBytesOf(text="abc") returns [97,98,99]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0009 begin`);
      const actual: number[] = writeBytesOf('abc');
      logInfo(`writeBytesOf(text="abc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`writeBytesOf(text="abc"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[97,98,99]');
      logInfo(`${BUNDLE}WriteBytesOf_0009 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0010
     * @tc.name      SerialCommunication_WriteBytesOf_0010
     * @tc.desc      writeBytesOf(text="Hello World") returns [72,101,108,108,111,32,87,111,114,108,100]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0010 begin`);
      const actual: number[] = writeBytesOf('Hello World');
      logInfo(`writeBytesOf(text="Hello World"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`writeBytesOf(text="Hello World"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[72,101,108,108,111,32,87,111,114,108,100]');
      logInfo(`${BUNDLE}WriteBytesOf_0010 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0011
     * @tc.name      SerialCommunication_WriteBytesOf_0011
     * @tc.desc      writeBytesOf(text="123") returns [49,50,51]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0011 begin`);
      const actual: number[] = writeBytesOf('123');
      logInfo(`writeBytesOf(text="123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`writeBytesOf(text="123"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[49,50,51]');
      logInfo(`${BUNDLE}WriteBytesOf_0011 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0012
     * @tc.name      SerialCommunication_WriteBytesOf_0012
     * @tc.desc      writeBytesOf(text=" Hello ") returns [32,72,101,108,108,111,32]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WriteBytesOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0012 begin`);
      const actual: number[] = writeBytesOf(' Hello ');
      logInfo(`writeBytesOf(text=" Hello "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`writeBytesOf(text=" Hello "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[32,72,101,108,108,111,32]');
      logInfo(`${BUNDLE}WriteBytesOf_0012 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0013
     * @tc.name      SerialCommunication_WriteBytesOf_0013
     * @tc.desc      writeBytesOf(text="HelloHello") returns [72,101,108,108,111,72,101,108,108,111]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0013 begin`);
      const actual: number[] = writeBytesOf('HelloHello');
      logInfo(`writeBytesOf(text="HelloHello"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(10);
      logInfo(`writeBytesOf(text="HelloHello"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[72,101,108,108,111,72,101,108,108,111]');
      logInfo(`${BUNDLE}WriteBytesOf_0013 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0014
     * @tc.name      SerialCommunication_WriteBytesOf_0014
     * @tc.desc      writeBytesOf(text="Hello_1") returns [72,101,108,108,111,95,49]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0014 begin`);
      const actual: number[] = writeBytesOf('Hello_1');
      logInfo(`writeBytesOf(text="Hello_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`writeBytesOf(text="Hello_1"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[72,101,108,108,111,95,49]');
      logInfo(`${BUNDLE}WriteBytesOf_0014 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0015
     * @tc.name      SerialCommunication_WriteBytesOf_0015
     * @tc.desc      writeBytesOf(text="xHello") returns [120,72,101,108,108,111]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WriteBytesOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0015 begin`);
      const actual: number[] = writeBytesOf('xHello');
      logInfo(`writeBytesOf(text="xHello"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`writeBytesOf(text="xHello"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[120,72,101,108,108,111]');
      logInfo(`${BUNDLE}WriteBytesOf_0015 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0016
     * @tc.name      SerialCommunication_WriteBytesOf_0016
     * @tc.desc      writeBytesOf(text=" hello world ") returns [32,104,101,108,108,111,32,119,111,114,108,100,32]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WriteBytesOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0016 begin`);
      const actual: number[] = writeBytesOf(' hello world ');
      logInfo(`writeBytesOf(text=" hello world "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(13);
      logInfo(`writeBytesOf(text=" hello world "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[32,104,101,108,108,111,32,119,111,114,108,100,32]');
      logInfo(`${BUNDLE}WriteBytesOf_0016 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0017
     * @tc.name      SerialCommunication_WriteBytesOf_0017
     * @tc.desc      writeBytesOf(text="hello worldhello world") returns [108,111,32,119,111,114,108,100]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0017 begin`);
      const actual: number[] = writeBytesOf('hello worldhello world');
      logInfo(`writeBytesOf(text="hello worldhello world"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(22);
      logInfo(`writeBytesOf(text="hello worldhello world"): JSON.stringify(a...${JSON.stringify(actual.slice(0, 14))}`);
      expect(JSON.stringify(actual.slice(0, 14)))
        .assertEqual('[104,101,108,108,111,32,119,111,114,108,100,104,101,108]');
      logInfo(`writeBytesOf(text="hello worldhello world"): JSON.stringify(...${JSON.stringify(actual.slice(14, 22))}`);
      expect(JSON.stringify(actual.slice(14, 22))).assertEqual('[108,111,32,119,111,114,108,100]');
      logInfo(`${BUNDLE}WriteBytesOf_0017 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0018
     * @tc.name      SerialCommunication_WriteBytesOf_0018
     * @tc.desc      writeBytesOf(text="hello world_1") returns [104,101,108,108,111,32,119,111,114,108,100,95,49]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0018 begin`);
      const actual: number[] = writeBytesOf('hello world_1');
      logInfo(`writeBytesOf(text="hello world_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(13);
      logInfo(`writeBytesOf(text="hello world_1"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[104,101,108,108,111,32,119,111,114,108,100,95,49]');
      logInfo(`${BUNDLE}WriteBytesOf_0018 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0019
     * @tc.name      SerialCommunication_WriteBytesOf_0019
     * @tc.desc      writeBytesOf(text="xhello world") returns [120,104,101,108,108,111,32,119,111,114,108,100]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WriteBytesOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0019 begin`);
      const actual: number[] = writeBytesOf('xhello world');
      logInfo(`writeBytesOf(text="xhello world"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(12);
      logInfo(`writeBytesOf(text="xhello world"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[120,104,101,108,108,111,32,119,111,114,108,100]');
      logInfo(`${BUNDLE}WriteBytesOf_0019 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0020
     * @tc.name      SerialCommunication_WriteBytesOf_0020
     * @tc.desc      writeBytesOf(text="   ") returns [32,32,32]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WriteBytesOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0020 begin`);
      const actual: number[] = writeBytesOf('   ');
      logInfo(`writeBytesOf(text="   "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`writeBytesOf(text="   "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[32,32,32]');
      logInfo(`${BUNDLE}WriteBytesOf_0020 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0021
     * @tc.name      SerialCommunication_WriteBytesOf_0021
     * @tc.desc      writeBytesOf(text="  ") returns [32,32]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0021 begin`);
      const actual: number[] = writeBytesOf('  ');
      logInfo(`writeBytesOf(text="  "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`writeBytesOf(text="  "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[32,32]');
      logInfo(`${BUNDLE}WriteBytesOf_0021 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0022
     * @tc.name      SerialCommunication_WriteBytesOf_0022
     * @tc.desc      writeBytesOf(text=" _1") returns [32,95,49]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0022 begin`);
      const actual: number[] = writeBytesOf(' _1');
      logInfo(`writeBytesOf(text=" _1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`writeBytesOf(text=" _1"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[32,95,49]');
      logInfo(`${BUNDLE}WriteBytesOf_0022 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0023
     * @tc.name      SerialCommunication_WriteBytesOf_0023
     * @tc.desc      writeBytesOf(text="x ") returns [120,32]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WriteBytesOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0023 begin`);
      const actual: number[] = writeBytesOf('x ');
      logInfo(`writeBytesOf(text="x "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`writeBytesOf(text="x "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[120,32]');
      logInfo(`${BUNDLE}WriteBytesOf_0023 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0024
     * @tc.name      SerialCommunication_WriteBytesOf_0024
     * @tc.desc      writeBytesOf(text=" A ") returns [32,65,32]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WriteBytesOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0024 begin`);
      const actual: number[] = writeBytesOf(' A ');
      logInfo(`writeBytesOf(text=" A "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`writeBytesOf(text=" A "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[32,65,32]');
      logInfo(`${BUNDLE}WriteBytesOf_0024 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0025
     * @tc.name      SerialCommunication_WriteBytesOf_0025
     * @tc.desc      writeBytesOf(text="AA") returns [65,65]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0025 begin`);
      const actual: number[] = writeBytesOf('AA');
      logInfo(`writeBytesOf(text="AA"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`writeBytesOf(text="AA"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[65,65]');
      logInfo(`${BUNDLE}WriteBytesOf_0025 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0026
     * @tc.name      SerialCommunication_WriteBytesOf_0026
     * @tc.desc      writeBytesOf(text="A_1") returns [65,95,49]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0026 begin`);
      const actual: number[] = writeBytesOf('A_1');
      logInfo(`writeBytesOf(text="A_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`writeBytesOf(text="A_1"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[65,95,49]');
      logInfo(`${BUNDLE}WriteBytesOf_0026 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0027
     * @tc.name      SerialCommunication_WriteBytesOf_0027
     * @tc.desc      writeBytesOf(text="xA") returns [120,65]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WriteBytesOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0027 begin`);
      const actual: number[] = writeBytesOf('xA');
      logInfo(`writeBytesOf(text="xA"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`writeBytesOf(text="xA"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[120,65]');
      logInfo(`${BUNDLE}WriteBytesOf_0027 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0028
     * @tc.name      SerialCommunication_WriteBytesOf_0028
     * @tc.desc      writeBytesOf(text=" Sample Title 123 ") returns [32,83,97,109,112,108,101,32,84,105,116,108,101,...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WriteBytesOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0028 begin`);
      const actual: number[] = writeBytesOf(' Sample Title 123 ');
      logInfo(`writeBytesOf(text=" Sample Title 123 "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(18);
      logInfo(`writeBytesOf(text=" Sample Title 123 "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[32,83,97,109,112,108,101,32,84,105,116,108,101,32,49,50,51,32]');
      logInfo(`${BUNDLE}WriteBytesOf_0028 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0029
     * @tc.name      SerialCommunication_WriteBytesOf_0029
     * @tc.desc      writeBytesOf(text="Sample Title 123Sample Title 123") returns [50,51]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0029 begin`);
      const actual: number[] = writeBytesOf('Sample Title 123Sample Title 123');
      logInfo(`writeBytesOf(text="Sample Title 123Sample...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(32);
      logInfo(`writeBytesOf(text="Sample Title 123Sample...: JSON.stringify(...${JSON.stringify(actual.slice(0, 15))}`);
      expect(JSON.stringify(actual.slice(0, 15))).assertEqual('[83,97,109,112,108,101,32,84,105,116,108,101,32,49,50]');
      logInfo(`writeBytesOf(text="Sample Title 123Sample...: JSON.stringify...${JSON.stringify(actual.slice(15, 30))}`);
      expect(JSON.stringify(actual.slice(15, 30)))
        .assertEqual('[51,83,97,109,112,108,101,32,84,105,116,108,101,32,49]');
      logInfo(`writeBytesOf(text="Sample Title 123Sample...: JSON.stringify...${JSON.stringify(actual.slice(30, 32))}`);
      expect(JSON.stringify(actual.slice(30, 32))).assertEqual('[50,51]');
      logInfo(`${BUNDLE}WriteBytesOf_0029 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0030
     * @tc.name      SerialCommunication_WriteBytesOf_0030
     * @tc.desc      writeBytesOf(text="Sample Title 123_1") returns [83,97,109,112,108,101,32,84,105,116,108,101,32,...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0030 begin`);
      const actual: number[] = writeBytesOf('Sample Title 123_1');
      logInfo(`writeBytesOf(text="Sample Title 123_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(18);
      logInfo(`writeBytesOf(text="Sample Title 123_1"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[83,97,109,112,108,101,32,84,105,116,108,101,32,49,50,51,95,49]');
      logInfo(`${BUNDLE}WriteBytesOf_0030 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0031
     * @tc.name      SerialCommunication_WriteBytesOf_0031
     * @tc.desc      writeBytesOf(text="xSample Title 123") returns [120,83,97,109,112,108,101,32,84,105,116,108,101,...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WriteBytesOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0031 begin`);
      const actual: number[] = writeBytesOf('xSample Title 123');
      logInfo(`writeBytesOf(text="xSample Title 123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(17);
      logInfo(`writeBytesOf(text="xSample Title 123"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[120,83,97,109,112,108,101,32,84,105,116,108,101,32,49,50,51]');
      logInfo(`${BUNDLE}WriteBytesOf_0031 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0032
     * @tc.name      SerialCommunication_WriteBytesOf_0032
     * @tc.desc      writeBytesOf(text=" ?? ") returns [32,228,184,173]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WriteBytesOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0032 begin`);
      const actual: number[] = writeBytesOf(' \u4e2d\u6587 ');
      logInfo(`writeBytesOf(text=" ?? "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`writeBytesOf(text=" ?? "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[32,228,184,173]');
      logInfo(`${BUNDLE}WriteBytesOf_0032 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0033
     * @tc.name      SerialCommunication_WriteBytesOf_0033
     * @tc.desc      writeBytesOf(text="????") returns [228,184,173,0]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0033 begin`);
      const actual: number[] = writeBytesOf('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`writeBytesOf(text="????"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`writeBytesOf(text="????"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[228,184,173,0]');
      logInfo(`${BUNDLE}WriteBytesOf_0033 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0034
     * @tc.name      SerialCommunication_WriteBytesOf_0034
     * @tc.desc      writeBytesOf(text="x??") returns [120,0,0]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WriteBytesOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0034 begin`);
      const actual: number[] = writeBytesOf('x\u4e2d\u6587');
      logInfo(`writeBytesOf(text="x??"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`writeBytesOf(text="x??"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[120,0,0]');
      logInfo(`${BUNDLE}WriteBytesOf_0034 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0035
     * @tc.name      SerialCommunication_WriteBytesOf_0035
     * @tc.desc      writeBytesOf(text=" a ") returns [32,97,32]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WriteBytesOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0035 begin`);
      const actual: number[] = writeBytesOf(' a ');
      logInfo(`writeBytesOf(text=" a "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`writeBytesOf(text=" a "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[32,97,32]');
      logInfo(`${BUNDLE}WriteBytesOf_0035 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0036
     * @tc.name      SerialCommunication_WriteBytesOf_0036
     * @tc.desc      writeBytesOf(text="aa") returns [97,97]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0036 begin`);
      const actual: number[] = writeBytesOf('aa');
      logInfo(`writeBytesOf(text="aa"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`writeBytesOf(text="aa"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[97,97]');
      logInfo(`${BUNDLE}WriteBytesOf_0036 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0037
     * @tc.name      SerialCommunication_WriteBytesOf_0037
     * @tc.desc      writeBytesOf(text="a_1") returns [97,95,49]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0037 begin`);
      const actual: number[] = writeBytesOf('a_1');
      logInfo(`writeBytesOf(text="a_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`writeBytesOf(text="a_1"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[97,95,49]');
      logInfo(`${BUNDLE}WriteBytesOf_0037 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0038
     * @tc.name      SerialCommunication_WriteBytesOf_0038
     * @tc.desc      writeBytesOf(text="xa") returns [120,97]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WriteBytesOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0038 begin`);
      const actual: number[] = writeBytesOf('xa');
      logInfo(`writeBytesOf(text="xa"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`writeBytesOf(text="xa"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[120,97]');
      logInfo(`${BUNDLE}WriteBytesOf_0038 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0039
     * @tc.name      SerialCommunication_WriteBytesOf_0039
     * @tc.desc      writeBytesOf(text=" abc ") returns [32,97,98,99,32]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WriteBytesOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0039 begin`);
      const actual: number[] = writeBytesOf(' abc ');
      logInfo(`writeBytesOf(text=" abc "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`writeBytesOf(text=" abc "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[32,97,98,99,32]');
      logInfo(`${BUNDLE}WriteBytesOf_0039 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0040
     * @tc.name      SerialCommunication_WriteBytesOf_0040
     * @tc.desc      writeBytesOf(text="abcabc") returns [97,98,99,97,98,99]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0040 begin`);
      const actual: number[] = writeBytesOf('abcabc');
      logInfo(`writeBytesOf(text="abcabc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`writeBytesOf(text="abcabc"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[97,98,99,97,98,99]');
      logInfo(`${BUNDLE}WriteBytesOf_0040 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0041
     * @tc.name      SerialCommunication_WriteBytesOf_0041
     * @tc.desc      writeBytesOf(text="abc_1") returns [97,98,99,95,49]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0041 begin`);
      const actual: number[] = writeBytesOf('abc_1');
      logInfo(`writeBytesOf(text="abc_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`writeBytesOf(text="abc_1"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[97,98,99,95,49]');
      logInfo(`${BUNDLE}WriteBytesOf_0041 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0042
     * @tc.name      SerialCommunication_WriteBytesOf_0042
     * @tc.desc      writeBytesOf(text="xabc") returns [120,97,98,99]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WriteBytesOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0042 begin`);
      const actual: number[] = writeBytesOf('xabc');
      logInfo(`writeBytesOf(text="xabc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`writeBytesOf(text="xabc"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[120,97,98,99]');
      logInfo(`${BUNDLE}WriteBytesOf_0042 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0043
     * @tc.name      SerialCommunication_WriteBytesOf_0043
     * @tc.desc      writeBytesOf(text=" Hello World ") returns [32,72,101,108,108,111,32,87,111,114,108,100,32]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WriteBytesOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0043 begin`);
      const actual: number[] = writeBytesOf(' Hello World ');
      logInfo(`writeBytesOf(text=" Hello World "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(13);
      logInfo(`writeBytesOf(text=" Hello World "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[32,72,101,108,108,111,32,87,111,114,108,100,32]');
      logInfo(`${BUNDLE}WriteBytesOf_0043 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0044
     * @tc.name      SerialCommunication_WriteBytesOf_0044
     * @tc.desc      writeBytesOf(text="Hello WorldHello World") returns [108,111,32,87,111,114,108,100]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0044 begin`);
      const actual: number[] = writeBytesOf('Hello WorldHello World');
      logInfo(`writeBytesOf(text="Hello WorldHello World"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(22);
      logInfo(`writeBytesOf(text="Hello WorldHello World"): JSON.stringify(a...${JSON.stringify(actual.slice(0, 14))}`);
      expect(JSON.stringify(actual.slice(0, 14))).assertEqual('[72,101,108,108,111,32,87,111,114,108,100,72,101,108]');
      logInfo(`writeBytesOf(text="Hello WorldHello World"): JSON.stringify(...${JSON.stringify(actual.slice(14, 22))}`);
      expect(JSON.stringify(actual.slice(14, 22))).assertEqual('[108,111,32,87,111,114,108,100]');
      logInfo(`${BUNDLE}WriteBytesOf_0044 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0045
     * @tc.name      SerialCommunication_WriteBytesOf_0045
     * @tc.desc      writeBytesOf(text="Hello World_1") returns [72,101,108,108,111,32,87,111,114,108,100,95,49]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0045 begin`);
      const actual: number[] = writeBytesOf('Hello World_1');
      logInfo(`writeBytesOf(text="Hello World_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(13);
      logInfo(`writeBytesOf(text="Hello World_1"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[72,101,108,108,111,32,87,111,114,108,100,95,49]');
      logInfo(`${BUNDLE}WriteBytesOf_0045 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0046
     * @tc.name      SerialCommunication_WriteBytesOf_0046
     * @tc.desc      writeBytesOf(text="xHello World") returns [120,72,101,108,108,111,32,87,111,114,108,100]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WriteBytesOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0046 begin`);
      const actual: number[] = writeBytesOf('xHello World');
      logInfo(`writeBytesOf(text="xHello World"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(12);
      logInfo(`writeBytesOf(text="xHello World"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[120,72,101,108,108,111,32,87,111,114,108,100]');
      logInfo(`${BUNDLE}WriteBytesOf_0046 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0047
     * @tc.name      SerialCommunication_WriteBytesOf_0047
     * @tc.desc      writeBytesOf(text=" 123 ") returns [32,49,50,51,32]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WriteBytesOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0047 begin`);
      const actual: number[] = writeBytesOf(' 123 ');
      logInfo(`writeBytesOf(text=" 123 "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`writeBytesOf(text=" 123 "): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[32,49,50,51,32]');
      logInfo(`${BUNDLE}WriteBytesOf_0047 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0048
     * @tc.name      SerialCommunication_WriteBytesOf_0048
     * @tc.desc      writeBytesOf(text="123123") returns [49,50,51,49,50,51]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0048 begin`);
      const actual: number[] = writeBytesOf('123123');
      logInfo(`writeBytesOf(text="123123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`writeBytesOf(text="123123"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[49,50,51,49,50,51]');
      logInfo(`${BUNDLE}WriteBytesOf_0048 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0049
     * @tc.name      SerialCommunication_WriteBytesOf_0049
     * @tc.desc      writeBytesOf(text="123_1") returns [49,50,51,95,49]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0049 begin`);
      const actual: number[] = writeBytesOf('123_1');
      logInfo(`writeBytesOf(text="123_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`writeBytesOf(text="123_1"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[49,50,51,95,49]');
      logInfo(`${BUNDLE}WriteBytesOf_0049 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0050
     * @tc.name      SerialCommunication_WriteBytesOf_0050
     * @tc.desc      writeBytesOf(text="x123") returns [120,49,50,51]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WriteBytesOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0050 begin`);
      const actual: number[] = writeBytesOf('x123');
      logInfo(`writeBytesOf(text="x123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`writeBytesOf(text="x123"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[120,49,50,51]');
      logInfo(`${BUNDLE}WriteBytesOf_0050 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0051
     * @tc.name      SerialCommunication_WriteBytesOf_0051
     * @tc.desc      writeBytesOf(text="sAnj") returns [115,65,110,106]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0051 begin`);
      const actual: number[] = writeBytesOf('sAnj');
      logInfo(`writeBytesOf(text="sAnj"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`writeBytesOf(text="sAnj"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[115,65,110,106]');
      logInfo(`${BUNDLE}WriteBytesOf_0051 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0052
     * @tc.name      SerialCommunication_WriteBytesOf_0052
     * @tc.desc      writeBytesOf(text="9c") returns [57,99]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0052 begin`);
      const actual: number[] = writeBytesOf('9c');
      logInfo(`writeBytesOf(text="9c"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`writeBytesOf(text="9c"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[57,99]');
      logInfo(`${BUNDLE}WriteBytesOf_0052 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0053
     * @tc.name      SerialCommunication_WriteBytesOf_0053
     * @tc.desc      writeBytesOf(text="cp8Nwkcd") returns [99,112,56,78,119,107,99,100]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0053 begin`);
      const actual: number[] = writeBytesOf('cp8Nwkcd');
      logInfo(`writeBytesOf(text="cp8Nwkcd"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(8);
      logInfo(`writeBytesOf(text="cp8Nwkcd"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[99,112,56,78,119,107,99,100]');
      logInfo(`${BUNDLE}WriteBytesOf_0053 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0054
     * @tc.name      SerialCommunication_WriteBytesOf_0054
     * @tc.desc      writeBytesOf(text="fq2N17Jrp") returns [102,113,50,78,49,55,74,114,112]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0054 begin`);
      const actual: number[] = writeBytesOf('fq2N17Jrp');
      logInfo(`writeBytesOf(text="fq2N17Jrp"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(9);
      logInfo(`writeBytesOf(text="fq2N17Jrp"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[102,113,50,78,49,55,74,114,112]');
      logInfo(`${BUNDLE}WriteBytesOf_0054 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0055
     * @tc.name      SerialCommunication_WriteBytesOf_0055
     * @tc.desc      writeBytesOf(text="g2TdWe") returns [103,50,84,100,87,101]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0055 begin`);
      const actual: number[] = writeBytesOf('g2TdWe');
      logInfo(`writeBytesOf(text="g2TdWe"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`writeBytesOf(text="g2TdWe"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[103,50,84,100,87,101]');
      logInfo(`${BUNDLE}WriteBytesOf_0055 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0056
     * @tc.name      SerialCommunication_WriteBytesOf_0056
     * @tc.desc      writeBytesOf(text="r") returns [114]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0056 begin`);
      const actual: number[] = writeBytesOf('r');
      logInfo(`writeBytesOf(text="r"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`writeBytesOf(text="r"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[114]');
      logInfo(`${BUNDLE}WriteBytesOf_0056 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0057
     * @tc.name      SerialCommunication_WriteBytesOf_0057
     * @tc.desc      writeBytesOf(text="Wj5XL1ogk") returns [87,106,53,88,76,49,111,103,107]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0057 begin`);
      const actual: number[] = writeBytesOf('Wj5XL1ogk');
      logInfo(`writeBytesOf(text="Wj5XL1ogk"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(9);
      logInfo(`writeBytesOf(text="Wj5XL1ogk"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[87,106,53,88,76,49,111,103,107]');
      logInfo(`${BUNDLE}WriteBytesOf_0057 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0058
     * @tc.name      SerialCommunication_WriteBytesOf_0058
     * @tc.desc      writeBytesOf(text="Y97") returns [89,57,55]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0058 begin`);
      const actual: number[] = writeBytesOf('Y97');
      logInfo(`writeBytesOf(text="Y97"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`writeBytesOf(text="Y97"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[89,57,55]');
      logInfo(`${BUNDLE}WriteBytesOf_0058 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0059
     * @tc.name      SerialCommunication_WriteBytesOf_0059
     * @tc.desc      writeBytesOf(text="a1d3njV1Calt") returns [97,49,100,51,110,106,86,49,67,97,108,116]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0059 begin`);
      const actual: number[] = writeBytesOf('a1d3njV1Calt');
      logInfo(`writeBytesOf(text="a1d3njV1Calt"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(12);
      logInfo(`writeBytesOf(text="a1d3njV1Calt"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[97,49,100,51,110,106,86,49,67,97,108,116]');
      logInfo(`${BUNDLE}WriteBytesOf_0059 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0060
     * @tc.name      SerialCommunication_WriteBytesOf_0060
     * @tc.desc      writeBytesOf(text="NheES9") returns [78,104,101,69,83,57]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0060 begin`);
      const actual: number[] = writeBytesOf('NheES9');
      logInfo(`writeBytesOf(text="NheES9"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`writeBytesOf(text="NheES9"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[78,104,101,69,83,57]');
      logInfo(`${BUNDLE}WriteBytesOf_0060 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0061
     * @tc.name      SerialCommunication_WriteBytesOf_0061
     * @tc.desc      writeBytesOf(text="hhceUTiz2aFj") returns [104,104,99,101,85,84,105,122,50,97,70,106]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0061 begin`);
      const actual: number[] = writeBytesOf('hhceUTiz2aFj');
      logInfo(`writeBytesOf(text="hhceUTiz2aFj"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(12);
      logInfo(`writeBytesOf(text="hhceUTiz2aFj"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[104,104,99,101,85,84,105,122,50,97,70,106]');
      logInfo(`${BUNDLE}WriteBytesOf_0061 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0062
     * @tc.name      SerialCommunication_WriteBytesOf_0062
     * @tc.desc      writeBytesOf(text="LsoHP1NJCX") returns [76,115,111,72,80,49,78,74,67,88]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0062 begin`);
      const actual: number[] = writeBytesOf('LsoHP1NJCX');
      logInfo(`writeBytesOf(text="LsoHP1NJCX"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(10);
      logInfo(`writeBytesOf(text="LsoHP1NJCX"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[76,115,111,72,80,49,78,74,67,88]');
      logInfo(`${BUNDLE}WriteBytesOf_0062 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0063
     * @tc.name      SerialCommunication_WriteBytesOf_0063
     * @tc.desc      writeBytesOf(text="pEv7c") returns [112,69,118,55,99]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0063 begin`);
      const actual: number[] = writeBytesOf('pEv7c');
      logInfo(`writeBytesOf(text="pEv7c"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`writeBytesOf(text="pEv7c"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[112,69,118,55,99]');
      logInfo(`${BUNDLE}WriteBytesOf_0063 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0064
     * @tc.name      SerialCommunication_WriteBytesOf_0064
     * @tc.desc      writeBytesOf(text="ojoHTYd") returns [111,106,111,72,84,89,100]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0064 begin`);
      const actual: number[] = writeBytesOf('ojoHTYd');
      logInfo(`writeBytesOf(text="ojoHTYd"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`writeBytesOf(text="ojoHTYd"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[111,106,111,72,84,89,100]');
      logInfo(`${BUNDLE}WriteBytesOf_0064 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0065
     * @tc.name      SerialCommunication_WriteBytesOf_0065
     * @tc.desc      writeBytesOf(text="Vi") returns [86,105]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0065 begin`);
      const actual: number[] = writeBytesOf('Vi');
      logInfo(`writeBytesOf(text="Vi"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`writeBytesOf(text="Vi"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[86,105]');
      logInfo(`${BUNDLE}WriteBytesOf_0065 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0066
     * @tc.name      SerialCommunication_WriteBytesOf_0066
     * @tc.desc      writeBytesOf(text="mgm") returns [109,103,109]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0066 begin`);
      const actual: number[] = writeBytesOf('mgm');
      logInfo(`writeBytesOf(text="mgm"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`writeBytesOf(text="mgm"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[109,103,109]');
      logInfo(`${BUNDLE}WriteBytesOf_0066 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0067
     * @tc.name      SerialCommunication_WriteBytesOf_0067
     * @tc.desc      writeBytesOf(text="pS3MyD") returns [112,83,51,77,121,68]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0067 begin`);
      const actual: number[] = writeBytesOf('pS3MyD');
      logInfo(`writeBytesOf(text="pS3MyD"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`writeBytesOf(text="pS3MyD"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[112,83,51,77,121,68]');
      logInfo(`${BUNDLE}WriteBytesOf_0067 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0068
     * @tc.name      SerialCommunication_WriteBytesOf_0068
     * @tc.desc      writeBytesOf(text="Vz7bgXWCR1W") returns [86,122,55,98,103,88,87,67,82,49,87]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0068 begin`);
      const actual: number[] = writeBytesOf('Vz7bgXWCR1W');
      logInfo(`writeBytesOf(text="Vz7bgXWCR1W"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`writeBytesOf(text="Vz7bgXWCR1W"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[86,122,55,98,103,88,87,67,82,49,87]');
      logInfo(`${BUNDLE}WriteBytesOf_0068 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0069
     * @tc.name      SerialCommunication_WriteBytesOf_0069
     * @tc.desc      writeBytesOf(text="iMtKbdi") returns [105,77,116,75,98,100,105]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0069 begin`);
      const actual: number[] = writeBytesOf('iMtKbdi');
      logInfo(`writeBytesOf(text="iMtKbdi"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`writeBytesOf(text="iMtKbdi"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[105,77,116,75,98,100,105]');
      logInfo(`${BUNDLE}WriteBytesOf_0069 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0070
     * @tc.name      SerialCommunication_WriteBytesOf_0070
     * @tc.desc      writeBytesOf(text="z46B") returns [122,52,54,66]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0070 begin`);
      const actual: number[] = writeBytesOf('z46B');
      logInfo(`writeBytesOf(text="z46B"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`writeBytesOf(text="z46B"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[122,52,54,66]');
      logInfo(`${BUNDLE}WriteBytesOf_0070 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0071
     * @tc.name      SerialCommunication_WriteBytesOf_0071
     * @tc.desc      writeBytesOf(text="cHBjTSuYcN") returns [99,72,66,106,84,83,117,89,99,78]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0071 begin`);
      const actual: number[] = writeBytesOf('cHBjTSuYcN');
      logInfo(`writeBytesOf(text="cHBjTSuYcN"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(10);
      logInfo(`writeBytesOf(text="cHBjTSuYcN"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[99,72,66,106,84,83,117,89,99,78]');
      logInfo(`${BUNDLE}WriteBytesOf_0071 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0072
     * @tc.name      SerialCommunication_WriteBytesOf_0072
     * @tc.desc      writeBytesOf(text="3g8zfF") returns [51,103,56,122,102,70]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0072 begin`);
      const actual: number[] = writeBytesOf('3g8zfF');
      logInfo(`writeBytesOf(text="3g8zfF"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`writeBytesOf(text="3g8zfF"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[51,103,56,122,102,70]');
      logInfo(`${BUNDLE}WriteBytesOf_0072 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0073
     * @tc.name      SerialCommunication_WriteBytesOf_0073
     * @tc.desc      writeBytesOf(text="zQgodfu") returns [122,81,103,111,100,102,117]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0073 begin`);
      const actual: number[] = writeBytesOf('zQgodfu');
      logInfo(`writeBytesOf(text="zQgodfu"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`writeBytesOf(text="zQgodfu"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[122,81,103,111,100,102,117]');
      logInfo(`${BUNDLE}WriteBytesOf_0073 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0074
     * @tc.name      SerialCommunication_WriteBytesOf_0074
     * @tc.desc      writeBytesOf(text="hnP") returns [104,110,80]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0074 begin`);
      const actual: number[] = writeBytesOf('hnP');
      logInfo(`writeBytesOf(text="hnP"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`writeBytesOf(text="hnP"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[104,110,80]');
      logInfo(`${BUNDLE}WriteBytesOf_0074 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0075
     * @tc.name      SerialCommunication_WriteBytesOf_0075
     * @tc.desc      writeBytesOf(text="OVgApDgI1YS") returns [79,86,103,65,112,68,103,73,49,89,83]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0075 begin`);
      const actual: number[] = writeBytesOf('OVgApDgI1YS');
      logInfo(`writeBytesOf(text="OVgApDgI1YS"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`writeBytesOf(text="OVgApDgI1YS"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[79,86,103,65,112,68,103,73,49,89,83]');
      logInfo(`${BUNDLE}WriteBytesOf_0075 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0076
     * @tc.name      SerialCommunication_WriteBytesOf_0076
     * @tc.desc      writeBytesOf(text="DOHSBpWhyC") returns [68,79,72,83,66,112,87,104,121,67]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0076 begin`);
      const actual: number[] = writeBytesOf('DOHSBpWhyC');
      logInfo(`writeBytesOf(text="DOHSBpWhyC"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(10);
      logInfo(`writeBytesOf(text="DOHSBpWhyC"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[68,79,72,83,66,112,87,104,121,67]');
      logInfo(`${BUNDLE}WriteBytesOf_0076 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0077
     * @tc.name      SerialCommunication_WriteBytesOf_0077
     * @tc.desc      writeBytesOf(text="f") returns [102]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0077 begin`);
      const actual: number[] = writeBytesOf('f');
      logInfo(`writeBytesOf(text="f"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`writeBytesOf(text="f"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[102]');
      logInfo(`${BUNDLE}WriteBytesOf_0077 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0078
     * @tc.name      SerialCommunication_WriteBytesOf_0078
     * @tc.desc      writeBytesOf(text="eTml160") returns [101,84,109,108,49,54,48]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0078 begin`);
      const actual: number[] = writeBytesOf('eTml160');
      logInfo(`writeBytesOf(text="eTml160"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`writeBytesOf(text="eTml160"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[101,84,109,108,49,54,48]');
      logInfo(`${BUNDLE}WriteBytesOf_0078 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0079
     * @tc.name      SerialCommunication_WriteBytesOf_0079
     * @tc.desc      writeBytesOf(text="hMBXPEyKr7X") returns [104,77,66,88,80,69,121,75,114,55,88]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0079 begin`);
      const actual: number[] = writeBytesOf('hMBXPEyKr7X');
      logInfo(`writeBytesOf(text="hMBXPEyKr7X"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`writeBytesOf(text="hMBXPEyKr7X"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[104,77,66,88,80,69,121,75,114,55,88]');
      logInfo(`${BUNDLE}WriteBytesOf_0079 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0080
     * @tc.name      SerialCommunication_WriteBytesOf_0080
     * @tc.desc      writeBytesOf(text="ti") returns [116,105]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0080 begin`);
      const actual: number[] = writeBytesOf('ti');
      logInfo(`writeBytesOf(text="ti"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`writeBytesOf(text="ti"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[116,105]');
      logInfo(`${BUNDLE}WriteBytesOf_0080 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0081
     * @tc.name      SerialCommunication_WriteBytesOf_0081
     * @tc.desc      writeBytesOf(text="1c8HJ") returns [49,99,56,72,74]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0081 begin`);
      const actual: number[] = writeBytesOf('1c8HJ');
      logInfo(`writeBytesOf(text="1c8HJ"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`writeBytesOf(text="1c8HJ"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[49,99,56,72,74]');
      logInfo(`${BUNDLE}WriteBytesOf_0081 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0082
     * @tc.name      SerialCommunication_WriteBytesOf_0082
     * @tc.desc      writeBytesOf(text="Ma81Dm4SL") returns [77,97,56,49,68,109,52,83,76]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0082 begin`);
      const actual: number[] = writeBytesOf('Ma81Dm4SL');
      logInfo(`writeBytesOf(text="Ma81Dm4SL"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(9);
      logInfo(`writeBytesOf(text="Ma81Dm4SL"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[77,97,56,49,68,109,52,83,76]');
      logInfo(`${BUNDLE}WriteBytesOf_0082 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0083
     * @tc.name      SerialCommunication_WriteBytesOf_0083
     * @tc.desc      writeBytesOf(text="4d0mEi79fRN") returns [52,100,48,109,69,105,55,57,102,82,78]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0083 begin`);
      const actual: number[] = writeBytesOf('4d0mEi79fRN');
      logInfo(`writeBytesOf(text="4d0mEi79fRN"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`writeBytesOf(text="4d0mEi79fRN"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[52,100,48,109,69,105,55,57,102,82,78]');
      logInfo(`${BUNDLE}WriteBytesOf_0083 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0084
     * @tc.name      SerialCommunication_WriteBytesOf_0084
     * @tc.desc      writeBytesOf(text="DoWQAQvcIUw") returns [68,111,87,81,65,81,118,99,73,85,119]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0084 begin`);
      const actual: number[] = writeBytesOf('DoWQAQvcIUw');
      logInfo(`writeBytesOf(text="DoWQAQvcIUw"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(11);
      logInfo(`writeBytesOf(text="DoWQAQvcIUw"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[68,111,87,81,65,81,118,99,73,85,119]');
      logInfo(`${BUNDLE}WriteBytesOf_0084 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITE_BYTES_OF_0085
     * @tc.name      SerialCommunication_WriteBytesOf_0085
     * @tc.desc      writeBytesOf(text="eaKBgCjNu8Oz") returns [101,97,75,66,103,67,106,78,117,56,79,122]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WriteBytesOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WriteBytesOf_0085 begin`);
      const actual: number[] = writeBytesOf('eaKBgCjNu8Oz');
      logInfo(`writeBytesOf(text="eaKBgCjNu8Oz"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(12);
      logInfo(`writeBytesOf(text="eaKBgCjNu8Oz"): JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[101,97,75,66,103,67,106,78,117,56,79,122]');
      logInfo(`${BUNDLE}WriteBytesOf_0085 end`);
    });
  });
}
