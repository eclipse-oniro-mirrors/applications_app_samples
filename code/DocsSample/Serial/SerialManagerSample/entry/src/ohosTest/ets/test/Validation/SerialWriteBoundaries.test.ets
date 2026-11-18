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

export default function SerialWriteBoundariesTest(): void {
  describe('SerialWriteBoundariesTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialWriteBoundaries', 'begin');
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
      logSuite('SerialWriteBoundaries', 'end');
    });

    /**
     * @tc.name SerialWriteBoundariesTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBOUNDARIES_0100
     * @tc.desc write forwards 4096 bytes with seed 1 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBoundariesTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(4096, 1);
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
     * @tc.name SerialWriteBoundariesTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBOUNDARIES_0200
     * @tc.desc write forwards 1 bytes with seed 2 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBoundariesTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(1, 2);
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
     * @tc.name SerialWriteBoundariesTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBOUNDARIES_0300
     * @tc.desc write forwards 2 bytes with seed 2 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBoundariesTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(2, 2);
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
     * @tc.name SerialWriteBoundariesTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBOUNDARIES_0400
     * @tc.desc write forwards 3 bytes with seed 2 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBoundariesTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(3, 2);
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
     * @tc.name SerialWriteBoundariesTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBOUNDARIES_0500
     * @tc.desc write forwards 4 bytes with seed 2 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBoundariesTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(4, 2);
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
     * @tc.name SerialWriteBoundariesTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBOUNDARIES_0600
     * @tc.desc write forwards 5 bytes with seed 2 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBoundariesTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(5, 2);
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
     * @tc.name SerialWriteBoundariesTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBOUNDARIES_0700
     * @tc.desc write forwards 7 bytes with seed 2 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBoundariesTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(7, 2);
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
     * @tc.name SerialWriteBoundariesTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBOUNDARIES_0800
     * @tc.desc write forwards 8 bytes with seed 2 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBoundariesTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(8, 2);
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
     * @tc.name SerialWriteBoundariesTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBOUNDARIES_0900
     * @tc.desc write forwards 16 bytes with seed 2 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBoundariesTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(16, 2);
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
     * @tc.name SerialWriteBoundariesTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBOUNDARIES_1000
     * @tc.desc write forwards 31 bytes with seed 2 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBoundariesTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(31, 2);
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
     * @tc.name SerialWriteBoundariesTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBOUNDARIES_1100
     * @tc.desc write forwards 32 bytes with seed 2 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBoundariesTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(32, 2);
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
     * @tc.name SerialWriteBoundariesTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBOUNDARIES_1200
     * @tc.desc write forwards 63 bytes with seed 2 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBoundariesTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(63, 2);
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
     * @tc.name SerialWriteBoundariesTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBOUNDARIES_1300
     * @tc.desc write forwards 64 bytes with seed 2 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBoundariesTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(64, 2);
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
     * @tc.name SerialWriteBoundariesTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBOUNDARIES_1400
     * @tc.desc write forwards 127 bytes with seed 2 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBoundariesTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(127, 2);
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
     * @tc.name SerialWriteBoundariesTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBOUNDARIES_1500
     * @tc.desc write forwards 128 bytes with seed 2 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBoundariesTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(128, 2);
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
     * @tc.name SerialWriteBoundariesTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBOUNDARIES_1600
     * @tc.desc write forwards 255 bytes with seed 2 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBoundariesTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(255, 2);
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
     * @tc.name SerialWriteBoundariesTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBOUNDARIES_1700
     * @tc.desc write forwards 256 bytes with seed 2 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBoundariesTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(256, 2);
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
     * @tc.name SerialWriteBoundariesTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBOUNDARIES_1800
     * @tc.desc write forwards 511 bytes with seed 2 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBoundariesTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(511, 2);
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
     * @tc.name SerialWriteBoundariesTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBOUNDARIES_1900
     * @tc.desc write forwards 512 bytes with seed 2 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBoundariesTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(512, 2);
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
     * @tc.name SerialWriteBoundariesTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBOUNDARIES_2000
     * @tc.desc write forwards 1023 bytes with seed 2 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBoundariesTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(1023, 2);
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
     * @tc.name SerialWriteBoundariesTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBOUNDARIES_2100
     * @tc.desc write forwards 1024 bytes with seed 2 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBoundariesTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(1024, 2);
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
     * @tc.name SerialWriteBoundariesTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBOUNDARIES_2200
     * @tc.desc write forwards 2048 bytes with seed 2 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBoundariesTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(2048, 2);
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
     * @tc.name SerialWriteBoundariesTest023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBOUNDARIES_2300
     * @tc.desc write forwards 4095 bytes with seed 2 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBoundariesTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(4095, 2);
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
     * @tc.name SerialWriteBoundariesTest024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBOUNDARIES_2400
     * @tc.desc write forwards 4096 bytes with seed 2 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBoundariesTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(4096, 2);
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
     * @tc.name SerialWriteBoundariesTest025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBOUNDARIES_2500
     * @tc.desc write forwards 1 bytes with seed 3 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBoundariesTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(1, 3);
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
     * @tc.name SerialWriteBoundariesTest026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBOUNDARIES_2600
     * @tc.desc write forwards 2 bytes with seed 3 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBoundariesTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(2, 3);
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
     * @tc.name SerialWriteBoundariesTest027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBOUNDARIES_2700
     * @tc.desc write forwards 3 bytes with seed 3 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBoundariesTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(3, 3);
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
     * @tc.name SerialWriteBoundariesTest028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBOUNDARIES_2800
     * @tc.desc write forwards 4 bytes with seed 3 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBoundariesTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(4, 3);
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
     * @tc.name SerialWriteBoundariesTest029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBOUNDARIES_2900
     * @tc.desc write forwards 5 bytes with seed 3 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBoundariesTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(5, 3);
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
     * @tc.name SerialWriteBoundariesTest030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBOUNDARIES_3000
     * @tc.desc write sends the sample Hello bytes when called without a payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBoundariesTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write()).assertEqual(5);
      expectBytes(fixture.port.writes[0], [0x48, 0x65, 0x6C, 0x6C, 0x6F]);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
    });
  });
}
