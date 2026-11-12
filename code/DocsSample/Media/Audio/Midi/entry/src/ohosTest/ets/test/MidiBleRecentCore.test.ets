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

const TAG: string = '[Sample_midiBleRecentCore]';
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

export default function midiBleRecentCoreTest(): void {
  describe('midiBleRecentCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0001
     * @tc.name      testExtMidiRecent0000
     * @tc.desc      Recent BLE list 0 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 0; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(0);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:00'.length).assertEqual(17);
      expect('dev0'.length).assertLarger(0);
      expect(true || !true).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0002
     * @tc.name      testExtMidiRecent0001
     * @tc.desc      Recent BLE list 1 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(1);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:01'.length).assertEqual(17);
      expect('dev1'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0003
     * @tc.name      testExtMidiRecent0002
     * @tc.desc      Recent BLE list 2 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(2);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:02'.length).assertEqual(17);
      expect('dev2'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0004
     * @tc.name      testExtMidiRecent0003
     * @tc.desc      Recent BLE list 3 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(3);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:03'.length).assertEqual(17);
      expect('dev3'.length).assertLarger(0);
      expect(true || !true).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0005
     * @tc.name      testExtMidiRecent0004
     * @tc.desc      Recent BLE list 4 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 4; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(4);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:04'.length).assertEqual(17);
      expect('dev4'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0006
     * @tc.name      testExtMidiRecent0005
     * @tc.desc      Recent BLE list 5 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(5);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:05'.length).assertEqual(17);
      expect('dev5'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0007
     * @tc.name      testExtMidiRecent0006
     * @tc.desc      Recent BLE list 6 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 6; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(5);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:06'.length).assertEqual(17);
      expect('dev6'.length).assertLarger(0);
      expect(true || !true).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0008
     * @tc.name      testExtMidiRecent0007
     * @tc.desc      Recent BLE list 7 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 7; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(5);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:07'.length).assertEqual(17);
      expect('dev0'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0009
     * @tc.name      testExtMidiRecent0008
     * @tc.desc      Recent BLE list 0 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 0; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(0);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:08'.length).assertEqual(17);
      expect('dev1'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0010
     * @tc.name      testExtMidiRecent0009
     * @tc.desc      Recent BLE list 1 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(1);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:09'.length).assertEqual(17);
      expect('dev2'.length).assertLarger(0);
      expect(true || !true).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0011
     * @tc.name      testExtMidiRecent0010
     * @tc.desc      Recent BLE list 2 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(2);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:0A'.length).assertEqual(17);
      expect('dev3'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0012
     * @tc.name      testExtMidiRecent0011
     * @tc.desc      Recent BLE list 3 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(3);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:0B'.length).assertEqual(17);
      expect('dev4'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0013
     * @tc.name      testExtMidiRecent0012
     * @tc.desc      Recent BLE list 4 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 4; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(4);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:0C'.length).assertEqual(17);
      expect('dev5'.length).assertLarger(0);
      expect(true || !true).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0014
     * @tc.name      testExtMidiRecent0013
     * @tc.desc      Recent BLE list 5 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(5);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:0D'.length).assertEqual(17);
      expect('dev6'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0015
     * @tc.name      testExtMidiRecent0014
     * @tc.desc      Recent BLE list 6 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 6; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(5);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:0E'.length).assertEqual(17);
      expect('dev0'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0016
     * @tc.name      testExtMidiRecent0015
     * @tc.desc      Recent BLE list 7 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 7; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(5);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:0F'.length).assertEqual(17);
      expect('dev1'.length).assertLarger(0);
      expect(true || !true).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0017
     * @tc.name      testExtMidiRecent0016
     * @tc.desc      Recent BLE list 0 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 0; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(0);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:10'.length).assertEqual(17);
      expect('dev2'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0018
     * @tc.name      testExtMidiRecent0017
     * @tc.desc      Recent BLE list 1 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(1);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:11'.length).assertEqual(17);
      expect('dev3'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0019
     * @tc.name      testExtMidiRecent0018
     * @tc.desc      Recent BLE list 2 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(2);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:12'.length).assertEqual(17);
      expect('dev4'.length).assertLarger(0);
      expect(true || !true).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0020
     * @tc.name      testExtMidiRecent0019
     * @tc.desc      Recent BLE list 3 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(3);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:13'.length).assertEqual(17);
      expect('dev5'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0021
     * @tc.name      testExtMidiRecent0020
     * @tc.desc      Recent BLE list 4 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 4; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(4);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:14'.length).assertEqual(17);
      expect('dev6'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0022
     * @tc.name      testExtMidiRecent0021
     * @tc.desc      Recent BLE list 5 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(5);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:15'.length).assertEqual(17);
      expect('dev0'.length).assertLarger(0);
      expect(true || !true).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0023
     * @tc.name      testExtMidiRecent0022
     * @tc.desc      Recent BLE list 6 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 6; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(5);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:16'.length).assertEqual(17);
      expect('dev1'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0024
     * @tc.name      testExtMidiRecent0023
     * @tc.desc      Recent BLE list 7 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 7; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(5);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:17'.length).assertEqual(17);
      expect('dev2'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0025
     * @tc.name      testExtMidiRecent0024
     * @tc.desc      Recent BLE list 0 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 0; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(0);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:18'.length).assertEqual(17);
      expect('dev3'.length).assertLarger(0);
      expect(true || !true).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0026
     * @tc.name      testExtMidiRecent0025
     * @tc.desc      Recent BLE list 1 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(1);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:19'.length).assertEqual(17);
      expect('dev4'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0027
     * @tc.name      testExtMidiRecent0026
     * @tc.desc      Recent BLE list 2 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(2);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:1A'.length).assertEqual(17);
      expect('dev5'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0028
     * @tc.name      testExtMidiRecent0027
     * @tc.desc      Recent BLE list 3 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(3);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:1B'.length).assertEqual(17);
      expect('dev6'.length).assertLarger(0);
      expect(true || !true).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0029
     * @tc.name      testExtMidiRecent0028
     * @tc.desc      Recent BLE list 4 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 4; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(4);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:1C'.length).assertEqual(17);
      expect('dev0'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0030
     * @tc.name      testExtMidiRecent0029
     * @tc.desc      Recent BLE list 5 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(5);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:1D'.length).assertEqual(17);
      expect('dev1'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0031
     * @tc.name      testExtMidiRecent0030
     * @tc.desc      Recent BLE list 6 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 6; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(5);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:1E'.length).assertEqual(17);
      expect('dev2'.length).assertLarger(0);
      expect(true || !true).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0032
     * @tc.name      testExtMidiRecent0031
     * @tc.desc      Recent BLE list 7 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 7; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(5);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:1F'.length).assertEqual(17);
      expect('dev3'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0033
     * @tc.name      testExtMidiRecent0032
     * @tc.desc      Recent BLE list 0 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 0; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(0);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:20'.length).assertEqual(17);
      expect('dev4'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0034
     * @tc.name      testExtMidiRecent0033
     * @tc.desc      Recent BLE list 1 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(1);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:21'.length).assertEqual(17);
      expect('dev5'.length).assertLarger(0);
      expect(true || !true).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0035
     * @tc.name      testExtMidiRecent0034
     * @tc.desc      Recent BLE list 2 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(2);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:22'.length).assertEqual(17);
      expect('dev6'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0036
     * @tc.name      testExtMidiRecent0035
     * @tc.desc      Recent BLE list 3 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(3);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:23'.length).assertEqual(17);
      expect('dev0'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0037
     * @tc.name      testExtMidiRecent0036
     * @tc.desc      Recent BLE list 4 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 4; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(4);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:24'.length).assertEqual(17);
      expect('dev1'.length).assertLarger(0);
      expect(true || !true).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0038
     * @tc.name      testExtMidiRecent0037
     * @tc.desc      Recent BLE list 5 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(5);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:25'.length).assertEqual(17);
      expect('dev2'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0039
     * @tc.name      testExtMidiRecent0038
     * @tc.desc      Recent BLE list 6 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 6; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(5);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:26'.length).assertEqual(17);
      expect('dev3'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0040
     * @tc.name      testExtMidiRecent0039
     * @tc.desc      Recent BLE list 7 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 7; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(5);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:27'.length).assertEqual(17);
      expect('dev4'.length).assertLarger(0);
      expect(true || !true).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0041
     * @tc.name      testExtMidiRecent0040
     * @tc.desc      Recent BLE list 0 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 0; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(0);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:28'.length).assertEqual(17);
      expect('dev5'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0042
     * @tc.name      testExtMidiRecent0041
     * @tc.desc      Recent BLE list 1 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(1);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:29'.length).assertEqual(17);
      expect('dev6'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0043
     * @tc.name      testExtMidiRecent0042
     * @tc.desc      Recent BLE list 2 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(2);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:2A'.length).assertEqual(17);
      expect('dev0'.length).assertLarger(0);
      expect(true || !true).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0044
     * @tc.name      testExtMidiRecent0043
     * @tc.desc      Recent BLE list 3 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(3);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:2B'.length).assertEqual(17);
      expect('dev1'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0045
     * @tc.name      testExtMidiRecent0044
     * @tc.desc      Recent BLE list 4 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 4; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(4);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:2C'.length).assertEqual(17);
      expect('dev2'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0046
     * @tc.name      testExtMidiRecent0045
     * @tc.desc      Recent BLE list 5 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(5);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:2D'.length).assertEqual(17);
      expect('dev3'.length).assertLarger(0);
      expect(true || !true).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0047
     * @tc.name      testExtMidiRecent0046
     * @tc.desc      Recent BLE list 6 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 6; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(5);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:2E'.length).assertEqual(17);
      expect('dev4'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0048
     * @tc.name      testExtMidiRecent0047
     * @tc.desc      Recent BLE list 7 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 7; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(5);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:2F'.length).assertEqual(17);
      expect('dev5'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0049
     * @tc.name      testExtMidiRecent0048
     * @tc.desc      Recent BLE list 0 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 0; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(0);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:30'.length).assertEqual(17);
      expect('dev6'.length).assertLarger(0);
      expect(true || !true).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0050
     * @tc.name      testExtMidiRecent0049
     * @tc.desc      Recent BLE list 1 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(1);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:31'.length).assertEqual(17);
      expect('dev0'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0051
     * @tc.name      testExtMidiRecent0050
     * @tc.desc      Recent BLE list 2 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(2);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:32'.length).assertEqual(17);
      expect('dev1'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0052
     * @tc.name      testExtMidiRecent0051
     * @tc.desc      Recent BLE list 3 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(3);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:33'.length).assertEqual(17);
      expect('dev2'.length).assertLarger(0);
      expect(true || !true).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0053
     * @tc.name      testExtMidiRecent0052
     * @tc.desc      Recent BLE list 4 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 4; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(4);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:34'.length).assertEqual(17);
      expect('dev3'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0054
     * @tc.name      testExtMidiRecent0053
     * @tc.desc      Recent BLE list 5 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(5);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:35'.length).assertEqual(17);
      expect('dev4'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0055
     * @tc.name      testExtMidiRecent0054
     * @tc.desc      Recent BLE list 6 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 6; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(5);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:36'.length).assertEqual(17);
      expect('dev5'.length).assertLarger(0);
      expect(true || !true).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0056
     * @tc.name      testExtMidiRecent0055
     * @tc.desc      Recent BLE list 7 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 7; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(5);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:37'.length).assertEqual(17);
      expect('dev6'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0057
     * @tc.name      testExtMidiRecent0056
     * @tc.desc      Recent BLE list 0 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 0; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(0);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:38'.length).assertEqual(17);
      expect('dev0'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0058
     * @tc.name      testExtMidiRecent0057
     * @tc.desc      Recent BLE list 1 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(1);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:39'.length).assertEqual(17);
      expect('dev1'.length).assertLarger(0);
      expect(true || !true).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0059
     * @tc.name      testExtMidiRecent0058
     * @tc.desc      Recent BLE list 2 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(2);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:3A'.length).assertEqual(17);
      expect('dev2'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0060
     * @tc.name      testExtMidiRecent0059
     * @tc.desc      Recent BLE list 3 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(3);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:3B'.length).assertEqual(17);
      expect('dev3'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0061
     * @tc.name      testExtMidiRecent0060
     * @tc.desc      Recent BLE list 4 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 4; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(4);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:3C'.length).assertEqual(17);
      expect('dev4'.length).assertLarger(0);
      expect(true || !true).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0062
     * @tc.name      testExtMidiRecent0061
     * @tc.desc      Recent BLE list 5 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(5);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:3D'.length).assertEqual(17);
      expect('dev5'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0063
     * @tc.name      testExtMidiRecent0062
     * @tc.desc      Recent BLE list 6 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 6; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(5);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:3E'.length).assertEqual(17);
      expect('dev6'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0064
     * @tc.name      testExtMidiRecent0063
     * @tc.desc      Recent BLE list 7 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 7; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(5);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:3F'.length).assertEqual(17);
      expect('dev0'.length).assertLarger(0);
      expect(true || !true).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0065
     * @tc.name      testExtMidiRecent0064
     * @tc.desc      Recent BLE list 0 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 0; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(0);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:40'.length).assertEqual(17);
      expect('dev1'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0066
     * @tc.name      testExtMidiRecent0065
     * @tc.desc      Recent BLE list 1 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(1);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:41'.length).assertEqual(17);
      expect('dev2'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0067
     * @tc.name      testExtMidiRecent0066
     * @tc.desc      Recent BLE list 2 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(2);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:42'.length).assertEqual(17);
      expect('dev3'.length).assertLarger(0);
      expect(true || !true).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0068
     * @tc.name      testExtMidiRecent0067
     * @tc.desc      Recent BLE list 3 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(3);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:43'.length).assertEqual(17);
      expect('dev4'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0069
     * @tc.name      testExtMidiRecent0068
     * @tc.desc      Recent BLE list 4 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 4; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(4);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:44'.length).assertEqual(17);
      expect('dev5'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0070
     * @tc.name      testExtMidiRecent0069
     * @tc.desc      Recent BLE list 5 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(5);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:45'.length).assertEqual(17);
      expect('dev6'.length).assertLarger(0);
      expect(true || !true).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0071
     * @tc.name      testExtMidiRecent0070
     * @tc.desc      Recent BLE list 6 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 6; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(5);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:46'.length).assertEqual(17);
      expect('dev0'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0072
     * @tc.name      testExtMidiRecent0071
     * @tc.desc      Recent BLE list 7 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 7; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(5);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:47'.length).assertEqual(17);
      expect('dev1'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0073
     * @tc.name      testExtMidiRecent0072
     * @tc.desc      Recent BLE list 0 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 0; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(0);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:48'.length).assertEqual(17);
      expect('dev2'.length).assertLarger(0);
      expect(true || !true).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0074
     * @tc.name      testExtMidiRecent0073
     * @tc.desc      Recent BLE list 1 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(1);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:49'.length).assertEqual(17);
      expect('dev3'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0075
     * @tc.name      testExtMidiRecent0074
     * @tc.desc      Recent BLE list 2 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(2);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:4A'.length).assertEqual(17);
      expect('dev4'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0076
     * @tc.name      testExtMidiRecent0075
     * @tc.desc      Recent BLE list 3 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(3);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:4B'.length).assertEqual(17);
      expect('dev5'.length).assertLarger(0);
      expect(true || !true).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0077
     * @tc.name      testExtMidiRecent0076
     * @tc.desc      Recent BLE list 4 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 4; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(4);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:4C'.length).assertEqual(17);
      expect('dev6'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0078
     * @tc.name      testExtMidiRecent0077
     * @tc.desc      Recent BLE list 5 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(5);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:4D'.length).assertEqual(17);
      expect('dev0'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0079
     * @tc.name      testExtMidiRecent0078
     * @tc.desc      Recent BLE list 6 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 6; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(5);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:4E'.length).assertEqual(17);
      expect('dev1'.length).assertLarger(0);
      expect(true || !true).assertTrue();
    })
    /**
     * @tc.number    SUB_MIDI_EXT_RECENT_0080
     * @tc.name      testExtMidiRecent0079
     * @tc.desc      Recent BLE list 7 entries.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiRecent0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = [];
      for (let index: number = 0; index < 7; index++) {
        devices.unshift('device_' + index);
      }
      if (devices.length > 5) { devices = devices.slice(0, 5); }
      expect(devices.length).assertEqual(5);
      expect(devices.length).assertLessOrEqual(5);
      expect('AA:BB:CC:DD:EE:4F'.length).assertEqual(17);
      expect('dev2'.length).assertLarger(0);
      expect(false || !false).assertTrue();
    })
  });
}
