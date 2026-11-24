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

export default function SerialPortFlowTest(): void {
  describe('SerialPortFlowTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialPortFlow', 'begin');
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
      logSuite('SerialPortFlow', 'end');
    });

    /**
     * @tc.name SerialPortFlowTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_0100
     * @tc.desc write drain flush sendBrk execute in submission order for 7 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(7, 3));
      const write: Promise<number> = fixture.controller.write(payload(7, 3));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(7);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(7, 3)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(7, 3)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_0200
     * @tc.desc write flush drain sendBrk execute in submission order for 8 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(8, 3));
      const write: Promise<number> = fixture.controller.write(payload(8, 3));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(8);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(8, 3)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(8, 3)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_0300
     * @tc.desc write drain flush sendBrk execute in submission order for 16 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(16, 3));
      const write: Promise<number> = fixture.controller.write(payload(16, 3));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(16);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(16, 3)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(16, 3)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(16);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_0400
     * @tc.desc write flush drain sendBrk execute in submission order for 31 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(31, 3));
      const write: Promise<number> = fixture.controller.write(payload(31, 3));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(31);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(31, 3)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(31, 3)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(31);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(31);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_0500
     * @tc.desc write drain flush sendBrk execute in submission order for 32 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(32, 3));
      const write: Promise<number> = fixture.controller.write(payload(32, 3));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(32);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(32, 3)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(32, 3)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(32);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_0600
     * @tc.desc write flush drain sendBrk execute in submission order for 63 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(63, 3));
      const write: Promise<number> = fixture.controller.write(payload(63, 3));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(63);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(63, 3)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(63, 3)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(63);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(63);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_0700
     * @tc.desc write drain flush sendBrk execute in submission order for 64 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(64, 3));
      const write: Promise<number> = fixture.controller.write(payload(64, 3));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(64);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(64, 3)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(64, 3)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(64);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_0800
     * @tc.desc write flush drain sendBrk execute in submission order for 127 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(127, 3));
      const write: Promise<number> = fixture.controller.write(payload(127, 3));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(127);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(127, 3)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(127, 3)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(127);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(127);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_0900
     * @tc.desc write drain flush sendBrk execute in submission order for 128 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(128, 3));
      const write: Promise<number> = fixture.controller.write(payload(128, 3));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(128);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(128, 3)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(128, 3)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(128);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(128);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_1000
     * @tc.desc write flush drain sendBrk execute in submission order for 255 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(255, 3));
      const write: Promise<number> = fixture.controller.write(payload(255, 3));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(255);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(255, 3)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(255, 3)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(255);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(255);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_1100
     * @tc.desc write drain flush sendBrk execute in submission order for 256 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(256, 3));
      const write: Promise<number> = fixture.controller.write(payload(256, 3));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(256);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(256, 3)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(256, 3)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(256);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(256);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_1200
     * @tc.desc write flush drain sendBrk execute in submission order for 511 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(511, 3));
      const write: Promise<number> = fixture.controller.write(payload(511, 3));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(511);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(511, 3)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(511, 3)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(511);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(511);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_1300
     * @tc.desc write drain flush sendBrk execute in submission order for 512 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(512, 3));
      const write: Promise<number> = fixture.controller.write(payload(512, 3));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(512);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(512, 3)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(512, 3)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(512);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(512);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_1400
     * @tc.desc write flush drain sendBrk execute in submission order for 1023 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(1023, 3));
      const write: Promise<number> = fixture.controller.write(payload(1023, 3));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(1023);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(1023, 3)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1023, 3)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1023);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1023);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_1500
     * @tc.desc write drain flush sendBrk execute in submission order for 1024 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(1024, 3));
      const write: Promise<number> = fixture.controller.write(payload(1024, 3));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(1024);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(1024, 3)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1024, 3)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1024);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1024);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_1600
     * @tc.desc write flush drain sendBrk execute in submission order for 2048 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(2048, 3));
      const write: Promise<number> = fixture.controller.write(payload(2048, 3));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(2048);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(2048, 3)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(2048, 3)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2048);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2048);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_1700
     * @tc.desc write drain flush sendBrk execute in submission order for 4095 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(4095, 3));
      const write: Promise<number> = fixture.controller.write(payload(4095, 3));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(4095);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(4095, 3)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4095, 3)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4095);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4095);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_1800
     * @tc.desc write flush drain sendBrk execute in submission order for 4096 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(4096, 3));
      const write: Promise<number> = fixture.controller.write(payload(4096, 3));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(4096);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(4096, 3)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4096, 3)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4096);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4096);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_1900
     * @tc.desc write drain flush sendBrk execute in submission order for 1 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(1, 4));
      const write: Promise<number> = fixture.controller.write(payload(1, 4));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(1);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(1, 4)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1, 4)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_2000
     * @tc.desc write flush drain sendBrk execute in submission order for 2 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(2, 4));
      const write: Promise<number> = fixture.controller.write(payload(2, 4));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(2);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(2, 4)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(2, 4)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_2100
     * @tc.desc write drain flush sendBrk execute in submission order for 3 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(3, 4));
      const write: Promise<number> = fixture.controller.write(payload(3, 4));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(3);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(3, 4)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(3, 4)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_2200
     * @tc.desc write flush drain sendBrk execute in submission order for 4 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(4, 4));
      const write: Promise<number> = fixture.controller.write(payload(4, 4));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(4);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(4, 4)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4, 4)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_2300
     * @tc.desc write drain flush sendBrk execute in submission order for 5 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(5, 4));
      const write: Promise<number> = fixture.controller.write(payload(5, 4));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(5);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(5, 4)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(5, 4)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_2400
     * @tc.desc write flush drain sendBrk execute in submission order for 7 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(7, 4));
      const write: Promise<number> = fixture.controller.write(payload(7, 4));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(7);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(7, 4)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(7, 4)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_2500
     * @tc.desc write drain flush sendBrk execute in submission order for 8 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(8, 4));
      const write: Promise<number> = fixture.controller.write(payload(8, 4));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(8);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(8, 4)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(8, 4)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_2600
     * @tc.desc write flush drain sendBrk execute in submission order for 16 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(16, 4));
      const write: Promise<number> = fixture.controller.write(payload(16, 4));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(16);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(16, 4)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(16, 4)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(16);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_2700
     * @tc.desc write drain flush sendBrk execute in submission order for 31 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(31, 4));
      const write: Promise<number> = fixture.controller.write(payload(31, 4));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(31);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(31, 4)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(31, 4)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(31);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(31);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_2800
     * @tc.desc write flush drain sendBrk execute in submission order for 32 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(32, 4));
      const write: Promise<number> = fixture.controller.write(payload(32, 4));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(32);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(32, 4)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(32, 4)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(32);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_2900
     * @tc.desc write drain flush sendBrk execute in submission order for 63 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(63, 4));
      const write: Promise<number> = fixture.controller.write(payload(63, 4));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(63);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(63, 4)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(63, 4)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(63);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(63);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_3000
     * @tc.desc write flush drain sendBrk execute in submission order for 64 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(64, 4));
      const write: Promise<number> = fixture.controller.write(payload(64, 4));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(64);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(64, 4)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(64, 4)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(64);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_3100
     * @tc.desc write drain flush sendBrk execute in submission order for 127 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(127, 4));
      const write: Promise<number> = fixture.controller.write(payload(127, 4));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(127);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(127, 4)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(127, 4)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(127);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(127);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_3200
     * @tc.desc write flush drain sendBrk execute in submission order for 128 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(128, 4));
      const write: Promise<number> = fixture.controller.write(payload(128, 4));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(128);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(128, 4)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(128, 4)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(128);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(128);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_3300
     * @tc.desc write drain flush sendBrk execute in submission order for 255 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(255, 4));
      const write: Promise<number> = fixture.controller.write(payload(255, 4));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(255);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(255, 4)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(255, 4)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(255);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(255);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_3400
     * @tc.desc write flush drain sendBrk execute in submission order for 256 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(256, 4));
      const write: Promise<number> = fixture.controller.write(payload(256, 4));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(256);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(256, 4)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(256, 4)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(256);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(256);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_3500
     * @tc.desc write drain flush sendBrk execute in submission order for 511 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(511, 4));
      const write: Promise<number> = fixture.controller.write(payload(511, 4));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(511);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(511, 4)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(511, 4)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(511);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(511);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_3600
     * @tc.desc write flush drain sendBrk execute in submission order for 512 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(512, 4));
      const write: Promise<number> = fixture.controller.write(payload(512, 4));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(512);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(512, 4)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(512, 4)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(512);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(512);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortFlowTest037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTFLOW_3700
     * @tc.desc write drain flush sendBrk execute in submission order for 1023 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortFlowTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(1023, 4));
      const write: Promise<number> = fixture.controller.write(payload(1023, 4));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(1023);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(1023, 4)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1023, 4)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1023);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1023);
      expectSession(fixture);
    });
  });
}
