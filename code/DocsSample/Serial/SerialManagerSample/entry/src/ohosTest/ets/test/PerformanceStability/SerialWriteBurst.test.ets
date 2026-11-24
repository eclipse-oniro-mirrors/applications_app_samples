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

export default function SerialWriteBurstTest(): void {
  describe('SerialWriteBurstTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialWriteBurst', 'begin');
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
      logSuite('SerialWriteBurst', 'end');
    });

    /**
     * @tc.name SerialWriteBurstTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBURST_0100
     * @tc.desc write serializes 2 concurrent 7 byte buffers seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBurstTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 2; index++) {
        pending.push(fixture.controller.write(payload(7, 0 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(2);
      for (let index: number = 0; index < 2; index++) {
        expect(results[index]).assertEqual(7);
        expectBytes(fixture.port.writes[index], Array.from(payload(7, 0 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(14);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBurstTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBURST_0200
     * @tc.desc write serializes 2 concurrent 8 byte buffers seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBurstTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 2; index++) {
        pending.push(fixture.controller.write(payload(8, 0 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(2);
      for (let index: number = 0; index < 2; index++) {
        expect(results[index]).assertEqual(8);
        expectBytes(fixture.port.writes[index], Array.from(payload(8, 0 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBurstTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBURST_0300
     * @tc.desc write serializes 2 concurrent 16 byte buffers seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBurstTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 2; index++) {
        pending.push(fixture.controller.write(payload(16, 0 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(2);
      for (let index: number = 0; index < 2; index++) {
        expect(results[index]).assertEqual(16);
        expectBytes(fixture.port.writes[index], Array.from(payload(16, 0 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBurstTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBURST_0400
     * @tc.desc write serializes 2 concurrent 31 byte buffers seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBurstTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 2; index++) {
        pending.push(fixture.controller.write(payload(31, 0 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(2);
      for (let index: number = 0; index < 2; index++) {
        expect(results[index]).assertEqual(31);
        expectBytes(fixture.port.writes[index], Array.from(payload(31, 0 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(62);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBurstTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBURST_0500
     * @tc.desc write serializes 2 concurrent 32 byte buffers seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBurstTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 2; index++) {
        pending.push(fixture.controller.write(payload(32, 0 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(2);
      for (let index: number = 0; index < 2; index++) {
        expect(results[index]).assertEqual(32);
        expectBytes(fixture.port.writes[index], Array.from(payload(32, 0 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBurstTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBURST_0600
     * @tc.desc write serializes 2 concurrent 63 byte buffers seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBurstTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 2; index++) {
        pending.push(fixture.controller.write(payload(63, 0 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(2);
      for (let index: number = 0; index < 2; index++) {
        expect(results[index]).assertEqual(63);
        expectBytes(fixture.port.writes[index], Array.from(payload(63, 0 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(126);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBurstTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBURST_0700
     * @tc.desc write serializes 2 concurrent 64 byte buffers seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBurstTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 2; index++) {
        pending.push(fixture.controller.write(payload(64, 0 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(2);
      for (let index: number = 0; index < 2; index++) {
        expect(results[index]).assertEqual(64);
        expectBytes(fixture.port.writes[index], Array.from(payload(64, 0 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(128);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBurstTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBURST_0800
     * @tc.desc write serializes 2 concurrent 127 byte buffers seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBurstTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 2; index++) {
        pending.push(fixture.controller.write(payload(127, 0 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(2);
      for (let index: number = 0; index < 2; index++) {
        expect(results[index]).assertEqual(127);
        expectBytes(fixture.port.writes[index], Array.from(payload(127, 0 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(254);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBurstTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBURST_0900
     * @tc.desc write serializes 2 concurrent 128 byte buffers seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBurstTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 2; index++) {
        pending.push(fixture.controller.write(payload(128, 0 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(2);
      for (let index: number = 0; index < 2; index++) {
        expect(results[index]).assertEqual(128);
        expectBytes(fixture.port.writes[index], Array.from(payload(128, 0 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(256);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBurstTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBURST_1000
     * @tc.desc write serializes 2 concurrent 255 byte buffers seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBurstTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 2; index++) {
        pending.push(fixture.controller.write(payload(255, 0 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(2);
      for (let index: number = 0; index < 2; index++) {
        expect(results[index]).assertEqual(255);
        expectBytes(fixture.port.writes[index], Array.from(payload(255, 0 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(510);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBurstTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBURST_1100
     * @tc.desc write serializes 2 concurrent 256 byte buffers seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBurstTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 2; index++) {
        pending.push(fixture.controller.write(payload(256, 0 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(2);
      for (let index: number = 0; index < 2; index++) {
        expect(results[index]).assertEqual(256);
        expectBytes(fixture.port.writes[index], Array.from(payload(256, 0 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(512);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBurstTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBURST_1200
     * @tc.desc write serializes 2 concurrent 511 byte buffers seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBurstTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 2; index++) {
        pending.push(fixture.controller.write(payload(511, 0 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(2);
      for (let index: number = 0; index < 2; index++) {
        expect(results[index]).assertEqual(511);
        expectBytes(fixture.port.writes[index], Array.from(payload(511, 0 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1022);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBurstTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBURST_1300
     * @tc.desc write serializes 2 concurrent 512 byte buffers seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBurstTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 2; index++) {
        pending.push(fixture.controller.write(payload(512, 0 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(2);
      for (let index: number = 0; index < 2; index++) {
        expect(results[index]).assertEqual(512);
        expectBytes(fixture.port.writes[index], Array.from(payload(512, 0 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1024);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBurstTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBURST_1400
     * @tc.desc write serializes 2 concurrent 1023 byte buffers seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBurstTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 2; index++) {
        pending.push(fixture.controller.write(payload(1023, 0 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(2);
      for (let index: number = 0; index < 2; index++) {
        expect(results[index]).assertEqual(1023);
        expectBytes(fixture.port.writes[index], Array.from(payload(1023, 0 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2046);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBurstTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBURST_1500
     * @tc.desc write serializes 2 concurrent 1024 byte buffers seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBurstTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 2; index++) {
        pending.push(fixture.controller.write(payload(1024, 0 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(2);
      for (let index: number = 0; index < 2; index++) {
        expect(results[index]).assertEqual(1024);
        expectBytes(fixture.port.writes[index], Array.from(payload(1024, 0 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2048);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBurstTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBURST_1600
     * @tc.desc write serializes 2 concurrent 2048 byte buffers seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBurstTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 2; index++) {
        pending.push(fixture.controller.write(payload(2048, 0 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(2);
      for (let index: number = 0; index < 2; index++) {
        expect(results[index]).assertEqual(2048);
        expectBytes(fixture.port.writes[index], Array.from(payload(2048, 0 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4096);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBurstTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBURST_1700
     * @tc.desc write serializes 2 concurrent 4095 byte buffers seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBurstTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 2; index++) {
        pending.push(fixture.controller.write(payload(4095, 0 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(2);
      for (let index: number = 0; index < 2; index++) {
        expect(results[index]).assertEqual(4095);
        expectBytes(fixture.port.writes[index], Array.from(payload(4095, 0 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8190);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBurstTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBURST_1800
     * @tc.desc write serializes 2 concurrent 4096 byte buffers seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBurstTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 2; index++) {
        pending.push(fixture.controller.write(payload(4096, 0 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(2);
      for (let index: number = 0; index < 2; index++) {
        expect(results[index]).assertEqual(4096);
        expectBytes(fixture.port.writes[index], Array.from(payload(4096, 0 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8192);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBurstTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBURST_1900
     * @tc.desc write serializes 3 concurrent 1 byte buffers seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBurstTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 3; index++) {
        pending.push(fixture.controller.write(payload(1, 1 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(3);
      expect(fixture.port.writes.length).assertEqual(3);
      for (let index: number = 0; index < 3; index++) {
        expect(results[index]).assertEqual(1);
        expectBytes(fixture.port.writes[index], Array.from(payload(1, 1 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBurstTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBURST_2000
     * @tc.desc write serializes 3 concurrent 2 byte buffers seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBurstTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 3; index++) {
        pending.push(fixture.controller.write(payload(2, 1 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(3);
      expect(fixture.port.writes.length).assertEqual(3);
      for (let index: number = 0; index < 3; index++) {
        expect(results[index]).assertEqual(2);
        expectBytes(fixture.port.writes[index], Array.from(payload(2, 1 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(6);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBurstTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBURST_2100
     * @tc.desc write serializes 3 concurrent 3 byte buffers seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBurstTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 3; index++) {
        pending.push(fixture.controller.write(payload(3, 1 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(3);
      expect(fixture.port.writes.length).assertEqual(3);
      for (let index: number = 0; index < 3; index++) {
        expect(results[index]).assertEqual(3);
        expectBytes(fixture.port.writes[index], Array.from(payload(3, 1 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(9);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });
  });
}
