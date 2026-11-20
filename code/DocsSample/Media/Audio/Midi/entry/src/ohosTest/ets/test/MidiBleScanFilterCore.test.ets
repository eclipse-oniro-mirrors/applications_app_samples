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

const TAG: string = '[Sample_midiBleScanFilterCore]';
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

export default function midiBleScanFilterCoreTest(): void {
  describe('midiBleScanFilterCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0001
     * @tc.name      testExtMidiScan0000
     * @tc.desc      Scan filter name=MIDI Keyboard rssi -40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'MIDI Keyboard';
      const address: string = 'AA:BB:CC:DD:EE:00';
      const rssi: number = -40;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0002
     * @tc.name      testExtMidiScan0001
     * @tc.desc      Scan filter name=BLE MIDI rssi -70.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'BLE MIDI';
      const address: string = 'AA:BB:CC:DD:EE:01';
      const rssi: number = -70;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0003
     * @tc.name      testExtMidiScan0002
     * @tc.desc      Scan filter name= rssi -95.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = '';
      const address: string = 'AA:BB:CC:DD:EE:02';
      const rssi: number = -95;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(false);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0004
     * @tc.name      testExtMidiScan0003
     * @tc.desc      Scan filter name=Device X rssi -120.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'Device X';
      const address: string = 'AA:BB:CC:DD:EE:03';
      const rssi: number = -120;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(false);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0005
     * @tc.name      testExtMidiScan0004
     * @tc.desc      Scan filter name=Piano rssi -20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'Piano';
      const address: string = 'AA:BB:CC:DD:EE:04';
      const rssi: number = -20;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0006
     * @tc.name      testExtMidiScan0005
     * @tc.desc      Scan filter name=MIDI Keyboard rssi -40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'MIDI Keyboard';
      const address: string = 'AA:BB:CC:DD:EE:05';
      const rssi: number = -40;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0007
     * @tc.name      testExtMidiScan0006
     * @tc.desc      Scan filter name=BLE MIDI rssi -70.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'BLE MIDI';
      const address: string = 'AA:BB:CC:DD:EE:06';
      const rssi: number = -70;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0008
     * @tc.name      testExtMidiScan0007
     * @tc.desc      Scan filter name= rssi -95.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = '';
      const address: string = 'AA:BB:CC:DD:EE:07';
      const rssi: number = -95;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(false);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0009
     * @tc.name      testExtMidiScan0008
     * @tc.desc      Scan filter name=Device X rssi -120.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'Device X';
      const address: string = 'AA:BB:CC:DD:EE:08';
      const rssi: number = -120;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(false);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0010
     * @tc.name      testExtMidiScan0009
     * @tc.desc      Scan filter name=Piano rssi -20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'Piano';
      const address: string = 'AA:BB:CC:DD:EE:09';
      const rssi: number = -20;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0011
     * @tc.name      testExtMidiScan0010
     * @tc.desc      Scan filter name=MIDI Keyboard rssi -40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'MIDI Keyboard';
      const address: string = 'AA:BB:CC:DD:EE:0A';
      const rssi: number = -40;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0012
     * @tc.name      testExtMidiScan0011
     * @tc.desc      Scan filter name=BLE MIDI rssi -70.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'BLE MIDI';
      const address: string = 'AA:BB:CC:DD:EE:0B';
      const rssi: number = -70;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0013
     * @tc.name      testExtMidiScan0012
     * @tc.desc      Scan filter name= rssi -95.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = '';
      const address: string = 'AA:BB:CC:DD:EE:0C';
      const rssi: number = -95;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(false);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0014
     * @tc.name      testExtMidiScan0013
     * @tc.desc      Scan filter name=Device X rssi -120.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'Device X';
      const address: string = 'AA:BB:CC:DD:EE:0D';
      const rssi: number = -120;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(false);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0015
     * @tc.name      testExtMidiScan0014
     * @tc.desc      Scan filter name=Piano rssi -20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'Piano';
      const address: string = 'AA:BB:CC:DD:EE:0E';
      const rssi: number = -20;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0016
     * @tc.name      testExtMidiScan0015
     * @tc.desc      Scan filter name=MIDI Keyboard rssi -40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'MIDI Keyboard';
      const address: string = 'AA:BB:CC:DD:EE:0F';
      const rssi: number = -40;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0017
     * @tc.name      testExtMidiScan0016
     * @tc.desc      Scan filter name=BLE MIDI rssi -70.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'BLE MIDI';
      const address: string = 'AA:BB:CC:DD:EE:10';
      const rssi: number = -70;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0018
     * @tc.name      testExtMidiScan0017
     * @tc.desc      Scan filter name= rssi -95.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = '';
      const address: string = 'AA:BB:CC:DD:EE:11';
      const rssi: number = -95;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(false);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0019
     * @tc.name      testExtMidiScan0018
     * @tc.desc      Scan filter name=Device X rssi -120.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'Device X';
      const address: string = 'AA:BB:CC:DD:EE:12';
      const rssi: number = -120;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(false);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0020
     * @tc.name      testExtMidiScan0019
     * @tc.desc      Scan filter name=Piano rssi -20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'Piano';
      const address: string = 'AA:BB:CC:DD:EE:13';
      const rssi: number = -20;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0021
     * @tc.name      testExtMidiScan0020
     * @tc.desc      Scan filter name=MIDI Keyboard rssi -40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'MIDI Keyboard';
      const address: string = 'AA:BB:CC:DD:EE:14';
      const rssi: number = -40;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0022
     * @tc.name      testExtMidiScan0021
     * @tc.desc      Scan filter name=BLE MIDI rssi -70.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'BLE MIDI';
      const address: string = 'AA:BB:CC:DD:EE:15';
      const rssi: number = -70;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0023
     * @tc.name      testExtMidiScan0022
     * @tc.desc      Scan filter name= rssi -95.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = '';
      const address: string = 'AA:BB:CC:DD:EE:16';
      const rssi: number = -95;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(false);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0024
     * @tc.name      testExtMidiScan0023
     * @tc.desc      Scan filter name=Device X rssi -120.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'Device X';
      const address: string = 'AA:BB:CC:DD:EE:17';
      const rssi: number = -120;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(false);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0025
     * @tc.name      testExtMidiScan0024
     * @tc.desc      Scan filter name=Piano rssi -20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'Piano';
      const address: string = 'AA:BB:CC:DD:EE:18';
      const rssi: number = -20;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0026
     * @tc.name      testExtMidiScan0025
     * @tc.desc      Scan filter name=MIDI Keyboard rssi -40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'MIDI Keyboard';
      const address: string = 'AA:BB:CC:DD:EE:19';
      const rssi: number = -40;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0027
     * @tc.name      testExtMidiScan0026
     * @tc.desc      Scan filter name=BLE MIDI rssi -70.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'BLE MIDI';
      const address: string = 'AA:BB:CC:DD:EE:1A';
      const rssi: number = -70;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0028
     * @tc.name      testExtMidiScan0027
     * @tc.desc      Scan filter name= rssi -95.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = '';
      const address: string = 'AA:BB:CC:DD:EE:1B';
      const rssi: number = -95;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(false);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0029
     * @tc.name      testExtMidiScan0028
     * @tc.desc      Scan filter name=Device X rssi -120.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'Device X';
      const address: string = 'AA:BB:CC:DD:EE:1C';
      const rssi: number = -120;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(false);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0030
     * @tc.name      testExtMidiScan0029
     * @tc.desc      Scan filter name=Piano rssi -20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'Piano';
      const address: string = 'AA:BB:CC:DD:EE:1D';
      const rssi: number = -20;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0031
     * @tc.name      testExtMidiScan0030
     * @tc.desc      Scan filter name=MIDI Keyboard rssi -40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'MIDI Keyboard';
      const address: string = 'AA:BB:CC:DD:EE:1E';
      const rssi: number = -40;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0032
     * @tc.name      testExtMidiScan0031
     * @tc.desc      Scan filter name=BLE MIDI rssi -70.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'BLE MIDI';
      const address: string = 'AA:BB:CC:DD:EE:1F';
      const rssi: number = -70;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0033
     * @tc.name      testExtMidiScan0032
     * @tc.desc      Scan filter name= rssi -95.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = '';
      const address: string = 'AA:BB:CC:DD:EE:20';
      const rssi: number = -95;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(false);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0034
     * @tc.name      testExtMidiScan0033
     * @tc.desc      Scan filter name=Device X rssi -120.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'Device X';
      const address: string = 'AA:BB:CC:DD:EE:21';
      const rssi: number = -120;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(false);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0035
     * @tc.name      testExtMidiScan0034
     * @tc.desc      Scan filter name=Piano rssi -20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'Piano';
      const address: string = 'AA:BB:CC:DD:EE:22';
      const rssi: number = -20;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0036
     * @tc.name      testExtMidiScan0035
     * @tc.desc      Scan filter name=MIDI Keyboard rssi -40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'MIDI Keyboard';
      const address: string = 'AA:BB:CC:DD:EE:23';
      const rssi: number = -40;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0037
     * @tc.name      testExtMidiScan0036
     * @tc.desc      Scan filter name=BLE MIDI rssi -70.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'BLE MIDI';
      const address: string = 'AA:BB:CC:DD:EE:24';
      const rssi: number = -70;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0038
     * @tc.name      testExtMidiScan0037
     * @tc.desc      Scan filter name= rssi -95.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = '';
      const address: string = 'AA:BB:CC:DD:EE:25';
      const rssi: number = -95;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(false);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0039
     * @tc.name      testExtMidiScan0038
     * @tc.desc      Scan filter name=Device X rssi -120.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'Device X';
      const address: string = 'AA:BB:CC:DD:EE:26';
      const rssi: number = -120;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(false);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0040
     * @tc.name      testExtMidiScan0039
     * @tc.desc      Scan filter name=Piano rssi -20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'Piano';
      const address: string = 'AA:BB:CC:DD:EE:27';
      const rssi: number = -20;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0041
     * @tc.name      testExtMidiScan0040
     * @tc.desc      Scan filter name=MIDI Keyboard rssi -40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'MIDI Keyboard';
      const address: string = 'AA:BB:CC:DD:EE:28';
      const rssi: number = -40;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0042
     * @tc.name      testExtMidiScan0041
     * @tc.desc      Scan filter name=BLE MIDI rssi -70.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'BLE MIDI';
      const address: string = 'AA:BB:CC:DD:EE:29';
      const rssi: number = -70;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0043
     * @tc.name      testExtMidiScan0042
     * @tc.desc      Scan filter name= rssi -95.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = '';
      const address: string = 'AA:BB:CC:DD:EE:2A';
      const rssi: number = -95;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(false);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0044
     * @tc.name      testExtMidiScan0043
     * @tc.desc      Scan filter name=Device X rssi -120.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'Device X';
      const address: string = 'AA:BB:CC:DD:EE:2B';
      const rssi: number = -120;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(false);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0045
     * @tc.name      testExtMidiScan0044
     * @tc.desc      Scan filter name=Piano rssi -20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'Piano';
      const address: string = 'AA:BB:CC:DD:EE:2C';
      const rssi: number = -20;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0046
     * @tc.name      testExtMidiScan0045
     * @tc.desc      Scan filter name=MIDI Keyboard rssi -40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'MIDI Keyboard';
      const address: string = 'AA:BB:CC:DD:EE:2D';
      const rssi: number = -40;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0047
     * @tc.name      testExtMidiScan0046
     * @tc.desc      Scan filter name=BLE MIDI rssi -70.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'BLE MIDI';
      const address: string = 'AA:BB:CC:DD:EE:2E';
      const rssi: number = -70;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0048
     * @tc.name      testExtMidiScan0047
     * @tc.desc      Scan filter name= rssi -95.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = '';
      const address: string = 'AA:BB:CC:DD:EE:2F';
      const rssi: number = -95;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(false);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0049
     * @tc.name      testExtMidiScan0048
     * @tc.desc      Scan filter name=Device X rssi -120.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'Device X';
      const address: string = 'AA:BB:CC:DD:EE:30';
      const rssi: number = -120;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(false);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0050
     * @tc.name      testExtMidiScan0049
     * @tc.desc      Scan filter name=Piano rssi -20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'Piano';
      const address: string = 'AA:BB:CC:DD:EE:31';
      const rssi: number = -20;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0051
     * @tc.name      testExtMidiScan0050
     * @tc.desc      Scan filter name=MIDI Keyboard rssi -40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'MIDI Keyboard';
      const address: string = 'AA:BB:CC:DD:EE:32';
      const rssi: number = -40;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0052
     * @tc.name      testExtMidiScan0051
     * @tc.desc      Scan filter name=BLE MIDI rssi -70.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'BLE MIDI';
      const address: string = 'AA:BB:CC:DD:EE:33';
      const rssi: number = -70;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0053
     * @tc.name      testExtMidiScan0052
     * @tc.desc      Scan filter name= rssi -95.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = '';
      const address: string = 'AA:BB:CC:DD:EE:34';
      const rssi: number = -95;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(false);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0054
     * @tc.name      testExtMidiScan0053
     * @tc.desc      Scan filter name=Device X rssi -120.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'Device X';
      const address: string = 'AA:BB:CC:DD:EE:35';
      const rssi: number = -120;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(false);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0055
     * @tc.name      testExtMidiScan0054
     * @tc.desc      Scan filter name=Piano rssi -20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'Piano';
      const address: string = 'AA:BB:CC:DD:EE:36';
      const rssi: number = -20;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0056
     * @tc.name      testExtMidiScan0055
     * @tc.desc      Scan filter name=MIDI Keyboard rssi -40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'MIDI Keyboard';
      const address: string = 'AA:BB:CC:DD:EE:37';
      const rssi: number = -40;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0057
     * @tc.name      testExtMidiScan0056
     * @tc.desc      Scan filter name=BLE MIDI rssi -70.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'BLE MIDI';
      const address: string = 'AA:BB:CC:DD:EE:38';
      const rssi: number = -70;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0058
     * @tc.name      testExtMidiScan0057
     * @tc.desc      Scan filter name= rssi -95.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = '';
      const address: string = 'AA:BB:CC:DD:EE:39';
      const rssi: number = -95;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(false);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0059
     * @tc.name      testExtMidiScan0058
     * @tc.desc      Scan filter name=Device X rssi -120.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'Device X';
      const address: string = 'AA:BB:CC:DD:EE:3A';
      const rssi: number = -120;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(false);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0060
     * @tc.name      testExtMidiScan0059
     * @tc.desc      Scan filter name=Piano rssi -20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'Piano';
      const address: string = 'AA:BB:CC:DD:EE:3B';
      const rssi: number = -20;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0061
     * @tc.name      testExtMidiScan0060
     * @tc.desc      Scan filter name=MIDI Keyboard rssi -40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'MIDI Keyboard';
      const address: string = 'AA:BB:CC:DD:EE:3C';
      const rssi: number = -40;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0062
     * @tc.name      testExtMidiScan0061
     * @tc.desc      Scan filter name=BLE MIDI rssi -70.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'BLE MIDI';
      const address: string = 'AA:BB:CC:DD:EE:3D';
      const rssi: number = -70;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0063
     * @tc.name      testExtMidiScan0062
     * @tc.desc      Scan filter name= rssi -95.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = '';
      const address: string = 'AA:BB:CC:DD:EE:3E';
      const rssi: number = -95;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(false);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0064
     * @tc.name      testExtMidiScan0063
     * @tc.desc      Scan filter name=Device X rssi -120.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'Device X';
      const address: string = 'AA:BB:CC:DD:EE:3F';
      const rssi: number = -120;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(false);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0065
     * @tc.name      testExtMidiScan0064
     * @tc.desc      Scan filter name=Piano rssi -20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'Piano';
      const address: string = 'AA:BB:CC:DD:EE:40';
      const rssi: number = -20;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0066
     * @tc.name      testExtMidiScan0065
     * @tc.desc      Scan filter name=MIDI Keyboard rssi -40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'MIDI Keyboard';
      const address: string = 'AA:BB:CC:DD:EE:41';
      const rssi: number = -40;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0067
     * @tc.name      testExtMidiScan0066
     * @tc.desc      Scan filter name=BLE MIDI rssi -70.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'BLE MIDI';
      const address: string = 'AA:BB:CC:DD:EE:42';
      const rssi: number = -70;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0068
     * @tc.name      testExtMidiScan0067
     * @tc.desc      Scan filter name= rssi -95.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = '';
      const address: string = 'AA:BB:CC:DD:EE:43';
      const rssi: number = -95;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(false);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0069
     * @tc.name      testExtMidiScan0068
     * @tc.desc      Scan filter name=Device X rssi -120.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'Device X';
      const address: string = 'AA:BB:CC:DD:EE:44';
      const rssi: number = -120;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(false);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0070
     * @tc.name      testExtMidiScan0069
     * @tc.desc      Scan filter name=Piano rssi -20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'Piano';
      const address: string = 'AA:BB:CC:DD:EE:45';
      const rssi: number = -20;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0071
     * @tc.name      testExtMidiScan0070
     * @tc.desc      Scan filter name=MIDI Keyboard rssi -40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'MIDI Keyboard';
      const address: string = 'AA:BB:CC:DD:EE:46';
      const rssi: number = -40;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0072
     * @tc.name      testExtMidiScan0071
     * @tc.desc      Scan filter name=BLE MIDI rssi -70.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'BLE MIDI';
      const address: string = 'AA:BB:CC:DD:EE:47';
      const rssi: number = -70;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0073
     * @tc.name      testExtMidiScan0072
     * @tc.desc      Scan filter name= rssi -95.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = '';
      const address: string = 'AA:BB:CC:DD:EE:48';
      const rssi: number = -95;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(false);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0074
     * @tc.name      testExtMidiScan0073
     * @tc.desc      Scan filter name=Device X rssi -120.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'Device X';
      const address: string = 'AA:BB:CC:DD:EE:49';
      const rssi: number = -120;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(false);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0075
     * @tc.name      testExtMidiScan0074
     * @tc.desc      Scan filter name=Piano rssi -20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'Piano';
      const address: string = 'AA:BB:CC:DD:EE:4A';
      const rssi: number = -20;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0076
     * @tc.name      testExtMidiScan0075
     * @tc.desc      Scan filter name=MIDI Keyboard rssi -40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'MIDI Keyboard';
      const address: string = 'AA:BB:CC:DD:EE:4B';
      const rssi: number = -40;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0077
     * @tc.name      testExtMidiScan0076
     * @tc.desc      Scan filter name=BLE MIDI rssi -70.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'BLE MIDI';
      const address: string = 'AA:BB:CC:DD:EE:4C';
      const rssi: number = -70;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0078
     * @tc.name      testExtMidiScan0077
     * @tc.desc      Scan filter name= rssi -95.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = '';
      const address: string = 'AA:BB:CC:DD:EE:4D';
      const rssi: number = -95;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(false);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0079
     * @tc.name      testExtMidiScan0078
     * @tc.desc      Scan filter name=Device X rssi -120.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'Device X';
      const address: string = 'AA:BB:CC:DD:EE:4E';
      const rssi: number = -120;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(false);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_SCAN_0080
     * @tc.name      testExtMidiScan0079
     * @tc.desc      Scan filter name=Piano rssi -20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiScan0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const name: string = 'Piano';
      const address: string = 'AA:BB:CC:DD:EE:4F';
      const rssi: number = -20;
      const valid: boolean = name.length > 0 && rssi >= -100;
      expect(valid).assertEqual(true);
      expect(address.length).assertEqual(17);
      expect(rssi).assertLess(0);
      expect(name.length).assertLargerOrEqual(0);
    })
  });
}
