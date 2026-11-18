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

export default function SerialPayloadOwnershipTest(): void {
  describe('SerialPayloadOwnershipTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialPayloadOwnership', 'begin');
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
      logSuite('SerialPayloadOwnership', 'end');
    });

    /**
     * @tc.name SerialPayloadOwnershipTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPAYLOADOWNERSHIP_0100
     * @tc.desc write snapshots 64 input bytes with seed 0 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPayloadOwnershipTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(64, 0);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(1);
      const written: number = await pending;
      expect(written).assertEqual(64);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(1);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPayloadOwnershipTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPAYLOADOWNERSHIP_0200
     * @tc.desc write snapshots 127 input bytes with seed 0 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPayloadOwnershipTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(127, 0);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(1);
      const written: number = await pending;
      expect(written).assertEqual(127);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(1);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(127);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPayloadOwnershipTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPAYLOADOWNERSHIP_0300
     * @tc.desc write snapshots 128 input bytes with seed 0 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPayloadOwnershipTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(128, 0);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(1);
      const written: number = await pending;
      expect(written).assertEqual(128);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(1);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(128);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPayloadOwnershipTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPAYLOADOWNERSHIP_0400
     * @tc.desc write snapshots 255 input bytes with seed 0 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPayloadOwnershipTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(255, 0);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(1);
      const written: number = await pending;
      expect(written).assertEqual(255);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(1);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(255);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPayloadOwnershipTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPAYLOADOWNERSHIP_0500
     * @tc.desc write snapshots 256 input bytes with seed 0 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPayloadOwnershipTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(256, 0);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(1);
      const written: number = await pending;
      expect(written).assertEqual(256);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(1);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(256);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPayloadOwnershipTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPAYLOADOWNERSHIP_0600
     * @tc.desc write snapshots 511 input bytes with seed 0 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPayloadOwnershipTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(511, 0);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(1);
      const written: number = await pending;
      expect(written).assertEqual(511);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(1);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(511);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPayloadOwnershipTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPAYLOADOWNERSHIP_0700
     * @tc.desc write snapshots 512 input bytes with seed 0 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPayloadOwnershipTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(512, 0);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(1);
      const written: number = await pending;
      expect(written).assertEqual(512);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(1);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(512);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPayloadOwnershipTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPAYLOADOWNERSHIP_0800
     * @tc.desc write snapshots 1023 input bytes with seed 0 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPayloadOwnershipTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(1023, 0);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(1);
      const written: number = await pending;
      expect(written).assertEqual(1023);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(1);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1023);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPayloadOwnershipTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPAYLOADOWNERSHIP_0900
     * @tc.desc write snapshots 1024 input bytes with seed 0 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPayloadOwnershipTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(1024, 0);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(1);
      const written: number = await pending;
      expect(written).assertEqual(1024);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(1);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1024);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPayloadOwnershipTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPAYLOADOWNERSHIP_1000
     * @tc.desc write snapshots 2048 input bytes with seed 0 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPayloadOwnershipTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(2048, 0);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(1);
      const written: number = await pending;
      expect(written).assertEqual(2048);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(1);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2048);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPayloadOwnershipTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPAYLOADOWNERSHIP_1100
     * @tc.desc write snapshots 4095 input bytes with seed 0 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPayloadOwnershipTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(4095, 0);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(1);
      const written: number = await pending;
      expect(written).assertEqual(4095);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(1);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4095);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPayloadOwnershipTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPAYLOADOWNERSHIP_1200
     * @tc.desc write snapshots 4096 input bytes with seed 0 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPayloadOwnershipTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(4096, 0);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(1);
      const written: number = await pending;
      expect(written).assertEqual(4096);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(1);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4096);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPayloadOwnershipTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPAYLOADOWNERSHIP_1300
     * @tc.desc write snapshots 1 input bytes with seed 1 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPayloadOwnershipTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(1, 1);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(2);
      const written: number = await pending;
      expect(written).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(2);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPayloadOwnershipTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPAYLOADOWNERSHIP_1400
     * @tc.desc write snapshots 2 input bytes with seed 1 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPayloadOwnershipTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(2, 1);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(2);
      const written: number = await pending;
      expect(written).assertEqual(2);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(2);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPayloadOwnershipTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPAYLOADOWNERSHIP_1500
     * @tc.desc write snapshots 3 input bytes with seed 1 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPayloadOwnershipTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(3, 1);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(2);
      const written: number = await pending;
      expect(written).assertEqual(3);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(2);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPayloadOwnershipTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPAYLOADOWNERSHIP_1600
     * @tc.desc write snapshots 4 input bytes with seed 1 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPayloadOwnershipTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(4, 1);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(2);
      const written: number = await pending;
      expect(written).assertEqual(4);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(2);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPayloadOwnershipTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPAYLOADOWNERSHIP_1700
     * @tc.desc write snapshots 5 input bytes with seed 1 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPayloadOwnershipTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(5, 1);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(2);
      const written: number = await pending;
      expect(written).assertEqual(5);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(2);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPayloadOwnershipTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPAYLOADOWNERSHIP_1800
     * @tc.desc write snapshots 7 input bytes with seed 1 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPayloadOwnershipTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(7, 1);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(2);
      const written: number = await pending;
      expect(written).assertEqual(7);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(2);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPayloadOwnershipTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPAYLOADOWNERSHIP_1900
     * @tc.desc write snapshots 8 input bytes with seed 1 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPayloadOwnershipTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(8, 1);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(2);
      const written: number = await pending;
      expect(written).assertEqual(8);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(2);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPayloadOwnershipTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPAYLOADOWNERSHIP_2000
     * @tc.desc write snapshots 16 input bytes with seed 1 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPayloadOwnershipTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(16, 1);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(2);
      const written: number = await pending;
      expect(written).assertEqual(16);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(2);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPayloadOwnershipTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPAYLOADOWNERSHIP_2100
     * @tc.desc write snapshots 31 input bytes with seed 1 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPayloadOwnershipTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(31, 1);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(2);
      const written: number = await pending;
      expect(written).assertEqual(31);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(2);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(31);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPayloadOwnershipTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPAYLOADOWNERSHIP_2200
     * @tc.desc write snapshots 32 input bytes with seed 1 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPayloadOwnershipTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(32, 1);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(2);
      const written: number = await pending;
      expect(written).assertEqual(32);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(2);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPayloadOwnershipTest023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPAYLOADOWNERSHIP_2300
     * @tc.desc write snapshots 63 input bytes with seed 1 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPayloadOwnershipTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(63, 1);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(2);
      const written: number = await pending;
      expect(written).assertEqual(63);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(2);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(63);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPayloadOwnershipTest024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPAYLOADOWNERSHIP_2400
     * @tc.desc write snapshots 64 input bytes with seed 1 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPayloadOwnershipTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(64, 1);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(2);
      const written: number = await pending;
      expect(written).assertEqual(64);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(2);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPayloadOwnershipTest025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPAYLOADOWNERSHIP_2500
     * @tc.desc write snapshots 127 input bytes with seed 1 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPayloadOwnershipTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(127, 1);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(2);
      const written: number = await pending;
      expect(written).assertEqual(127);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(2);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(127);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPayloadOwnershipTest026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPAYLOADOWNERSHIP_2600
     * @tc.desc write snapshots 128 input bytes with seed 1 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPayloadOwnershipTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(128, 1);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(2);
      const written: number = await pending;
      expect(written).assertEqual(128);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(2);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(128);
      expectSession(fixture);
    });
  });
}
