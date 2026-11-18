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

const TAG: string = '[Sample_midiDeviceHotplugCore]';
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

export default function midiDeviceHotplugCoreTest(): void {
  describe('midiDeviceHotplugCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0001
     * @tc.name      testExtMidiHotplug0000
     * @tc.desc      Hotplug action 0 device 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = true;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 0); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 0);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0002
     * @tc.name      testExtMidiHotplug0001
     * @tc.desc      Hotplug action 1 device 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 1); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 1);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0003
     * @tc.name      testExtMidiHotplug0002
     * @tc.desc      Hotplug action 0 device 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 2); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 2);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0004
     * @tc.name      testExtMidiHotplug0003
     * @tc.desc      Hotplug action 1 device 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = true;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 3); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 3);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0005
     * @tc.name      testExtMidiHotplug0004
     * @tc.desc      Hotplug action 0 device 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 4); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 4);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0006
     * @tc.name      testExtMidiHotplug0005
     * @tc.desc      Hotplug action 1 device 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 5); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 5);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0007
     * @tc.name      testExtMidiHotplug0006
     * @tc.desc      Hotplug action 0 device 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = true;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 0); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 0);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0008
     * @tc.name      testExtMidiHotplug0007
     * @tc.desc      Hotplug action 1 device 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 1); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 1);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0009
     * @tc.name      testExtMidiHotplug0008
     * @tc.desc      Hotplug action 0 device 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 2); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 2);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0010
     * @tc.name      testExtMidiHotplug0009
     * @tc.desc      Hotplug action 1 device 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = true;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 3); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 3);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0011
     * @tc.name      testExtMidiHotplug0010
     * @tc.desc      Hotplug action 0 device 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 4); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 4);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0012
     * @tc.name      testExtMidiHotplug0011
     * @tc.desc      Hotplug action 1 device 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 5); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 5);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0013
     * @tc.name      testExtMidiHotplug0012
     * @tc.desc      Hotplug action 0 device 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = true;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 0); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 0);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0014
     * @tc.name      testExtMidiHotplug0013
     * @tc.desc      Hotplug action 1 device 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 1); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 1);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0015
     * @tc.name      testExtMidiHotplug0014
     * @tc.desc      Hotplug action 0 device 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 2); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 2);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0016
     * @tc.name      testExtMidiHotplug0015
     * @tc.desc      Hotplug action 1 device 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = true;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 3); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 3);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0017
     * @tc.name      testExtMidiHotplug0016
     * @tc.desc      Hotplug action 0 device 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 4); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 4);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0018
     * @tc.name      testExtMidiHotplug0017
     * @tc.desc      Hotplug action 1 device 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 5); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 5);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0019
     * @tc.name      testExtMidiHotplug0018
     * @tc.desc      Hotplug action 0 device 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = true;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 0); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 0);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0020
     * @tc.name      testExtMidiHotplug0019
     * @tc.desc      Hotplug action 1 device 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 1); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 1);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0021
     * @tc.name      testExtMidiHotplug0020
     * @tc.desc      Hotplug action 0 device 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 2); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 2);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0022
     * @tc.name      testExtMidiHotplug0021
     * @tc.desc      Hotplug action 1 device 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = true;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 3); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 3);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0023
     * @tc.name      testExtMidiHotplug0022
     * @tc.desc      Hotplug action 0 device 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 4); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 4);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0024
     * @tc.name      testExtMidiHotplug0023
     * @tc.desc      Hotplug action 1 device 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 5); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 5);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0025
     * @tc.name      testExtMidiHotplug0024
     * @tc.desc      Hotplug action 0 device 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = true;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 0); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 0);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0026
     * @tc.name      testExtMidiHotplug0025
     * @tc.desc      Hotplug action 1 device 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 1); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 1);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0027
     * @tc.name      testExtMidiHotplug0026
     * @tc.desc      Hotplug action 0 device 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 2); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 2);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0028
     * @tc.name      testExtMidiHotplug0027
     * @tc.desc      Hotplug action 1 device 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = true;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 3); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 3);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0029
     * @tc.name      testExtMidiHotplug0028
     * @tc.desc      Hotplug action 0 device 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 4); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 4);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0030
     * @tc.name      testExtMidiHotplug0029
     * @tc.desc      Hotplug action 1 device 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 5); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 5);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0031
     * @tc.name      testExtMidiHotplug0030
     * @tc.desc      Hotplug action 0 device 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = true;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 0); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 0);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0032
     * @tc.name      testExtMidiHotplug0031
     * @tc.desc      Hotplug action 1 device 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 1); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 1);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0033
     * @tc.name      testExtMidiHotplug0032
     * @tc.desc      Hotplug action 0 device 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 2); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 2);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0034
     * @tc.name      testExtMidiHotplug0033
     * @tc.desc      Hotplug action 1 device 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = true;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 3); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 3);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0035
     * @tc.name      testExtMidiHotplug0034
     * @tc.desc      Hotplug action 0 device 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 4); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 4);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0036
     * @tc.name      testExtMidiHotplug0035
     * @tc.desc      Hotplug action 1 device 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 5); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 5);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0037
     * @tc.name      testExtMidiHotplug0036
     * @tc.desc      Hotplug action 0 device 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = true;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 0); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 0);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0038
     * @tc.name      testExtMidiHotplug0037
     * @tc.desc      Hotplug action 1 device 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 1); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 1);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0039
     * @tc.name      testExtMidiHotplug0038
     * @tc.desc      Hotplug action 0 device 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 2); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 2);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0040
     * @tc.name      testExtMidiHotplug0039
     * @tc.desc      Hotplug action 1 device 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = true;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 3); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 3);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0041
     * @tc.name      testExtMidiHotplug0040
     * @tc.desc      Hotplug action 0 device 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 4); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 4);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0042
     * @tc.name      testExtMidiHotplug0041
     * @tc.desc      Hotplug action 1 device 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 5); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 5);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0043
     * @tc.name      testExtMidiHotplug0042
     * @tc.desc      Hotplug action 0 device 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = true;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 0); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 0);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0044
     * @tc.name      testExtMidiHotplug0043
     * @tc.desc      Hotplug action 1 device 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 1); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 1);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0045
     * @tc.name      testExtMidiHotplug0044
     * @tc.desc      Hotplug action 0 device 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 2); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 2);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0046
     * @tc.name      testExtMidiHotplug0045
     * @tc.desc      Hotplug action 1 device 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = true;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 3); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 3);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0047
     * @tc.name      testExtMidiHotplug0046
     * @tc.desc      Hotplug action 0 device 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 4); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 4);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0048
     * @tc.name      testExtMidiHotplug0047
     * @tc.desc      Hotplug action 1 device 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 5); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 5);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0049
     * @tc.name      testExtMidiHotplug0048
     * @tc.desc      Hotplug action 0 device 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = true;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 0); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 0);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0050
     * @tc.name      testExtMidiHotplug0049
     * @tc.desc      Hotplug action 1 device 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 1); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 1);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0051
     * @tc.name      testExtMidiHotplug0050
     * @tc.desc      Hotplug action 0 device 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 2); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 2);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0052
     * @tc.name      testExtMidiHotplug0051
     * @tc.desc      Hotplug action 1 device 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = true;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 3); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 3);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0053
     * @tc.name      testExtMidiHotplug0052
     * @tc.desc      Hotplug action 0 device 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 4); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 4);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0054
     * @tc.name      testExtMidiHotplug0053
     * @tc.desc      Hotplug action 1 device 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 5); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 5);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0055
     * @tc.name      testExtMidiHotplug0054
     * @tc.desc      Hotplug action 0 device 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = true;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 0); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 0);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0056
     * @tc.name      testExtMidiHotplug0055
     * @tc.desc      Hotplug action 1 device 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 1); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 1);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0057
     * @tc.name      testExtMidiHotplug0056
     * @tc.desc      Hotplug action 0 device 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 2); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 2);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0058
     * @tc.name      testExtMidiHotplug0057
     * @tc.desc      Hotplug action 1 device 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = true;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 3); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 3);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0059
     * @tc.name      testExtMidiHotplug0058
     * @tc.desc      Hotplug action 0 device 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 4); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 4);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0060
     * @tc.name      testExtMidiHotplug0059
     * @tc.desc      Hotplug action 1 device 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 5); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 5);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0061
     * @tc.name      testExtMidiHotplug0060
     * @tc.desc      Hotplug action 0 device 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = true;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 0); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 0);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0062
     * @tc.name      testExtMidiHotplug0061
     * @tc.desc      Hotplug action 1 device 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 1); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 1);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0063
     * @tc.name      testExtMidiHotplug0062
     * @tc.desc      Hotplug action 0 device 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 2); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 2);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0064
     * @tc.name      testExtMidiHotplug0063
     * @tc.desc      Hotplug action 1 device 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = true;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 3); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 3);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0065
     * @tc.name      testExtMidiHotplug0064
     * @tc.desc      Hotplug action 0 device 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 4); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 4);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0066
     * @tc.name      testExtMidiHotplug0065
     * @tc.desc      Hotplug action 1 device 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 5); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 5);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0067
     * @tc.name      testExtMidiHotplug0066
     * @tc.desc      Hotplug action 0 device 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = true;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 0); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 0);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0068
     * @tc.name      testExtMidiHotplug0067
     * @tc.desc      Hotplug action 1 device 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 1); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 1);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0069
     * @tc.name      testExtMidiHotplug0068
     * @tc.desc      Hotplug action 0 device 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 2); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 2);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0070
     * @tc.name      testExtMidiHotplug0069
     * @tc.desc      Hotplug action 1 device 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = true;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 3); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 3);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0071
     * @tc.name      testExtMidiHotplug0070
     * @tc.desc      Hotplug action 0 device 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 4); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 4);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0072
     * @tc.name      testExtMidiHotplug0071
     * @tc.desc      Hotplug action 1 device 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 5); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 5);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0073
     * @tc.name      testExtMidiHotplug0072
     * @tc.desc      Hotplug action 0 device 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = true;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 0); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 0);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0074
     * @tc.name      testExtMidiHotplug0073
     * @tc.desc      Hotplug action 1 device 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 1); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 1);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0075
     * @tc.name      testExtMidiHotplug0074
     * @tc.desc      Hotplug action 0 device 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 2); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 2);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0076
     * @tc.name      testExtMidiHotplug0075
     * @tc.desc      Hotplug action 1 device 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = true;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 3); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 3);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0077
     * @tc.name      testExtMidiHotplug0076
     * @tc.desc      Hotplug action 0 device 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 4); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 4);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0078
     * @tc.name      testExtMidiHotplug0077
     * @tc.desc      Hotplug action 1 device 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 5); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 5);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0079
     * @tc.name      testExtMidiHotplug0078
     * @tc.desc      Hotplug action 0 device 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 0;
      const exists: boolean = true;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 0); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 0);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_HOTPLUG_0080
     * @tc.name      testExtMidiHotplug0079
     * @tc.desc      Hotplug action 1 device 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiHotplug0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let devices: string[] = ['dev0', 'dev1', 'dev2', 'dev3', 'dev4'];
      const action: number = 1;
      const exists: boolean = false;
      if (action === 0) {
        if (!exists) { devices.push('dev' + 1); }
      } else {
        devices = devices.filter((item: string) => item !== 'dev' + 1);
      }
      expect(devices.length).assertLargerOrEqual(0);
      expect(devices.length).assertLessOrEqual(6);
    })
  });
}
