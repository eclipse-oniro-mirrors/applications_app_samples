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

export default function SerialBufferControlTest(): void {
  describe('SerialBufferControlTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialBufferControl', 'begin');
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
      logSuite('SerialBufferControl', 'end');
    });

    /**
     * @tc.name SerialBufferControlTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALBUFFERCONTROL_0100
     * @tc.desc write flush drain sendBrk execute in submission order for 2048 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialBufferControlTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(2048, 1));
      const write: Promise<number> = fixture.controller.write(payload(2048, 1));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(2048);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(2048, 1)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(2048, 1)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2048);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2048);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialBufferControlTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALBUFFERCONTROL_0200
     * @tc.desc write drain flush sendBrk execute in submission order for 4095 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialBufferControlTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(4095, 1));
      const write: Promise<number> = fixture.controller.write(payload(4095, 1));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(4095);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(4095, 1)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4095, 1)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4095);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4095);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialBufferControlTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALBUFFERCONTROL_0300
     * @tc.desc write flush drain sendBrk execute in submission order for 4096 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialBufferControlTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(4096, 1));
      const write: Promise<number> = fixture.controller.write(payload(4096, 1));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(4096);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(4096, 1)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4096, 1)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4096);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4096);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialBufferControlTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALBUFFERCONTROL_0400
     * @tc.desc write drain flush sendBrk execute in submission order for 1 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialBufferControlTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(1, 2));
      const write: Promise<number> = fixture.controller.write(payload(1, 2));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(1);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(1, 2)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1, 2)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialBufferControlTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALBUFFERCONTROL_0500
     * @tc.desc write flush drain sendBrk execute in submission order for 2 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialBufferControlTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(2, 2));
      const write: Promise<number> = fixture.controller.write(payload(2, 2));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(2);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(2, 2)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(2, 2)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialBufferControlTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALBUFFERCONTROL_0600
     * @tc.desc write drain flush sendBrk execute in submission order for 3 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialBufferControlTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(3, 2));
      const write: Promise<number> = fixture.controller.write(payload(3, 2));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(3);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(3, 2)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(3, 2)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialBufferControlTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALBUFFERCONTROL_0700
     * @tc.desc write flush drain sendBrk execute in submission order for 4 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialBufferControlTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(4, 2));
      const write: Promise<number> = fixture.controller.write(payload(4, 2));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(4);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(4, 2)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4, 2)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialBufferControlTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALBUFFERCONTROL_0800
     * @tc.desc write drain flush sendBrk execute in submission order for 5 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialBufferControlTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(5, 2));
      const write: Promise<number> = fixture.controller.write(payload(5, 2));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(5);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(5, 2)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(5, 2)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialBufferControlTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALBUFFERCONTROL_0900
     * @tc.desc write flush drain sendBrk execute in submission order for 7 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialBufferControlTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(7, 2));
      const write: Promise<number> = fixture.controller.write(payload(7, 2));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(7);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(7, 2)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(7, 2)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialBufferControlTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALBUFFERCONTROL_1000
     * @tc.desc write drain flush sendBrk execute in submission order for 8 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialBufferControlTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(8, 2));
      const write: Promise<number> = fixture.controller.write(payload(8, 2));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(8);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(8, 2)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(8, 2)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialBufferControlTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALBUFFERCONTROL_1100
     * @tc.desc write flush drain sendBrk execute in submission order for 16 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialBufferControlTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(16, 2));
      const write: Promise<number> = fixture.controller.write(payload(16, 2));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(16);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(16, 2)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(16, 2)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(16);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialBufferControlTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALBUFFERCONTROL_1200
     * @tc.desc write drain flush sendBrk execute in submission order for 31 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialBufferControlTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(31, 2));
      const write: Promise<number> = fixture.controller.write(payload(31, 2));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(31);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(31, 2)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(31, 2)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(31);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(31);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialBufferControlTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALBUFFERCONTROL_1300
     * @tc.desc write flush drain sendBrk execute in submission order for 32 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialBufferControlTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(32, 2));
      const write: Promise<number> = fixture.controller.write(payload(32, 2));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(32);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(32, 2)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(32, 2)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(32);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialBufferControlTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALBUFFERCONTROL_1400
     * @tc.desc write drain flush sendBrk execute in submission order for 63 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialBufferControlTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(63, 2));
      const write: Promise<number> = fixture.controller.write(payload(63, 2));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(63);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(63, 2)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(63, 2)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(63);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(63);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialBufferControlTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALBUFFERCONTROL_1500
     * @tc.desc write flush drain sendBrk execute in submission order for 64 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialBufferControlTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(64, 2));
      const write: Promise<number> = fixture.controller.write(payload(64, 2));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(64);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(64, 2)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(64, 2)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(64);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialBufferControlTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALBUFFERCONTROL_1600
     * @tc.desc write drain flush sendBrk execute in submission order for 127 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialBufferControlTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(127, 2));
      const write: Promise<number> = fixture.controller.write(payload(127, 2));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(127);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(127, 2)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(127, 2)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(127);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(127);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialBufferControlTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALBUFFERCONTROL_1700
     * @tc.desc write flush drain sendBrk execute in submission order for 128 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialBufferControlTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(128, 2));
      const write: Promise<number> = fixture.controller.write(payload(128, 2));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(128);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(128, 2)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(128, 2)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(128);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(128);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialBufferControlTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALBUFFERCONTROL_1800
     * @tc.desc write drain flush sendBrk execute in submission order for 255 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialBufferControlTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(255, 2));
      const write: Promise<number> = fixture.controller.write(payload(255, 2));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(255);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(255, 2)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(255, 2)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(255);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(255);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialBufferControlTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALBUFFERCONTROL_1900
     * @tc.desc write flush drain sendBrk execute in submission order for 256 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialBufferControlTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(256, 2));
      const write: Promise<number> = fixture.controller.write(payload(256, 2));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(256);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(256, 2)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(256, 2)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(256);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(256);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialBufferControlTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALBUFFERCONTROL_2000
     * @tc.desc write drain flush sendBrk execute in submission order for 511 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialBufferControlTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(511, 2));
      const write: Promise<number> = fixture.controller.write(payload(511, 2));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(511);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(511, 2)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(511, 2)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(511);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(511);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialBufferControlTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALBUFFERCONTROL_2100
     * @tc.desc write flush drain sendBrk execute in submission order for 512 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialBufferControlTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(512, 2));
      const write: Promise<number> = fixture.controller.write(payload(512, 2));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(512);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(512, 2)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(512, 2)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(512);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(512);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialBufferControlTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALBUFFERCONTROL_2200
     * @tc.desc write drain flush sendBrk execute in submission order for 1023 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialBufferControlTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(1023, 2));
      const write: Promise<number> = fixture.controller.write(payload(1023, 2));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(1023);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(1023, 2)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1023, 2)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1023);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1023);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialBufferControlTest023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALBUFFERCONTROL_2300
     * @tc.desc write flush drain sendBrk execute in submission order for 1024 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialBufferControlTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(1024, 2));
      const write: Promise<number> = fixture.controller.write(payload(1024, 2));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(1024);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(1024, 2)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1024, 2)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1024);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1024);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialBufferControlTest024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALBUFFERCONTROL_2400
     * @tc.desc write drain flush sendBrk execute in submission order for 2048 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialBufferControlTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(2048, 2));
      const write: Promise<number> = fixture.controller.write(payload(2048, 2));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(2048);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(2048, 2)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(2048, 2)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2048);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2048);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialBufferControlTest025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALBUFFERCONTROL_2500
     * @tc.desc write flush drain sendBrk execute in submission order for 4095 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialBufferControlTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(4095, 2));
      const write: Promise<number> = fixture.controller.write(payload(4095, 2));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(4095);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(4095, 2)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4095, 2)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4095);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4095);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialBufferControlTest026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALBUFFERCONTROL_2600
     * @tc.desc write drain flush sendBrk execute in submission order for 4096 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialBufferControlTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(4096, 2));
      const write: Promise<number> = fixture.controller.write(payload(4096, 2));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(4096);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(4096, 2)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4096, 2)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4096);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4096);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialBufferControlTest027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALBUFFERCONTROL_2700
     * @tc.desc write flush drain sendBrk execute in submission order for 1 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialBufferControlTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(1, 3));
      const write: Promise<number> = fixture.controller.write(payload(1, 3));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(1);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(1, 3)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1, 3)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialBufferControlTest028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALBUFFERCONTROL_2800
     * @tc.desc write drain flush sendBrk execute in submission order for 2 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialBufferControlTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(2, 3));
      const write: Promise<number> = fixture.controller.write(payload(2, 3));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(2);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(2, 3)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(2, 3)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialBufferControlTest029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALBUFFERCONTROL_2900
     * @tc.desc write flush drain sendBrk execute in submission order for 3 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialBufferControlTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(3, 3));
      const write: Promise<number> = fixture.controller.write(payload(3, 3));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(3);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(3, 3)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(3, 3)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialBufferControlTest030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALBUFFERCONTROL_3000
     * @tc.desc write drain flush sendBrk execute in submission order for 4 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialBufferControlTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(4, 3));
      const write: Promise<number> = fixture.controller.write(payload(4, 3));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(4);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(4, 3)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4, 3)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialBufferControlTest031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALBUFFERCONTROL_3100
     * @tc.desc write flush drain sendBrk execute in submission order for 5 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialBufferControlTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(5, 3));
      const write: Promise<number> = fixture.controller.write(payload(5, 3));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(5);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(5, 3)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(5, 3)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
      expectSession(fixture);
    });
  });
}
