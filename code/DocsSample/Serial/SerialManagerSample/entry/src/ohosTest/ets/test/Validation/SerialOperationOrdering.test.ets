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

export default function SerialOperationOrderingTest(): void {
  describe('SerialOperationOrderingTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialOperationOrdering', 'begin');
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
      logSuite('SerialOperationOrdering', 'end');
    });

    /**
     * @tc.name SerialOperationOrderingTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_0100
     * @tc.desc write flush drain sendBrk execute in submission order for 1024 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(1024, 4));
      const write: Promise<number> = fixture.controller.write(payload(1024, 4));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(1024);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(1024, 4)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1024, 4)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1024);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1024);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_0200
     * @tc.desc write drain flush sendBrk execute in submission order for 2048 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(2048, 4));
      const write: Promise<number> = fixture.controller.write(payload(2048, 4));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(2048);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(2048, 4)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(2048, 4)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2048);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2048);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_0300
     * @tc.desc write flush drain sendBrk execute in submission order for 4095 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(4095, 4));
      const write: Promise<number> = fixture.controller.write(payload(4095, 4));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(4095);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(4095, 4)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4095, 4)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4095);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4095);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_0400
     * @tc.desc write drain flush sendBrk execute in submission order for 4096 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(4096, 4));
      const write: Promise<number> = fixture.controller.write(payload(4096, 4));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(4096);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(4096, 4)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4096, 4)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4096);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4096);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_0500
     * @tc.desc write flush drain sendBrk execute in submission order for 1 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(1, 5));
      const write: Promise<number> = fixture.controller.write(payload(1, 5));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(1);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(1, 5)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1, 5)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_0600
     * @tc.desc write drain flush sendBrk execute in submission order for 2 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(2, 5));
      const write: Promise<number> = fixture.controller.write(payload(2, 5));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(2);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(2, 5)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(2, 5)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_0700
     * @tc.desc write flush drain sendBrk execute in submission order for 3 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(3, 5));
      const write: Promise<number> = fixture.controller.write(payload(3, 5));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(3);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(3, 5)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(3, 5)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_0800
     * @tc.desc write drain flush sendBrk execute in submission order for 4 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(4, 5));
      const write: Promise<number> = fixture.controller.write(payload(4, 5));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(4);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(4, 5)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4, 5)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_0900
     * @tc.desc write flush drain sendBrk execute in submission order for 5 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(5, 5));
      const write: Promise<number> = fixture.controller.write(payload(5, 5));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(5);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(5, 5)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(5, 5)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_1000
     * @tc.desc write drain flush sendBrk execute in submission order for 7 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(7, 5));
      const write: Promise<number> = fixture.controller.write(payload(7, 5));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(7);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(7, 5)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(7, 5)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_1100
     * @tc.desc write flush drain sendBrk execute in submission order for 8 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(8, 5));
      const write: Promise<number> = fixture.controller.write(payload(8, 5));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(8);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(8, 5)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(8, 5)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_1200
     * @tc.desc write drain flush sendBrk execute in submission order for 16 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(16, 5));
      const write: Promise<number> = fixture.controller.write(payload(16, 5));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(16);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(16, 5)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(16, 5)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(16);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_1300
     * @tc.desc write flush drain sendBrk execute in submission order for 31 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(31, 5));
      const write: Promise<number> = fixture.controller.write(payload(31, 5));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(31);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(31, 5)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(31, 5)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(31);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(31);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_1400
     * @tc.desc write drain flush sendBrk execute in submission order for 32 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(32, 5));
      const write: Promise<number> = fixture.controller.write(payload(32, 5));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(32);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(32, 5)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(32, 5)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(32);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_1500
     * @tc.desc write flush drain sendBrk execute in submission order for 63 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(63, 5));
      const write: Promise<number> = fixture.controller.write(payload(63, 5));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(63);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(63, 5)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(63, 5)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(63);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(63);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_1600
     * @tc.desc write drain flush sendBrk execute in submission order for 64 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(64, 5));
      const write: Promise<number> = fixture.controller.write(payload(64, 5));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(64);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(64, 5)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(64, 5)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(64);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_1700
     * @tc.desc write flush drain sendBrk execute in submission order for 127 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(127, 5));
      const write: Promise<number> = fixture.controller.write(payload(127, 5));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(127);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(127, 5)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(127, 5)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(127);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(127);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_1800
     * @tc.desc write drain flush sendBrk execute in submission order for 128 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(128, 5));
      const write: Promise<number> = fixture.controller.write(payload(128, 5));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(128);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(128, 5)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(128, 5)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(128);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(128);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_1900
     * @tc.desc write flush drain sendBrk execute in submission order for 255 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(255, 5));
      const write: Promise<number> = fixture.controller.write(payload(255, 5));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(255);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(255, 5)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(255, 5)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(255);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(255);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_2000
     * @tc.desc write drain flush sendBrk execute in submission order for 256 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(256, 5));
      const write: Promise<number> = fixture.controller.write(payload(256, 5));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(256);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(256, 5)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(256, 5)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(256);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(256);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_2100
     * @tc.desc write flush drain sendBrk execute in submission order for 511 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(511, 5));
      const write: Promise<number> = fixture.controller.write(payload(511, 5));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(511);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(511, 5)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(511, 5)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(511);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(511);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_2200
     * @tc.desc write drain flush sendBrk execute in submission order for 512 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(512, 5));
      const write: Promise<number> = fixture.controller.write(payload(512, 5));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(512);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(512, 5)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(512, 5)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(512);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(512);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_2300
     * @tc.desc write flush drain sendBrk execute in submission order for 1023 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(1023, 5));
      const write: Promise<number> = fixture.controller.write(payload(1023, 5));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(1023);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(1023, 5)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1023, 5)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1023);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1023);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_2400
     * @tc.desc write drain flush sendBrk execute in submission order for 1024 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(1024, 5));
      const write: Promise<number> = fixture.controller.write(payload(1024, 5));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(1024);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(1024, 5)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1024, 5)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1024);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1024);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_2500
     * @tc.desc write flush drain sendBrk execute in submission order for 2048 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(2048, 5));
      const write: Promise<number> = fixture.controller.write(payload(2048, 5));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(2048);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(2048, 5)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(2048, 5)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2048);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2048);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_2600
     * @tc.desc write drain flush sendBrk execute in submission order for 4095 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(4095, 5));
      const write: Promise<number> = fixture.controller.write(payload(4095, 5));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(4095);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(4095, 5)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4095, 5)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4095);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4095);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_2700
     * @tc.desc write flush drain sendBrk execute in submission order for 4096 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(4096, 5));
      const write: Promise<number> = fixture.controller.write(payload(4096, 5));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(4096);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(4096, 5)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4096, 5)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4096);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4096);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_2800
     * @tc.desc write drain flush sendBrk execute in submission order for 1 bytes seed 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(1, 6));
      const write: Promise<number> = fixture.controller.write(payload(1, 6));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(1);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(1, 6)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1, 6)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_2900
     * @tc.desc write flush drain sendBrk execute in submission order for 2 bytes seed 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(2, 6));
      const write: Promise<number> = fixture.controller.write(payload(2, 6));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(2);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(2, 6)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(2, 6)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_3000
     * @tc.desc write drain flush sendBrk execute in submission order for 3 bytes seed 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(3, 6));
      const write: Promise<number> = fixture.controller.write(payload(3, 6));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(3);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(3, 6)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(3, 6)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_3100
     * @tc.desc write flush drain sendBrk execute in submission order for 4 bytes seed 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(4, 6));
      const write: Promise<number> = fixture.controller.write(payload(4, 6));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(4);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(4, 6)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4, 6)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_3200
     * @tc.desc write drain flush sendBrk execute in submission order for 5 bytes seed 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(5, 6));
      const write: Promise<number> = fixture.controller.write(payload(5, 6));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(5);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(5, 6)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(5, 6)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_3300
     * @tc.desc write flush drain sendBrk execute in submission order for 7 bytes seed 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(7, 6));
      const write: Promise<number> = fixture.controller.write(payload(7, 6));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(7);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(7, 6)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(7, 6)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_3400
     * @tc.desc write drain flush sendBrk execute in submission order for 8 bytes seed 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(8, 6));
      const write: Promise<number> = fixture.controller.write(payload(8, 6));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(8);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(8, 6)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(8, 6)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_3500
     * @tc.desc write flush drain sendBrk execute in submission order for 16 bytes seed 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(16, 6));
      const write: Promise<number> = fixture.controller.write(payload(16, 6));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(16);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(16, 6)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(16, 6)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(16);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_3600
     * @tc.desc write drain flush sendBrk execute in submission order for 31 bytes seed 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(31, 6));
      const write: Promise<number> = fixture.controller.write(payload(31, 6));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(31);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(31, 6)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(31, 6)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(31);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(31);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_3700
     * @tc.desc write flush drain sendBrk execute in submission order for 32 bytes seed 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(32, 6));
      const write: Promise<number> = fixture.controller.write(payload(32, 6));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(32);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(32, 6)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(32, 6)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(32);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_3800
     * @tc.desc write drain flush sendBrk execute in submission order for 63 bytes seed 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(63, 6));
      const write: Promise<number> = fixture.controller.write(payload(63, 6));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(63);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(63, 6)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(63, 6)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(63);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(63);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_3900
     * @tc.desc write flush drain sendBrk execute in submission order for 64 bytes seed 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(64, 6));
      const write: Promise<number> = fixture.controller.write(payload(64, 6));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(64);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(64, 6)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(64, 6)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(64);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_4000
     * @tc.desc write drain flush sendBrk execute in submission order for 127 bytes seed 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(127, 6));
      const write: Promise<number> = fixture.controller.write(payload(127, 6));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(127);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(127, 6)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(127, 6)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(127);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(127);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest041
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_4100
     * @tc.desc write flush drain sendBrk execute in submission order for 128 bytes seed 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(128, 6));
      const write: Promise<number> = fixture.controller.write(payload(128, 6));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(128);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(128, 6)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(128, 6)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(128);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(128);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest042
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_4200
     * @tc.desc write drain flush sendBrk execute in submission order for 255 bytes seed 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(255, 6));
      const write: Promise<number> = fixture.controller.write(payload(255, 6));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(255);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(255, 6)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(255, 6)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(255);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(255);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest043
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_4300
     * @tc.desc write flush drain sendBrk execute in submission order for 256 bytes seed 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(256, 6));
      const write: Promise<number> = fixture.controller.write(payload(256, 6));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(256);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(256, 6)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(256, 6)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(256);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(256);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest044
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_4400
     * @tc.desc write drain flush sendBrk execute in submission order for 511 bytes seed 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(511, 6));
      const write: Promise<number> = fixture.controller.write(payload(511, 6));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(511);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(511, 6)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(511, 6)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(511);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(511);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest045
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_4500
     * @tc.desc write flush drain sendBrk execute in submission order for 512 bytes seed 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(512, 6));
      const write: Promise<number> = fixture.controller.write(payload(512, 6));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(512);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(512, 6)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(512, 6)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(512);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(512);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest046
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_4600
     * @tc.desc write drain flush sendBrk execute in submission order for 1023 bytes seed 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(1023, 6));
      const write: Promise<number> = fixture.controller.write(payload(1023, 6));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(1023);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(1023, 6)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1023, 6)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1023);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1023);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest047
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_4700
     * @tc.desc write flush drain sendBrk execute in submission order for 1024 bytes seed 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(1024, 6));
      const write: Promise<number> = fixture.controller.write(payload(1024, 6));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(1024);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(1024, 6)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1024, 6)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1024);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1024);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest048
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_4800
     * @tc.desc write drain flush sendBrk execute in submission order for 2048 bytes seed 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(2048, 6));
      const write: Promise<number> = fixture.controller.write(payload(2048, 6));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(2048);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(2048, 6)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(2048, 6)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2048);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2048);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOperationOrderingTest049
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPERATIONORDERING_4900
     * @tc.desc write flush drain sendBrk execute in submission order for 4095 bytes seed 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOperationOrderingTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(4095, 6));
      const write: Promise<number> = fixture.controller.write(payload(4095, 6));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(4095);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(4095, 6)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4095, 6)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4095);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4095);
      expectSession(fixture);
    });
  });
}
