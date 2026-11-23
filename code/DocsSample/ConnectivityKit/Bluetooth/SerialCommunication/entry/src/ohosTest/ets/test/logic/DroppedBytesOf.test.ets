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
import { droppedBytesOf } from '../model/SppSerialLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SerialCommunication]';
const BUNDLE: string = 'SerialCommunication_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for droppedBytesOf (90 cases). */
export default function droppedBytesOfTest(): void {
  describe('DroppedBytesOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0001
     * @tc.name      SerialCommunication_DroppedBytesOf_0001
     * @tc.desc      droppedBytesOf(text="Hello") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_DroppedBytesOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0001 begin`);
      const actual: number = droppedBytesOf('Hello');
      logInfo(`droppedBytesOf(text="Hello"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0001 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0002
     * @tc.name      SerialCommunication_DroppedBytesOf_0002
     * @tc.desc      droppedBytesOf(text="??") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_DroppedBytesOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0002 begin`);
      const actual: number = droppedBytesOf('\u4e2d\u6587');
      logInfo(`droppedBytesOf(text="??"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}DroppedBytesOf_0002 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0003
     * @tc.name      SerialCommunication_DroppedBytesOf_0003
     * @tc.desc      droppedBytesOf(text=" ?? ") returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_DroppedBytesOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0003 begin`);
      const actual: number = droppedBytesOf(' \u4e2d\u6587 ');
      logInfo(`droppedBytesOf(text=" ?? "): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}DroppedBytesOf_0003 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0004
     * @tc.name      SerialCommunication_DroppedBytesOf_0004
     * @tc.desc      droppedBytesOf(text="????") returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0004 begin`);
      const actual: number = droppedBytesOf('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`droppedBytesOf(text="????"): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}DroppedBytesOf_0004 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0005
     * @tc.name      SerialCommunication_DroppedBytesOf_0005
     * @tc.desc      droppedBytesOf(text="??_1") returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0005 begin`);
      const actual: number = droppedBytesOf('\u4e2d\u6587_1');
      logInfo(`droppedBytesOf(text="??_1"): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}DroppedBytesOf_0005 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0006
     * @tc.name      SerialCommunication_DroppedBytesOf_0006
     * @tc.desc      droppedBytesOf(text="hello world") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0006 begin`);
      const actual: number = droppedBytesOf('hello world');
      logInfo(`droppedBytesOf(text="hello world"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0006 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0007
     * @tc.name      SerialCommunication_DroppedBytesOf_0007
     * @tc.desc      droppedBytesOf(text="") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_DroppedBytesOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0007 begin`);
      const actual: number = droppedBytesOf('');
      logInfo(`droppedBytesOf(text=""): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0007 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0008
     * @tc.name      SerialCommunication_DroppedBytesOf_0008
     * @tc.desc      droppedBytesOf(text=" ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0008 begin`);
      const actual: number = droppedBytesOf(' ');
      logInfo(`droppedBytesOf(text=" "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0008 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0009
     * @tc.name      SerialCommunication_DroppedBytesOf_0009
     * @tc.desc      droppedBytesOf(text="A") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0009 begin`);
      const actual: number = droppedBytesOf('A');
      logInfo(`droppedBytesOf(text="A"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0009 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0010
     * @tc.name      SerialCommunication_DroppedBytesOf_0010
     * @tc.desc      droppedBytesOf(text="Sample Title 123") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0010 begin`);
      const actual: number = droppedBytesOf('Sample Title 123');
      logInfo(`droppedBytesOf(text="Sample Title 123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0010 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0011
     * @tc.name      SerialCommunication_DroppedBytesOf_0011
     * @tc.desc      droppedBytesOf(text="a") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0011 begin`);
      const actual: number = droppedBytesOf('a');
      logInfo(`droppedBytesOf(text="a"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0011 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0012
     * @tc.name      SerialCommunication_DroppedBytesOf_0012
     * @tc.desc      droppedBytesOf(text="abc") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0012 begin`);
      const actual: number = droppedBytesOf('abc');
      logInfo(`droppedBytesOf(text="abc"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0012 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0013
     * @tc.name      SerialCommunication_DroppedBytesOf_0013
     * @tc.desc      droppedBytesOf(text="Hello World") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0013 begin`);
      const actual: number = droppedBytesOf('Hello World');
      logInfo(`droppedBytesOf(text="Hello World"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0013 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0014
     * @tc.name      SerialCommunication_DroppedBytesOf_0014
     * @tc.desc      droppedBytesOf(text="123") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0014 begin`);
      const actual: number = droppedBytesOf('123');
      logInfo(`droppedBytesOf(text="123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0014 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0015
     * @tc.name      SerialCommunication_DroppedBytesOf_0015
     * @tc.desc      droppedBytesOf(text=" Hello ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_DroppedBytesOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0015 begin`);
      const actual: number = droppedBytesOf(' Hello ');
      logInfo(`droppedBytesOf(text=" Hello "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0015 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0016
     * @tc.name      SerialCommunication_DroppedBytesOf_0016
     * @tc.desc      droppedBytesOf(text="HelloHello") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0016 begin`);
      const actual: number = droppedBytesOf('HelloHello');
      logInfo(`droppedBytesOf(text="HelloHello"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0016 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0017
     * @tc.name      SerialCommunication_DroppedBytesOf_0017
     * @tc.desc      droppedBytesOf(text="Hello_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0017 begin`);
      const actual: number = droppedBytesOf('Hello_1');
      logInfo(`droppedBytesOf(text="Hello_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0017 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0018
     * @tc.name      SerialCommunication_DroppedBytesOf_0018
     * @tc.desc      droppedBytesOf(text="xHello") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_DroppedBytesOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0018 begin`);
      const actual: number = droppedBytesOf('xHello');
      logInfo(`droppedBytesOf(text="xHello"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0018 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0019
     * @tc.name      SerialCommunication_DroppedBytesOf_0019
     * @tc.desc      droppedBytesOf(text=" hello world ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_DroppedBytesOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0019 begin`);
      const actual: number = droppedBytesOf(' hello world ');
      logInfo(`droppedBytesOf(text=" hello world "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0019 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0020
     * @tc.name      SerialCommunication_DroppedBytesOf_0020
     * @tc.desc      droppedBytesOf(text="hello worldhello world") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0020 begin`);
      const actual: number = droppedBytesOf('hello worldhello world');
      logInfo(`droppedBytesOf(text="hello worldhello wor...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0020 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0021
     * @tc.name      SerialCommunication_DroppedBytesOf_0021
     * @tc.desc      droppedBytesOf(text="hello world_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0021 begin`);
      const actual: number = droppedBytesOf('hello world_1');
      logInfo(`droppedBytesOf(text="hello world_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0021 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0022
     * @tc.name      SerialCommunication_DroppedBytesOf_0022
     * @tc.desc      droppedBytesOf(text="xhello world") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_DroppedBytesOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0022 begin`);
      const actual: number = droppedBytesOf('xhello world');
      logInfo(`droppedBytesOf(text="xhello world"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0022 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0023
     * @tc.name      SerialCommunication_DroppedBytesOf_0023
     * @tc.desc      droppedBytesOf(text="   ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_DroppedBytesOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0023 begin`);
      const actual: number = droppedBytesOf('   ');
      logInfo(`droppedBytesOf(text="   "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0023 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0024
     * @tc.name      SerialCommunication_DroppedBytesOf_0024
     * @tc.desc      droppedBytesOf(text="  ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0024 begin`);
      const actual: number = droppedBytesOf('  ');
      logInfo(`droppedBytesOf(text="  "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0024 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0025
     * @tc.name      SerialCommunication_DroppedBytesOf_0025
     * @tc.desc      droppedBytesOf(text=" _1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0025 begin`);
      const actual: number = droppedBytesOf(' _1');
      logInfo(`droppedBytesOf(text=" _1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0025 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0026
     * @tc.name      SerialCommunication_DroppedBytesOf_0026
     * @tc.desc      droppedBytesOf(text="x ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_DroppedBytesOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0026 begin`);
      const actual: number = droppedBytesOf('x ');
      logInfo(`droppedBytesOf(text="x "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0026 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0027
     * @tc.name      SerialCommunication_DroppedBytesOf_0027
     * @tc.desc      droppedBytesOf(text=" A ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_DroppedBytesOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0027 begin`);
      const actual: number = droppedBytesOf(' A ');
      logInfo(`droppedBytesOf(text=" A "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0027 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0028
     * @tc.name      SerialCommunication_DroppedBytesOf_0028
     * @tc.desc      droppedBytesOf(text="AA") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0028 begin`);
      const actual: number = droppedBytesOf('AA');
      logInfo(`droppedBytesOf(text="AA"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0028 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0029
     * @tc.name      SerialCommunication_DroppedBytesOf_0029
     * @tc.desc      droppedBytesOf(text="A_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0029 begin`);
      const actual: number = droppedBytesOf('A_1');
      logInfo(`droppedBytesOf(text="A_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0029 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0030
     * @tc.name      SerialCommunication_DroppedBytesOf_0030
     * @tc.desc      droppedBytesOf(text="xA") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_DroppedBytesOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0030 begin`);
      const actual: number = droppedBytesOf('xA');
      logInfo(`droppedBytesOf(text="xA"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0030 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0031
     * @tc.name      SerialCommunication_DroppedBytesOf_0031
     * @tc.desc      droppedBytesOf(text=" Sample Title 123 ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_DroppedBytesOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0031 begin`);
      const actual: number = droppedBytesOf(' Sample Title 123 ');
      logInfo(`droppedBytesOf(text=" Sample Title 123 "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0031 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0032
     * @tc.name      SerialCommunication_DroppedBytesOf_0032
     * @tc.desc      droppedBytesOf(text="Sample Title 123Sample Title 123") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0032 begin`);
      const actual: number = droppedBytesOf('Sample Title 123Sample Title 123');
      logInfo(`droppedBytesOf(text="Sample Title 123Samp...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0032 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0033
     * @tc.name      SerialCommunication_DroppedBytesOf_0033
     * @tc.desc      droppedBytesOf(text="Sample Title 123_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0033 begin`);
      const actual: number = droppedBytesOf('Sample Title 123_1');
      logInfo(`droppedBytesOf(text="Sample Title 123_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0033 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0034
     * @tc.name      SerialCommunication_DroppedBytesOf_0034
     * @tc.desc      droppedBytesOf(text="xSample Title 123") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_DroppedBytesOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0034 begin`);
      const actual: number = droppedBytesOf('xSample Title 123');
      logInfo(`droppedBytesOf(text="xSample Title 123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0034 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0035
     * @tc.name      SerialCommunication_DroppedBytesOf_0035
     * @tc.desc      droppedBytesOf(text="x??") returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_DroppedBytesOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0035 begin`);
      const actual: number = droppedBytesOf('x\u4e2d\u6587');
      logInfo(`droppedBytesOf(text="x??"): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}DroppedBytesOf_0035 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0036
     * @tc.name      SerialCommunication_DroppedBytesOf_0036
     * @tc.desc      droppedBytesOf(text=" a ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_DroppedBytesOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0036 begin`);
      const actual: number = droppedBytesOf(' a ');
      logInfo(`droppedBytesOf(text=" a "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0036 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0037
     * @tc.name      SerialCommunication_DroppedBytesOf_0037
     * @tc.desc      droppedBytesOf(text="aa") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0037 begin`);
      const actual: number = droppedBytesOf('aa');
      logInfo(`droppedBytesOf(text="aa"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0037 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0038
     * @tc.name      SerialCommunication_DroppedBytesOf_0038
     * @tc.desc      droppedBytesOf(text="a_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0038 begin`);
      const actual: number = droppedBytesOf('a_1');
      logInfo(`droppedBytesOf(text="a_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0038 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0039
     * @tc.name      SerialCommunication_DroppedBytesOf_0039
     * @tc.desc      droppedBytesOf(text="xa") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_DroppedBytesOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0039 begin`);
      const actual: number = droppedBytesOf('xa');
      logInfo(`droppedBytesOf(text="xa"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0039 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0040
     * @tc.name      SerialCommunication_DroppedBytesOf_0040
     * @tc.desc      droppedBytesOf(text=" abc ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_DroppedBytesOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0040 begin`);
      const actual: number = droppedBytesOf(' abc ');
      logInfo(`droppedBytesOf(text=" abc "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0040 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0041
     * @tc.name      SerialCommunication_DroppedBytesOf_0041
     * @tc.desc      droppedBytesOf(text="abcabc") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0041 begin`);
      const actual: number = droppedBytesOf('abcabc');
      logInfo(`droppedBytesOf(text="abcabc"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0041 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0042
     * @tc.name      SerialCommunication_DroppedBytesOf_0042
     * @tc.desc      droppedBytesOf(text="abc_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0042 begin`);
      const actual: number = droppedBytesOf('abc_1');
      logInfo(`droppedBytesOf(text="abc_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0042 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0043
     * @tc.name      SerialCommunication_DroppedBytesOf_0043
     * @tc.desc      droppedBytesOf(text="xabc") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_DroppedBytesOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0043 begin`);
      const actual: number = droppedBytesOf('xabc');
      logInfo(`droppedBytesOf(text="xabc"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0043 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0044
     * @tc.name      SerialCommunication_DroppedBytesOf_0044
     * @tc.desc      droppedBytesOf(text=" Hello World ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_DroppedBytesOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0044 begin`);
      const actual: number = droppedBytesOf(' Hello World ');
      logInfo(`droppedBytesOf(text=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0044 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0045
     * @tc.name      SerialCommunication_DroppedBytesOf_0045
     * @tc.desc      droppedBytesOf(text="Hello WorldHello World") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0045 begin`);
      const actual: number = droppedBytesOf('Hello WorldHello World');
      logInfo(`droppedBytesOf(text="Hello WorldHello Wor...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0045 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0046
     * @tc.name      SerialCommunication_DroppedBytesOf_0046
     * @tc.desc      droppedBytesOf(text="Hello World_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0046 begin`);
      const actual: number = droppedBytesOf('Hello World_1');
      logInfo(`droppedBytesOf(text="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0046 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0047
     * @tc.name      SerialCommunication_DroppedBytesOf_0047
     * @tc.desc      droppedBytesOf(text="xHello World") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_DroppedBytesOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0047 begin`);
      const actual: number = droppedBytesOf('xHello World');
      logInfo(`droppedBytesOf(text="xHello World"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0047 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0048
     * @tc.name      SerialCommunication_DroppedBytesOf_0048
     * @tc.desc      droppedBytesOf(text=" 123 ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_DroppedBytesOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0048 begin`);
      const actual: number = droppedBytesOf(' 123 ');
      logInfo(`droppedBytesOf(text=" 123 "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0048 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0049
     * @tc.name      SerialCommunication_DroppedBytesOf_0049
     * @tc.desc      droppedBytesOf(text="123123") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0049 begin`);
      const actual: number = droppedBytesOf('123123');
      logInfo(`droppedBytesOf(text="123123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0049 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0050
     * @tc.name      SerialCommunication_DroppedBytesOf_0050
     * @tc.desc      droppedBytesOf(text="123_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0050 begin`);
      const actual: number = droppedBytesOf('123_1');
      logInfo(`droppedBytesOf(text="123_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0050 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0051
     * @tc.name      SerialCommunication_DroppedBytesOf_0051
     * @tc.desc      droppedBytesOf(text="x123") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SerialCommunication_DroppedBytesOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0051 begin`);
      const actual: number = droppedBytesOf('x123');
      logInfo(`droppedBytesOf(text="x123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0051 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0052
     * @tc.name      SerialCommunication_DroppedBytesOf_0052
     * @tc.desc      droppedBytesOf(text="N") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0052 begin`);
      const actual: number = droppedBytesOf('N');
      logInfo(`droppedBytesOf(text="N"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0052 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0053
     * @tc.name      SerialCommunication_DroppedBytesOf_0053
     * @tc.desc      droppedBytesOf(text="M6R") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0053 begin`);
      const actual: number = droppedBytesOf('M6R');
      logInfo(`droppedBytesOf(text="M6R"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0053 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0054
     * @tc.name      SerialCommunication_DroppedBytesOf_0054
     * @tc.desc      droppedBytesOf(text="1EO4fIvjgJ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0054 begin`);
      const actual: number = droppedBytesOf('1EO4fIvjgJ');
      logInfo(`droppedBytesOf(text="1EO4fIvjgJ"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0054 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0055
     * @tc.name      SerialCommunication_DroppedBytesOf_0055
     * @tc.desc      droppedBytesOf(text="5G") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0055 begin`);
      const actual: number = droppedBytesOf('5G');
      logInfo(`droppedBytesOf(text="5G"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0055 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0056
     * @tc.name      SerialCommunication_DroppedBytesOf_0056
     * @tc.desc      droppedBytesOf(text="sn05pN1NS") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0056 begin`);
      const actual: number = droppedBytesOf('sn05pN1NS');
      logInfo(`droppedBytesOf(text="sn05pN1NS"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0056 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0057
     * @tc.name      SerialCommunication_DroppedBytesOf_0057
     * @tc.desc      droppedBytesOf(text="nSajYPiQ6scX") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0057 begin`);
      const actual: number = droppedBytesOf('nSajYPiQ6scX');
      logInfo(`droppedBytesOf(text="nSajYPiQ6scX"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0057 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0058
     * @tc.name      SerialCommunication_DroppedBytesOf_0058
     * @tc.desc      droppedBytesOf(text="aVifQ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0058 begin`);
      const actual: number = droppedBytesOf('aVifQ');
      logInfo(`droppedBytesOf(text="aVifQ"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0058 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0059
     * @tc.name      SerialCommunication_DroppedBytesOf_0059
     * @tc.desc      droppedBytesOf(text="G1SD9Gbs1Hry") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0059 begin`);
      const actual: number = droppedBytesOf('G1SD9Gbs1Hry');
      logInfo(`droppedBytesOf(text="G1SD9Gbs1Hry"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0059 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0060
     * @tc.name      SerialCommunication_DroppedBytesOf_0060
     * @tc.desc      droppedBytesOf(text="DJnLOz") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0060 begin`);
      const actual: number = droppedBytesOf('DJnLOz');
      logInfo(`droppedBytesOf(text="DJnLOz"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0060 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0061
     * @tc.name      SerialCommunication_DroppedBytesOf_0061
     * @tc.desc      droppedBytesOf(text="sUCK5") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0061 begin`);
      const actual: number = droppedBytesOf('sUCK5');
      logInfo(`droppedBytesOf(text="sUCK5"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0061 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0062
     * @tc.name      SerialCommunication_DroppedBytesOf_0062
     * @tc.desc      droppedBytesOf(text="BX") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0062 begin`);
      const actual: number = droppedBytesOf('BX');
      logInfo(`droppedBytesOf(text="BX"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0062 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0063
     * @tc.name      SerialCommunication_DroppedBytesOf_0063
     * @tc.desc      droppedBytesOf(text="EilJF") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0063 begin`);
      const actual: number = droppedBytesOf('EilJF');
      logInfo(`droppedBytesOf(text="EilJF"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0063 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0064
     * @tc.name      SerialCommunication_DroppedBytesOf_0064
     * @tc.desc      droppedBytesOf(text="q") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0064 begin`);
      const actual: number = droppedBytesOf('q');
      logInfo(`droppedBytesOf(text="q"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0064 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0065
     * @tc.name      SerialCommunication_DroppedBytesOf_0065
     * @tc.desc      droppedBytesOf(text="OePMvCwHdC") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0065 begin`);
      const actual: number = droppedBytesOf('OePMvCwHdC');
      logInfo(`droppedBytesOf(text="OePMvCwHdC"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0065 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0066
     * @tc.name      SerialCommunication_DroppedBytesOf_0066
     * @tc.desc      droppedBytesOf(text="Anjy3qQXugYR") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0066 begin`);
      const actual: number = droppedBytesOf('Anjy3qQXugYR');
      logInfo(`droppedBytesOf(text="Anjy3qQXugYR"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0066 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0067
     * @tc.name      SerialCommunication_DroppedBytesOf_0067
     * @tc.desc      droppedBytesOf(text="g9cFO") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0067 begin`);
      const actual: number = droppedBytesOf('g9cFO');
      logInfo(`droppedBytesOf(text="g9cFO"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0067 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0068
     * @tc.name      SerialCommunication_DroppedBytesOf_0068
     * @tc.desc      droppedBytesOf(text="DI") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0068 begin`);
      const actual: number = droppedBytesOf('DI');
      logInfo(`droppedBytesOf(text="DI"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0068 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0069
     * @tc.name      SerialCommunication_DroppedBytesOf_0069
     * @tc.desc      droppedBytesOf(text="t") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0069 begin`);
      const actual: number = droppedBytesOf('t');
      logInfo(`droppedBytesOf(text="t"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0069 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0070
     * @tc.name      SerialCommunication_DroppedBytesOf_0070
     * @tc.desc      droppedBytesOf(text="JGAZ9yU") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0070 begin`);
      const actual: number = droppedBytesOf('JGAZ9yU');
      logInfo(`droppedBytesOf(text="JGAZ9yU"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0070 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0071
     * @tc.name      SerialCommunication_DroppedBytesOf_0071
     * @tc.desc      droppedBytesOf(text="ui") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0071 begin`);
      const actual: number = droppedBytesOf('ui');
      logInfo(`droppedBytesOf(text="ui"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0071 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0072
     * @tc.name      SerialCommunication_DroppedBytesOf_0072
     * @tc.desc      droppedBytesOf(text="fWSri") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0072 begin`);
      const actual: number = droppedBytesOf('fWSri');
      logInfo(`droppedBytesOf(text="fWSri"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0072 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0073
     * @tc.name      SerialCommunication_DroppedBytesOf_0073
     * @tc.desc      droppedBytesOf(text="GnPKCoiGCtW") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0073 begin`);
      const actual: number = droppedBytesOf('GnPKCoiGCtW');
      logInfo(`droppedBytesOf(text="GnPKCoiGCtW"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0073 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0074
     * @tc.name      SerialCommunication_DroppedBytesOf_0074
     * @tc.desc      droppedBytesOf(text="o") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0074 begin`);
      const actual: number = droppedBytesOf('o');
      logInfo(`droppedBytesOf(text="o"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0074 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0075
     * @tc.name      SerialCommunication_DroppedBytesOf_0075
     * @tc.desc      droppedBytesOf(text="QrHZ0lk6imn") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0075 begin`);
      const actual: number = droppedBytesOf('QrHZ0lk6imn');
      logInfo(`droppedBytesOf(text="QrHZ0lk6imn"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0075 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0076
     * @tc.name      SerialCommunication_DroppedBytesOf_0076
     * @tc.desc      droppedBytesOf(text="YEnj") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0076 begin`);
      const actual: number = droppedBytesOf('YEnj');
      logInfo(`droppedBytesOf(text="YEnj"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0076 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0077
     * @tc.name      SerialCommunication_DroppedBytesOf_0077
     * @tc.desc      droppedBytesOf(text="tYF") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0077 begin`);
      const actual: number = droppedBytesOf('tYF');
      logInfo(`droppedBytesOf(text="tYF"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0077 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0078
     * @tc.name      SerialCommunication_DroppedBytesOf_0078
     * @tc.desc      droppedBytesOf(text="CdKlEOBas2Y") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0078 begin`);
      const actual: number = droppedBytesOf('CdKlEOBas2Y');
      logInfo(`droppedBytesOf(text="CdKlEOBas2Y"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0078 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0079
     * @tc.name      SerialCommunication_DroppedBytesOf_0079
     * @tc.desc      droppedBytesOf(text="99sO2") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0079 begin`);
      const actual: number = droppedBytesOf('99sO2');
      logInfo(`droppedBytesOf(text="99sO2"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0079 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0080
     * @tc.name      SerialCommunication_DroppedBytesOf_0080
     * @tc.desc      droppedBytesOf(text="qtEXzCu") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0080 begin`);
      const actual: number = droppedBytesOf('qtEXzCu');
      logInfo(`droppedBytesOf(text="qtEXzCu"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0080 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0081
     * @tc.name      SerialCommunication_DroppedBytesOf_0081
     * @tc.desc      droppedBytesOf(text="vbG4p0ZGf5") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0081 begin`);
      const actual: number = droppedBytesOf('vbG4p0ZGf5');
      logInfo(`droppedBytesOf(text="vbG4p0ZGf5"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0081 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0082
     * @tc.name      SerialCommunication_DroppedBytesOf_0082
     * @tc.desc      droppedBytesOf(text="qoSQSWu") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0082 begin`);
      const actual: number = droppedBytesOf('qoSQSWu');
      logInfo(`droppedBytesOf(text="qoSQSWu"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0082 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0083
     * @tc.name      SerialCommunication_DroppedBytesOf_0083
     * @tc.desc      droppedBytesOf(text="modZFk") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0083 begin`);
      const actual: number = droppedBytesOf('modZFk');
      logInfo(`droppedBytesOf(text="modZFk"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0083 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0084
     * @tc.name      SerialCommunication_DroppedBytesOf_0084
     * @tc.desc      droppedBytesOf(text="BFz3n") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0084 begin`);
      const actual: number = droppedBytesOf('BFz3n');
      logInfo(`droppedBytesOf(text="BFz3n"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0084 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0085
     * @tc.name      SerialCommunication_DroppedBytesOf_0085
     * @tc.desc      droppedBytesOf(text="U6R59Obh8Z") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0085 begin`);
      const actual: number = droppedBytesOf('U6R59Obh8Z');
      logInfo(`droppedBytesOf(text="U6R59Obh8Z"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0085 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0086
     * @tc.name      SerialCommunication_DroppedBytesOf_0086
     * @tc.desc      droppedBytesOf(text="Bfi") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0086 begin`);
      const actual: number = droppedBytesOf('Bfi');
      logInfo(`droppedBytesOf(text="Bfi"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0086 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0087
     * @tc.name      SerialCommunication_DroppedBytesOf_0087
     * @tc.desc      droppedBytesOf(text="lS0Q") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0087 begin`);
      const actual: number = droppedBytesOf('lS0Q');
      logInfo(`droppedBytesOf(text="lS0Q"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0087 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0088
     * @tc.name      SerialCommunication_DroppedBytesOf_0088
     * @tc.desc      droppedBytesOf(text="uzOGDb5") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0088 begin`);
      const actual: number = droppedBytesOf('uzOGDb5');
      logInfo(`droppedBytesOf(text="uzOGDb5"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0088 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0089
     * @tc.name      SerialCommunication_DroppedBytesOf_0089
     * @tc.desc      droppedBytesOf(text="sJU") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0089 begin`);
      const actual: number = droppedBytesOf('sJU');
      logInfo(`droppedBytesOf(text="sJU"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0089 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_DROPPED_BYTES_OF_0090
     * @tc.name      SerialCommunication_DroppedBytesOf_0090
     * @tc.desc      droppedBytesOf(text="ZT0XK") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_DroppedBytesOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DroppedBytesOf_0090 begin`);
      const actual: number = droppedBytesOf('ZT0XK');
      logInfo(`droppedBytesOf(text="ZT0XK"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}DroppedBytesOf_0090 end`);
    });
  });
}
