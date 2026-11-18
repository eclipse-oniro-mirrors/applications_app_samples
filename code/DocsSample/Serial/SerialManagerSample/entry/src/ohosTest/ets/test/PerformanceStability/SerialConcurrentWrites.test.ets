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

export default function SerialConcurrentWritesTest(): void {
  describe('SerialConcurrentWritesTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialConcurrentWrites', 'begin');
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
      logSuite('SerialConcurrentWrites', 'end');
    });

    /**
     * @tc.name SerialConcurrentWritesTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONCURRENTWRITES_0100
     * @tc.desc write serializes 2 concurrent 1 byte buffers seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConcurrentWritesTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 2; index++) {
        pending.push(fixture.controller.write(payload(1, 0 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(2);
      for (let index: number = 0; index < 2; index++) {
        expect(results[index]).assertEqual(1);
        expectBytes(fixture.port.writes[index], Array.from(payload(1, 0 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialConcurrentWritesTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONCURRENTWRITES_0200
     * @tc.desc write serializes 2 concurrent 2 byte buffers seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConcurrentWritesTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 2; index++) {
        pending.push(fixture.controller.write(payload(2, 0 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(2);
      for (let index: number = 0; index < 2; index++) {
        expect(results[index]).assertEqual(2);
        expectBytes(fixture.port.writes[index], Array.from(payload(2, 0 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialConcurrentWritesTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONCURRENTWRITES_0300
     * @tc.desc write serializes 2 concurrent 3 byte buffers seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConcurrentWritesTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 2; index++) {
        pending.push(fixture.controller.write(payload(3, 0 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(2);
      for (let index: number = 0; index < 2; index++) {
        expect(results[index]).assertEqual(3);
        expectBytes(fixture.port.writes[index], Array.from(payload(3, 0 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(6);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialConcurrentWritesTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONCURRENTWRITES_0400
     * @tc.desc write serializes 2 concurrent 4 byte buffers seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConcurrentWritesTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 2; index++) {
        pending.push(fixture.controller.write(payload(4, 0 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(2);
      for (let index: number = 0; index < 2; index++) {
        expect(results[index]).assertEqual(4);
        expectBytes(fixture.port.writes[index], Array.from(payload(4, 0 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialConcurrentWritesTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONCURRENTWRITES_0500
     * @tc.desc write serializes 2 concurrent 5 byte buffers seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConcurrentWritesTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 2; index++) {
        pending.push(fixture.controller.write(payload(5, 0 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(2);
      for (let index: number = 0; index < 2; index++) {
        expect(results[index]).assertEqual(5);
        expectBytes(fixture.port.writes[index], Array.from(payload(5, 0 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(10);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });
  });
}
