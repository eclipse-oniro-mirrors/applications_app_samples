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

export default function SerialCallbackRegistrationTest(): void {
  describe('SerialCallbackRegistrationTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialCallbackRegistration', 'begin');
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
      logSuite('SerialCallbackRegistration', 'end');
    });

    /**
     * @tc.name SerialCallbackRegistrationTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREGISTRATION_0100
     * @tc.desc onDataRead remains idempotent across 2 registrations then receives 1 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRegistrationTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 2; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(1, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialCallbackRegistrationTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREGISTRATION_0200
     * @tc.desc onDataRead remains idempotent across 2 registrations then receives 2 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRegistrationTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 2; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(2, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialCallbackRegistrationTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREGISTRATION_0300
     * @tc.desc onDataRead remains idempotent across 2 registrations then receives 3 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRegistrationTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 2; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(3, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(3);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialCallbackRegistrationTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREGISTRATION_0400
     * @tc.desc onDataRead remains idempotent across 2 registrations then receives 4 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRegistrationTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 2; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(4, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialCallbackRegistrationTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREGISTRATION_0500
     * @tc.desc onDataRead remains idempotent across 2 registrations then receives 5 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRegistrationTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 2; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(5, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(5);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialCallbackRegistrationTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREGISTRATION_0600
     * @tc.desc onDataRead remains idempotent across 2 registrations then receives 7 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRegistrationTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 2; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(7, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(7);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialCallbackRegistrationTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREGISTRATION_0700
     * @tc.desc onDataRead remains idempotent across 2 registrations then receives 8 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRegistrationTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 2; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(8, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialCallbackRegistrationTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREGISTRATION_0800
     * @tc.desc onDataRead remains idempotent across 2 registrations then receives 16 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRegistrationTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 2; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(16, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(16);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialCallbackRegistrationTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREGISTRATION_0900
     * @tc.desc onDataRead remains idempotent across 2 registrations then receives 31 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRegistrationTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 2; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(31, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(31);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialCallbackRegistrationTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREGISTRATION_1000
     * @tc.desc onDataRead remains idempotent across 2 registrations then receives 32 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRegistrationTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 2; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(32, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(32);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialCallbackRegistrationTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREGISTRATION_1100
     * @tc.desc onDataRead remains idempotent across 2 registrations then receives 63 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRegistrationTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 2; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(63, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(63);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialCallbackRegistrationTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREGISTRATION_1200
     * @tc.desc onDataRead remains idempotent across 2 registrations then receives 64 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRegistrationTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 2; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(64, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(64);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialCallbackRegistrationTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREGISTRATION_1300
     * @tc.desc onDataRead remains idempotent across 2 registrations then receives 127 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRegistrationTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 2; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(127, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(127);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialCallbackRegistrationTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREGISTRATION_1400
     * @tc.desc onDataRead remains idempotent across 2 registrations then receives 128 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRegistrationTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 2; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(128, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(128);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialCallbackRegistrationTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREGISTRATION_1500
     * @tc.desc onDataRead remains idempotent across 2 registrations then receives 255 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRegistrationTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 2; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(255, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(255);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialCallbackRegistrationTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREGISTRATION_1600
     * @tc.desc onDataRead remains idempotent across 2 registrations then receives 256 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRegistrationTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 2; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(256, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(256);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialCallbackRegistrationTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREGISTRATION_1700
     * @tc.desc onDataRead remains idempotent across 2 registrations then receives 511 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRegistrationTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 2; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(511, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(511);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialCallbackRegistrationTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREGISTRATION_1800
     * @tc.desc onDataRead remains idempotent across 2 registrations then receives 512 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRegistrationTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 2; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(512, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(512);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialCallbackRegistrationTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREGISTRATION_1900
     * @tc.desc onDataRead remains idempotent across 2 registrations then receives 1023 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRegistrationTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 2; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(1023, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1023);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialCallbackRegistrationTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREGISTRATION_2000
     * @tc.desc onDataRead remains idempotent across 2 registrations then receives 1024 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRegistrationTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 2; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(1024, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1024);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialCallbackRegistrationTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREGISTRATION_2100
     * @tc.desc onDataRead remains idempotent across 2 registrations then receives 2048 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRegistrationTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 2; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(2048, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2048);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialCallbackRegistrationTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREGISTRATION_2200
     * @tc.desc onDataRead remains idempotent across 2 registrations then receives 4095 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRegistrationTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 2; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(4095, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4095);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialCallbackRegistrationTest023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREGISTRATION_2300
     * @tc.desc onDataRead remains idempotent across 2 registrations then receives 4096 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRegistrationTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 2; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(4096, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4096);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialCallbackRegistrationTest024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREGISTRATION_2400
     * @tc.desc onDataRead remains idempotent across 3 registrations then receives 1 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRegistrationTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 3; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(1, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialCallbackRegistrationTest025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREGISTRATION_2500
     * @tc.desc onDataRead remains idempotent across 3 registrations then receives 2 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRegistrationTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 3; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(2, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialCallbackRegistrationTest026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREGISTRATION_2600
     * @tc.desc onDataRead remains idempotent across 3 registrations then receives 3 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRegistrationTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 3; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(3, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(3);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialCallbackRegistrationTest027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREGISTRATION_2700
     * @tc.desc onDataRead remains idempotent across 3 registrations then receives 4 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRegistrationTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 3; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(4, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialCallbackRegistrationTest028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREGISTRATION_2800
     * @tc.desc onDataRead remains idempotent across 3 registrations then receives 5 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRegistrationTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 3; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(5, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(5);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialCallbackRegistrationTest029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREGISTRATION_2900
     * @tc.desc onDataRead remains idempotent across 3 registrations then receives 7 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRegistrationTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 3; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(7, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(7);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialCallbackRegistrationTest030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREGISTRATION_3000
     * @tc.desc onDataRead remains idempotent across 3 registrations then receives 8 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRegistrationTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 3; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(8, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialCallbackRegistrationTest031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREGISTRATION_3100
     * @tc.desc onDataRead remains idempotent across 3 registrations then receives 16 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRegistrationTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 3; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(16, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(16);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialCallbackRegistrationTest032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREGISTRATION_3200
     * @tc.desc onDataRead remains idempotent across 3 registrations then receives 31 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRegistrationTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 3; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(31, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(31);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialCallbackRegistrationTest033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREGISTRATION_3300
     * @tc.desc onDataRead remains idempotent across 3 registrations then receives 32 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRegistrationTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 3; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(32, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(32);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialCallbackRegistrationTest034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREGISTRATION_3400
     * @tc.desc offDataRead rejects a selected port without a registered callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRegistrationTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      await expectFailure(async () => fixture.controller.offDataRead(), 'SerialStateError');
      expect(fixture.port.callCount('offDataRead')).assertEqual(0);
      await fixture.controller.onDataRead();
      await fixture.controller.offDataRead();
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackRegistrationTest035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREGISTRATION_3500
     * @tc.desc offDisconnect rejects a selected port without a registered callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRegistrationTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      await expectFailure(async () => fixture.controller.offDisconnect(), 'SerialStateError');
      expect(fixture.port.callCount('offDisconnect')).assertEqual(0);
      await fixture.controller.onDisconnect();
      await fixture.controller.offDisconnect();
      expect(fixture.port.callCount('offDisconnect')).assertEqual(1);
    });
  });
}
