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

export default function SerialWriteTimeoutForwardingTest(): void {
  describe('SerialWriteTimeoutForwardingTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialWriteTimeoutForwarding', 'begin');
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
      logSuite('SerialWriteTimeoutForwarding', 'end');
    });

    /**
     * @tc.name SerialWriteTimeoutForwardingTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITETIMEOUTFORWARDING_0100
     * @tc.desc write forwards timeout 0 for 1 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteTimeoutForwardingTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(1, 0);
      const written: number = await fixture.controller.write(bytes, 0);
      expect(written).assertEqual(1);
      expect(fixture.port.timeouts.length).assertEqual(1);
      expect(fixture.port.timeouts[0]).assertEqual(0);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expect(fixture.port.callCount('write')).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteTimeoutForwardingTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITETIMEOUTFORWARDING_0200
     * @tc.desc write forwards timeout 1 for 2 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteTimeoutForwardingTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(2, 0);
      const written: number = await fixture.controller.write(bytes, 1);
      expect(written).assertEqual(2);
      expect(fixture.port.timeouts.length).assertEqual(1);
      expect(fixture.port.timeouts[0]).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expect(fixture.port.callCount('write')).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteTimeoutForwardingTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITETIMEOUTFORWARDING_0300
     * @tc.desc write forwards timeout 2 for 3 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteTimeoutForwardingTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(3, 0);
      const written: number = await fixture.controller.write(bytes, 2);
      expect(written).assertEqual(3);
      expect(fixture.port.timeouts.length).assertEqual(1);
      expect(fixture.port.timeouts[0]).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expect(fixture.port.callCount('write')).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteTimeoutForwardingTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITETIMEOUTFORWARDING_0400
     * @tc.desc write forwards timeout 10 for 4 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteTimeoutForwardingTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(4, 0);
      const written: number = await fixture.controller.write(bytes, 10);
      expect(written).assertEqual(4);
      expect(fixture.port.timeouts.length).assertEqual(1);
      expect(fixture.port.timeouts[0]).assertEqual(10);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expect(fixture.port.callCount('write')).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteTimeoutForwardingTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITETIMEOUTFORWARDING_0500
     * @tc.desc write forwards timeout 100 for 5 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteTimeoutForwardingTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(5, 0);
      const written: number = await fixture.controller.write(bytes, 100);
      expect(written).assertEqual(5);
      expect(fixture.port.timeouts.length).assertEqual(1);
      expect(fixture.port.timeouts[0]).assertEqual(100);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expect(fixture.port.callCount('write')).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteTimeoutForwardingTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITETIMEOUTFORWARDING_0600
     * @tc.desc write forwards timeout 1000 for 7 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteTimeoutForwardingTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(7, 0);
      const written: number = await fixture.controller.write(bytes, 1000);
      expect(written).assertEqual(7);
      expect(fixture.port.timeouts.length).assertEqual(1);
      expect(fixture.port.timeouts[0]).assertEqual(1000);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expect(fixture.port.callCount('write')).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteTimeoutForwardingTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITETIMEOUTFORWARDING_0700
     * @tc.desc write forwards timeout 10000 for 8 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteTimeoutForwardingTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(8, 0);
      const written: number = await fixture.controller.write(bytes, 10000);
      expect(written).assertEqual(8);
      expect(fixture.port.timeouts.length).assertEqual(1);
      expect(fixture.port.timeouts[0]).assertEqual(10000);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expect(fixture.port.callCount('write')).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteTimeoutForwardingTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITETIMEOUTFORWARDING_0800
     * @tc.desc write forwards timeout 299999 for 16 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteTimeoutForwardingTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(16, 0);
      const written: number = await fixture.controller.write(bytes, 299999);
      expect(written).assertEqual(16);
      expect(fixture.port.timeouts.length).assertEqual(1);
      expect(fixture.port.timeouts[0]).assertEqual(299999);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expect(fixture.port.callCount('write')).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteTimeoutForwardingTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITETIMEOUTFORWARDING_0900
     * @tc.desc write forwards timeout 300000 for 31 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteTimeoutForwardingTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(31, 0);
      const written: number = await fixture.controller.write(bytes, 300000);
      expect(written).assertEqual(31);
      expect(fixture.port.timeouts.length).assertEqual(1);
      expect(fixture.port.timeouts[0]).assertEqual(300000);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expect(fixture.port.callCount('write')).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(31);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteTimeoutForwardingTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITETIMEOUTFORWARDING_1000
     * @tc.desc write forwards timeout 0 for 32 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteTimeoutForwardingTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(32, 0);
      const written: number = await fixture.controller.write(bytes, 0);
      expect(written).assertEqual(32);
      expect(fixture.port.timeouts.length).assertEqual(1);
      expect(fixture.port.timeouts[0]).assertEqual(0);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expect(fixture.port.callCount('write')).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteTimeoutForwardingTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITETIMEOUTFORWARDING_1100
     * @tc.desc write forwards timeout 1 for 63 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteTimeoutForwardingTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(63, 0);
      const written: number = await fixture.controller.write(bytes, 1);
      expect(written).assertEqual(63);
      expect(fixture.port.timeouts.length).assertEqual(1);
      expect(fixture.port.timeouts[0]).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expect(fixture.port.callCount('write')).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(63);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteTimeoutForwardingTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITETIMEOUTFORWARDING_1200
     * @tc.desc write forwards timeout 2 for 64 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteTimeoutForwardingTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(64, 0);
      const written: number = await fixture.controller.write(bytes, 2);
      expect(written).assertEqual(64);
      expect(fixture.port.timeouts.length).assertEqual(1);
      expect(fixture.port.timeouts[0]).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expect(fixture.port.callCount('write')).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteTimeoutForwardingTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITETIMEOUTFORWARDING_1300
     * @tc.desc write forwards timeout 10 for 127 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteTimeoutForwardingTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(127, 0);
      const written: number = await fixture.controller.write(bytes, 10);
      expect(written).assertEqual(127);
      expect(fixture.port.timeouts.length).assertEqual(1);
      expect(fixture.port.timeouts[0]).assertEqual(10);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expect(fixture.port.callCount('write')).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(127);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteTimeoutForwardingTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITETIMEOUTFORWARDING_1400
     * @tc.desc write forwards timeout 100 for 128 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteTimeoutForwardingTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(128, 0);
      const written: number = await fixture.controller.write(bytes, 100);
      expect(written).assertEqual(128);
      expect(fixture.port.timeouts.length).assertEqual(1);
      expect(fixture.port.timeouts[0]).assertEqual(100);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expect(fixture.port.callCount('write')).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(128);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteTimeoutForwardingTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITETIMEOUTFORWARDING_1500
     * @tc.desc write forwards timeout 1000 for 255 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteTimeoutForwardingTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(255, 0);
      const written: number = await fixture.controller.write(bytes, 1000);
      expect(written).assertEqual(255);
      expect(fixture.port.timeouts.length).assertEqual(1);
      expect(fixture.port.timeouts[0]).assertEqual(1000);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expect(fixture.port.callCount('write')).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(255);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteTimeoutForwardingTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITETIMEOUTFORWARDING_1600
     * @tc.desc write forwards timeout 10000 for 256 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteTimeoutForwardingTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(256, 0);
      const written: number = await fixture.controller.write(bytes, 10000);
      expect(written).assertEqual(256);
      expect(fixture.port.timeouts.length).assertEqual(1);
      expect(fixture.port.timeouts[0]).assertEqual(10000);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expect(fixture.port.callCount('write')).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(256);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteTimeoutForwardingTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITETIMEOUTFORWARDING_1700
     * @tc.desc write forwards timeout 299999 for 511 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteTimeoutForwardingTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(511, 0);
      const written: number = await fixture.controller.write(bytes, 299999);
      expect(written).assertEqual(511);
      expect(fixture.port.timeouts.length).assertEqual(1);
      expect(fixture.port.timeouts[0]).assertEqual(299999);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expect(fixture.port.callCount('write')).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(511);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteTimeoutForwardingTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITETIMEOUTFORWARDING_1800
     * @tc.desc write forwards timeout 300000 for 512 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteTimeoutForwardingTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(512, 0);
      const written: number = await fixture.controller.write(bytes, 300000);
      expect(written).assertEqual(512);
      expect(fixture.port.timeouts.length).assertEqual(1);
      expect(fixture.port.timeouts[0]).assertEqual(300000);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expect(fixture.port.callCount('write')).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(512);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteTimeoutForwardingTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITETIMEOUTFORWARDING_1900
     * @tc.desc write forwards timeout 0 for 1023 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteTimeoutForwardingTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(1023, 0);
      const written: number = await fixture.controller.write(bytes, 0);
      expect(written).assertEqual(1023);
      expect(fixture.port.timeouts.length).assertEqual(1);
      expect(fixture.port.timeouts[0]).assertEqual(0);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expect(fixture.port.callCount('write')).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1023);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteTimeoutForwardingTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITETIMEOUTFORWARDING_2000
     * @tc.desc write forwards timeout 1 for 1024 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteTimeoutForwardingTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(1024, 0);
      const written: number = await fixture.controller.write(bytes, 1);
      expect(written).assertEqual(1024);
      expect(fixture.port.timeouts.length).assertEqual(1);
      expect(fixture.port.timeouts[0]).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expect(fixture.port.callCount('write')).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1024);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteTimeoutForwardingTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITETIMEOUTFORWARDING_2100
     * @tc.desc write forwards timeout 2 for 2048 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteTimeoutForwardingTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(2048, 0);
      const written: number = await fixture.controller.write(bytes, 2);
      expect(written).assertEqual(2048);
      expect(fixture.port.timeouts.length).assertEqual(1);
      expect(fixture.port.timeouts[0]).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expect(fixture.port.callCount('write')).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2048);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteTimeoutForwardingTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITETIMEOUTFORWARDING_2200
     * @tc.desc write forwards timeout 10 for 4095 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteTimeoutForwardingTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(4095, 0);
      const written: number = await fixture.controller.write(bytes, 10);
      expect(written).assertEqual(4095);
      expect(fixture.port.timeouts.length).assertEqual(1);
      expect(fixture.port.timeouts[0]).assertEqual(10);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expect(fixture.port.callCount('write')).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4095);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteTimeoutForwardingTest023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITETIMEOUTFORWARDING_2300
     * @tc.desc write forwards timeout 100 for 4096 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteTimeoutForwardingTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(4096, 0);
      const written: number = await fixture.controller.write(bytes, 100);
      expect(written).assertEqual(4096);
      expect(fixture.port.timeouts.length).assertEqual(1);
      expect(fixture.port.timeouts[0]).assertEqual(100);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expect(fixture.port.callCount('write')).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4096);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteTimeoutForwardingTest024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITETIMEOUTFORWARDING_2400
     * @tc.desc write forwards timeout 1000 for 1 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteTimeoutForwardingTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(1, 1);
      const written: number = await fixture.controller.write(bytes, 1000);
      expect(written).assertEqual(1);
      expect(fixture.port.timeouts.length).assertEqual(1);
      expect(fixture.port.timeouts[0]).assertEqual(1000);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expect(fixture.port.callCount('write')).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteTimeoutForwardingTest025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITETIMEOUTFORWARDING_2500
     * @tc.desc write forwards timeout 10000 for 2 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteTimeoutForwardingTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(2, 1);
      const written: number = await fixture.controller.write(bytes, 10000);
      expect(written).assertEqual(2);
      expect(fixture.port.timeouts.length).assertEqual(1);
      expect(fixture.port.timeouts[0]).assertEqual(10000);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expect(fixture.port.callCount('write')).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteTimeoutForwardingTest026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITETIMEOUTFORWARDING_2600
     * @tc.desc write forwards timeout 299999 for 3 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteTimeoutForwardingTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(3, 1);
      const written: number = await fixture.controller.write(bytes, 299999);
      expect(written).assertEqual(3);
      expect(fixture.port.timeouts.length).assertEqual(1);
      expect(fixture.port.timeouts[0]).assertEqual(299999);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expect(fixture.port.callCount('write')).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteTimeoutForwardingTest027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITETIMEOUTFORWARDING_2700
     * @tc.desc write forwards timeout 300000 for 4 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteTimeoutForwardingTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(4, 1);
      const written: number = await fixture.controller.write(bytes, 300000);
      expect(written).assertEqual(4);
      expect(fixture.port.timeouts.length).assertEqual(1);
      expect(fixture.port.timeouts[0]).assertEqual(300000);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expect(fixture.port.callCount('write')).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteTimeoutForwardingTest028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITETIMEOUTFORWARDING_2800
     * @tc.desc write forwards timeout 0 for 5 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteTimeoutForwardingTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(5, 1);
      const written: number = await fixture.controller.write(bytes, 0);
      expect(written).assertEqual(5);
      expect(fixture.port.timeouts.length).assertEqual(1);
      expect(fixture.port.timeouts[0]).assertEqual(0);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expect(fixture.port.callCount('write')).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteTimeoutForwardingTest029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITETIMEOUTFORWARDING_2900
     * @tc.desc write forwards timeout 1 for 7 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteTimeoutForwardingTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(7, 1);
      const written: number = await fixture.controller.write(bytes, 1);
      expect(written).assertEqual(7);
      expect(fixture.port.timeouts.length).assertEqual(1);
      expect(fixture.port.timeouts[0]).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expect(fixture.port.callCount('write')).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteTimeoutForwardingTest030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITETIMEOUTFORWARDING_3000
     * @tc.desc write forwards timeout 2 for 8 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteTimeoutForwardingTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(8, 1);
      const written: number = await fixture.controller.write(bytes, 2);
      expect(written).assertEqual(8);
      expect(fixture.port.timeouts.length).assertEqual(1);
      expect(fixture.port.timeouts[0]).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expect(fixture.port.callCount('write')).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteTimeoutForwardingTest031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITETIMEOUTFORWARDING_3100
     * @tc.desc write forwards timeout 10 for 16 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteTimeoutForwardingTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(16, 1);
      const written: number = await fixture.controller.write(bytes, 10);
      expect(written).assertEqual(16);
      expect(fixture.port.timeouts.length).assertEqual(1);
      expect(fixture.port.timeouts[0]).assertEqual(10);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expect(fixture.port.callCount('write')).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
      expectSession(fixture);
    });
  });
}
