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

export default function SerialPortConsistencyTest(): void {
  describe('SerialPortConsistencyTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialPortConsistency', 'begin');
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
      logSuite('SerialPortConsistency', 'end');
    });

    /**
     * @tc.name SerialPortConsistencyTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONSISTENCY_0100
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 256 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConsistencyTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(256, 0);
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
     * @tc.name SerialPortConsistencyTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONSISTENCY_0200
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 511 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConsistencyTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(511, 0);
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
     * @tc.name SerialPortConsistencyTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONSISTENCY_0300
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 512 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConsistencyTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(512, 0);
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
     * @tc.name SerialPortConsistencyTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONSISTENCY_0400
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 1023 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConsistencyTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(1023, 0);
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
     * @tc.name SerialPortConsistencyTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONSISTENCY_0500
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 1024 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConsistencyTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(1024, 0);
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
     * @tc.name SerialPortConsistencyTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONSISTENCY_0600
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 2048 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConsistencyTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(2048, 0);
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
     * @tc.name SerialPortConsistencyTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONSISTENCY_0700
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 4095 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConsistencyTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(4095, 0);
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
     * @tc.name SerialPortConsistencyTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONSISTENCY_0800
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 4096 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConsistencyTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(4096, 0);
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
     * @tc.name SerialPortConsistencyTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONSISTENCY_0900
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 1 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConsistencyTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(1, 1);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 2;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConsistencyTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONSISTENCY_1000
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 2 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConsistencyTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(2, 1);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 2;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConsistencyTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONSISTENCY_1100
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 3 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConsistencyTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(3, 1);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 2;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConsistencyTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONSISTENCY_1200
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 4 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConsistencyTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(4, 1);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 2;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConsistencyTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONSISTENCY_1300
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 5 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConsistencyTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(5, 1);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 2;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConsistencyTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONSISTENCY_1400
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 7 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConsistencyTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(7, 1);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 2;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConsistencyTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONSISTENCY_1500
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 8 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConsistencyTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(8, 1);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 2;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConsistencyTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONSISTENCY_1600
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 16 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConsistencyTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(16, 1);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 2;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConsistencyTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONSISTENCY_1700
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 31 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConsistencyTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(31, 1);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 2;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConsistencyTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONSISTENCY_1800
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 32 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConsistencyTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(32, 1);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 2;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConsistencyTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONSISTENCY_1900
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 63 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConsistencyTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(63, 1);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 2;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });
  });
}
