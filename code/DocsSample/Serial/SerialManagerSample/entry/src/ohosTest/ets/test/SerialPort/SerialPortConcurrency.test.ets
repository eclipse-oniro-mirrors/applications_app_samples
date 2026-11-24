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

export default function SerialPortConcurrencyTest(): void {
  describe('SerialPortConcurrencyTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialPortConcurrency', 'begin');
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
      logSuite('SerialPortConcurrency', 'end');
    });

    /**
     * @tc.name SerialPortConcurrencyTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONCURRENCY_0100
     * @tc.desc write serializes 3 concurrent 4 byte buffers seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConcurrencyTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 3; index++) {
        pending.push(fixture.controller.write(payload(4, 1 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(3);
      expect(fixture.port.writes.length).assertEqual(3);
      for (let index: number = 0; index < 3; index++) {
        expect(results[index]).assertEqual(4);
        expectBytes(fixture.port.writes[index], Array.from(payload(4, 1 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(12);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConcurrencyTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONCURRENCY_0200
     * @tc.desc write serializes 3 concurrent 5 byte buffers seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConcurrencyTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 3; index++) {
        pending.push(fixture.controller.write(payload(5, 1 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(3);
      expect(fixture.port.writes.length).assertEqual(3);
      for (let index: number = 0; index < 3; index++) {
        expect(results[index]).assertEqual(5);
        expectBytes(fixture.port.writes[index], Array.from(payload(5, 1 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(15);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConcurrencyTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONCURRENCY_0300
     * @tc.desc write serializes 3 concurrent 7 byte buffers seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConcurrencyTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 3; index++) {
        pending.push(fixture.controller.write(payload(7, 1 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(3);
      expect(fixture.port.writes.length).assertEqual(3);
      for (let index: number = 0; index < 3; index++) {
        expect(results[index]).assertEqual(7);
        expectBytes(fixture.port.writes[index], Array.from(payload(7, 1 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(21);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConcurrencyTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONCURRENCY_0400
     * @tc.desc write serializes 3 concurrent 8 byte buffers seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConcurrencyTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 3; index++) {
        pending.push(fixture.controller.write(payload(8, 1 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(3);
      expect(fixture.port.writes.length).assertEqual(3);
      for (let index: number = 0; index < 3; index++) {
        expect(results[index]).assertEqual(8);
        expectBytes(fixture.port.writes[index], Array.from(payload(8, 1 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(24);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConcurrencyTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONCURRENCY_0500
     * @tc.desc write serializes 3 concurrent 16 byte buffers seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConcurrencyTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 3; index++) {
        pending.push(fixture.controller.write(payload(16, 1 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(3);
      expect(fixture.port.writes.length).assertEqual(3);
      for (let index: number = 0; index < 3; index++) {
        expect(results[index]).assertEqual(16);
        expectBytes(fixture.port.writes[index], Array.from(payload(16, 1 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(48);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConcurrencyTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONCURRENCY_0600
     * @tc.desc write serializes 3 concurrent 31 byte buffers seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConcurrencyTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 3; index++) {
        pending.push(fixture.controller.write(payload(31, 1 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(3);
      expect(fixture.port.writes.length).assertEqual(3);
      for (let index: number = 0; index < 3; index++) {
        expect(results[index]).assertEqual(31);
        expectBytes(fixture.port.writes[index], Array.from(payload(31, 1 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(93);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConcurrencyTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONCURRENCY_0700
     * @tc.desc write serializes 3 concurrent 32 byte buffers seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConcurrencyTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 3; index++) {
        pending.push(fixture.controller.write(payload(32, 1 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(3);
      expect(fixture.port.writes.length).assertEqual(3);
      for (let index: number = 0; index < 3; index++) {
        expect(results[index]).assertEqual(32);
        expectBytes(fixture.port.writes[index], Array.from(payload(32, 1 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(96);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConcurrencyTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONCURRENCY_0800
     * @tc.desc write serializes 3 concurrent 63 byte buffers seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConcurrencyTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 3; index++) {
        pending.push(fixture.controller.write(payload(63, 1 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(3);
      expect(fixture.port.writes.length).assertEqual(3);
      for (let index: number = 0; index < 3; index++) {
        expect(results[index]).assertEqual(63);
        expectBytes(fixture.port.writes[index], Array.from(payload(63, 1 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(189);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConcurrencyTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONCURRENCY_0900
     * @tc.desc write serializes 3 concurrent 64 byte buffers seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConcurrencyTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 3; index++) {
        pending.push(fixture.controller.write(payload(64, 1 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(3);
      expect(fixture.port.writes.length).assertEqual(3);
      for (let index: number = 0; index < 3; index++) {
        expect(results[index]).assertEqual(64);
        expectBytes(fixture.port.writes[index], Array.from(payload(64, 1 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(192);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConcurrencyTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONCURRENCY_1000
     * @tc.desc write serializes 3 concurrent 127 byte buffers seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConcurrencyTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 3; index++) {
        pending.push(fixture.controller.write(payload(127, 1 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(3);
      expect(fixture.port.writes.length).assertEqual(3);
      for (let index: number = 0; index < 3; index++) {
        expect(results[index]).assertEqual(127);
        expectBytes(fixture.port.writes[index], Array.from(payload(127, 1 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(381);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConcurrencyTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONCURRENCY_1100
     * @tc.desc write serializes 3 concurrent 128 byte buffers seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConcurrencyTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 3; index++) {
        pending.push(fixture.controller.write(payload(128, 1 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(3);
      expect(fixture.port.writes.length).assertEqual(3);
      for (let index: number = 0; index < 3; index++) {
        expect(results[index]).assertEqual(128);
        expectBytes(fixture.port.writes[index], Array.from(payload(128, 1 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(384);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConcurrencyTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONCURRENCY_1200
     * @tc.desc write serializes 3 concurrent 255 byte buffers seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConcurrencyTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 3; index++) {
        pending.push(fixture.controller.write(payload(255, 1 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(3);
      expect(fixture.port.writes.length).assertEqual(3);
      for (let index: number = 0; index < 3; index++) {
        expect(results[index]).assertEqual(255);
        expectBytes(fixture.port.writes[index], Array.from(payload(255, 1 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(765);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConcurrencyTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONCURRENCY_1300
     * @tc.desc write serializes 3 concurrent 256 byte buffers seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConcurrencyTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 3; index++) {
        pending.push(fixture.controller.write(payload(256, 1 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(3);
      expect(fixture.port.writes.length).assertEqual(3);
      for (let index: number = 0; index < 3; index++) {
        expect(results[index]).assertEqual(256);
        expectBytes(fixture.port.writes[index], Array.from(payload(256, 1 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(768);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConcurrencyTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONCURRENCY_1400
     * @tc.desc write serializes 3 concurrent 511 byte buffers seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConcurrencyTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 3; index++) {
        pending.push(fixture.controller.write(payload(511, 1 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(3);
      expect(fixture.port.writes.length).assertEqual(3);
      for (let index: number = 0; index < 3; index++) {
        expect(results[index]).assertEqual(511);
        expectBytes(fixture.port.writes[index], Array.from(payload(511, 1 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1533);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConcurrencyTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONCURRENCY_1500
     * @tc.desc write serializes 3 concurrent 512 byte buffers seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConcurrencyTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 3; index++) {
        pending.push(fixture.controller.write(payload(512, 1 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(3);
      expect(fixture.port.writes.length).assertEqual(3);
      for (let index: number = 0; index < 3; index++) {
        expect(results[index]).assertEqual(512);
        expectBytes(fixture.port.writes[index], Array.from(payload(512, 1 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1536);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConcurrencyTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONCURRENCY_1600
     * @tc.desc write serializes 3 concurrent 1023 byte buffers seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConcurrencyTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 3; index++) {
        pending.push(fixture.controller.write(payload(1023, 1 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(3);
      expect(fixture.port.writes.length).assertEqual(3);
      for (let index: number = 0; index < 3; index++) {
        expect(results[index]).assertEqual(1023);
        expectBytes(fixture.port.writes[index], Array.from(payload(1023, 1 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3069);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConcurrencyTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONCURRENCY_1700
     * @tc.desc write serializes 3 concurrent 1024 byte buffers seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConcurrencyTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 3; index++) {
        pending.push(fixture.controller.write(payload(1024, 1 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(3);
      expect(fixture.port.writes.length).assertEqual(3);
      for (let index: number = 0; index < 3; index++) {
        expect(results[index]).assertEqual(1024);
        expectBytes(fixture.port.writes[index], Array.from(payload(1024, 1 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3072);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConcurrencyTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONCURRENCY_1800
     * @tc.desc write serializes 3 concurrent 2048 byte buffers seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConcurrencyTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 3; index++) {
        pending.push(fixture.controller.write(payload(2048, 1 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(3);
      expect(fixture.port.writes.length).assertEqual(3);
      for (let index: number = 0; index < 3; index++) {
        expect(results[index]).assertEqual(2048);
        expectBytes(fixture.port.writes[index], Array.from(payload(2048, 1 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(6144);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });
  });
}
