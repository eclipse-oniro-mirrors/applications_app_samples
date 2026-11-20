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

const TAG: string = '[Sample_midiDataByteBoundaryCore]';
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

export default function midiDataByteBoundaryCoreTest(): void {
  describe('midiDataByteBoundaryCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0001
     * @tc.name      testExtMidiBound0000
     * @tc.desc      Data boundary ch=0 byte=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 0;
      const dataByte: number = 0;
      const status: number = 128 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0002
     * @tc.name      testExtMidiBound0001
     * @tc.desc      Data boundary ch=1 byte=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 1;
      const dataByte: number = 1;
      const status: number = 144 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0003
     * @tc.name      testExtMidiBound0002
     * @tc.desc      Data boundary ch=2 byte=63.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 2;
      const dataByte: number = 63;
      const status: number = 176 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0004
     * @tc.name      testExtMidiBound0003
     * @tc.desc      Data boundary ch=3 byte=64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 3;
      const dataByte: number = 64;
      const status: number = 192 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0005
     * @tc.name      testExtMidiBound0004
     * @tc.desc      Data boundary ch=4 byte=126.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 4;
      const dataByte: number = 126;
      const status: number = 224 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0006
     * @tc.name      testExtMidiBound0005
     * @tc.desc      Data boundary ch=5 byte=127.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 5;
      const dataByte: number = 127;
      const status: number = 128 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0007
     * @tc.name      testExtMidiBound0006
     * @tc.desc      Data boundary ch=6 byte=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 6;
      const dataByte: number = 0;
      const status: number = 144 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0008
     * @tc.name      testExtMidiBound0007
     * @tc.desc      Data boundary ch=7 byte=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 7;
      const dataByte: number = 1;
      const status: number = 176 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0009
     * @tc.name      testExtMidiBound0008
     * @tc.desc      Data boundary ch=8 byte=63.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 8;
      const dataByte: number = 63;
      const status: number = 192 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0010
     * @tc.name      testExtMidiBound0009
     * @tc.desc      Data boundary ch=9 byte=64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 9;
      const dataByte: number = 64;
      const status: number = 224 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0011
     * @tc.name      testExtMidiBound0010
     * @tc.desc      Data boundary ch=10 byte=126.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 10;
      const dataByte: number = 126;
      const status: number = 128 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0012
     * @tc.name      testExtMidiBound0011
     * @tc.desc      Data boundary ch=11 byte=127.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 11;
      const dataByte: number = 127;
      const status: number = 144 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0013
     * @tc.name      testExtMidiBound0012
     * @tc.desc      Data boundary ch=12 byte=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 12;
      const dataByte: number = 0;
      const status: number = 176 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0014
     * @tc.name      testExtMidiBound0013
     * @tc.desc      Data boundary ch=13 byte=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 13;
      const dataByte: number = 1;
      const status: number = 192 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0015
     * @tc.name      testExtMidiBound0014
     * @tc.desc      Data boundary ch=14 byte=63.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 14;
      const dataByte: number = 63;
      const status: number = 224 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0016
     * @tc.name      testExtMidiBound0015
     * @tc.desc      Data boundary ch=15 byte=64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 15;
      const dataByte: number = 64;
      const status: number = 128 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0017
     * @tc.name      testExtMidiBound0016
     * @tc.desc      Data boundary ch=0 byte=126.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 0;
      const dataByte: number = 126;
      const status: number = 144 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0018
     * @tc.name      testExtMidiBound0017
     * @tc.desc      Data boundary ch=1 byte=127.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 1;
      const dataByte: number = 127;
      const status: number = 176 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0019
     * @tc.name      testExtMidiBound0018
     * @tc.desc      Data boundary ch=2 byte=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 2;
      const dataByte: number = 0;
      const status: number = 192 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0020
     * @tc.name      testExtMidiBound0019
     * @tc.desc      Data boundary ch=3 byte=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 3;
      const dataByte: number = 1;
      const status: number = 224 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0021
     * @tc.name      testExtMidiBound0020
     * @tc.desc      Data boundary ch=4 byte=63.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 4;
      const dataByte: number = 63;
      const status: number = 128 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0022
     * @tc.name      testExtMidiBound0021
     * @tc.desc      Data boundary ch=5 byte=64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 5;
      const dataByte: number = 64;
      const status: number = 144 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0023
     * @tc.name      testExtMidiBound0022
     * @tc.desc      Data boundary ch=6 byte=126.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 6;
      const dataByte: number = 126;
      const status: number = 176 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0024
     * @tc.name      testExtMidiBound0023
     * @tc.desc      Data boundary ch=7 byte=127.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 7;
      const dataByte: number = 127;
      const status: number = 192 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0025
     * @tc.name      testExtMidiBound0024
     * @tc.desc      Data boundary ch=8 byte=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 8;
      const dataByte: number = 0;
      const status: number = 224 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0026
     * @tc.name      testExtMidiBound0025
     * @tc.desc      Data boundary ch=9 byte=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 9;
      const dataByte: number = 1;
      const status: number = 128 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0027
     * @tc.name      testExtMidiBound0026
     * @tc.desc      Data boundary ch=10 byte=63.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 10;
      const dataByte: number = 63;
      const status: number = 144 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0028
     * @tc.name      testExtMidiBound0027
     * @tc.desc      Data boundary ch=11 byte=64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 11;
      const dataByte: number = 64;
      const status: number = 176 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0029
     * @tc.name      testExtMidiBound0028
     * @tc.desc      Data boundary ch=12 byte=126.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 12;
      const dataByte: number = 126;
      const status: number = 192 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0030
     * @tc.name      testExtMidiBound0029
     * @tc.desc      Data boundary ch=13 byte=127.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 13;
      const dataByte: number = 127;
      const status: number = 224 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0031
     * @tc.name      testExtMidiBound0030
     * @tc.desc      Data boundary ch=14 byte=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 14;
      const dataByte: number = 0;
      const status: number = 128 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0032
     * @tc.name      testExtMidiBound0031
     * @tc.desc      Data boundary ch=15 byte=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 15;
      const dataByte: number = 1;
      const status: number = 144 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0033
     * @tc.name      testExtMidiBound0032
     * @tc.desc      Data boundary ch=0 byte=63.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 0;
      const dataByte: number = 63;
      const status: number = 176 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0034
     * @tc.name      testExtMidiBound0033
     * @tc.desc      Data boundary ch=1 byte=64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 1;
      const dataByte: number = 64;
      const status: number = 192 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0035
     * @tc.name      testExtMidiBound0034
     * @tc.desc      Data boundary ch=2 byte=126.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 2;
      const dataByte: number = 126;
      const status: number = 224 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0036
     * @tc.name      testExtMidiBound0035
     * @tc.desc      Data boundary ch=3 byte=127.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 3;
      const dataByte: number = 127;
      const status: number = 128 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0037
     * @tc.name      testExtMidiBound0036
     * @tc.desc      Data boundary ch=4 byte=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 4;
      const dataByte: number = 0;
      const status: number = 144 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0038
     * @tc.name      testExtMidiBound0037
     * @tc.desc      Data boundary ch=5 byte=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 5;
      const dataByte: number = 1;
      const status: number = 176 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0039
     * @tc.name      testExtMidiBound0038
     * @tc.desc      Data boundary ch=6 byte=63.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 6;
      const dataByte: number = 63;
      const status: number = 192 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0040
     * @tc.name      testExtMidiBound0039
     * @tc.desc      Data boundary ch=7 byte=64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 7;
      const dataByte: number = 64;
      const status: number = 224 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0041
     * @tc.name      testExtMidiBound0040
     * @tc.desc      Data boundary ch=8 byte=126.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 8;
      const dataByte: number = 126;
      const status: number = 128 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0042
     * @tc.name      testExtMidiBound0041
     * @tc.desc      Data boundary ch=9 byte=127.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 9;
      const dataByte: number = 127;
      const status: number = 144 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0043
     * @tc.name      testExtMidiBound0042
     * @tc.desc      Data boundary ch=10 byte=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 10;
      const dataByte: number = 0;
      const status: number = 176 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0044
     * @tc.name      testExtMidiBound0043
     * @tc.desc      Data boundary ch=11 byte=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 11;
      const dataByte: number = 1;
      const status: number = 192 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0045
     * @tc.name      testExtMidiBound0044
     * @tc.desc      Data boundary ch=12 byte=63.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 12;
      const dataByte: number = 63;
      const status: number = 224 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0046
     * @tc.name      testExtMidiBound0045
     * @tc.desc      Data boundary ch=13 byte=64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 13;
      const dataByte: number = 64;
      const status: number = 128 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0047
     * @tc.name      testExtMidiBound0046
     * @tc.desc      Data boundary ch=14 byte=126.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 14;
      const dataByte: number = 126;
      const status: number = 144 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0048
     * @tc.name      testExtMidiBound0047
     * @tc.desc      Data boundary ch=15 byte=127.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 15;
      const dataByte: number = 127;
      const status: number = 176 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0049
     * @tc.name      testExtMidiBound0048
     * @tc.desc      Data boundary ch=0 byte=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 0;
      const dataByte: number = 0;
      const status: number = 192 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0050
     * @tc.name      testExtMidiBound0049
     * @tc.desc      Data boundary ch=1 byte=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 1;
      const dataByte: number = 1;
      const status: number = 224 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0051
     * @tc.name      testExtMidiBound0050
     * @tc.desc      Data boundary ch=2 byte=63.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 2;
      const dataByte: number = 63;
      const status: number = 128 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0052
     * @tc.name      testExtMidiBound0051
     * @tc.desc      Data boundary ch=3 byte=64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 3;
      const dataByte: number = 64;
      const status: number = 144 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0053
     * @tc.name      testExtMidiBound0052
     * @tc.desc      Data boundary ch=4 byte=126.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 4;
      const dataByte: number = 126;
      const status: number = 176 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0054
     * @tc.name      testExtMidiBound0053
     * @tc.desc      Data boundary ch=5 byte=127.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 5;
      const dataByte: number = 127;
      const status: number = 192 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0055
     * @tc.name      testExtMidiBound0054
     * @tc.desc      Data boundary ch=6 byte=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 6;
      const dataByte: number = 0;
      const status: number = 224 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0056
     * @tc.name      testExtMidiBound0055
     * @tc.desc      Data boundary ch=7 byte=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 7;
      const dataByte: number = 1;
      const status: number = 128 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0057
     * @tc.name      testExtMidiBound0056
     * @tc.desc      Data boundary ch=8 byte=63.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 8;
      const dataByte: number = 63;
      const status: number = 144 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0058
     * @tc.name      testExtMidiBound0057
     * @tc.desc      Data boundary ch=9 byte=64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 9;
      const dataByte: number = 64;
      const status: number = 176 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0059
     * @tc.name      testExtMidiBound0058
     * @tc.desc      Data boundary ch=10 byte=126.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 10;
      const dataByte: number = 126;
      const status: number = 192 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0060
     * @tc.name      testExtMidiBound0059
     * @tc.desc      Data boundary ch=11 byte=127.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 11;
      const dataByte: number = 127;
      const status: number = 224 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0061
     * @tc.name      testExtMidiBound0060
     * @tc.desc      Data boundary ch=12 byte=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 12;
      const dataByte: number = 0;
      const status: number = 128 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0062
     * @tc.name      testExtMidiBound0061
     * @tc.desc      Data boundary ch=13 byte=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 13;
      const dataByte: number = 1;
      const status: number = 144 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0063
     * @tc.name      testExtMidiBound0062
     * @tc.desc      Data boundary ch=14 byte=63.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 14;
      const dataByte: number = 63;
      const status: number = 176 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0064
     * @tc.name      testExtMidiBound0063
     * @tc.desc      Data boundary ch=15 byte=64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 15;
      const dataByte: number = 64;
      const status: number = 192 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0065
     * @tc.name      testExtMidiBound0064
     * @tc.desc      Data boundary ch=0 byte=126.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 0;
      const dataByte: number = 126;
      const status: number = 224 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0066
     * @tc.name      testExtMidiBound0065
     * @tc.desc      Data boundary ch=1 byte=127.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 1;
      const dataByte: number = 127;
      const status: number = 128 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0067
     * @tc.name      testExtMidiBound0066
     * @tc.desc      Data boundary ch=2 byte=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 2;
      const dataByte: number = 0;
      const status: number = 144 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0068
     * @tc.name      testExtMidiBound0067
     * @tc.desc      Data boundary ch=3 byte=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 3;
      const dataByte: number = 1;
      const status: number = 176 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0069
     * @tc.name      testExtMidiBound0068
     * @tc.desc      Data boundary ch=4 byte=63.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 4;
      const dataByte: number = 63;
      const status: number = 192 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0070
     * @tc.name      testExtMidiBound0069
     * @tc.desc      Data boundary ch=5 byte=64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 5;
      const dataByte: number = 64;
      const status: number = 224 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0071
     * @tc.name      testExtMidiBound0070
     * @tc.desc      Data boundary ch=6 byte=126.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 6;
      const dataByte: number = 126;
      const status: number = 128 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0072
     * @tc.name      testExtMidiBound0071
     * @tc.desc      Data boundary ch=7 byte=127.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 7;
      const dataByte: number = 127;
      const status: number = 144 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0073
     * @tc.name      testExtMidiBound0072
     * @tc.desc      Data boundary ch=8 byte=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 8;
      const dataByte: number = 0;
      const status: number = 176 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0074
     * @tc.name      testExtMidiBound0073
     * @tc.desc      Data boundary ch=9 byte=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 9;
      const dataByte: number = 1;
      const status: number = 192 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0075
     * @tc.name      testExtMidiBound0074
     * @tc.desc      Data boundary ch=10 byte=63.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 10;
      const dataByte: number = 63;
      const status: number = 224 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0076
     * @tc.name      testExtMidiBound0075
     * @tc.desc      Data boundary ch=11 byte=64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 11;
      const dataByte: number = 64;
      const status: number = 128 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0077
     * @tc.name      testExtMidiBound0076
     * @tc.desc      Data boundary ch=12 byte=126.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 12;
      const dataByte: number = 126;
      const status: number = 144 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0078
     * @tc.name      testExtMidiBound0077
     * @tc.desc      Data boundary ch=13 byte=127.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 13;
      const dataByte: number = 127;
      const status: number = 176 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0079
     * @tc.name      testExtMidiBound0078
     * @tc.desc      Data boundary ch=14 byte=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 14;
      const dataByte: number = 0;
      const status: number = 192 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BOUND_0080
     * @tc.name      testExtMidiBound0079
     * @tc.desc      Data boundary ch=15 byte=1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBound0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 15;
      const dataByte: number = 1;
      const status: number = 224 | channel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLessOrEqual(15);
      expect(dataByte).assertLargerOrEqual(0);
      expect(dataByte).assertLessOrEqual(127);
      expect(status).assertLargerOrEqual(0x80);
      expect(status).assertLessOrEqual(0xEF);
    })
  });
}
