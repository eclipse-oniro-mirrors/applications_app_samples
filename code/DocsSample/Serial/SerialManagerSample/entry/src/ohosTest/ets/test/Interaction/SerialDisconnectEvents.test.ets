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

export default function SerialDisconnectEventsTest(): void {
  describe('SerialDisconnectEventsTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialDisconnectEvents', 'begin');
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
      logSuite('SerialDisconnectEvents', 'end');
    });

    /**
     * @tc.name SerialDisconnectEventsTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_0100
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 1 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(1, 0));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(1, 0));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1, 0)));
      await expectFailure(async () => fixture.controller.write(payload(1, 0)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisconnectEventsTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_0200
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 2 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(2, 0));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(2, 0));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(2, 0)));
      await expectFailure(async () => fixture.controller.write(payload(2, 0)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisconnectEventsTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_0300
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 3 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(3, 0));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(3, 0));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(3);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(3, 0)));
      await expectFailure(async () => fixture.controller.write(payload(3, 0)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisconnectEventsTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_0400
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 4 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(4, 0));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(4, 0));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4, 0)));
      await expectFailure(async () => fixture.controller.write(payload(4, 0)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisconnectEventsTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_0500
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 5 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(5, 0));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(5, 0));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(5);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(5, 0)));
      await expectFailure(async () => fixture.controller.write(payload(5, 0)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisconnectEventsTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_0600
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 7 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(7, 0));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(7, 0));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(7);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(7, 0)));
      await expectFailure(async () => fixture.controller.write(payload(7, 0)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisconnectEventsTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_0700
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 8 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(8, 0));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(8, 0));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(8, 0)));
      await expectFailure(async () => fixture.controller.write(payload(8, 0)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisconnectEventsTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_0800
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 16 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(16, 0));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(16, 0));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(16);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(16, 0)));
      await expectFailure(async () => fixture.controller.write(payload(16, 0)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisconnectEventsTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_0900
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 31 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(31, 0));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(31, 0));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(31);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(31, 0)));
      await expectFailure(async () => fixture.controller.write(payload(31, 0)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisconnectEventsTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_1000
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 32 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(32, 0));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(32, 0));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(32);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(32, 0)));
      await expectFailure(async () => fixture.controller.write(payload(32, 0)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisconnectEventsTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_1100
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 63 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(63, 0));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(63, 0));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(63);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(63, 0)));
      await expectFailure(async () => fixture.controller.write(payload(63, 0)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisconnectEventsTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_1200
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 64 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(64, 0));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(64, 0));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(64);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(64, 0)));
      await expectFailure(async () => fixture.controller.write(payload(64, 0)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisconnectEventsTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_1300
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 127 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(127, 0));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(127, 0));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(127);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(127, 0)));
      await expectFailure(async () => fixture.controller.write(payload(127, 0)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisconnectEventsTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_1400
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 128 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(128, 0));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(128, 0));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(128);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(128, 0)));
      await expectFailure(async () => fixture.controller.write(payload(128, 0)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisconnectEventsTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_1500
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 255 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(255, 0));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(255, 0));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(255);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(255, 0)));
      await expectFailure(async () => fixture.controller.write(payload(255, 0)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisconnectEventsTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_1600
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 256 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(256, 0));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(256, 0));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(256);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(256, 0)));
      await expectFailure(async () => fixture.controller.write(payload(256, 0)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisconnectEventsTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_1700
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 511 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(511, 0));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(511, 0));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(511);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(511, 0)));
      await expectFailure(async () => fixture.controller.write(payload(511, 0)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisconnectEventsTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_1800
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 512 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(512, 0));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(512, 0));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(512);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(512, 0)));
      await expectFailure(async () => fixture.controller.write(payload(512, 0)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisconnectEventsTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_1900
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 1023 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(1023, 0));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(1023, 0));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1023);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1023, 0)));
      await expectFailure(async () => fixture.controller.write(payload(1023, 0)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisconnectEventsTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_2000
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 1024 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(1024, 0));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(1024, 0));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1024);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1024, 0)));
      await expectFailure(async () => fixture.controller.write(payload(1024, 0)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisconnectEventsTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_2100
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 2048 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(2048, 0));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(2048, 0));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2048);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(2048, 0)));
      await expectFailure(async () => fixture.controller.write(payload(2048, 0)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisconnectEventsTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_2200
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 4095 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(4095, 0));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(4095, 0));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4095);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4095, 0)));
      await expectFailure(async () => fixture.controller.write(payload(4095, 0)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisconnectEventsTest023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_2300
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 4096 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(4096, 0));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(4096, 0));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4096);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4096, 0)));
      await expectFailure(async () => fixture.controller.write(payload(4096, 0)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisconnectEventsTest024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_2400
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 1 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(1, 1));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(1, 1));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1, 1)));
      await expectFailure(async () => fixture.controller.write(payload(1, 1)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisconnectEventsTest025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_2500
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 2 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(2, 1));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(2, 1));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(2, 1)));
      await expectFailure(async () => fixture.controller.write(payload(2, 1)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisconnectEventsTest026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_2600
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 3 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(3, 1));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(3, 1));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(3);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(3, 1)));
      await expectFailure(async () => fixture.controller.write(payload(3, 1)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisconnectEventsTest027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_2700
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 4 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(4, 1));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(4, 1));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4, 1)));
      await expectFailure(async () => fixture.controller.write(payload(4, 1)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisconnectEventsTest028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_2800
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 5 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(5, 1));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(5, 1));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(5);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(5, 1)));
      await expectFailure(async () => fixture.controller.write(payload(5, 1)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisconnectEventsTest029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_2900
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 7 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(7, 1));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(7, 1));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(7);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(7, 1)));
      await expectFailure(async () => fixture.controller.write(payload(7, 1)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisconnectEventsTest030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_3000
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 8 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(8, 1));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(8, 1));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(8, 1)));
      await expectFailure(async () => fixture.controller.write(payload(8, 1)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisconnectEventsTest031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_3100
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 16 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(16, 1));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(16, 1));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(16);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(16, 1)));
      await expectFailure(async () => fixture.controller.write(payload(16, 1)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisconnectEventsTest032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_3200
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 31 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(31, 1));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(31, 1));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(31);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(31, 1)));
      await expectFailure(async () => fixture.controller.write(payload(31, 1)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisconnectEventsTest033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_3300
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 32 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(32, 1));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(32, 1));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(32);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(32, 1)));
      await expectFailure(async () => fixture.controller.write(payload(32, 1)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisconnectEventsTest034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_3400
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 63 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(63, 1));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(63, 1));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(63);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(63, 1)));
      await expectFailure(async () => fixture.controller.write(payload(63, 1)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisconnectEventsTest035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_3500
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 64 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(64, 1));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(64, 1));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(64);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(64, 1)));
      await expectFailure(async () => fixture.controller.write(payload(64, 1)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisconnectEventsTest036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTEVENTS_3600
     * @tc.desc onDisconnect releases the session and ignores stale data after receiving 127 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectEventsTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const staleData: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      const staleDisconnect: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(127, 1));
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      staleData(payload(127, 1));
      staleDisconnect();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(127);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(127, 1)));
      await expectFailure(async () => fixture.controller.write(payload(127, 1)), 'SerialStateError');
      expect(fixture.port.callCount('write')).assertEqual(0);
    });
  });
}
