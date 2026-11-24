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

export default function SerialCallbackResourcesTest(): void {
  describe('SerialCallbackResourcesTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialCallbackResources', 'begin');
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
      logSuite('SerialCallbackResources', 'end');
    });

    /**
     * @tc.name SerialCallbackResourcesTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKRESOURCES_0100
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 16 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackResourcesTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(16, 1));
      await fixture.controller.offDataRead();
      stale(payload(16, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(16);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(16, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(16);
      fixture.port.emitData(payload(16, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(32);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackResourcesTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKRESOURCES_0200
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 31 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackResourcesTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(31, 1));
      await fixture.controller.offDataRead();
      stale(payload(31, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(31);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(31, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(31);
      fixture.port.emitData(payload(31, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(62);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackResourcesTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKRESOURCES_0300
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 32 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackResourcesTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(32, 1));
      await fixture.controller.offDataRead();
      stale(payload(32, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(32);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(32, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(32);
      fixture.port.emitData(payload(32, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(64);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackResourcesTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKRESOURCES_0400
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 63 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackResourcesTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(63, 1));
      await fixture.controller.offDataRead();
      stale(payload(63, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(63);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(63, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(63);
      fixture.port.emitData(payload(63, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(126);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackResourcesTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKRESOURCES_0500
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 64 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackResourcesTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(64, 1));
      await fixture.controller.offDataRead();
      stale(payload(64, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(64);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(64, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(64);
      fixture.port.emitData(payload(64, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(128);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackResourcesTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKRESOURCES_0600
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 127 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackResourcesTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(127, 1));
      await fixture.controller.offDataRead();
      stale(payload(127, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(127);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(127, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(127);
      fixture.port.emitData(payload(127, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(254);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackResourcesTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKRESOURCES_0700
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 128 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackResourcesTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(128, 1));
      await fixture.controller.offDataRead();
      stale(payload(128, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(128);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(128, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(128);
      fixture.port.emitData(payload(128, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(256);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackResourcesTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKRESOURCES_0800
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 255 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackResourcesTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(255, 1));
      await fixture.controller.offDataRead();
      stale(payload(255, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(255);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(255, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(255);
      fixture.port.emitData(payload(255, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(510);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackResourcesTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKRESOURCES_0900
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 256 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackResourcesTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(256, 1));
      await fixture.controller.offDataRead();
      stale(payload(256, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(256);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(256, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(256);
      fixture.port.emitData(payload(256, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(512);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackResourcesTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKRESOURCES_1000
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 511 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackResourcesTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(511, 1));
      await fixture.controller.offDataRead();
      stale(payload(511, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(511);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(511, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(511);
      fixture.port.emitData(payload(511, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1022);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackResourcesTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKRESOURCES_1100
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 512 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackResourcesTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(512, 1));
      await fixture.controller.offDataRead();
      stale(payload(512, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(512);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(512, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(512);
      fixture.port.emitData(payload(512, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1024);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackResourcesTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKRESOURCES_1200
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 1023 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackResourcesTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(1023, 1));
      await fixture.controller.offDataRead();
      stale(payload(1023, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1023);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(1023, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1023);
      fixture.port.emitData(payload(1023, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2046);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackResourcesTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKRESOURCES_1300
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 1024 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackResourcesTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(1024, 1));
      await fixture.controller.offDataRead();
      stale(payload(1024, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1024);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(1024, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1024);
      fixture.port.emitData(payload(1024, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2048);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });
  });
}
