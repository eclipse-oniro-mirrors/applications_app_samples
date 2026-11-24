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

export default function SerialStaleCallbacksTest(): void {
  describe('SerialStaleCallbacksTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialStaleCallbacks', 'begin');
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
      logSuite('SerialStaleCallbacks', 'end');
    });

    /**
     * @tc.name SerialStaleCallbacksTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSTALECALLBACKS_0100
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 2048 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialStaleCallbacksTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(2048, 1));
      await fixture.controller.offDataRead();
      stale(payload(2048, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2048);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(2048, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2048);
      fixture.port.emitData(payload(2048, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4096);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialStaleCallbacksTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSTALECALLBACKS_0200
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 4095 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialStaleCallbacksTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(4095, 1));
      await fixture.controller.offDataRead();
      stale(payload(4095, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4095);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(4095, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4095);
      fixture.port.emitData(payload(4095, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8190);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialStaleCallbacksTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSTALECALLBACKS_0300
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 4096 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialStaleCallbacksTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(4096, 1));
      await fixture.controller.offDataRead();
      stale(payload(4096, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4096);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(4096, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4096);
      fixture.port.emitData(payload(4096, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8192);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialStaleCallbacksTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSTALECALLBACKS_0400
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 1 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialStaleCallbacksTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(1, 2));
      await fixture.controller.offDataRead();
      stale(payload(1, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(1, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1);
      fixture.port.emitData(payload(1, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialStaleCallbacksTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSTALECALLBACKS_0500
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 2 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialStaleCallbacksTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(2, 2));
      await fixture.controller.offDataRead();
      stale(payload(2, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(2, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2);
      fixture.port.emitData(payload(2, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialStaleCallbacksTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSTALECALLBACKS_0600
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 3 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialStaleCallbacksTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(3, 2));
      await fixture.controller.offDataRead();
      stale(payload(3, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(3);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(3, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(3);
      fixture.port.emitData(payload(3, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(6);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialStaleCallbacksTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSTALECALLBACKS_0700
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 4 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialStaleCallbacksTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(4, 2));
      await fixture.controller.offDataRead();
      stale(payload(4, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(4, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4);
      fixture.port.emitData(payload(4, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialStaleCallbacksTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSTALECALLBACKS_0800
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 5 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialStaleCallbacksTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(5, 2));
      await fixture.controller.offDataRead();
      stale(payload(5, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(5);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(5, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(5);
      fixture.port.emitData(payload(5, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(10);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialStaleCallbacksTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSTALECALLBACKS_0900
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 7 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialStaleCallbacksTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(7, 2));
      await fixture.controller.offDataRead();
      stale(payload(7, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(7);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(7, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(7);
      fixture.port.emitData(payload(7, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(14);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialStaleCallbacksTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSTALECALLBACKS_1000
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 8 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialStaleCallbacksTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(8, 2));
      await fixture.controller.offDataRead();
      stale(payload(8, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(8, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8);
      fixture.port.emitData(payload(8, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(16);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialStaleCallbacksTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSTALECALLBACKS_1100
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 16 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialStaleCallbacksTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(16, 2));
      await fixture.controller.offDataRead();
      stale(payload(16, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(16);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(16, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(16);
      fixture.port.emitData(payload(16, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(32);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });
  });
}
