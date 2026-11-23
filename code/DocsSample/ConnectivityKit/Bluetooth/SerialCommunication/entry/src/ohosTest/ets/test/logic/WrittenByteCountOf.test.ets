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
import { writtenByteCountOf } from '../model/SppSerialLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SerialCommunication]';
const BUNDLE: string = 'SerialCommunication_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for writtenByteCountOf (90 cases). */
export default function writtenByteCountOfTest(): void {
  describe('WrittenByteCountOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0001
     * @tc.name      SerialCommunication_WrittenByteCountOf_0001
     * @tc.desc      writtenByteCountOf(text="Hello") returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_WrittenByteCountOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0001 begin`);
      const actual: number = writtenByteCountOf('Hello');
      logInfo(`writtenByteCountOf(text="Hello"): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}WrittenByteCountOf_0001 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0002
     * @tc.name      SerialCommunication_WrittenByteCountOf_0002
     * @tc.desc      writtenByteCountOf(text="hello world") returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_WrittenByteCountOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0002 begin`);
      const actual: number = writtenByteCountOf('hello world');
      logInfo(`writtenByteCountOf(text="hello world"): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}WrittenByteCountOf_0002 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0003
     * @tc.name      SerialCommunication_WrittenByteCountOf_0003
     * @tc.desc      writtenByteCountOf(text="") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WrittenByteCountOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0003 begin`);
      const actual: number = writtenByteCountOf('');
      logInfo(`writtenByteCountOf(text=""): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}WrittenByteCountOf_0003 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0004
     * @tc.name      SerialCommunication_WrittenByteCountOf_0004
     * @tc.desc      writtenByteCountOf(text=" ") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0004 begin`);
      const actual: number = writtenByteCountOf(' ');
      logInfo(`writtenByteCountOf(text=" "): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}WrittenByteCountOf_0004 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0005
     * @tc.name      SerialCommunication_WrittenByteCountOf_0005
     * @tc.desc      writtenByteCountOf(text="Sample Title 123") returns 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0005 begin`);
      const actual: number = writtenByteCountOf('Sample Title 123');
      logInfo(`writtenByteCountOf(text="Sample Title 123"): actual=${actual}`);
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}WrittenByteCountOf_0005 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0006
     * @tc.name      SerialCommunication_WrittenByteCountOf_0006
     * @tc.desc      writtenByteCountOf(text="abc") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0006 begin`);
      const actual: number = writtenByteCountOf('abc');
      logInfo(`writtenByteCountOf(text="abc"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}WrittenByteCountOf_0006 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0007
     * @tc.name      SerialCommunication_WrittenByteCountOf_0007
     * @tc.desc      writtenByteCountOf(text=" Hello ") returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WrittenByteCountOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0007 begin`);
      const actual: number = writtenByteCountOf(' Hello ');
      logInfo(`writtenByteCountOf(text=" Hello "): actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}WrittenByteCountOf_0007 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0008
     * @tc.name      SerialCommunication_WrittenByteCountOf_0008
     * @tc.desc      writtenByteCountOf(text="HelloHello") returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0008 begin`);
      const actual: number = writtenByteCountOf('HelloHello');
      logInfo(`writtenByteCountOf(text="HelloHello"): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}WrittenByteCountOf_0008 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0009
     * @tc.name      SerialCommunication_WrittenByteCountOf_0009
     * @tc.desc      writtenByteCountOf(text="xHello") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WrittenByteCountOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0009 begin`);
      const actual: number = writtenByteCountOf('xHello');
      logInfo(`writtenByteCountOf(text="xHello"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}WrittenByteCountOf_0009 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0010
     * @tc.name      SerialCommunication_WrittenByteCountOf_0010
     * @tc.desc      writtenByteCountOf(text=" hello world ") returns 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WrittenByteCountOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0010 begin`);
      const actual: number = writtenByteCountOf(' hello world ');
      logInfo(`writtenByteCountOf(text=" hello world "): actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}WrittenByteCountOf_0010 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0011
     * @tc.name      SerialCommunication_WrittenByteCountOf_0011
     * @tc.desc      writtenByteCountOf(text="hello worldhello world") returns 22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0011 begin`);
      const actual: number = writtenByteCountOf('hello worldhello world');
      logInfo(`writtenByteCountOf(text="hello worldhello...: actual=${actual}`);
      expect(actual).assertEqual(22);
      logInfo(`${BUNDLE}WrittenByteCountOf_0011 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0012
     * @tc.name      SerialCommunication_WrittenByteCountOf_0012
     * @tc.desc      writtenByteCountOf(text="xhello world") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WrittenByteCountOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0012 begin`);
      const actual: number = writtenByteCountOf('xhello world');
      logInfo(`writtenByteCountOf(text="xhello world"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}WrittenByteCountOf_0012 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0013
     * @tc.name      SerialCommunication_WrittenByteCountOf_0013
     * @tc.desc      writtenByteCountOf(text="  ") returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0013 begin`);
      const actual: number = writtenByteCountOf('  ');
      logInfo(`writtenByteCountOf(text="  "): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}WrittenByteCountOf_0013 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0014
     * @tc.name      SerialCommunication_WrittenByteCountOf_0014
     * @tc.desc      writtenByteCountOf(text=" Sample Title 123 ") returns 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WrittenByteCountOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0014 begin`);
      const actual: number = writtenByteCountOf(' Sample Title 123 ');
      logInfo(`writtenByteCountOf(text=" Sample Title 12...: actual=${actual}`);
      expect(actual).assertEqual(18);
      logInfo(`${BUNDLE}WrittenByteCountOf_0014 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0015
     * @tc.name      SerialCommunication_WrittenByteCountOf_0015
     * @tc.desc      writtenByteCountOf(text="Sample Title 123Sample Title 123") returns 32
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0015 begin`);
      const actual: number = writtenByteCountOf('Sample Title 123Sample Title 123');
      logInfo(`writtenByteCountOf(text="Sample Title 123...: actual=${actual}`);
      expect(actual).assertEqual(32);
      logInfo(`${BUNDLE}WrittenByteCountOf_0015 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0016
     * @tc.name      SerialCommunication_WrittenByteCountOf_0016
     * @tc.desc      writtenByteCountOf(text="xSample Title 123") returns 17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WrittenByteCountOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0016 begin`);
      const actual: number = writtenByteCountOf('xSample Title 123');
      logInfo(`writtenByteCountOf(text="xSample Title 123"): actual=${actual}`);
      expect(actual).assertEqual(17);
      logInfo(`${BUNDLE}WrittenByteCountOf_0016 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0017
     * @tc.name      SerialCommunication_WrittenByteCountOf_0017
     * @tc.desc      writtenByteCountOf(text=" ?? ") returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WrittenByteCountOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0017 begin`);
      const actual: number = writtenByteCountOf(' \u4e2d\u6587 ');
      logInfo(`writtenByteCountOf(text=" ?? "): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}WrittenByteCountOf_0017 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0018
     * @tc.name      SerialCommunication_WrittenByteCountOf_0018
     * @tc.desc      writtenByteCountOf(text="Bv1yGPExE") returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0018 begin`);
      const actual: number = writtenByteCountOf('Bv1yGPExE');
      logInfo(`writtenByteCountOf(text="Bv1yGPExE"): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}WrittenByteCountOf_0018 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0019
     * @tc.name      SerialCommunication_WrittenByteCountOf_0019
     * @tc.desc      writtenByteCountOf(text="7HHH3KC7") returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0019 begin`);
      const actual: number = writtenByteCountOf('7HHH3KC7');
      logInfo(`writtenByteCountOf(text="7HHH3KC7"): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}WrittenByteCountOf_0019 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0020
     * @tc.name      SerialCommunication_WrittenByteCountOf_0020
     * @tc.desc      writtenByteCountOf(text="A") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0020 begin`);
      const actual: number = writtenByteCountOf('A');
      logInfo(`writtenByteCountOf(text="A"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}WrittenByteCountOf_0020 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0021
     * @tc.name      SerialCommunication_WrittenByteCountOf_0021
     * @tc.desc      writtenByteCountOf(text="??") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0021 begin`);
      const actual: number = writtenByteCountOf('\u4e2d\u6587');
      logInfo(`writtenByteCountOf(text="??"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}WrittenByteCountOf_0021 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0022
     * @tc.name      SerialCommunication_WrittenByteCountOf_0022
     * @tc.desc      writtenByteCountOf(text="a") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0022 begin`);
      const actual: number = writtenByteCountOf('a');
      logInfo(`writtenByteCountOf(text="a"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}WrittenByteCountOf_0022 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0023
     * @tc.name      SerialCommunication_WrittenByteCountOf_0023
     * @tc.desc      writtenByteCountOf(text="Hello World") returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0023 begin`);
      const actual: number = writtenByteCountOf('Hello World');
      logInfo(`writtenByteCountOf(text="Hello World"): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}WrittenByteCountOf_0023 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0024
     * @tc.name      SerialCommunication_WrittenByteCountOf_0024
     * @tc.desc      writtenByteCountOf(text="123") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0024 begin`);
      const actual: number = writtenByteCountOf('123');
      logInfo(`writtenByteCountOf(text="123"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}WrittenByteCountOf_0024 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0025
     * @tc.name      SerialCommunication_WrittenByteCountOf_0025
     * @tc.desc      writtenByteCountOf(text="Hello_1") returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0025 begin`);
      const actual: number = writtenByteCountOf('Hello_1');
      logInfo(`writtenByteCountOf(text="Hello_1"): actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}WrittenByteCountOf_0025 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0026
     * @tc.name      SerialCommunication_WrittenByteCountOf_0026
     * @tc.desc      writtenByteCountOf(text="hello world_1") returns 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0026 begin`);
      const actual: number = writtenByteCountOf('hello world_1');
      logInfo(`writtenByteCountOf(text="hello world_1"): actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}WrittenByteCountOf_0026 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0027
     * @tc.name      SerialCommunication_WrittenByteCountOf_0027
     * @tc.desc      writtenByteCountOf(text="   ") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WrittenByteCountOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0027 begin`);
      const actual: number = writtenByteCountOf('   ');
      logInfo(`writtenByteCountOf(text="   "): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}WrittenByteCountOf_0027 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0028
     * @tc.name      SerialCommunication_WrittenByteCountOf_0028
     * @tc.desc      writtenByteCountOf(text=" _1") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0028 begin`);
      const actual: number = writtenByteCountOf(' _1');
      logInfo(`writtenByteCountOf(text=" _1"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}WrittenByteCountOf_0028 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0029
     * @tc.name      SerialCommunication_WrittenByteCountOf_0029
     * @tc.desc      writtenByteCountOf(text="x ") returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WrittenByteCountOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0029 begin`);
      const actual: number = writtenByteCountOf('x ');
      logInfo(`writtenByteCountOf(text="x "): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}WrittenByteCountOf_0029 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0030
     * @tc.name      SerialCommunication_WrittenByteCountOf_0030
     * @tc.desc      writtenByteCountOf(text=" A ") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WrittenByteCountOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0030 begin`);
      const actual: number = writtenByteCountOf(' A ');
      logInfo(`writtenByteCountOf(text=" A "): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}WrittenByteCountOf_0030 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0031
     * @tc.name      SerialCommunication_WrittenByteCountOf_0031
     * @tc.desc      writtenByteCountOf(text="AA") returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0031 begin`);
      const actual: number = writtenByteCountOf('AA');
      logInfo(`writtenByteCountOf(text="AA"): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}WrittenByteCountOf_0031 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0032
     * @tc.name      SerialCommunication_WrittenByteCountOf_0032
     * @tc.desc      writtenByteCountOf(text="A_1") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0032 begin`);
      const actual: number = writtenByteCountOf('A_1');
      logInfo(`writtenByteCountOf(text="A_1"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}WrittenByteCountOf_0032 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0033
     * @tc.name      SerialCommunication_WrittenByteCountOf_0033
     * @tc.desc      writtenByteCountOf(text="xA") returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WrittenByteCountOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0033 begin`);
      const actual: number = writtenByteCountOf('xA');
      logInfo(`writtenByteCountOf(text="xA"): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}WrittenByteCountOf_0033 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0034
     * @tc.name      SerialCommunication_WrittenByteCountOf_0034
     * @tc.desc      writtenByteCountOf(text="Sample Title 123_1") returns 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0034 begin`);
      const actual: number = writtenByteCountOf('Sample Title 123_1');
      logInfo(`writtenByteCountOf(text="Sample Title 123...: actual=${actual}`);
      expect(actual).assertEqual(18);
      logInfo(`${BUNDLE}WrittenByteCountOf_0034 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0035
     * @tc.name      SerialCommunication_WrittenByteCountOf_0035
     * @tc.desc      writtenByteCountOf(text="????") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0035 begin`);
      const actual: number = writtenByteCountOf('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`writtenByteCountOf(text="????"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}WrittenByteCountOf_0035 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0036
     * @tc.name      SerialCommunication_WrittenByteCountOf_0036
     * @tc.desc      writtenByteCountOf(text="??_1") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0036 begin`);
      const actual: number = writtenByteCountOf('\u4e2d\u6587_1');
      logInfo(`writtenByteCountOf(text="??_1"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}WrittenByteCountOf_0036 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0037
     * @tc.name      SerialCommunication_WrittenByteCountOf_0037
     * @tc.desc      writtenByteCountOf(text="x??") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WrittenByteCountOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0037 begin`);
      const actual: number = writtenByteCountOf('x\u4e2d\u6587');
      logInfo(`writtenByteCountOf(text="x??"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}WrittenByteCountOf_0037 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0038
     * @tc.name      SerialCommunication_WrittenByteCountOf_0038
     * @tc.desc      writtenByteCountOf(text=" a ") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WrittenByteCountOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0038 begin`);
      const actual: number = writtenByteCountOf(' a ');
      logInfo(`writtenByteCountOf(text=" a "): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}WrittenByteCountOf_0038 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0039
     * @tc.name      SerialCommunication_WrittenByteCountOf_0039
     * @tc.desc      writtenByteCountOf(text="aa") returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0039 begin`);
      const actual: number = writtenByteCountOf('aa');
      logInfo(`writtenByteCountOf(text="aa"): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}WrittenByteCountOf_0039 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0040
     * @tc.name      SerialCommunication_WrittenByteCountOf_0040
     * @tc.desc      writtenByteCountOf(text="a_1") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0040 begin`);
      const actual: number = writtenByteCountOf('a_1');
      logInfo(`writtenByteCountOf(text="a_1"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}WrittenByteCountOf_0040 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0041
     * @tc.name      SerialCommunication_WrittenByteCountOf_0041
     * @tc.desc      writtenByteCountOf(text="xa") returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WrittenByteCountOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0041 begin`);
      const actual: number = writtenByteCountOf('xa');
      logInfo(`writtenByteCountOf(text="xa"): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}WrittenByteCountOf_0041 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0042
     * @tc.name      SerialCommunication_WrittenByteCountOf_0042
     * @tc.desc      writtenByteCountOf(text=" abc ") returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WrittenByteCountOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0042 begin`);
      const actual: number = writtenByteCountOf(' abc ');
      logInfo(`writtenByteCountOf(text=" abc "): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}WrittenByteCountOf_0042 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0043
     * @tc.name      SerialCommunication_WrittenByteCountOf_0043
     * @tc.desc      writtenByteCountOf(text="abcabc") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0043 begin`);
      const actual: number = writtenByteCountOf('abcabc');
      logInfo(`writtenByteCountOf(text="abcabc"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}WrittenByteCountOf_0043 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0044
     * @tc.name      SerialCommunication_WrittenByteCountOf_0044
     * @tc.desc      writtenByteCountOf(text="abc_1") returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0044 begin`);
      const actual: number = writtenByteCountOf('abc_1');
      logInfo(`writtenByteCountOf(text="abc_1"): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}WrittenByteCountOf_0044 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0045
     * @tc.name      SerialCommunication_WrittenByteCountOf_0045
     * @tc.desc      writtenByteCountOf(text="xabc") returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WrittenByteCountOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0045 begin`);
      const actual: number = writtenByteCountOf('xabc');
      logInfo(`writtenByteCountOf(text="xabc"): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}WrittenByteCountOf_0045 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0046
     * @tc.name      SerialCommunication_WrittenByteCountOf_0046
     * @tc.desc      writtenByteCountOf(text=" Hello World ") returns 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WrittenByteCountOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0046 begin`);
      const actual: number = writtenByteCountOf(' Hello World ');
      logInfo(`writtenByteCountOf(text=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}WrittenByteCountOf_0046 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0047
     * @tc.name      SerialCommunication_WrittenByteCountOf_0047
     * @tc.desc      writtenByteCountOf(text="Hello WorldHello World") returns 22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0047 begin`);
      const actual: number = writtenByteCountOf('Hello WorldHello World');
      logInfo(`writtenByteCountOf(text="Hello WorldHello...: actual=${actual}`);
      expect(actual).assertEqual(22);
      logInfo(`${BUNDLE}WrittenByteCountOf_0047 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0048
     * @tc.name      SerialCommunication_WrittenByteCountOf_0048
     * @tc.desc      writtenByteCountOf(text="Hello World_1") returns 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0048 begin`);
      const actual: number = writtenByteCountOf('Hello World_1');
      logInfo(`writtenByteCountOf(text="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}WrittenByteCountOf_0048 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0049
     * @tc.name      SerialCommunication_WrittenByteCountOf_0049
     * @tc.desc      writtenByteCountOf(text="xHello World") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WrittenByteCountOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0049 begin`);
      const actual: number = writtenByteCountOf('xHello World');
      logInfo(`writtenByteCountOf(text="xHello World"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}WrittenByteCountOf_0049 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0050
     * @tc.name      SerialCommunication_WrittenByteCountOf_0050
     * @tc.desc      writtenByteCountOf(text=" 123 ") returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WrittenByteCountOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0050 begin`);
      const actual: number = writtenByteCountOf(' 123 ');
      logInfo(`writtenByteCountOf(text=" 123 "): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}WrittenByteCountOf_0050 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0051
     * @tc.name      SerialCommunication_WrittenByteCountOf_0051
     * @tc.desc      writtenByteCountOf(text="123123") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0051 begin`);
      const actual: number = writtenByteCountOf('123123');
      logInfo(`writtenByteCountOf(text="123123"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}WrittenByteCountOf_0051 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0052
     * @tc.name      SerialCommunication_WrittenByteCountOf_0052
     * @tc.desc      writtenByteCountOf(text="123_1") returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0052 begin`);
      const actual: number = writtenByteCountOf('123_1');
      logInfo(`writtenByteCountOf(text="123_1"): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}WrittenByteCountOf_0052 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0053
     * @tc.name      SerialCommunication_WrittenByteCountOf_0053
     * @tc.desc      writtenByteCountOf(text="x123") returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_WrittenByteCountOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0053 begin`);
      const actual: number = writtenByteCountOf('x123');
      logInfo(`writtenByteCountOf(text="x123"): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}WrittenByteCountOf_0053 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0054
     * @tc.name      SerialCommunication_WrittenByteCountOf_0054
     * @tc.desc      writtenByteCountOf(text="X") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0054 begin`);
      const actual: number = writtenByteCountOf('X');
      logInfo(`writtenByteCountOf(text="X"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}WrittenByteCountOf_0054 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0055
     * @tc.name      SerialCommunication_WrittenByteCountOf_0055
     * @tc.desc      writtenByteCountOf(text="jmCg2JH91Z") returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0055 begin`);
      const actual: number = writtenByteCountOf('jmCg2JH91Z');
      logInfo(`writtenByteCountOf(text="jmCg2JH91Z"): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}WrittenByteCountOf_0055 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0056
     * @tc.name      SerialCommunication_WrittenByteCountOf_0056
     * @tc.desc      writtenByteCountOf(text="OZdhPlprvNL") returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0056 begin`);
      const actual: number = writtenByteCountOf('OZdhPlprvNL');
      logInfo(`writtenByteCountOf(text="OZdhPlprvNL"): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}WrittenByteCountOf_0056 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0057
     * @tc.name      SerialCommunication_WrittenByteCountOf_0057
     * @tc.desc      writtenByteCountOf(text="8l1gmU") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0057 begin`);
      const actual: number = writtenByteCountOf('8l1gmU');
      logInfo(`writtenByteCountOf(text="8l1gmU"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}WrittenByteCountOf_0057 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0058
     * @tc.name      SerialCommunication_WrittenByteCountOf_0058
     * @tc.desc      writtenByteCountOf(text="5") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0058 begin`);
      const actual: number = writtenByteCountOf('5');
      logInfo(`writtenByteCountOf(text="5"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}WrittenByteCountOf_0058 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0059
     * @tc.name      SerialCommunication_WrittenByteCountOf_0059
     * @tc.desc      writtenByteCountOf(text="GjkczyD") returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0059 begin`);
      const actual: number = writtenByteCountOf('GjkczyD');
      logInfo(`writtenByteCountOf(text="GjkczyD"): actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}WrittenByteCountOf_0059 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0060
     * @tc.name      SerialCommunication_WrittenByteCountOf_0060
     * @tc.desc      writtenByteCountOf(text="1HS8") returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0060 begin`);
      const actual: number = writtenByteCountOf('1HS8');
      logInfo(`writtenByteCountOf(text="1HS8"): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}WrittenByteCountOf_0060 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0061
     * @tc.name      SerialCommunication_WrittenByteCountOf_0061
     * @tc.desc      writtenByteCountOf(text="czQVICWcX") returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0061 begin`);
      const actual: number = writtenByteCountOf('czQVICWcX');
      logInfo(`writtenByteCountOf(text="czQVICWcX"): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}WrittenByteCountOf_0061 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0062
     * @tc.name      SerialCommunication_WrittenByteCountOf_0062
     * @tc.desc      writtenByteCountOf(text="q1k99") returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0062 begin`);
      const actual: number = writtenByteCountOf('q1k99');
      logInfo(`writtenByteCountOf(text="q1k99"): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}WrittenByteCountOf_0062 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0063
     * @tc.name      SerialCommunication_WrittenByteCountOf_0063
     * @tc.desc      writtenByteCountOf(text="02KnhW") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0063 begin`);
      const actual: number = writtenByteCountOf('02KnhW');
      logInfo(`writtenByteCountOf(text="02KnhW"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}WrittenByteCountOf_0063 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0064
     * @tc.name      SerialCommunication_WrittenByteCountOf_0064
     * @tc.desc      writtenByteCountOf(text="AQfW3sC7SYR") returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0064 begin`);
      const actual: number = writtenByteCountOf('AQfW3sC7SYR');
      logInfo(`writtenByteCountOf(text="AQfW3sC7SYR"): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}WrittenByteCountOf_0064 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0065
     * @tc.name      SerialCommunication_WrittenByteCountOf_0065
     * @tc.desc      writtenByteCountOf(text="Mjd5naDsN") returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0065 begin`);
      const actual: number = writtenByteCountOf('Mjd5naDsN');
      logInfo(`writtenByteCountOf(text="Mjd5naDsN"): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}WrittenByteCountOf_0065 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0066
     * @tc.name      SerialCommunication_WrittenByteCountOf_0066
     * @tc.desc      writtenByteCountOf(text="Aa1JO7py") returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0066 begin`);
      const actual: number = writtenByteCountOf('Aa1JO7py');
      logInfo(`writtenByteCountOf(text="Aa1JO7py"): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}WrittenByteCountOf_0066 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0067
     * @tc.name      SerialCommunication_WrittenByteCountOf_0067
     * @tc.desc      writtenByteCountOf(text="Y3sKV9HSDcIN") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0067 begin`);
      const actual: number = writtenByteCountOf('Y3sKV9HSDcIN');
      logInfo(`writtenByteCountOf(text="Y3sKV9HSDcIN"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}WrittenByteCountOf_0067 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0068
     * @tc.name      SerialCommunication_WrittenByteCountOf_0068
     * @tc.desc      writtenByteCountOf(text="v6l25W48i") returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0068 begin`);
      const actual: number = writtenByteCountOf('v6l25W48i');
      logInfo(`writtenByteCountOf(text="v6l25W48i"): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}WrittenByteCountOf_0068 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0069
     * @tc.name      SerialCommunication_WrittenByteCountOf_0069
     * @tc.desc      writtenByteCountOf(text="J6ROuRoR7H") returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0069 begin`);
      const actual: number = writtenByteCountOf('J6ROuRoR7H');
      logInfo(`writtenByteCountOf(text="J6ROuRoR7H"): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}WrittenByteCountOf_0069 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0070
     * @tc.name      SerialCommunication_WrittenByteCountOf_0070
     * @tc.desc      writtenByteCountOf(text="lYjeoEawl") returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0070 begin`);
      const actual: number = writtenByteCountOf('lYjeoEawl');
      logInfo(`writtenByteCountOf(text="lYjeoEawl"): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}WrittenByteCountOf_0070 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0071
     * @tc.name      SerialCommunication_WrittenByteCountOf_0071
     * @tc.desc      writtenByteCountOf(text="IRKC5oF") returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0071 begin`);
      const actual: number = writtenByteCountOf('IRKC5oF');
      logInfo(`writtenByteCountOf(text="IRKC5oF"): actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}WrittenByteCountOf_0071 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0072
     * @tc.name      SerialCommunication_WrittenByteCountOf_0072
     * @tc.desc      writtenByteCountOf(text="q") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0072 begin`);
      const actual: number = writtenByteCountOf('q');
      logInfo(`writtenByteCountOf(text="q"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}WrittenByteCountOf_0072 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0073
     * @tc.name      SerialCommunication_WrittenByteCountOf_0073
     * @tc.desc      writtenByteCountOf(text="DW") returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0073 begin`);
      const actual: number = writtenByteCountOf('DW');
      logInfo(`writtenByteCountOf(text="DW"): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}WrittenByteCountOf_0073 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0074
     * @tc.name      SerialCommunication_WrittenByteCountOf_0074
     * @tc.desc      writtenByteCountOf(text="PjvEDi") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0074 begin`);
      const actual: number = writtenByteCountOf('PjvEDi');
      logInfo(`writtenByteCountOf(text="PjvEDi"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}WrittenByteCountOf_0074 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0075
     * @tc.name      SerialCommunication_WrittenByteCountOf_0075
     * @tc.desc      writtenByteCountOf(text="CTY9MS") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0075 begin`);
      const actual: number = writtenByteCountOf('CTY9MS');
      logInfo(`writtenByteCountOf(text="CTY9MS"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}WrittenByteCountOf_0075 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0076
     * @tc.name      SerialCommunication_WrittenByteCountOf_0076
     * @tc.desc      writtenByteCountOf(text="RhnB") returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0076 begin`);
      const actual: number = writtenByteCountOf('RhnB');
      logInfo(`writtenByteCountOf(text="RhnB"): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}WrittenByteCountOf_0076 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0077
     * @tc.name      SerialCommunication_WrittenByteCountOf_0077
     * @tc.desc      writtenByteCountOf(text="Ax4eQ") returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0077 begin`);
      const actual: number = writtenByteCountOf('Ax4eQ');
      logInfo(`writtenByteCountOf(text="Ax4eQ"): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}WrittenByteCountOf_0077 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0078
     * @tc.name      SerialCommunication_WrittenByteCountOf_0078
     * @tc.desc      writtenByteCountOf(text="i8NLdZjxd") returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0078 begin`);
      const actual: number = writtenByteCountOf('i8NLdZjxd');
      logInfo(`writtenByteCountOf(text="i8NLdZjxd"): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}WrittenByteCountOf_0078 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0079
     * @tc.name      SerialCommunication_WrittenByteCountOf_0079
     * @tc.desc      writtenByteCountOf(text="ZG0bIAThs") returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0079 begin`);
      const actual: number = writtenByteCountOf('ZG0bIAThs');
      logInfo(`writtenByteCountOf(text="ZG0bIAThs"): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}WrittenByteCountOf_0079 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0080
     * @tc.name      SerialCommunication_WrittenByteCountOf_0080
     * @tc.desc      writtenByteCountOf(text="3tiIDtSj6fUG") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0080 begin`);
      const actual: number = writtenByteCountOf('3tiIDtSj6fUG');
      logInfo(`writtenByteCountOf(text="3tiIDtSj6fUG"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}WrittenByteCountOf_0080 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0081
     * @tc.name      SerialCommunication_WrittenByteCountOf_0081
     * @tc.desc      writtenByteCountOf(text="6") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0081 begin`);
      const actual: number = writtenByteCountOf('6');
      logInfo(`writtenByteCountOf(text="6"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}WrittenByteCountOf_0081 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0082
     * @tc.name      SerialCommunication_WrittenByteCountOf_0082
     * @tc.desc      writtenByteCountOf(text="vgFs1XKuv") returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0082 begin`);
      const actual: number = writtenByteCountOf('vgFs1XKuv');
      logInfo(`writtenByteCountOf(text="vgFs1XKuv"): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}WrittenByteCountOf_0082 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0083
     * @tc.name      SerialCommunication_WrittenByteCountOf_0083
     * @tc.desc      writtenByteCountOf(text="S6md") returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0083 begin`);
      const actual: number = writtenByteCountOf('S6md');
      logInfo(`writtenByteCountOf(text="S6md"): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}WrittenByteCountOf_0083 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0084
     * @tc.name      SerialCommunication_WrittenByteCountOf_0084
     * @tc.desc      writtenByteCountOf(text="WDse6EZ") returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0084 begin`);
      const actual: number = writtenByteCountOf('WDse6EZ');
      logInfo(`writtenByteCountOf(text="WDse6EZ"): actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}WrittenByteCountOf_0084 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0085
     * @tc.name      SerialCommunication_WrittenByteCountOf_0085
     * @tc.desc      writtenByteCountOf(text="jJjYRUrR") returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0085 begin`);
      const actual: number = writtenByteCountOf('jJjYRUrR');
      logInfo(`writtenByteCountOf(text="jJjYRUrR"): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}WrittenByteCountOf_0085 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0086
     * @tc.name      SerialCommunication_WrittenByteCountOf_0086
     * @tc.desc      writtenByteCountOf(text="zB4") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0086 begin`);
      const actual: number = writtenByteCountOf('zB4');
      logInfo(`writtenByteCountOf(text="zB4"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}WrittenByteCountOf_0086 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0087
     * @tc.name      SerialCommunication_WrittenByteCountOf_0087
     * @tc.desc      writtenByteCountOf(text="1mN") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0087 begin`);
      const actual: number = writtenByteCountOf('1mN');
      logInfo(`writtenByteCountOf(text="1mN"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}WrittenByteCountOf_0087 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0088
     * @tc.name      SerialCommunication_WrittenByteCountOf_0088
     * @tc.desc      writtenByteCountOf(text="QhMbTdii") returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0088 begin`);
      const actual: number = writtenByteCountOf('QhMbTdii');
      logInfo(`writtenByteCountOf(text="QhMbTdii"): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}WrittenByteCountOf_0088 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0089
     * @tc.name      SerialCommunication_WrittenByteCountOf_0089
     * @tc.desc      writtenByteCountOf(text="EaJ") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0089 begin`);
      const actual: number = writtenByteCountOf('EaJ');
      logInfo(`writtenByteCountOf(text="EaJ"): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}WrittenByteCountOf_0089 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_WRITTEN_BYTE_COUNT_OF_0090
     * @tc.name      SerialCommunication_WrittenByteCountOf_0090
     * @tc.desc      writtenByteCountOf(text="fwoZWSrt") returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_WrittenByteCountOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}WrittenByteCountOf_0090 begin`);
      const actual: number = writtenByteCountOf('fwoZWSrt');
      logInfo(`writtenByteCountOf(text="fwoZWSrt"): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}WrittenByteCountOf_0090 end`);
    });
  });
}
