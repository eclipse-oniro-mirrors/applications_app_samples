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

export default function SerialDisposalTest(): void {
  describe('SerialDisposalTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialDisposal', 'begin');
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
      logSuite('SerialDisposal', 'end');
    });

    /**
     * @tc.name SerialDisposalTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISPOSAL_0100
     * @tc.desc dispose releases subscriptions and remains idempotent after receiving 1 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisposalTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(1, 0));
      await fixture.controller.dispose();
      expectReleased(fixture);
      stale(payload(1, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1);
      expect(fixture.port.callCount('close')).assertEqual(1);
      await fixture.controller.dispose();
      expect(fixture.port.callCount('close')).assertEqual(1);
      expectReleased(fixture);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1, 0)));
    });

    /**
     * @tc.name SerialDisposalTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISPOSAL_0200
     * @tc.desc dispose releases subscriptions and remains idempotent after receiving 2 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisposalTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(2, 0));
      await fixture.controller.dispose();
      expectReleased(fixture);
      stale(payload(2, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2);
      expect(fixture.port.callCount('close')).assertEqual(1);
      await fixture.controller.dispose();
      expect(fixture.port.callCount('close')).assertEqual(1);
      expectReleased(fixture);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(2, 0)));
    });

    /**
     * @tc.name SerialDisposalTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISPOSAL_0300
     * @tc.desc dispose releases subscriptions and remains idempotent after receiving 3 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisposalTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(3, 0));
      await fixture.controller.dispose();
      expectReleased(fixture);
      stale(payload(3, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(3);
      expect(fixture.port.callCount('close')).assertEqual(1);
      await fixture.controller.dispose();
      expect(fixture.port.callCount('close')).assertEqual(1);
      expectReleased(fixture);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(3, 0)));
    });

    /**
     * @tc.name SerialDisposalTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISPOSAL_0400
     * @tc.desc dispose releases subscriptions and remains idempotent after receiving 4 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisposalTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(4, 0));
      await fixture.controller.dispose();
      expectReleased(fixture);
      stale(payload(4, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4);
      expect(fixture.port.callCount('close')).assertEqual(1);
      await fixture.controller.dispose();
      expect(fixture.port.callCount('close')).assertEqual(1);
      expectReleased(fixture);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4, 0)));
    });

    /**
     * @tc.name SerialDisposalTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISPOSAL_0500
     * @tc.desc dispose releases subscriptions and remains idempotent after receiving 5 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisposalTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(5, 0));
      await fixture.controller.dispose();
      expectReleased(fixture);
      stale(payload(5, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(5);
      expect(fixture.port.callCount('close')).assertEqual(1);
      await fixture.controller.dispose();
      expect(fixture.port.callCount('close')).assertEqual(1);
      expectReleased(fixture);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(5, 0)));
    });

    /**
     * @tc.name SerialDisposalTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISPOSAL_0600
     * @tc.desc dispose releases subscriptions and remains idempotent after receiving 7 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisposalTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(7, 0));
      await fixture.controller.dispose();
      expectReleased(fixture);
      stale(payload(7, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(7);
      expect(fixture.port.callCount('close')).assertEqual(1);
      await fixture.controller.dispose();
      expect(fixture.port.callCount('close')).assertEqual(1);
      expectReleased(fixture);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(7, 0)));
    });

    /**
     * @tc.name SerialDisposalTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISPOSAL_0700
     * @tc.desc dispose releases subscriptions and remains idempotent after receiving 8 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisposalTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(8, 0));
      await fixture.controller.dispose();
      expectReleased(fixture);
      stale(payload(8, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8);
      expect(fixture.port.callCount('close')).assertEqual(1);
      await fixture.controller.dispose();
      expect(fixture.port.callCount('close')).assertEqual(1);
      expectReleased(fixture);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(8, 0)));
    });

    /**
     * @tc.name SerialDisposalTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISPOSAL_0800
     * @tc.desc dispose releases subscriptions and remains idempotent after receiving 16 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisposalTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(16, 0));
      await fixture.controller.dispose();
      expectReleased(fixture);
      stale(payload(16, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(16);
      expect(fixture.port.callCount('close')).assertEqual(1);
      await fixture.controller.dispose();
      expect(fixture.port.callCount('close')).assertEqual(1);
      expectReleased(fixture);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(16, 0)));
    });

    /**
     * @tc.name SerialDisposalTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISPOSAL_0900
     * @tc.desc dispose releases subscriptions and remains idempotent after receiving 31 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisposalTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(31, 0));
      await fixture.controller.dispose();
      expectReleased(fixture);
      stale(payload(31, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(31);
      expect(fixture.port.callCount('close')).assertEqual(1);
      await fixture.controller.dispose();
      expect(fixture.port.callCount('close')).assertEqual(1);
      expectReleased(fixture);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(31, 0)));
    });

    /**
     * @tc.name SerialDisposalTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISPOSAL_1000
     * @tc.desc dispose releases subscriptions and remains idempotent after receiving 32 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisposalTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(32, 0));
      await fixture.controller.dispose();
      expectReleased(fixture);
      stale(payload(32, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(32);
      expect(fixture.port.callCount('close')).assertEqual(1);
      await fixture.controller.dispose();
      expect(fixture.port.callCount('close')).assertEqual(1);
      expectReleased(fixture);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(32, 0)));
    });

    /**
     * @tc.name SerialDisposalTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISPOSAL_1100
     * @tc.desc dispose releases subscriptions and remains idempotent after receiving 63 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisposalTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(63, 0));
      await fixture.controller.dispose();
      expectReleased(fixture);
      stale(payload(63, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(63);
      expect(fixture.port.callCount('close')).assertEqual(1);
      await fixture.controller.dispose();
      expect(fixture.port.callCount('close')).assertEqual(1);
      expectReleased(fixture);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(63, 0)));
    });

    /**
     * @tc.name SerialDisposalTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISPOSAL_1200
     * @tc.desc dispose releases subscriptions and remains idempotent after receiving 64 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisposalTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(64, 0));
      await fixture.controller.dispose();
      expectReleased(fixture);
      stale(payload(64, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(64);
      expect(fixture.port.callCount('close')).assertEqual(1);
      await fixture.controller.dispose();
      expect(fixture.port.callCount('close')).assertEqual(1);
      expectReleased(fixture);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(64, 0)));
    });

    /**
     * @tc.name SerialDisposalTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISPOSAL_1300
     * @tc.desc dispose releases subscriptions and remains idempotent after receiving 127 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisposalTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(127, 0));
      await fixture.controller.dispose();
      expectReleased(fixture);
      stale(payload(127, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(127);
      expect(fixture.port.callCount('close')).assertEqual(1);
      await fixture.controller.dispose();
      expect(fixture.port.callCount('close')).assertEqual(1);
      expectReleased(fixture);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(127, 0)));
    });

    /**
     * @tc.name SerialDisposalTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISPOSAL_1400
     * @tc.desc dispose releases subscriptions and remains idempotent after receiving 128 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisposalTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(128, 0));
      await fixture.controller.dispose();
      expectReleased(fixture);
      stale(payload(128, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(128);
      expect(fixture.port.callCount('close')).assertEqual(1);
      await fixture.controller.dispose();
      expect(fixture.port.callCount('close')).assertEqual(1);
      expectReleased(fixture);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(128, 0)));
    });

    /**
     * @tc.name SerialDisposalTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISPOSAL_1500
     * @tc.desc dispose releases subscriptions and remains idempotent after receiving 255 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisposalTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(255, 0));
      await fixture.controller.dispose();
      expectReleased(fixture);
      stale(payload(255, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(255);
      expect(fixture.port.callCount('close')).assertEqual(1);
      await fixture.controller.dispose();
      expect(fixture.port.callCount('close')).assertEqual(1);
      expectReleased(fixture);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(255, 0)));
    });

    /**
     * @tc.name SerialDisposalTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISPOSAL_1600
     * @tc.desc dispose releases subscriptions and remains idempotent after receiving 256 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisposalTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(256, 0));
      await fixture.controller.dispose();
      expectReleased(fixture);
      stale(payload(256, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(256);
      expect(fixture.port.callCount('close')).assertEqual(1);
      await fixture.controller.dispose();
      expect(fixture.port.callCount('close')).assertEqual(1);
      expectReleased(fixture);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(256, 0)));
    });

    /**
     * @tc.name SerialDisposalTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISPOSAL_1700
     * @tc.desc dispose releases subscriptions and remains idempotent after receiving 511 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisposalTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(511, 0));
      await fixture.controller.dispose();
      expectReleased(fixture);
      stale(payload(511, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(511);
      expect(fixture.port.callCount('close')).assertEqual(1);
      await fixture.controller.dispose();
      expect(fixture.port.callCount('close')).assertEqual(1);
      expectReleased(fixture);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(511, 0)));
    });

    /**
     * @tc.name SerialDisposalTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISPOSAL_1800
     * @tc.desc dispose releases subscriptions and remains idempotent after receiving 512 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisposalTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(512, 0));
      await fixture.controller.dispose();
      expectReleased(fixture);
      stale(payload(512, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(512);
      expect(fixture.port.callCount('close')).assertEqual(1);
      await fixture.controller.dispose();
      expect(fixture.port.callCount('close')).assertEqual(1);
      expectReleased(fixture);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(512, 0)));
    });

    /**
     * @tc.name SerialDisposalTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISPOSAL_1900
     * @tc.desc dispose releases subscriptions and remains idempotent after receiving 1023 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisposalTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(1023, 0));
      await fixture.controller.dispose();
      expectReleased(fixture);
      stale(payload(1023, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1023);
      expect(fixture.port.callCount('close')).assertEqual(1);
      await fixture.controller.dispose();
      expect(fixture.port.callCount('close')).assertEqual(1);
      expectReleased(fixture);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1023, 0)));
    });

    /**
     * @tc.name SerialDisposalTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISPOSAL_2000
     * @tc.desc dispose releases subscriptions and remains idempotent after receiving 1024 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisposalTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(1024, 0));
      await fixture.controller.dispose();
      expectReleased(fixture);
      stale(payload(1024, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1024);
      expect(fixture.port.callCount('close')).assertEqual(1);
      await fixture.controller.dispose();
      expect(fixture.port.callCount('close')).assertEqual(1);
      expectReleased(fixture);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1024, 0)));
    });

    /**
     * @tc.name SerialDisposalTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISPOSAL_2100
     * @tc.desc dispose releases subscriptions and remains idempotent after receiving 2048 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisposalTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(2048, 0));
      await fixture.controller.dispose();
      expectReleased(fixture);
      stale(payload(2048, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2048);
      expect(fixture.port.callCount('close')).assertEqual(1);
      await fixture.controller.dispose();
      expect(fixture.port.callCount('close')).assertEqual(1);
      expectReleased(fixture);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(2048, 0)));
    });

    /**
     * @tc.name SerialDisposalTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISPOSAL_2200
     * @tc.desc dispose releases subscriptions and remains idempotent after receiving 4095 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisposalTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(4095, 0));
      await fixture.controller.dispose();
      expectReleased(fixture);
      stale(payload(4095, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4095);
      expect(fixture.port.callCount('close')).assertEqual(1);
      await fixture.controller.dispose();
      expect(fixture.port.callCount('close')).assertEqual(1);
      expectReleased(fixture);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4095, 0)));
    });

    /**
     * @tc.name SerialDisposalTest023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISPOSAL_2300
     * @tc.desc dispose releases subscriptions and remains idempotent after receiving 4096 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisposalTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(4096, 0));
      await fixture.controller.dispose();
      expectReleased(fixture);
      stale(payload(4096, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4096);
      expect(fixture.port.callCount('close')).assertEqual(1);
      await fixture.controller.dispose();
      expect(fixture.port.callCount('close')).assertEqual(1);
      expectReleased(fixture);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4096, 0)));
    });

    /**
     * @tc.name SerialDisposalTest024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISPOSAL_2400
     * @tc.desc dispose releases subscriptions and remains idempotent after receiving 1 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisposalTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(1, 1));
      await fixture.controller.dispose();
      expectReleased(fixture);
      stale(payload(1, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1);
      expect(fixture.port.callCount('close')).assertEqual(1);
      await fixture.controller.dispose();
      expect(fixture.port.callCount('close')).assertEqual(1);
      expectReleased(fixture);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1, 1)));
    });

    /**
     * @tc.name SerialDisposalTest025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISPOSAL_2500
     * @tc.desc dispose releases subscriptions and remains idempotent after receiving 2 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisposalTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(2, 1));
      await fixture.controller.dispose();
      expectReleased(fixture);
      stale(payload(2, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2);
      expect(fixture.port.callCount('close')).assertEqual(1);
      await fixture.controller.dispose();
      expect(fixture.port.callCount('close')).assertEqual(1);
      expectReleased(fixture);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(2, 1)));
    });

    /**
     * @tc.name SerialDisposalTest026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISPOSAL_2600
     * @tc.desc dispose releases subscriptions and remains idempotent after receiving 3 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisposalTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(3, 1));
      await fixture.controller.dispose();
      expectReleased(fixture);
      stale(payload(3, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(3);
      expect(fixture.port.callCount('close')).assertEqual(1);
      await fixture.controller.dispose();
      expect(fixture.port.callCount('close')).assertEqual(1);
      expectReleased(fixture);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(3, 1)));
    });

    /**
     * @tc.name SerialDisposalTest027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISPOSAL_2700
     * @tc.desc dispose releases subscriptions and remains idempotent after receiving 4 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisposalTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(4, 1));
      await fixture.controller.dispose();
      expectReleased(fixture);
      stale(payload(4, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4);
      expect(fixture.port.callCount('close')).assertEqual(1);
      await fixture.controller.dispose();
      expect(fixture.port.callCount('close')).assertEqual(1);
      expectReleased(fixture);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4, 1)));
    });

    /**
     * @tc.name SerialDisposalTest028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISPOSAL_2800
     * @tc.desc dispose unregisters callbacks from a selected but unopened port without calling close
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisposalTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      await fixture.controller.dispose();
      expectReleased(fixture);
      expectCallSequence(fixture.port, ['onDataRead', 'onDisconnect', 'offDataRead', 'offDisconnect']);
      expect(fixture.port.callCount('close')).assertEqual(0);
    });

    /**
     * @tc.name SerialDisposalTest029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISPOSAL_2900
     * @tc.desc dispose preserves state when offDataRead fails and succeeds after a retry
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisposalTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('offDataRead', 35700001);
      await expectFailure(async () => fixture.controller.dispose(), 'BusinessError', 35700001);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      await fixture.controller.dispose();
      expectReleased(fixture);
    });
  });
}
