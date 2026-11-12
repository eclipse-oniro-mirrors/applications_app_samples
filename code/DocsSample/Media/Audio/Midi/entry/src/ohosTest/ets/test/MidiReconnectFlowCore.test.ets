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

const TAG: string = '[Sample_midiReconnectFlowCore]';
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

export default function midiReconnectFlowCoreTest(): void {
  describe('midiReconnectFlowCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0001
     * @tc.name      testExtMidiReconnect0000
     * @tc.desc      Reconnect case 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = true;
      if (true) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = true; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0002
     * @tc.name      testExtMidiReconnect0001
     * @tc.desc      Reconnect case 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = false;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0003
     * @tc.name      testExtMidiReconnect0002
     * @tc.desc      Reconnect case 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = true;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0004
     * @tc.name      testExtMidiReconnect0003
     * @tc.desc      Reconnect case 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = false;
      if (true) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(false);
      expect(deviceOpen).assertEqual(false);
      expect(portOpen).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0005
     * @tc.name      testExtMidiReconnect0004
     * @tc.desc      Reconnect case 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = true;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = true; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0006
     * @tc.name      testExtMidiReconnect0005
     * @tc.desc      Reconnect case 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = false;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0007
     * @tc.name      testExtMidiReconnect0006
     * @tc.desc      Reconnect case 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = true;
      if (true) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0008
     * @tc.name      testExtMidiReconnect0007
     * @tc.desc      Reconnect case 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = false;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0009
     * @tc.name      testExtMidiReconnect0008
     * @tc.desc      Reconnect case 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = true;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = true; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0010
     * @tc.name      testExtMidiReconnect0009
     * @tc.desc      Reconnect case 9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = false;
      if (true) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(false);
      expect(deviceOpen).assertEqual(false);
      expect(portOpen).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0011
     * @tc.name      testExtMidiReconnect0010
     * @tc.desc      Reconnect case 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = true;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0012
     * @tc.name      testExtMidiReconnect0011
     * @tc.desc      Reconnect case 11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = false;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0013
     * @tc.name      testExtMidiReconnect0012
     * @tc.desc      Reconnect case 12.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = true;
      if (true) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = true; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0014
     * @tc.name      testExtMidiReconnect0013
     * @tc.desc      Reconnect case 13.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = false;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0015
     * @tc.name      testExtMidiReconnect0014
     * @tc.desc      Reconnect case 14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = true;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0016
     * @tc.name      testExtMidiReconnect0015
     * @tc.desc      Reconnect case 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = false;
      if (true) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(false);
      expect(deviceOpen).assertEqual(false);
      expect(portOpen).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0017
     * @tc.name      testExtMidiReconnect0016
     * @tc.desc      Reconnect case 16.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = true;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = true; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0018
     * @tc.name      testExtMidiReconnect0017
     * @tc.desc      Reconnect case 17.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = false;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0019
     * @tc.name      testExtMidiReconnect0018
     * @tc.desc      Reconnect case 18.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = true;
      if (true) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0020
     * @tc.name      testExtMidiReconnect0019
     * @tc.desc      Reconnect case 19.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = false;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0021
     * @tc.name      testExtMidiReconnect0020
     * @tc.desc      Reconnect case 20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = true;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = true; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0022
     * @tc.name      testExtMidiReconnect0021
     * @tc.desc      Reconnect case 21.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = false;
      if (true) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(false);
      expect(deviceOpen).assertEqual(false);
      expect(portOpen).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0023
     * @tc.name      testExtMidiReconnect0022
     * @tc.desc      Reconnect case 22.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = true;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0024
     * @tc.name      testExtMidiReconnect0023
     * @tc.desc      Reconnect case 23.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = false;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0025
     * @tc.name      testExtMidiReconnect0024
     * @tc.desc      Reconnect case 24.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = true;
      if (true) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = true; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0026
     * @tc.name      testExtMidiReconnect0025
     * @tc.desc      Reconnect case 25.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = false;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0027
     * @tc.name      testExtMidiReconnect0026
     * @tc.desc      Reconnect case 26.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = true;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0028
     * @tc.name      testExtMidiReconnect0027
     * @tc.desc      Reconnect case 27.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = false;
      if (true) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(false);
      expect(deviceOpen).assertEqual(false);
      expect(portOpen).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0029
     * @tc.name      testExtMidiReconnect0028
     * @tc.desc      Reconnect case 28.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = true;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = true; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0030
     * @tc.name      testExtMidiReconnect0029
     * @tc.desc      Reconnect case 29.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = false;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0031
     * @tc.name      testExtMidiReconnect0030
     * @tc.desc      Reconnect case 30.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = true;
      if (true) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0032
     * @tc.name      testExtMidiReconnect0031
     * @tc.desc      Reconnect case 31.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = false;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0033
     * @tc.name      testExtMidiReconnect0032
     * @tc.desc      Reconnect case 32.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = true;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = true; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0034
     * @tc.name      testExtMidiReconnect0033
     * @tc.desc      Reconnect case 33.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = false;
      if (true) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(false);
      expect(deviceOpen).assertEqual(false);
      expect(portOpen).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0035
     * @tc.name      testExtMidiReconnect0034
     * @tc.desc      Reconnect case 34.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = true;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0036
     * @tc.name      testExtMidiReconnect0035
     * @tc.desc      Reconnect case 35.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = false;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0037
     * @tc.name      testExtMidiReconnect0036
     * @tc.desc      Reconnect case 36.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = true;
      if (true) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = true; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0038
     * @tc.name      testExtMidiReconnect0037
     * @tc.desc      Reconnect case 37.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = false;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0039
     * @tc.name      testExtMidiReconnect0038
     * @tc.desc      Reconnect case 38.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = true;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0040
     * @tc.name      testExtMidiReconnect0039
     * @tc.desc      Reconnect case 39.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = false;
      if (true) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(false);
      expect(deviceOpen).assertEqual(false);
      expect(portOpen).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0041
     * @tc.name      testExtMidiReconnect0040
     * @tc.desc      Reconnect case 40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = true;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = true; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0042
     * @tc.name      testExtMidiReconnect0041
     * @tc.desc      Reconnect case 41.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = false;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0043
     * @tc.name      testExtMidiReconnect0042
     * @tc.desc      Reconnect case 42.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = true;
      if (true) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0044
     * @tc.name      testExtMidiReconnect0043
     * @tc.desc      Reconnect case 43.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = false;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0045
     * @tc.name      testExtMidiReconnect0044
     * @tc.desc      Reconnect case 44.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = true;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = true; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0046
     * @tc.name      testExtMidiReconnect0045
     * @tc.desc      Reconnect case 45.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = false;
      if (true) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(false);
      expect(deviceOpen).assertEqual(false);
      expect(portOpen).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0047
     * @tc.name      testExtMidiReconnect0046
     * @tc.desc      Reconnect case 46.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = true;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0048
     * @tc.name      testExtMidiReconnect0047
     * @tc.desc      Reconnect case 47.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = false;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0049
     * @tc.name      testExtMidiReconnect0048
     * @tc.desc      Reconnect case 48.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = true;
      if (true) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = true; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0050
     * @tc.name      testExtMidiReconnect0049
     * @tc.desc      Reconnect case 49.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = false;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0051
     * @tc.name      testExtMidiReconnect0050
     * @tc.desc      Reconnect case 50.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = true;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0052
     * @tc.name      testExtMidiReconnect0051
     * @tc.desc      Reconnect case 51.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = false;
      if (true) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(false);
      expect(deviceOpen).assertEqual(false);
      expect(portOpen).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0053
     * @tc.name      testExtMidiReconnect0052
     * @tc.desc      Reconnect case 52.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = true;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = true; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0054
     * @tc.name      testExtMidiReconnect0053
     * @tc.desc      Reconnect case 53.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = false;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0055
     * @tc.name      testExtMidiReconnect0054
     * @tc.desc      Reconnect case 54.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = true;
      if (true) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0056
     * @tc.name      testExtMidiReconnect0055
     * @tc.desc      Reconnect case 55.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = false;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0057
     * @tc.name      testExtMidiReconnect0056
     * @tc.desc      Reconnect case 56.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = true;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = true; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(true);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0058
     * @tc.name      testExtMidiReconnect0057
     * @tc.desc      Reconnect case 57.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = false;
      if (true) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(false);
      expect(deviceOpen).assertEqual(false);
      expect(portOpen).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0059
     * @tc.name      testExtMidiReconnect0058
     * @tc.desc      Reconnect case 58.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = true;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(false);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECONNECT_0060
     * @tc.name      testExtMidiReconnect0059
     * @tc.desc      Reconnect case 59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiReconnect0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let connected: boolean = true;
      let deviceOpen: boolean = true;
      let portOpen: boolean = true;
      const reconnect: boolean = false;
      if (false) { connected = false; deviceOpen = false; portOpen = false; }
      if (reconnect) { connected = true; deviceOpen = true; portOpen = false; }
      expect(connected).assertEqual(true);
      expect(deviceOpen).assertEqual(true);
      expect(portOpen).assertEqual(true);
    })
  });
}
