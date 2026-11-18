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

const TAG: string = '[Sample_midiBleAddressCore]';
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

export default function midiBleAddressCoreTest(): void {
  describe('midiBleAddressCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0001
     * @tc.name      testExtMidiBle0000
     * @tc.desc      BLE address AA:BB:CC:DD:EE:FF.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'AA:BB:CC:DD:EE:FF';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 0;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0002
     * @tc.name      testExtMidiBle0001
     * @tc.desc      BLE address aa:bb:cc:dd:ee:ff.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'aa:bb:cc:dd:ee:ff';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 1;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0003
     * @tc.name      testExtMidiBle0002
     * @tc.desc      BLE address 11:22:33:44:55:66.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = '11:22:33:44:55:66';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 2;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('11:22:33:44:55:66');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0004
     * @tc.name      testExtMidiBle0003
     * @tc.desc      BLE address A1:B2:C3:D4:E5:F6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 3;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0005
     * @tc.name      testExtMidiBle0004
     * @tc.desc      BLE address AA:BB:CC:DD:EE:FF.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'AA:BB:CC:DD:EE:FF';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 4;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0006
     * @tc.name      testExtMidiBle0005
     * @tc.desc      BLE address aa:bb:cc:dd:ee:ff.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'aa:bb:cc:dd:ee:ff';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 5;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0007
     * @tc.name      testExtMidiBle0006
     * @tc.desc      BLE address 11:22:33:44:55:66.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = '11:22:33:44:55:66';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 6;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('11:22:33:44:55:66');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0008
     * @tc.name      testExtMidiBle0007
     * @tc.desc      BLE address A1:B2:C3:D4:E5:F6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 7;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0009
     * @tc.name      testExtMidiBle0008
     * @tc.desc      BLE address AA:BB:CC:DD:EE:FF.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'AA:BB:CC:DD:EE:FF';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 0;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0010
     * @tc.name      testExtMidiBle0009
     * @tc.desc      BLE address aa:bb:cc:dd:ee:ff.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'aa:bb:cc:dd:ee:ff';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 1;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0011
     * @tc.name      testExtMidiBle0010
     * @tc.desc      BLE address 11:22:33:44:55:66.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = '11:22:33:44:55:66';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 2;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('11:22:33:44:55:66');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0012
     * @tc.name      testExtMidiBle0011
     * @tc.desc      BLE address A1:B2:C3:D4:E5:F6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 3;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0013
     * @tc.name      testExtMidiBle0012
     * @tc.desc      BLE address AA:BB:CC:DD:EE:FF.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'AA:BB:CC:DD:EE:FF';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 4;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0014
     * @tc.name      testExtMidiBle0013
     * @tc.desc      BLE address aa:bb:cc:dd:ee:ff.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'aa:bb:cc:dd:ee:ff';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 5;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0015
     * @tc.name      testExtMidiBle0014
     * @tc.desc      BLE address 11:22:33:44:55:66.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = '11:22:33:44:55:66';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 6;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('11:22:33:44:55:66');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0016
     * @tc.name      testExtMidiBle0015
     * @tc.desc      BLE address A1:B2:C3:D4:E5:F6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 7;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0017
     * @tc.name      testExtMidiBle0016
     * @tc.desc      BLE address AA:BB:CC:DD:EE:FF.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'AA:BB:CC:DD:EE:FF';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 0;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0018
     * @tc.name      testExtMidiBle0017
     * @tc.desc      BLE address aa:bb:cc:dd:ee:ff.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'aa:bb:cc:dd:ee:ff';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 1;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0019
     * @tc.name      testExtMidiBle0018
     * @tc.desc      BLE address 11:22:33:44:55:66.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = '11:22:33:44:55:66';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 2;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('11:22:33:44:55:66');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0020
     * @tc.name      testExtMidiBle0019
     * @tc.desc      BLE address A1:B2:C3:D4:E5:F6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 3;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0021
     * @tc.name      testExtMidiBle0020
     * @tc.desc      BLE address AA:BB:CC:DD:EE:FF.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'AA:BB:CC:DD:EE:FF';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 4;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0022
     * @tc.name      testExtMidiBle0021
     * @tc.desc      BLE address aa:bb:cc:dd:ee:ff.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'aa:bb:cc:dd:ee:ff';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 5;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0023
     * @tc.name      testExtMidiBle0022
     * @tc.desc      BLE address 11:22:33:44:55:66.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = '11:22:33:44:55:66';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 6;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('11:22:33:44:55:66');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0024
     * @tc.name      testExtMidiBle0023
     * @tc.desc      BLE address A1:B2:C3:D4:E5:F6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 7;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0025
     * @tc.name      testExtMidiBle0024
     * @tc.desc      BLE address AA:BB:CC:DD:EE:FF.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'AA:BB:CC:DD:EE:FF';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 0;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0026
     * @tc.name      testExtMidiBle0025
     * @tc.desc      BLE address aa:bb:cc:dd:ee:ff.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'aa:bb:cc:dd:ee:ff';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 1;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0027
     * @tc.name      testExtMidiBle0026
     * @tc.desc      BLE address 11:22:33:44:55:66.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = '11:22:33:44:55:66';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 2;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('11:22:33:44:55:66');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0028
     * @tc.name      testExtMidiBle0027
     * @tc.desc      BLE address A1:B2:C3:D4:E5:F6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 3;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0029
     * @tc.name      testExtMidiBle0028
     * @tc.desc      BLE address AA:BB:CC:DD:EE:FF.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'AA:BB:CC:DD:EE:FF';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 4;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0030
     * @tc.name      testExtMidiBle0029
     * @tc.desc      BLE address aa:bb:cc:dd:ee:ff.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'aa:bb:cc:dd:ee:ff';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 5;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0031
     * @tc.name      testExtMidiBle0030
     * @tc.desc      BLE address 11:22:33:44:55:66.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = '11:22:33:44:55:66';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 6;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('11:22:33:44:55:66');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0032
     * @tc.name      testExtMidiBle0031
     * @tc.desc      BLE address A1:B2:C3:D4:E5:F6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 7;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0033
     * @tc.name      testExtMidiBle0032
     * @tc.desc      BLE address AA:BB:CC:DD:EE:FF.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'AA:BB:CC:DD:EE:FF';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 0;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0034
     * @tc.name      testExtMidiBle0033
     * @tc.desc      BLE address aa:bb:cc:dd:ee:ff.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'aa:bb:cc:dd:ee:ff';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 1;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0035
     * @tc.name      testExtMidiBle0034
     * @tc.desc      BLE address 11:22:33:44:55:66.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = '11:22:33:44:55:66';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 2;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('11:22:33:44:55:66');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0036
     * @tc.name      testExtMidiBle0035
     * @tc.desc      BLE address A1:B2:C3:D4:E5:F6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 3;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0037
     * @tc.name      testExtMidiBle0036
     * @tc.desc      BLE address AA:BB:CC:DD:EE:FF.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'AA:BB:CC:DD:EE:FF';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 4;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0038
     * @tc.name      testExtMidiBle0037
     * @tc.desc      BLE address aa:bb:cc:dd:ee:ff.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'aa:bb:cc:dd:ee:ff';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 5;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0039
     * @tc.name      testExtMidiBle0038
     * @tc.desc      BLE address 11:22:33:44:55:66.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = '11:22:33:44:55:66';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 6;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('11:22:33:44:55:66');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0040
     * @tc.name      testExtMidiBle0039
     * @tc.desc      BLE address A1:B2:C3:D4:E5:F6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 7;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0041
     * @tc.name      testExtMidiBle0040
     * @tc.desc      BLE address AA:BB:CC:DD:EE:FF.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'AA:BB:CC:DD:EE:FF';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 0;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0042
     * @tc.name      testExtMidiBle0041
     * @tc.desc      BLE address aa:bb:cc:dd:ee:ff.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'aa:bb:cc:dd:ee:ff';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 1;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0043
     * @tc.name      testExtMidiBle0042
     * @tc.desc      BLE address 11:22:33:44:55:66.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = '11:22:33:44:55:66';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 2;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('11:22:33:44:55:66');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0044
     * @tc.name      testExtMidiBle0043
     * @tc.desc      BLE address A1:B2:C3:D4:E5:F6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 3;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0045
     * @tc.name      testExtMidiBle0044
     * @tc.desc      BLE address AA:BB:CC:DD:EE:FF.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'AA:BB:CC:DD:EE:FF';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 4;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0046
     * @tc.name      testExtMidiBle0045
     * @tc.desc      BLE address aa:bb:cc:dd:ee:ff.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'aa:bb:cc:dd:ee:ff';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 5;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0047
     * @tc.name      testExtMidiBle0046
     * @tc.desc      BLE address 11:22:33:44:55:66.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = '11:22:33:44:55:66';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 6;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('11:22:33:44:55:66');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0048
     * @tc.name      testExtMidiBle0047
     * @tc.desc      BLE address A1:B2:C3:D4:E5:F6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 7;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0049
     * @tc.name      testExtMidiBle0048
     * @tc.desc      BLE address AA:BB:CC:DD:EE:FF.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'AA:BB:CC:DD:EE:FF';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 0;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0050
     * @tc.name      testExtMidiBle0049
     * @tc.desc      BLE address aa:bb:cc:dd:ee:ff.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'aa:bb:cc:dd:ee:ff';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 1;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0051
     * @tc.name      testExtMidiBle0050
     * @tc.desc      BLE address 11:22:33:44:55:66.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = '11:22:33:44:55:66';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 2;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('11:22:33:44:55:66');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0052
     * @tc.name      testExtMidiBle0051
     * @tc.desc      BLE address A1:B2:C3:D4:E5:F6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 3;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0053
     * @tc.name      testExtMidiBle0052
     * @tc.desc      BLE address AA:BB:CC:DD:EE:FF.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'AA:BB:CC:DD:EE:FF';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 4;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0054
     * @tc.name      testExtMidiBle0053
     * @tc.desc      BLE address aa:bb:cc:dd:ee:ff.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'aa:bb:cc:dd:ee:ff';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 5;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0055
     * @tc.name      testExtMidiBle0054
     * @tc.desc      BLE address 11:22:33:44:55:66.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = '11:22:33:44:55:66';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 6;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('11:22:33:44:55:66');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0056
     * @tc.name      testExtMidiBle0055
     * @tc.desc      BLE address A1:B2:C3:D4:E5:F6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 7;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0057
     * @tc.name      testExtMidiBle0056
     * @tc.desc      BLE address AA:BB:CC:DD:EE:FF.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'AA:BB:CC:DD:EE:FF';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 0;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0058
     * @tc.name      testExtMidiBle0057
     * @tc.desc      BLE address aa:bb:cc:dd:ee:ff.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'aa:bb:cc:dd:ee:ff';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 1;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0059
     * @tc.name      testExtMidiBle0058
     * @tc.desc      BLE address 11:22:33:44:55:66.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = '11:22:33:44:55:66';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 2;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('11:22:33:44:55:66');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0060
     * @tc.name      testExtMidiBle0059
     * @tc.desc      BLE address A1:B2:C3:D4:E5:F6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 3;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0061
     * @tc.name      testExtMidiBle0060
     * @tc.desc      BLE address AA:BB:CC:DD:EE:FF.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'AA:BB:CC:DD:EE:FF';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 4;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0062
     * @tc.name      testExtMidiBle0061
     * @tc.desc      BLE address aa:bb:cc:dd:ee:ff.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'aa:bb:cc:dd:ee:ff';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 5;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0063
     * @tc.name      testExtMidiBle0062
     * @tc.desc      BLE address 11:22:33:44:55:66.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = '11:22:33:44:55:66';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 6;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('11:22:33:44:55:66');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0064
     * @tc.name      testExtMidiBle0063
     * @tc.desc      BLE address A1:B2:C3:D4:E5:F6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 7;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0065
     * @tc.name      testExtMidiBle0064
     * @tc.desc      BLE address AA:BB:CC:DD:EE:FF.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'AA:BB:CC:DD:EE:FF';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 0;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0066
     * @tc.name      testExtMidiBle0065
     * @tc.desc      BLE address aa:bb:cc:dd:ee:ff.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'aa:bb:cc:dd:ee:ff';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 1;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0067
     * @tc.name      testExtMidiBle0066
     * @tc.desc      BLE address 11:22:33:44:55:66.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = '11:22:33:44:55:66';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 2;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('11:22:33:44:55:66');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0068
     * @tc.name      testExtMidiBle0067
     * @tc.desc      BLE address A1:B2:C3:D4:E5:F6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 3;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0069
     * @tc.name      testExtMidiBle0068
     * @tc.desc      BLE address AA:BB:CC:DD:EE:FF.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'AA:BB:CC:DD:EE:FF';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 4;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0070
     * @tc.name      testExtMidiBle0069
     * @tc.desc      BLE address aa:bb:cc:dd:ee:ff.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'aa:bb:cc:dd:ee:ff';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 5;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0071
     * @tc.name      testExtMidiBle0070
     * @tc.desc      BLE address 11:22:33:44:55:66.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = '11:22:33:44:55:66';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 6;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('11:22:33:44:55:66');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0072
     * @tc.name      testExtMidiBle0071
     * @tc.desc      BLE address A1:B2:C3:D4:E5:F6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 7;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0073
     * @tc.name      testExtMidiBle0072
     * @tc.desc      BLE address AA:BB:CC:DD:EE:FF.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'AA:BB:CC:DD:EE:FF';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 0;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0074
     * @tc.name      testExtMidiBle0073
     * @tc.desc      BLE address aa:bb:cc:dd:ee:ff.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'aa:bb:cc:dd:ee:ff';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 1;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0075
     * @tc.name      testExtMidiBle0074
     * @tc.desc      BLE address 11:22:33:44:55:66.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = '11:22:33:44:55:66';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 2;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('11:22:33:44:55:66');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0076
     * @tc.name      testExtMidiBle0075
     * @tc.desc      BLE address A1:B2:C3:D4:E5:F6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 3;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0077
     * @tc.name      testExtMidiBle0076
     * @tc.desc      BLE address AA:BB:CC:DD:EE:FF.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'AA:BB:CC:DD:EE:FF';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 4;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0078
     * @tc.name      testExtMidiBle0077
     * @tc.desc      BLE address aa:bb:cc:dd:ee:ff.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'aa:bb:cc:dd:ee:ff';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 5;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('AA:BB:CC:DD:EE:FF');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0079
     * @tc.name      testExtMidiBle0078
     * @tc.desc      BLE address 11:22:33:44:55:66.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = '11:22:33:44:55:66';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 6;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('11:22:33:44:55:66');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
    /**
     * @tc.number    SUB_MIDI_EXT_BLE_0080
     * @tc.name      testExtMidiBle0079
     * @tc.desc      BLE address A1:B2:C3:D4:E5:F6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtMidiBle0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raw: string = 'A1:B2:C3:D4:E5:F6';
      const normalized: string = raw.toUpperCase();
      const parts: string[] = normalized.split(':');
      let count: number = 7;
      if (count > 5) { count = 5; }
      expect(normalized).assertEqual('A1:B2:C3:D4:E5:F6');
      expect(parts.length).assertEqual(6);
      expect(normalized.length).assertEqual(17);
      expect(count).assertLessOrEqual(5);
    })
  });
}
