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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_midiUmpParserCore]';
const DOMAIN: number = 0xF811;

function it(name: string, filter: number, func: () => void | Promise<void>): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}

interface ExpectAssert {
  assertEqual(expectValue: string | number | boolean | Object | null | undefined): void;
  assertTrue(): void;
  assertFalse(): void;
  assertLarger(expectValue: number): void;
  assertLargerOrEqual(expectValue: number): void;
  assertLess(expectValue: number): void;
  assertLessOrEqual(expectValue: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function midiUmpParserCoreTest(): void {
  describe('midiUmpParserCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0001
     * @tc.name      testExtMidiUmp0000
     * @tc.desc      UMP noteOn ch=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 144 | 0;
      const note: number = 60;
      const velocity: number = 64;
      const controller: number = 0;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(0);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0002
     * @tc.name      testExtMidiUmp0001
     * @tc.desc      UMP noteOff ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 128 | 1;
      const note: number = 64;
      const velocity: number = 127;
      const controller: number = 1;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(1);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0003
     * @tc.name      testExtMidiUmp0002
     * @tc.desc      UMP cc ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 4;
      const status: number = 176 | 2;
      const note: number = 72;
      const velocity: number = 1;
      const controller: number = 2;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(2);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0004
     * @tc.name      testExtMidiUmp0003
     * @tc.desc      UMP noteOn ch=3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 144 | 3;
      const note: number = 60;
      const velocity: number = 64;
      const controller: number = 3;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(3);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0005
     * @tc.name      testExtMidiUmp0004
     * @tc.desc      UMP noteOff ch=4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 128 | 4;
      const note: number = 64;
      const velocity: number = 127;
      const controller: number = 4;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(4);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0006
     * @tc.name      testExtMidiUmp0005
     * @tc.desc      UMP cc ch=5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 4;
      const status: number = 176 | 5;
      const note: number = 72;
      const velocity: number = 1;
      const controller: number = 5;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(5);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0007
     * @tc.name      testExtMidiUmp0006
     * @tc.desc      UMP noteOn ch=6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 144 | 6;
      const note: number = 60;
      const velocity: number = 64;
      const controller: number = 6;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(6);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0008
     * @tc.name      testExtMidiUmp0007
     * @tc.desc      UMP noteOff ch=7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 128 | 7;
      const note: number = 64;
      const velocity: number = 127;
      const controller: number = 7;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(7);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0009
     * @tc.name      testExtMidiUmp0008
     * @tc.desc      UMP cc ch=8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 4;
      const status: number = 176 | 8;
      const note: number = 72;
      const velocity: number = 1;
      const controller: number = 8;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(8);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0010
     * @tc.name      testExtMidiUmp0009
     * @tc.desc      UMP noteOn ch=9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 144 | 9;
      const note: number = 60;
      const velocity: number = 64;
      const controller: number = 9;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(9);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0011
     * @tc.name      testExtMidiUmp0010
     * @tc.desc      UMP noteOff ch=10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 128 | 10;
      const note: number = 64;
      const velocity: number = 127;
      const controller: number = 10;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(10);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0012
     * @tc.name      testExtMidiUmp0011
     * @tc.desc      UMP cc ch=11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 4;
      const status: number = 176 | 11;
      const note: number = 72;
      const velocity: number = 1;
      const controller: number = 11;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(11);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0013
     * @tc.name      testExtMidiUmp0012
     * @tc.desc      UMP noteOn ch=12.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 144 | 12;
      const note: number = 60;
      const velocity: number = 64;
      const controller: number = 12;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(12);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0014
     * @tc.name      testExtMidiUmp0013
     * @tc.desc      UMP noteOff ch=13.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 128 | 13;
      const note: number = 64;
      const velocity: number = 127;
      const controller: number = 13;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(13);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0015
     * @tc.name      testExtMidiUmp0014
     * @tc.desc      UMP cc ch=14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 4;
      const status: number = 176 | 14;
      const note: number = 72;
      const velocity: number = 1;
      const controller: number = 14;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(14);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0016
     * @tc.name      testExtMidiUmp0015
     * @tc.desc      UMP noteOn ch=15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 144 | 15;
      const note: number = 60;
      const velocity: number = 64;
      const controller: number = 15;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(15);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0017
     * @tc.name      testExtMidiUmp0016
     * @tc.desc      UMP noteOff ch=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 128 | 0;
      const note: number = 64;
      const velocity: number = 127;
      const controller: number = 16;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(0);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0018
     * @tc.name      testExtMidiUmp0017
     * @tc.desc      UMP cc ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 4;
      const status: number = 176 | 1;
      const note: number = 72;
      const velocity: number = 1;
      const controller: number = 17;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(1);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0019
     * @tc.name      testExtMidiUmp0018
     * @tc.desc      UMP noteOn ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 144 | 2;
      const note: number = 60;
      const velocity: number = 64;
      const controller: number = 18;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(2);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0020
     * @tc.name      testExtMidiUmp0019
     * @tc.desc      UMP noteOff ch=3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 128 | 3;
      const note: number = 64;
      const velocity: number = 127;
      const controller: number = 19;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(3);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0021
     * @tc.name      testExtMidiUmp0020
     * @tc.desc      UMP cc ch=4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 4;
      const status: number = 176 | 4;
      const note: number = 72;
      const velocity: number = 1;
      const controller: number = 20;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(4);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0022
     * @tc.name      testExtMidiUmp0021
     * @tc.desc      UMP noteOn ch=5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 144 | 5;
      const note: number = 60;
      const velocity: number = 64;
      const controller: number = 21;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(5);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0023
     * @tc.name      testExtMidiUmp0022
     * @tc.desc      UMP noteOff ch=6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 128 | 6;
      const note: number = 64;
      const velocity: number = 127;
      const controller: number = 22;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(6);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0024
     * @tc.name      testExtMidiUmp0023
     * @tc.desc      UMP cc ch=7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 4;
      const status: number = 176 | 7;
      const note: number = 72;
      const velocity: number = 1;
      const controller: number = 23;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(7);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0025
     * @tc.name      testExtMidiUmp0024
     * @tc.desc      UMP noteOn ch=8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 144 | 8;
      const note: number = 60;
      const velocity: number = 64;
      const controller: number = 24;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(8);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0026
     * @tc.name      testExtMidiUmp0025
     * @tc.desc      UMP noteOff ch=9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 128 | 9;
      const note: number = 64;
      const velocity: number = 127;
      const controller: number = 25;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(9);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0027
     * @tc.name      testExtMidiUmp0026
     * @tc.desc      UMP cc ch=10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 4;
      const status: number = 176 | 10;
      const note: number = 72;
      const velocity: number = 1;
      const controller: number = 26;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(10);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0028
     * @tc.name      testExtMidiUmp0027
     * @tc.desc      UMP noteOn ch=11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 144 | 11;
      const note: number = 60;
      const velocity: number = 64;
      const controller: number = 27;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(11);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0029
     * @tc.name      testExtMidiUmp0028
     * @tc.desc      UMP noteOff ch=12.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 128 | 12;
      const note: number = 64;
      const velocity: number = 127;
      const controller: number = 28;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(12);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0030
     * @tc.name      testExtMidiUmp0029
     * @tc.desc      UMP cc ch=13.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 4;
      const status: number = 176 | 13;
      const note: number = 72;
      const velocity: number = 1;
      const controller: number = 29;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(13);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0031
     * @tc.name      testExtMidiUmp0030
     * @tc.desc      UMP noteOn ch=14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 144 | 14;
      const note: number = 60;
      const velocity: number = 64;
      const controller: number = 30;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(14);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0032
     * @tc.name      testExtMidiUmp0031
     * @tc.desc      UMP noteOff ch=15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 128 | 15;
      const note: number = 64;
      const velocity: number = 127;
      const controller: number = 31;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(15);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0033
     * @tc.name      testExtMidiUmp0032
     * @tc.desc      UMP cc ch=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 4;
      const status: number = 176 | 0;
      const note: number = 72;
      const velocity: number = 1;
      const controller: number = 32;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(0);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0034
     * @tc.name      testExtMidiUmp0033
     * @tc.desc      UMP noteOn ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 144 | 1;
      const note: number = 60;
      const velocity: number = 64;
      const controller: number = 33;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(1);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0035
     * @tc.name      testExtMidiUmp0034
     * @tc.desc      UMP noteOff ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 128 | 2;
      const note: number = 64;
      const velocity: number = 127;
      const controller: number = 34;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(2);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0036
     * @tc.name      testExtMidiUmp0035
     * @tc.desc      UMP cc ch=3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 4;
      const status: number = 176 | 3;
      const note: number = 72;
      const velocity: number = 1;
      const controller: number = 35;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(3);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0037
     * @tc.name      testExtMidiUmp0036
     * @tc.desc      UMP noteOn ch=4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 144 | 4;
      const note: number = 60;
      const velocity: number = 64;
      const controller: number = 36;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(4);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0038
     * @tc.name      testExtMidiUmp0037
     * @tc.desc      UMP noteOff ch=5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 128 | 5;
      const note: number = 64;
      const velocity: number = 127;
      const controller: number = 37;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(5);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0039
     * @tc.name      testExtMidiUmp0038
     * @tc.desc      UMP cc ch=6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 4;
      const status: number = 176 | 6;
      const note: number = 72;
      const velocity: number = 1;
      const controller: number = 38;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(6);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0040
     * @tc.name      testExtMidiUmp0039
     * @tc.desc      UMP noteOn ch=7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 144 | 7;
      const note: number = 60;
      const velocity: number = 64;
      const controller: number = 39;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(7);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0041
     * @tc.name      testExtMidiUmp0040
     * @tc.desc      UMP noteOff ch=8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 128 | 8;
      const note: number = 64;
      const velocity: number = 127;
      const controller: number = 40;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(8);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0042
     * @tc.name      testExtMidiUmp0041
     * @tc.desc      UMP cc ch=9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 4;
      const status: number = 176 | 9;
      const note: number = 72;
      const velocity: number = 1;
      const controller: number = 41;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(9);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0043
     * @tc.name      testExtMidiUmp0042
     * @tc.desc      UMP noteOn ch=10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 144 | 10;
      const note: number = 60;
      const velocity: number = 64;
      const controller: number = 42;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(10);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0044
     * @tc.name      testExtMidiUmp0043
     * @tc.desc      UMP noteOff ch=11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 128 | 11;
      const note: number = 64;
      const velocity: number = 127;
      const controller: number = 43;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(11);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0045
     * @tc.name      testExtMidiUmp0044
     * @tc.desc      UMP cc ch=12.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 4;
      const status: number = 176 | 12;
      const note: number = 72;
      const velocity: number = 1;
      const controller: number = 44;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(12);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0046
     * @tc.name      testExtMidiUmp0045
     * @tc.desc      UMP noteOn ch=13.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 144 | 13;
      const note: number = 60;
      const velocity: number = 64;
      const controller: number = 45;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(13);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0047
     * @tc.name      testExtMidiUmp0046
     * @tc.desc      UMP noteOff ch=14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 128 | 14;
      const note: number = 64;
      const velocity: number = 127;
      const controller: number = 46;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(14);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0048
     * @tc.name      testExtMidiUmp0047
     * @tc.desc      UMP cc ch=15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 4;
      const status: number = 176 | 15;
      const note: number = 72;
      const velocity: number = 1;
      const controller: number = 47;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(15);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0049
     * @tc.name      testExtMidiUmp0048
     * @tc.desc      UMP noteOn ch=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 144 | 0;
      const note: number = 60;
      const velocity: number = 64;
      const controller: number = 48;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(0);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0050
     * @tc.name      testExtMidiUmp0049
     * @tc.desc      UMP noteOff ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 128 | 1;
      const note: number = 64;
      const velocity: number = 127;
      const controller: number = 49;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(1);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0051
     * @tc.name      testExtMidiUmp0050
     * @tc.desc      UMP cc ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 4;
      const status: number = 176 | 2;
      const note: number = 72;
      const velocity: number = 1;
      const controller: number = 50;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(2);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0052
     * @tc.name      testExtMidiUmp0051
     * @tc.desc      UMP noteOn ch=3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 144 | 3;
      const note: number = 60;
      const velocity: number = 64;
      const controller: number = 51;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(3);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0053
     * @tc.name      testExtMidiUmp0052
     * @tc.desc      UMP noteOff ch=4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 128 | 4;
      const note: number = 64;
      const velocity: number = 127;
      const controller: number = 52;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(4);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0054
     * @tc.name      testExtMidiUmp0053
     * @tc.desc      UMP cc ch=5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 4;
      const status: number = 176 | 5;
      const note: number = 72;
      const velocity: number = 1;
      const controller: number = 53;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(5);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0055
     * @tc.name      testExtMidiUmp0054
     * @tc.desc      UMP noteOn ch=6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 144 | 6;
      const note: number = 60;
      const velocity: number = 64;
      const controller: number = 54;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(6);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0056
     * @tc.name      testExtMidiUmp0055
     * @tc.desc      UMP noteOff ch=7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 128 | 7;
      const note: number = 64;
      const velocity: number = 127;
      const controller: number = 55;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(7);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0057
     * @tc.name      testExtMidiUmp0056
     * @tc.desc      UMP cc ch=8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 4;
      const status: number = 176 | 8;
      const note: number = 72;
      const velocity: number = 1;
      const controller: number = 56;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(8);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0058
     * @tc.name      testExtMidiUmp0057
     * @tc.desc      UMP noteOn ch=9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 144 | 9;
      const note: number = 60;
      const velocity: number = 64;
      const controller: number = 57;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(9);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0059
     * @tc.name      testExtMidiUmp0058
     * @tc.desc      UMP noteOff ch=10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 128 | 10;
      const note: number = 64;
      const velocity: number = 127;
      const controller: number = 58;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(10);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0060
     * @tc.name      testExtMidiUmp0059
     * @tc.desc      UMP cc ch=11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 4;
      const status: number = 176 | 11;
      const note: number = 72;
      const velocity: number = 1;
      const controller: number = 59;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(11);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0061
     * @tc.name      testExtMidiUmp0060
     * @tc.desc      UMP noteOn ch=12.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 144 | 12;
      const note: number = 60;
      const velocity: number = 64;
      const controller: number = 60;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(12);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0062
     * @tc.name      testExtMidiUmp0061
     * @tc.desc      UMP noteOff ch=13.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 128 | 13;
      const note: number = 64;
      const velocity: number = 127;
      const controller: number = 61;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(13);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0063
     * @tc.name      testExtMidiUmp0062
     * @tc.desc      UMP cc ch=14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 4;
      const status: number = 176 | 14;
      const note: number = 72;
      const velocity: number = 1;
      const controller: number = 62;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(14);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0064
     * @tc.name      testExtMidiUmp0063
     * @tc.desc      UMP noteOn ch=15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 144 | 15;
      const note: number = 60;
      const velocity: number = 64;
      const controller: number = 63;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(15);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0065
     * @tc.name      testExtMidiUmp0064
     * @tc.desc      UMP noteOff ch=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 128 | 0;
      const note: number = 64;
      const velocity: number = 127;
      const controller: number = 64;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(0);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0066
     * @tc.name      testExtMidiUmp0065
     * @tc.desc      UMP cc ch=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 4;
      const status: number = 176 | 1;
      const note: number = 72;
      const velocity: number = 1;
      const controller: number = 65;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(1);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0067
     * @tc.name      testExtMidiUmp0066
     * @tc.desc      UMP noteOn ch=2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 144 | 2;
      const note: number = 60;
      const velocity: number = 64;
      const controller: number = 66;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(2);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0068
     * @tc.name      testExtMidiUmp0067
     * @tc.desc      UMP noteOff ch=3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 128 | 3;
      const note: number = 64;
      const velocity: number = 127;
      const controller: number = 67;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(3);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0069
     * @tc.name      testExtMidiUmp0068
     * @tc.desc      UMP cc ch=4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 4;
      const status: number = 176 | 4;
      const note: number = 72;
      const velocity: number = 1;
      const controller: number = 68;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(4);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0070
     * @tc.name      testExtMidiUmp0069
     * @tc.desc      UMP noteOn ch=5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 144 | 5;
      const note: number = 60;
      const velocity: number = 64;
      const controller: number = 69;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(5);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0071
     * @tc.name      testExtMidiUmp0070
     * @tc.desc      UMP noteOff ch=6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 128 | 6;
      const note: number = 64;
      const velocity: number = 127;
      const controller: number = 70;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(6);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0072
     * @tc.name      testExtMidiUmp0071
     * @tc.desc      UMP cc ch=7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 4;
      const status: number = 176 | 7;
      const note: number = 72;
      const velocity: number = 1;
      const controller: number = 71;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(7);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0073
     * @tc.name      testExtMidiUmp0072
     * @tc.desc      UMP noteOn ch=8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 144 | 8;
      const note: number = 60;
      const velocity: number = 64;
      const controller: number = 72;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(8);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0074
     * @tc.name      testExtMidiUmp0073
     * @tc.desc      UMP noteOff ch=9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 128 | 9;
      const note: number = 64;
      const velocity: number = 127;
      const controller: number = 73;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(9);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0075
     * @tc.name      testExtMidiUmp0074
     * @tc.desc      UMP cc ch=10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 4;
      const status: number = 176 | 10;
      const note: number = 72;
      const velocity: number = 1;
      const controller: number = 74;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(10);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0076
     * @tc.name      testExtMidiUmp0075
     * @tc.desc      UMP noteOn ch=11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 144 | 11;
      const note: number = 60;
      const velocity: number = 64;
      const controller: number = 75;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(11);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0077
     * @tc.name      testExtMidiUmp0076
     * @tc.desc      UMP noteOff ch=12.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 128 | 12;
      const note: number = 64;
      const velocity: number = 127;
      const controller: number = 76;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(12);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0078
     * @tc.name      testExtMidiUmp0077
     * @tc.desc      UMP cc ch=13.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 4;
      const status: number = 176 | 13;
      const note: number = 72;
      const velocity: number = 1;
      const controller: number = 77;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(13);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0079
     * @tc.name      testExtMidiUmp0078
     * @tc.desc      UMP noteOn ch=14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 144 | 14;
      const note: number = 60;
      const velocity: number = 64;
      const controller: number = 78;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(14);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_UMP_0080
     * @tc.name      testExtMidiUmp0079
     * @tc.desc      UMP noteOff ch=15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiUmp0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const messageType: number = 2;
      const status: number = 128 | 15;
      const note: number = 64;
      const velocity: number = 127;
      const controller: number = 79;
      const data: number[] = [status, note, velocity, messageType];
      expect(data[0]).assertEqual(status);
      expect(data[0] & 0x0F).assertEqual(15);
      expect(data[1]).assertLargerOrEqual(0);
      expect(data[2]).assertLargerOrEqual(0);
      expect(controller).assertLessOrEqual(127);
    })
  });
}
