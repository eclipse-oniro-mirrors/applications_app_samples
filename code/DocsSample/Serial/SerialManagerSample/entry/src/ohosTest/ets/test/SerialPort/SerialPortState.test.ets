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

export default function SerialPortStateTest(): void {
  describe('SerialPortStateTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialPortState', 'begin');
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
      logSuite('SerialPortState', 'end');
    });

    /**
     * @tc.name SerialPortStateTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSTATE_0100
     * @tc.desc onDataRead remains idempotent across 3 registrations then receives 63 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortStateTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 3; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(63, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(63);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortStateTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSTATE_0200
     * @tc.desc onDataRead remains idempotent across 3 registrations then receives 64 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortStateTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 3; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(64, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(64);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortStateTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSTATE_0300
     * @tc.desc onDataRead remains idempotent across 3 registrations then receives 127 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortStateTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 3; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(127, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(127);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortStateTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSTATE_0400
     * @tc.desc onDataRead remains idempotent across 3 registrations then receives 128 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortStateTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 3; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(128, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(128);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortStateTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSTATE_0500
     * @tc.desc onDataRead remains idempotent across 3 registrations then receives 255 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortStateTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 3; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(255, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(255);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortStateTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSTATE_0600
     * @tc.desc onDataRead remains idempotent across 3 registrations then receives 256 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortStateTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 3; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(256, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(256);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortStateTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSTATE_0700
     * @tc.desc onDataRead remains idempotent across 3 registrations then receives 511 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortStateTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 3; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(511, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(511);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortStateTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSTATE_0800
     * @tc.desc onDataRead remains idempotent across 3 registrations then receives 512 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortStateTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 3; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(512, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(512);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortStateTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSTATE_0900
     * @tc.desc onDataRead remains idempotent across 3 registrations then receives 1023 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortStateTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 3; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(1023, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1023);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortStateTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSTATE_1000
     * @tc.desc onDataRead remains idempotent across 3 registrations then receives 1024 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortStateTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 3; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(1024, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1024);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortStateTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSTATE_1100
     * @tc.desc onDataRead remains idempotent across 3 registrations then receives 2048 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortStateTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 3; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(2048, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2048);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortStateTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSTATE_1200
     * @tc.desc onDataRead remains idempotent across 3 registrations then receives 4095 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortStateTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 3; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(4095, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4095);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortStateTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSTATE_1300
     * @tc.desc onDataRead remains idempotent across 3 registrations then receives 4096 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortStateTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 3; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(4096, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4096);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortStateTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSTATE_1400
     * @tc.desc onDataRead remains idempotent across 4 registrations then receives 1 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortStateTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 4; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(1, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortStateTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSTATE_1500
     * @tc.desc onDataRead remains idempotent across 4 registrations then receives 2 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortStateTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 4; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(2, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortStateTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSTATE_1600
     * @tc.desc onDataRead remains idempotent across 4 registrations then receives 3 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortStateTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 4; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(3, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(3);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortStateTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSTATE_1700
     * @tc.desc onDataRead remains idempotent across 4 registrations then receives 4 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortStateTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 4; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(4, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortStateTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSTATE_1800
     * @tc.desc onDataRead remains idempotent across 4 registrations then receives 5 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortStateTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      for (let index: number = 0; index < 4; index++) {
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
      }
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(1);
      fixture.port.emitData(payload(5, 2));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(5);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.offDisconnect();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
    });
  });
}
