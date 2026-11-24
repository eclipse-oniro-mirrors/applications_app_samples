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

export default function SerialPortBurstTest(): void {
  describe('SerialPortBurstTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialPortBurst', 'begin');
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
      logSuite('SerialPortBurst', 'end');
    });

    /**
     * @tc.name SerialPortBurstTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTBURST_0100
     * @tc.desc write serializes 3 concurrent 4095 byte buffers seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortBurstTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 3; index++) {
        pending.push(fixture.controller.write(payload(4095, 1 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(3);
      expect(fixture.port.writes.length).assertEqual(3);
      for (let index: number = 0; index < 3; index++) {
        expect(results[index]).assertEqual(4095);
        expectBytes(fixture.port.writes[index], Array.from(payload(4095, 1 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(12285);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortBurstTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTBURST_0200
     * @tc.desc write serializes 3 concurrent 4096 byte buffers seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortBurstTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 3; index++) {
        pending.push(fixture.controller.write(payload(4096, 1 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(3);
      expect(fixture.port.writes.length).assertEqual(3);
      for (let index: number = 0; index < 3; index++) {
        expect(results[index]).assertEqual(4096);
        expectBytes(fixture.port.writes[index], Array.from(payload(4096, 1 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(12288);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortBurstTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTBURST_0300
     * @tc.desc write serializes 4 concurrent 1 byte buffers seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortBurstTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 4; index++) {
        pending.push(fixture.controller.write(payload(1, 2 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(4);
      expect(fixture.port.writes.length).assertEqual(4);
      for (let index: number = 0; index < 4; index++) {
        expect(results[index]).assertEqual(1);
        expectBytes(fixture.port.writes[index], Array.from(payload(1, 2 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortBurstTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTBURST_0400
     * @tc.desc write serializes 4 concurrent 2 byte buffers seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortBurstTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pending: Promise<number>[] = [];
      for (let index: number = 0; index < 4; index++) {
        pending.push(fixture.controller.write(payload(2, 2 + index)));
      }
      const results: number[] = await Promise.all(pending);
      expect(results.length).assertEqual(4);
      expect(fixture.port.writes.length).assertEqual(4);
      for (let index: number = 0; index < 4; index++) {
        expect(results[index]).assertEqual(2);
        expectBytes(fixture.port.writes[index], Array.from(payload(2, 2 + index)));
      }
      expect(fixture.port.callCount('write')).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expectSession(fixture);
    });
  });
}
