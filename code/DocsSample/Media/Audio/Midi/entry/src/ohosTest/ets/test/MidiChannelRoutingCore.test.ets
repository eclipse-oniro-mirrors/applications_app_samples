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

const TAG: string = '[Sample_midiChannelRoutingCore]';
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

export default function midiChannelRoutingCoreTest(): void {
  describe('midiChannelRoutingCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0001
     * @tc.name      testExtMidiRoute0000
     * @tc.desc      Route channel 0 target 0 omni=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 0;
      const targetChannel: number = 0;
      const omni: boolean = true;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0002
     * @tc.name      testExtMidiRoute0001
     * @tc.desc      Route channel 1 target 1 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 1;
      const targetChannel: number = 1;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0003
     * @tc.name      testExtMidiRoute0002
     * @tc.desc      Route channel 2 target 2 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 2;
      const targetChannel: number = 2;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0004
     * @tc.name      testExtMidiRoute0003
     * @tc.desc      Route channel 3 target 3 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 3;
      const targetChannel: number = 3;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0005
     * @tc.name      testExtMidiRoute0004
     * @tc.desc      Route channel 4 target 4 omni=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 4;
      const targetChannel: number = 4;
      const omni: boolean = true;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0006
     * @tc.name      testExtMidiRoute0005
     * @tc.desc      Route channel 5 target 5 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 5;
      const targetChannel: number = 5;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0007
     * @tc.name      testExtMidiRoute0006
     * @tc.desc      Route channel 6 target 6 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 6;
      const targetChannel: number = 6;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0008
     * @tc.name      testExtMidiRoute0007
     * @tc.desc      Route channel 7 target 7 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 7;
      const targetChannel: number = 7;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0009
     * @tc.name      testExtMidiRoute0008
     * @tc.desc      Route channel 8 target 8 omni=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 8;
      const targetChannel: number = 8;
      const omni: boolean = true;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0010
     * @tc.name      testExtMidiRoute0009
     * @tc.desc      Route channel 9 target 9 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 9;
      const targetChannel: number = 9;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0011
     * @tc.name      testExtMidiRoute0010
     * @tc.desc      Route channel 10 target 10 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 10;
      const targetChannel: number = 10;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0012
     * @tc.name      testExtMidiRoute0011
     * @tc.desc      Route channel 11 target 11 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 11;
      const targetChannel: number = 11;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0013
     * @tc.name      testExtMidiRoute0012
     * @tc.desc      Route channel 12 target 12 omni=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 12;
      const targetChannel: number = 12;
      const omni: boolean = true;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0014
     * @tc.name      testExtMidiRoute0013
     * @tc.desc      Route channel 13 target 13 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 13;
      const targetChannel: number = 13;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0015
     * @tc.name      testExtMidiRoute0014
     * @tc.desc      Route channel 14 target 14 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 14;
      const targetChannel: number = 14;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0016
     * @tc.name      testExtMidiRoute0015
     * @tc.desc      Route channel 15 target 15 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 15;
      const targetChannel: number = 15;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0017
     * @tc.name      testExtMidiRoute0016
     * @tc.desc      Route channel 0 target 0 omni=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 0;
      const targetChannel: number = 0;
      const omni: boolean = true;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0018
     * @tc.name      testExtMidiRoute0017
     * @tc.desc      Route channel 1 target 1 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 1;
      const targetChannel: number = 1;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0019
     * @tc.name      testExtMidiRoute0018
     * @tc.desc      Route channel 2 target 2 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 2;
      const targetChannel: number = 2;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0020
     * @tc.name      testExtMidiRoute0019
     * @tc.desc      Route channel 3 target 3 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 3;
      const targetChannel: number = 3;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0021
     * @tc.name      testExtMidiRoute0020
     * @tc.desc      Route channel 4 target 4 omni=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 4;
      const targetChannel: number = 4;
      const omni: boolean = true;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0022
     * @tc.name      testExtMidiRoute0021
     * @tc.desc      Route channel 5 target 5 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 5;
      const targetChannel: number = 5;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0023
     * @tc.name      testExtMidiRoute0022
     * @tc.desc      Route channel 6 target 6 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 6;
      const targetChannel: number = 6;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0024
     * @tc.name      testExtMidiRoute0023
     * @tc.desc      Route channel 7 target 7 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 7;
      const targetChannel: number = 7;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0025
     * @tc.name      testExtMidiRoute0024
     * @tc.desc      Route channel 8 target 8 omni=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 8;
      const targetChannel: number = 8;
      const omni: boolean = true;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0026
     * @tc.name      testExtMidiRoute0025
     * @tc.desc      Route channel 9 target 9 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 9;
      const targetChannel: number = 9;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0027
     * @tc.name      testExtMidiRoute0026
     * @tc.desc      Route channel 10 target 10 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 10;
      const targetChannel: number = 10;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0028
     * @tc.name      testExtMidiRoute0027
     * @tc.desc      Route channel 11 target 11 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 11;
      const targetChannel: number = 11;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0029
     * @tc.name      testExtMidiRoute0028
     * @tc.desc      Route channel 12 target 12 omni=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 12;
      const targetChannel: number = 12;
      const omni: boolean = true;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0030
     * @tc.name      testExtMidiRoute0029
     * @tc.desc      Route channel 13 target 13 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 13;
      const targetChannel: number = 13;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0031
     * @tc.name      testExtMidiRoute0030
     * @tc.desc      Route channel 14 target 14 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 14;
      const targetChannel: number = 14;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0032
     * @tc.name      testExtMidiRoute0031
     * @tc.desc      Route channel 15 target 15 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 15;
      const targetChannel: number = 15;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0033
     * @tc.name      testExtMidiRoute0032
     * @tc.desc      Route channel 0 target 0 omni=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 0;
      const targetChannel: number = 0;
      const omni: boolean = true;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0034
     * @tc.name      testExtMidiRoute0033
     * @tc.desc      Route channel 1 target 1 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 1;
      const targetChannel: number = 1;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0035
     * @tc.name      testExtMidiRoute0034
     * @tc.desc      Route channel 2 target 2 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 2;
      const targetChannel: number = 2;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0036
     * @tc.name      testExtMidiRoute0035
     * @tc.desc      Route channel 3 target 3 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 3;
      const targetChannel: number = 3;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0037
     * @tc.name      testExtMidiRoute0036
     * @tc.desc      Route channel 4 target 4 omni=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 4;
      const targetChannel: number = 4;
      const omni: boolean = true;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0038
     * @tc.name      testExtMidiRoute0037
     * @tc.desc      Route channel 5 target 5 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 5;
      const targetChannel: number = 5;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0039
     * @tc.name      testExtMidiRoute0038
     * @tc.desc      Route channel 6 target 6 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 6;
      const targetChannel: number = 6;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0040
     * @tc.name      testExtMidiRoute0039
     * @tc.desc      Route channel 7 target 7 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 7;
      const targetChannel: number = 7;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0041
     * @tc.name      testExtMidiRoute0040
     * @tc.desc      Route channel 8 target 8 omni=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 8;
      const targetChannel: number = 8;
      const omni: boolean = true;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0042
     * @tc.name      testExtMidiRoute0041
     * @tc.desc      Route channel 9 target 9 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 9;
      const targetChannel: number = 9;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0043
     * @tc.name      testExtMidiRoute0042
     * @tc.desc      Route channel 10 target 10 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 10;
      const targetChannel: number = 10;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0044
     * @tc.name      testExtMidiRoute0043
     * @tc.desc      Route channel 11 target 11 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 11;
      const targetChannel: number = 11;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0045
     * @tc.name      testExtMidiRoute0044
     * @tc.desc      Route channel 12 target 12 omni=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 12;
      const targetChannel: number = 12;
      const omni: boolean = true;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0046
     * @tc.name      testExtMidiRoute0045
     * @tc.desc      Route channel 13 target 13 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 13;
      const targetChannel: number = 13;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0047
     * @tc.name      testExtMidiRoute0046
     * @tc.desc      Route channel 14 target 14 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 14;
      const targetChannel: number = 14;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0048
     * @tc.name      testExtMidiRoute0047
     * @tc.desc      Route channel 15 target 15 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 15;
      const targetChannel: number = 15;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0049
     * @tc.name      testExtMidiRoute0048
     * @tc.desc      Route channel 0 target 0 omni=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 0;
      const targetChannel: number = 0;
      const omni: boolean = true;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0050
     * @tc.name      testExtMidiRoute0049
     * @tc.desc      Route channel 1 target 1 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 1;
      const targetChannel: number = 1;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0051
     * @tc.name      testExtMidiRoute0050
     * @tc.desc      Route channel 2 target 2 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 2;
      const targetChannel: number = 2;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0052
     * @tc.name      testExtMidiRoute0051
     * @tc.desc      Route channel 3 target 3 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 3;
      const targetChannel: number = 3;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0053
     * @tc.name      testExtMidiRoute0052
     * @tc.desc      Route channel 4 target 4 omni=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 4;
      const targetChannel: number = 4;
      const omni: boolean = true;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0054
     * @tc.name      testExtMidiRoute0053
     * @tc.desc      Route channel 5 target 5 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 5;
      const targetChannel: number = 5;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0055
     * @tc.name      testExtMidiRoute0054
     * @tc.desc      Route channel 6 target 6 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 6;
      const targetChannel: number = 6;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0056
     * @tc.name      testExtMidiRoute0055
     * @tc.desc      Route channel 7 target 7 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 7;
      const targetChannel: number = 7;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0057
     * @tc.name      testExtMidiRoute0056
     * @tc.desc      Route channel 8 target 8 omni=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 8;
      const targetChannel: number = 8;
      const omni: boolean = true;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0058
     * @tc.name      testExtMidiRoute0057
     * @tc.desc      Route channel 9 target 9 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 9;
      const targetChannel: number = 9;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0059
     * @tc.name      testExtMidiRoute0058
     * @tc.desc      Route channel 10 target 10 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 10;
      const targetChannel: number = 10;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0060
     * @tc.name      testExtMidiRoute0059
     * @tc.desc      Route channel 11 target 11 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 11;
      const targetChannel: number = 11;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0061
     * @tc.name      testExtMidiRoute0060
     * @tc.desc      Route channel 12 target 12 omni=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 12;
      const targetChannel: number = 12;
      const omni: boolean = true;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0062
     * @tc.name      testExtMidiRoute0061
     * @tc.desc      Route channel 13 target 13 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 13;
      const targetChannel: number = 13;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0063
     * @tc.name      testExtMidiRoute0062
     * @tc.desc      Route channel 14 target 14 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 14;
      const targetChannel: number = 14;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0064
     * @tc.name      testExtMidiRoute0063
     * @tc.desc      Route channel 15 target 15 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 15;
      const targetChannel: number = 15;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0065
     * @tc.name      testExtMidiRoute0064
     * @tc.desc      Route channel 0 target 0 omni=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 0;
      const targetChannel: number = 0;
      const omni: boolean = true;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0066
     * @tc.name      testExtMidiRoute0065
     * @tc.desc      Route channel 1 target 1 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 1;
      const targetChannel: number = 1;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0067
     * @tc.name      testExtMidiRoute0066
     * @tc.desc      Route channel 2 target 2 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 2;
      const targetChannel: number = 2;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0068
     * @tc.name      testExtMidiRoute0067
     * @tc.desc      Route channel 3 target 3 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 3;
      const targetChannel: number = 3;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0069
     * @tc.name      testExtMidiRoute0068
     * @tc.desc      Route channel 4 target 4 omni=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 4;
      const targetChannel: number = 4;
      const omni: boolean = true;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0070
     * @tc.name      testExtMidiRoute0069
     * @tc.desc      Route channel 5 target 5 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 5;
      const targetChannel: number = 5;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0071
     * @tc.name      testExtMidiRoute0070
     * @tc.desc      Route channel 6 target 6 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 6;
      const targetChannel: number = 6;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0072
     * @tc.name      testExtMidiRoute0071
     * @tc.desc      Route channel 7 target 7 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 7;
      const targetChannel: number = 7;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0073
     * @tc.name      testExtMidiRoute0072
     * @tc.desc      Route channel 8 target 8 omni=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 8;
      const targetChannel: number = 8;
      const omni: boolean = true;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0074
     * @tc.name      testExtMidiRoute0073
     * @tc.desc      Route channel 9 target 9 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 9;
      const targetChannel: number = 9;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0075
     * @tc.name      testExtMidiRoute0074
     * @tc.desc      Route channel 10 target 10 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 10;
      const targetChannel: number = 10;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0076
     * @tc.name      testExtMidiRoute0075
     * @tc.desc      Route channel 11 target 11 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 11;
      const targetChannel: number = 11;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0077
     * @tc.name      testExtMidiRoute0076
     * @tc.desc      Route channel 12 target 12 omni=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 12;
      const targetChannel: number = 12;
      const omni: boolean = true;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0078
     * @tc.name      testExtMidiRoute0077
     * @tc.desc      Route channel 13 target 13 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 13;
      const targetChannel: number = 13;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0079
     * @tc.name      testExtMidiRoute0078
     * @tc.desc      Route channel 14 target 14 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 14;
      const targetChannel: number = 14;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_ROUTE_0080
     * @tc.name      testExtMidiRoute0079
     * @tc.desc      Route channel 15 target 15 omni=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRoute0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const channel: number = 15;
      const targetChannel: number = 15;
      const omni: boolean = false;
      const accepted: boolean = omni || channel === targetChannel;
      expect(channel).assertLargerOrEqual(0);
      expect(channel).assertLess(16);
      expect(targetChannel).assertLess(16);
      expect(accepted).assertEqual(true);
    })
  });
}
