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

export default function SerialTransferLoadTest(): void {
  describe('SerialTransferLoadTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialTransferLoad', 'begin');
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
      logSuite('SerialTransferLoad', 'end');
    });

    /**
     * @tc.name SerialTransferLoadTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERLOAD_0100
     * @tc.desc write forwards 127 bytes with seed 0 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferLoadTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(127, 0);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(127);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(127);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialTransferLoadTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERLOAD_0200
     * @tc.desc write forwards 128 bytes with seed 0 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferLoadTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(128, 0);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(128);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(128);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialTransferLoadTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERLOAD_0300
     * @tc.desc write forwards 255 bytes with seed 0 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferLoadTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(255, 0);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(255);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(255);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialTransferLoadTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERLOAD_0400
     * @tc.desc write forwards 256 bytes with seed 0 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferLoadTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(256, 0);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(256);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(256);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialTransferLoadTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERLOAD_0500
     * @tc.desc write forwards 511 bytes with seed 0 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferLoadTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(511, 0);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(511);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(511);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialTransferLoadTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERLOAD_0600
     * @tc.desc write forwards 512 bytes with seed 0 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferLoadTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(512, 0);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(512);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(512);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialTransferLoadTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERLOAD_0700
     * @tc.desc write forwards 1023 bytes with seed 0 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferLoadTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(1023, 0);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(1023);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1023);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialTransferLoadTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERLOAD_0800
     * @tc.desc write forwards 1024 bytes with seed 0 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferLoadTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(1024, 0);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(1024);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1024);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialTransferLoadTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERLOAD_0900
     * @tc.desc write forwards 2048 bytes with seed 0 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferLoadTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(2048, 0);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(2048);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2048);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialTransferLoadTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERLOAD_1000
     * @tc.desc write forwards 4095 bytes with seed 0 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferLoadTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(4095, 0);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(4095);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4095);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialTransferLoadTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERLOAD_1100
     * @tc.desc write forwards 4096 bytes with seed 0 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferLoadTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(4096, 0);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(4096);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4096);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialTransferLoadTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERLOAD_1200
     * @tc.desc write forwards 1 bytes with seed 1 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferLoadTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(1, 1);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialTransferLoadTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERLOAD_1300
     * @tc.desc write forwards 2 bytes with seed 1 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferLoadTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(2, 1);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialTransferLoadTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERLOAD_1400
     * @tc.desc write forwards 3 bytes with seed 1 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferLoadTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(3, 1);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(3);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialTransferLoadTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERLOAD_1500
     * @tc.desc write forwards 4 bytes with seed 1 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferLoadTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(4, 1);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(4);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialTransferLoadTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERLOAD_1600
     * @tc.desc write forwards 5 bytes with seed 1 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferLoadTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(5, 1);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(5);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialTransferLoadTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERLOAD_1700
     * @tc.desc write forwards 7 bytes with seed 1 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferLoadTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(7, 1);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(7);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialTransferLoadTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERLOAD_1800
     * @tc.desc write forwards 8 bytes with seed 1 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferLoadTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(8, 1);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(8);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialTransferLoadTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERLOAD_1900
     * @tc.desc write forwards 16 bytes with seed 1 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferLoadTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(16, 1);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(16);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialTransferLoadTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERLOAD_2000
     * @tc.desc write forwards 31 bytes with seed 1 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferLoadTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(31, 1);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(31);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(31);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialTransferLoadTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERLOAD_2100
     * @tc.desc write forwards 32 bytes with seed 1 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferLoadTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(32, 1);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(32);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialTransferLoadTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERLOAD_2200
     * @tc.desc write forwards 63 bytes with seed 1 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferLoadTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(63, 1);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(63);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(63);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialTransferLoadTest023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERLOAD_2300
     * @tc.desc write forwards 64 bytes with seed 1 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferLoadTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(64, 1);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(64);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialTransferLoadTest024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERLOAD_2400
     * @tc.desc write forwards 127 bytes with seed 1 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferLoadTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(127, 1);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(127);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(127);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialTransferLoadTest025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERLOAD_2500
     * @tc.desc write forwards 128 bytes with seed 1 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferLoadTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(128, 1);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(128);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(128);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialTransferLoadTest026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERLOAD_2600
     * @tc.desc write forwards 255 bytes with seed 1 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferLoadTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(255, 1);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(255);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(255);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialTransferLoadTest027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERLOAD_2700
     * @tc.desc write forwards 256 bytes with seed 1 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferLoadTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(256, 1);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(256);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(256);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialTransferLoadTest028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERLOAD_2800
     * @tc.desc write forwards 511 bytes with seed 1 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferLoadTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(511, 1);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(511);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(511);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialTransferLoadTest029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERLOAD_2900
     * @tc.desc write forwards 512 bytes with seed 1 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferLoadTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(512, 1);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(512);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(512);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialTransferLoadTest030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERLOAD_3000
     * @tc.desc write forwards 1023 bytes with seed 1 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferLoadTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(1023, 1);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(1023);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1023);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialTransferLoadTest031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERLOAD_3100
     * @tc.desc write forwards 1024 bytes with seed 1 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferLoadTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(1024, 1);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(1024);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1024);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialTransferLoadTest032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERLOAD_3200
     * @tc.desc write forwards 2048 bytes with seed 1 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferLoadTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(2048, 1);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(2048);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2048);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialTransferLoadTest033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERLOAD_3300
     * @tc.desc write forwards 4095 bytes with seed 1 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferLoadTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(4095, 1);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(4095);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4095);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });
  });
}
