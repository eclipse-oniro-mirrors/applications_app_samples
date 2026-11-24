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

export default function SerialResourceReleaseTest(): void {
  describe('SerialResourceReleaseTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialResourceRelease', 'begin');
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
      logSuite('SerialResourceRelease', 'end');
    });

    /**
     * @tc.name SerialResourceReleaseTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRESOURCERELEASE_0100
     * @tc.desc dispose releases subscriptions and remains idempotent after receiving 5 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialResourceReleaseTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(5, 1));
      await fixture.controller.dispose();
      expectReleased(fixture);
      stale(payload(5, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(5);
      expect(fixture.port.callCount('close')).assertEqual(1);
      await fixture.controller.dispose();
      expect(fixture.port.callCount('close')).assertEqual(1);
      expectReleased(fixture);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(5, 1)));
    });

    /**
     * @tc.name SerialResourceReleaseTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRESOURCERELEASE_0200
     * @tc.desc dispose releases subscriptions and remains idempotent after receiving 7 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialResourceReleaseTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(7, 1));
      await fixture.controller.dispose();
      expectReleased(fixture);
      stale(payload(7, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(7);
      expect(fixture.port.callCount('close')).assertEqual(1);
      await fixture.controller.dispose();
      expect(fixture.port.callCount('close')).assertEqual(1);
      expectReleased(fixture);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(7, 1)));
    });

    /**
     * @tc.name SerialResourceReleaseTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRESOURCERELEASE_0300
     * @tc.desc dispose releases subscriptions and remains idempotent after receiving 8 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialResourceReleaseTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(8, 1));
      await fixture.controller.dispose();
      expectReleased(fixture);
      stale(payload(8, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8);
      expect(fixture.port.callCount('close')).assertEqual(1);
      await fixture.controller.dispose();
      expect(fixture.port.callCount('close')).assertEqual(1);
      expectReleased(fixture);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(8, 1)));
    });

    /**
     * @tc.name SerialResourceReleaseTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRESOURCERELEASE_0400
     * @tc.desc dispose releases subscriptions and remains idempotent after receiving 16 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialResourceReleaseTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(16, 1));
      await fixture.controller.dispose();
      expectReleased(fixture);
      stale(payload(16, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(16);
      expect(fixture.port.callCount('close')).assertEqual(1);
      await fixture.controller.dispose();
      expect(fixture.port.callCount('close')).assertEqual(1);
      expectReleased(fixture);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(16, 1)));
    });

    /**
     * @tc.name SerialResourceReleaseTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRESOURCERELEASE_0500
     * @tc.desc dispose releases subscriptions and remains idempotent after receiving 31 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialResourceReleaseTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(31, 1));
      await fixture.controller.dispose();
      expectReleased(fixture);
      stale(payload(31, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(31);
      expect(fixture.port.callCount('close')).assertEqual(1);
      await fixture.controller.dispose();
      expect(fixture.port.callCount('close')).assertEqual(1);
      expectReleased(fixture);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(31, 1)));
    });

    /**
     * @tc.name SerialResourceReleaseTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRESOURCERELEASE_0600
     * @tc.desc dispose releases subscriptions and remains idempotent after receiving 32 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialResourceReleaseTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(32, 1));
      await fixture.controller.dispose();
      expectReleased(fixture);
      stale(payload(32, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(32);
      expect(fixture.port.callCount('close')).assertEqual(1);
      await fixture.controller.dispose();
      expect(fixture.port.callCount('close')).assertEqual(1);
      expectReleased(fixture);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(32, 1)));
    });

    /**
     * @tc.name SerialResourceReleaseTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRESOURCERELEASE_0700
     * @tc.desc dispose releases subscriptions and remains idempotent after receiving 63 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialResourceReleaseTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(63, 1));
      await fixture.controller.dispose();
      expectReleased(fixture);
      stale(payload(63, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(63);
      expect(fixture.port.callCount('close')).assertEqual(1);
      await fixture.controller.dispose();
      expect(fixture.port.callCount('close')).assertEqual(1);
      expectReleased(fixture);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(63, 1)));
    });
  });
}
