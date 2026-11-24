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

export default function SerialQueuedOperationsTest(): void {
  describe('SerialQueuedOperationsTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialQueuedOperations', 'begin');
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
      logSuite('SerialQueuedOperations', 'end');
    });

    /**
     * @tc.name SerialQueuedOperationsTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEDOPERATIONS_0100
     * @tc.desc write drain flush sendBrk execute in submission order for 127 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueuedOperationsTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(127, 0));
      const write: Promise<number> = fixture.controller.write(payload(127, 0));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(127);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(127, 0)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(127, 0)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(127);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(127);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueuedOperationsTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEDOPERATIONS_0200
     * @tc.desc write flush drain sendBrk execute in submission order for 128 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueuedOperationsTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(128, 0));
      const write: Promise<number> = fixture.controller.write(payload(128, 0));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(128);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(128, 0)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(128, 0)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(128);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(128);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueuedOperationsTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEDOPERATIONS_0300
     * @tc.desc write drain flush sendBrk execute in submission order for 255 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueuedOperationsTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(255, 0));
      const write: Promise<number> = fixture.controller.write(payload(255, 0));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(255);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(255, 0)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(255, 0)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(255);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(255);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueuedOperationsTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEDOPERATIONS_0400
     * @tc.desc write flush drain sendBrk execute in submission order for 256 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueuedOperationsTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(256, 0));
      const write: Promise<number> = fixture.controller.write(payload(256, 0));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(256);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(256, 0)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(256, 0)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(256);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(256);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueuedOperationsTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEDOPERATIONS_0500
     * @tc.desc write drain flush sendBrk execute in submission order for 511 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueuedOperationsTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(511, 0));
      const write: Promise<number> = fixture.controller.write(payload(511, 0));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(511);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(511, 0)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(511, 0)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(511);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(511);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueuedOperationsTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEDOPERATIONS_0600
     * @tc.desc write flush drain sendBrk execute in submission order for 512 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueuedOperationsTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(512, 0));
      const write: Promise<number> = fixture.controller.write(payload(512, 0));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(512);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(512, 0)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(512, 0)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(512);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(512);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueuedOperationsTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEDOPERATIONS_0700
     * @tc.desc write drain flush sendBrk execute in submission order for 1023 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueuedOperationsTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(1023, 0));
      const write: Promise<number> = fixture.controller.write(payload(1023, 0));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(1023);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(1023, 0)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1023, 0)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1023);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1023);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueuedOperationsTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEDOPERATIONS_0800
     * @tc.desc write flush drain sendBrk execute in submission order for 1024 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueuedOperationsTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(1024, 0));
      const write: Promise<number> = fixture.controller.write(payload(1024, 0));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(1024);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(1024, 0)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1024, 0)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1024);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1024);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueuedOperationsTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEDOPERATIONS_0900
     * @tc.desc write drain flush sendBrk execute in submission order for 2048 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueuedOperationsTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(2048, 0));
      const write: Promise<number> = fixture.controller.write(payload(2048, 0));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(2048);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(2048, 0)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(2048, 0)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2048);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2048);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueuedOperationsTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEDOPERATIONS_1000
     * @tc.desc write flush drain sendBrk execute in submission order for 4095 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueuedOperationsTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(4095, 0));
      const write: Promise<number> = fixture.controller.write(payload(4095, 0));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(4095);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(4095, 0)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4095, 0)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4095);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4095);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueuedOperationsTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEDOPERATIONS_1100
     * @tc.desc write drain flush sendBrk execute in submission order for 4096 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueuedOperationsTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(4096, 0));
      const write: Promise<number> = fixture.controller.write(payload(4096, 0));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(4096);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(4096, 0)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4096, 0)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4096);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4096);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueuedOperationsTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEDOPERATIONS_1200
     * @tc.desc write flush drain sendBrk execute in submission order for 1 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueuedOperationsTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(1, 1));
      const write: Promise<number> = fixture.controller.write(payload(1, 1));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(1);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(1, 1)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1, 1)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueuedOperationsTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEDOPERATIONS_1300
     * @tc.desc write drain flush sendBrk execute in submission order for 2 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueuedOperationsTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(2, 1));
      const write: Promise<number> = fixture.controller.write(payload(2, 1));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(2);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(2, 1)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(2, 1)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueuedOperationsTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEDOPERATIONS_1400
     * @tc.desc write flush drain sendBrk execute in submission order for 3 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueuedOperationsTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(3, 1));
      const write: Promise<number> = fixture.controller.write(payload(3, 1));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(3);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(3, 1)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(3, 1)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueuedOperationsTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEDOPERATIONS_1500
     * @tc.desc write drain flush sendBrk execute in submission order for 4 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueuedOperationsTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(4, 1));
      const write: Promise<number> = fixture.controller.write(payload(4, 1));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(4);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(4, 1)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4, 1)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueuedOperationsTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEDOPERATIONS_1600
     * @tc.desc write flush drain sendBrk execute in submission order for 5 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueuedOperationsTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(5, 1));
      const write: Promise<number> = fixture.controller.write(payload(5, 1));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(5);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(5, 1)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(5, 1)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueuedOperationsTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEDOPERATIONS_1700
     * @tc.desc write drain flush sendBrk execute in submission order for 7 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueuedOperationsTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(7, 1));
      const write: Promise<number> = fixture.controller.write(payload(7, 1));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(7);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(7, 1)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(7, 1)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueuedOperationsTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEDOPERATIONS_1800
     * @tc.desc write flush drain sendBrk execute in submission order for 8 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueuedOperationsTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(8, 1));
      const write: Promise<number> = fixture.controller.write(payload(8, 1));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(8);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(8, 1)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(8, 1)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueuedOperationsTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEDOPERATIONS_1900
     * @tc.desc write drain flush sendBrk execute in submission order for 16 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueuedOperationsTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(16, 1));
      const write: Promise<number> = fixture.controller.write(payload(16, 1));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(16);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(16, 1)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(16, 1)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(16);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueuedOperationsTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEDOPERATIONS_2000
     * @tc.desc write flush drain sendBrk execute in submission order for 31 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueuedOperationsTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(31, 1));
      const write: Promise<number> = fixture.controller.write(payload(31, 1));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(31);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(31, 1)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(31, 1)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(31);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(31);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueuedOperationsTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEDOPERATIONS_2100
     * @tc.desc write drain flush sendBrk execute in submission order for 32 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueuedOperationsTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(32, 1));
      const write: Promise<number> = fixture.controller.write(payload(32, 1));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(32);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(32, 1)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(32, 1)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(32);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueuedOperationsTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEDOPERATIONS_2200
     * @tc.desc write flush drain sendBrk execute in submission order for 63 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueuedOperationsTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(63, 1));
      const write: Promise<number> = fixture.controller.write(payload(63, 1));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(63);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(63, 1)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(63, 1)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(63);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(63);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueuedOperationsTest023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEDOPERATIONS_2300
     * @tc.desc write drain flush sendBrk execute in submission order for 64 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueuedOperationsTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(64, 1));
      const write: Promise<number> = fixture.controller.write(payload(64, 1));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(64);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(64, 1)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(64, 1)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(64);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueuedOperationsTest024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEDOPERATIONS_2400
     * @tc.desc write flush drain sendBrk execute in submission order for 127 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueuedOperationsTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(127, 1));
      const write: Promise<number> = fixture.controller.write(payload(127, 1));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(127);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(127, 1)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(127, 1)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(127);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(127);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueuedOperationsTest025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEDOPERATIONS_2500
     * @tc.desc write drain flush sendBrk execute in submission order for 128 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueuedOperationsTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(128, 1));
      const write: Promise<number> = fixture.controller.write(payload(128, 1));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(128);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(128, 1)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(128, 1)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(128);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(128);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueuedOperationsTest026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEDOPERATIONS_2600
     * @tc.desc write flush drain sendBrk execute in submission order for 255 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueuedOperationsTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(255, 1));
      const write: Promise<number> = fixture.controller.write(payload(255, 1));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(255);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(255, 1)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(255, 1)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(255);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(255);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueuedOperationsTest027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEDOPERATIONS_2700
     * @tc.desc write drain flush sendBrk execute in submission order for 256 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueuedOperationsTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(256, 1));
      const write: Promise<number> = fixture.controller.write(payload(256, 1));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(256);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(256, 1)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(256, 1)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(256);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(256);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueuedOperationsTest028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEDOPERATIONS_2800
     * @tc.desc write flush drain sendBrk execute in submission order for 511 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueuedOperationsTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(511, 1));
      const write: Promise<number> = fixture.controller.write(payload(511, 1));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(511);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(511, 1)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(511, 1)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(511);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(511);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueuedOperationsTest029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEDOPERATIONS_2900
     * @tc.desc write drain flush sendBrk execute in submission order for 512 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueuedOperationsTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(512, 1));
      const write: Promise<number> = fixture.controller.write(payload(512, 1));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(512);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(512, 1)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(512, 1)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(512);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(512);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueuedOperationsTest030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEDOPERATIONS_3000
     * @tc.desc write flush drain sendBrk execute in submission order for 1023 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueuedOperationsTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(1023, 1));
      const write: Promise<number> = fixture.controller.write(payload(1023, 1));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(1023);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(1023, 1)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1023, 1)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1023);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1023);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueuedOperationsTest031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEDOPERATIONS_3100
     * @tc.desc write drain flush sendBrk execute in submission order for 1024 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueuedOperationsTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(1024, 1));
      const write: Promise<number> = fixture.controller.write(payload(1024, 1));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(1024);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(1024, 1)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1024, 1)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1024);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1024);
      expectSession(fixture);
    });
  });
}
