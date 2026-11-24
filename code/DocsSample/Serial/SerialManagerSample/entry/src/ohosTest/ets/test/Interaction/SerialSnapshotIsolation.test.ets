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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { serial } from '@kit.BasicServicesKit';
import { SerialFixture, FakeSerialPort, expectBytes, expectFailure, payload, logSuite,
  expectReleased, expectSession, expectCallSequence, invokeOperation } from '../Shared/SharedDriver';

export default function SerialSnapshotIsolationTest(): void {
  describe('SerialSnapshotIsolationTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialSnapshotIsolation', 'begin');
    });

    beforeEach(async () => {
      fixture = new SerialFixture();
      await Promise.resolve();
    });

    afterEach(async () => {
      await fixture.dispose();
      expectReleased(fixture);
    });

    afterAll(() => {
      logSuite('SerialSnapshotIsolation', 'end');
    });

    /**
     * @tc.name SerialSnapshotIsolationTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTISOLATION_0100
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 1 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotIsolationTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(1, 0);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 1;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotIsolationTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTISOLATION_0200
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 2 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotIsolationTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(2, 0);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 1;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotIsolationTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTISOLATION_0300
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 3 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotIsolationTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(3, 0);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 1;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotIsolationTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTISOLATION_0400
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 4 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotIsolationTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(4, 0);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 1;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotIsolationTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTISOLATION_0500
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 5 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotIsolationTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(5, 0);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 1;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotIsolationTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTISOLATION_0600
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 7 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotIsolationTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(7, 0);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 1;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotIsolationTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTISOLATION_0700
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 8 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotIsolationTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(8, 0);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 1;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotIsolationTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTISOLATION_0800
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 16 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotIsolationTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(16, 0);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 1;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotIsolationTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTISOLATION_0900
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 31 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotIsolationTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(31, 0);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 1;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotIsolationTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTISOLATION_1000
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 32 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotIsolationTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(32, 0);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 1;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotIsolationTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTISOLATION_1100
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 63 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotIsolationTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(63, 0);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 1;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotIsolationTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTISOLATION_1200
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 64 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotIsolationTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(64, 0);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 1;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotIsolationTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTISOLATION_1300
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 127 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotIsolationTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(127, 0);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 1;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotIsolationTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTISOLATION_1400
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 128 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotIsolationTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(128, 0);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 1;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotIsolationTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTISOLATION_1500
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 255 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotIsolationTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(255, 0);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 1;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });
  });
}
