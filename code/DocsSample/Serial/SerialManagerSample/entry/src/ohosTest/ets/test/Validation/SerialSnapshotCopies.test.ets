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

export default function SerialSnapshotCopiesTest(): void {
  describe('SerialSnapshotCopiesTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialSnapshotCopies', 'begin');
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
      logSuite('SerialSnapshotCopies', 'end');
    });

    /**
     * @tc.name SerialSnapshotCopiesTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_0100
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 64 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(64, 1);
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
     * @tc.name SerialSnapshotCopiesTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_0200
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 127 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(127, 1);
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
     * @tc.name SerialSnapshotCopiesTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_0300
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 128 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(128, 1);
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
     * @tc.name SerialSnapshotCopiesTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_0400
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 255 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(255, 1);
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
     * @tc.name SerialSnapshotCopiesTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_0500
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 256 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(256, 1);
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
     * @tc.name SerialSnapshotCopiesTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_0600
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 511 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(511, 1);
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
     * @tc.name SerialSnapshotCopiesTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_0700
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 512 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(512, 1);
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
     * @tc.name SerialSnapshotCopiesTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_0800
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 1023 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(1023, 1);
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
     * @tc.name SerialSnapshotCopiesTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_0900
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 1024 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(1024, 1);
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
     * @tc.name SerialSnapshotCopiesTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_1000
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 2048 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(2048, 1);
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
     * @tc.name SerialSnapshotCopiesTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_1100
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 4095 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(4095, 1);
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
     * @tc.name SerialSnapshotCopiesTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_1200
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 4096 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(4096, 1);
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
     * @tc.name SerialSnapshotCopiesTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_1300
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 1 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(1, 2);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 3;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotCopiesTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_1400
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 2 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(2, 2);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 3;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotCopiesTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_1500
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 3 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(3, 2);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 3;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotCopiesTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_1600
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 4 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(4, 2);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 3;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotCopiesTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_1700
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 5 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(5, 2);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 3;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotCopiesTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_1800
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 7 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(7, 2);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 3;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotCopiesTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_1900
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 8 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(8, 2);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 3;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotCopiesTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_2000
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 16 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(16, 2);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 3;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotCopiesTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_2100
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 31 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(31, 2);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 3;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotCopiesTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_2200
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 32 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(32, 2);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 3;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotCopiesTest023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_2300
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 63 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(63, 2);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 3;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotCopiesTest024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_2400
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 64 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(64, 2);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 3;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotCopiesTest025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_2500
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 127 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(127, 2);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 3;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotCopiesTest026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_2600
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 128 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(128, 2);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 3;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotCopiesTest027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_2700
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 255 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(255, 2);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 3;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotCopiesTest028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_2800
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 256 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(256, 2);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 3;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotCopiesTest029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_2900
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 511 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(511, 2);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 3;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotCopiesTest030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_3000
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 512 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(512, 2);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 3;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotCopiesTest031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_3100
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 1023 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(1023, 2);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 3;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotCopiesTest032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_3200
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 1024 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(1024, 2);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 3;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotCopiesTest033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_3300
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 2048 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(2048, 2);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 3;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotCopiesTest034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_3400
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 4095 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(4095, 2);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 3;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotCopiesTest035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_3500
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 4096 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(4096, 2);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 3;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotCopiesTest036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_3600
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 1 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(1, 3);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 4;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotCopiesTest037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_3700
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 2 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(2, 3);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 4;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotCopiesTest038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_3800
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 3 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(3, 3);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 4;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotCopiesTest039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_3900
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 4 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(4, 3);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 4;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotCopiesTest040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_4000
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 5 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(5, 3);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 4;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotCopiesTest041
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_4100
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 7 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(7, 3);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 4;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotCopiesTest042
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_4200
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 8 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(8, 3);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 4;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotCopiesTest043
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_4300
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 16 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(16, 3);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 4;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSnapshotCopiesTest044
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSNAPSHOTCOPIES_4400
     * @tc.desc snapshot returns independent lastData storage after onDataRead of 31 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSnapshotCopiesTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(31, 3);
      fixture.port.emitData(bytes);
      const first = fixture.controller.snapshot();
      const second = fixture.controller.snapshot();
      expect(first === second).assertFalse();
      expect(first.lastData === second.lastData).assertFalse();
      first.lastData[0] = 4;
      first.portName = 'modified-snapshot';
      first.opened = false;
      expectBytes(second.lastData, Array.from(bytes));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expectSession(fixture);
    });
  });
}
