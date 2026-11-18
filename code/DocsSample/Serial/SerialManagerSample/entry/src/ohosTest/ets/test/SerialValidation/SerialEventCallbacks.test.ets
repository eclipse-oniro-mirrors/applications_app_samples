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

export default function SerialEventCallbacksTest(): void {
  describe('SerialEventCallbacksTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialEventCallbacks', 'begin');
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
      logSuite('SerialEventCallbacks', 'end');
    });

    /**
     * @tc.name SerialEventCallbacksTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEVENTCALLBACKS_0100
     * @tc.desc onDataRead remains idempotent across 4 registrations then receives 7 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEventCallbacksTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 4; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(7, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(7);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialEventCallbacksTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEVENTCALLBACKS_0200
     * @tc.desc onDataRead remains idempotent across 4 registrations then receives 8 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEventCallbacksTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 4; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(8, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialEventCallbacksTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEVENTCALLBACKS_0300
     * @tc.desc onDataRead remains idempotent across 4 registrations then receives 16 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEventCallbacksTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 4; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(16, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(16);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialEventCallbacksTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEVENTCALLBACKS_0400
     * @tc.desc onDataRead remains idempotent across 4 registrations then receives 31 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEventCallbacksTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 4; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(31, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(31);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialEventCallbacksTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEVENTCALLBACKS_0500
     * @tc.desc onDataRead remains idempotent across 4 registrations then receives 32 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEventCallbacksTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 4; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(32, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(32);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialEventCallbacksTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEVENTCALLBACKS_0600
     * @tc.desc onDataRead remains idempotent across 4 registrations then receives 63 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEventCallbacksTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 4; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(63, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(63);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialEventCallbacksTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEVENTCALLBACKS_0700
     * @tc.desc onDataRead remains idempotent across 4 registrations then receives 64 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEventCallbacksTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 4; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(64, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(64);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialEventCallbacksTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEVENTCALLBACKS_0800
     * @tc.desc onDataRead remains idempotent across 4 registrations then receives 127 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEventCallbacksTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 4; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(127, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(127);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialEventCallbacksTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEVENTCALLBACKS_0900
     * @tc.desc onDataRead remains idempotent across 4 registrations then receives 128 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEventCallbacksTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 4; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(128, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(128);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialEventCallbacksTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEVENTCALLBACKS_1000
     * @tc.desc onDataRead remains idempotent across 4 registrations then receives 255 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEventCallbacksTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 4; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(255, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(255);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialEventCallbacksTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEVENTCALLBACKS_1100
     * @tc.desc onDataRead remains idempotent across 4 registrations then receives 256 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEventCallbacksTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 4; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(256, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(256);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialEventCallbacksTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEVENTCALLBACKS_1200
     * @tc.desc onDataRead remains idempotent across 4 registrations then receives 511 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEventCallbacksTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 4; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(511, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(511);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialEventCallbacksTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEVENTCALLBACKS_1300
     * @tc.desc onDataRead remains idempotent across 4 registrations then receives 512 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEventCallbacksTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 4; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(512, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(512);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialEventCallbacksTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEVENTCALLBACKS_1400
     * @tc.desc onDataRead remains idempotent across 4 registrations then receives 1023 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEventCallbacksTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 4; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(1023, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1023);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialEventCallbacksTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEVENTCALLBACKS_1500
     * @tc.desc onDataRead remains idempotent across 4 registrations then receives 1024 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEventCallbacksTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 4; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(1024, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1024);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialEventCallbacksTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEVENTCALLBACKS_1600
     * @tc.desc onDataRead remains idempotent across 4 registrations then receives 2048 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEventCallbacksTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 4; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(2048, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2048);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialEventCallbacksTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEVENTCALLBACKS_1700
     * @tc.desc onDataRead remains idempotent across 4 registrations then receives 4095 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEventCallbacksTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 4; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(4095, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4095);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialEventCallbacksTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEVENTCALLBACKS_1800
     * @tc.desc onDataRead remains idempotent across 4 registrations then receives 4096 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEventCallbacksTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 4; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(4096, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4096);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });
  });
}
