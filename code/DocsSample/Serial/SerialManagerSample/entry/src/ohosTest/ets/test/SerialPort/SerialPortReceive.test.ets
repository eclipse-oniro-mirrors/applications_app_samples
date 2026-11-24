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

export default function SerialPortReceiveTest(): void {
  describe('SerialPortReceiveTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialPortReceive', 'begin');
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
      logSuite('SerialPortReceive', 'end');
    });

    /**
     * @tc.name SerialPortReceiveTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTRECEIVE_0100
     * @tc.desc onDataRead accumulates 3 chunks of 1024 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortReceiveTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(1024, 2);
      for (let index: number = 0; index < 3; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(3072);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1024, 2)));
    });

    /**
     * @tc.name SerialPortReceiveTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTRECEIVE_0200
     * @tc.desc onDataRead accumulates 3 chunks of 2048 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortReceiveTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(2048, 2);
      for (let index: number = 0; index < 3; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(6144);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(2048, 2)));
    });

    /**
     * @tc.name SerialPortReceiveTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTRECEIVE_0300
     * @tc.desc onDataRead accumulates 3 chunks of 4095 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortReceiveTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(4095, 2);
      for (let index: number = 0; index < 3; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(12285);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4095, 2)));
    });

    /**
     * @tc.name SerialPortReceiveTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTRECEIVE_0400
     * @tc.desc onDataRead accumulates 3 chunks of 4096 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortReceiveTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(4096, 2);
      for (let index: number = 0; index < 3; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(12288);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4096, 2)));
    });

    /**
     * @tc.name SerialPortReceiveTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTRECEIVE_0500
     * @tc.desc onDataRead accumulates 4 chunks of 1 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortReceiveTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(1, 3);
      for (let index: number = 0; index < 4; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(4);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1, 3)));
    });

    /**
     * @tc.name SerialPortReceiveTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTRECEIVE_0600
     * @tc.desc onDataRead accumulates 4 chunks of 2 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortReceiveTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(2, 3);
      for (let index: number = 0; index < 4; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(8);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(2, 3)));
    });

    /**
     * @tc.name SerialPortReceiveTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTRECEIVE_0700
     * @tc.desc onDataRead accumulates 4 chunks of 3 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortReceiveTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(3, 3);
      for (let index: number = 0; index < 4; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(12);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(3, 3)));
    });

    /**
     * @tc.name SerialPortReceiveTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTRECEIVE_0800
     * @tc.desc onDataRead accumulates 4 chunks of 4 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortReceiveTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(4, 3);
      for (let index: number = 0; index < 4; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(16);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4, 3)));
    });

    /**
     * @tc.name SerialPortReceiveTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTRECEIVE_0900
     * @tc.desc onDataRead accumulates 4 chunks of 5 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortReceiveTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(5, 3);
      for (let index: number = 0; index < 4; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(20);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(5, 3)));
    });

    /**
     * @tc.name SerialPortReceiveTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTRECEIVE_1000
     * @tc.desc onDataRead accumulates 4 chunks of 7 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortReceiveTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(7, 3);
      for (let index: number = 0; index < 4; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(28);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(7, 3)));
    });

    /**
     * @tc.name SerialPortReceiveTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTRECEIVE_1100
     * @tc.desc onDataRead accumulates 4 chunks of 8 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortReceiveTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(8, 3);
      for (let index: number = 0; index < 4; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(32);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(8, 3)));
    });

    /**
     * @tc.name SerialPortReceiveTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTRECEIVE_1200
     * @tc.desc onDataRead accumulates 4 chunks of 16 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortReceiveTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(16, 3);
      for (let index: number = 0; index < 4; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(64);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(16, 3)));
    });

    /**
     * @tc.name SerialPortReceiveTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTRECEIVE_1300
     * @tc.desc onDataRead accumulates 4 chunks of 31 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortReceiveTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(31, 3);
      for (let index: number = 0; index < 4; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(124);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(31, 3)));
    });

    /**
     * @tc.name SerialPortReceiveTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTRECEIVE_1400
     * @tc.desc onDataRead accumulates 4 chunks of 32 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortReceiveTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(32, 3);
      for (let index: number = 0; index < 4; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(128);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(32, 3)));
    });

    /**
     * @tc.name SerialPortReceiveTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTRECEIVE_1500
     * @tc.desc onDataRead accumulates 4 chunks of 63 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortReceiveTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(63, 3);
      for (let index: number = 0; index < 4; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(252);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(63, 3)));
    });

    /**
     * @tc.name SerialPortReceiveTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTRECEIVE_1600
     * @tc.desc onDataRead accumulates 4 chunks of 64 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortReceiveTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(64, 3);
      for (let index: number = 0; index < 4; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(256);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(64, 3)));
    });

    /**
     * @tc.name SerialPortReceiveTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTRECEIVE_1700
     * @tc.desc onDataRead accumulates 4 chunks of 127 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortReceiveTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(127, 3);
      for (let index: number = 0; index < 4; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(508);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(127, 3)));
    });

    /**
     * @tc.name SerialPortReceiveTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTRECEIVE_1800
     * @tc.desc onDataRead accumulates 4 chunks of 128 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortReceiveTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(128, 3);
      for (let index: number = 0; index < 4; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(512);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(128, 3)));
    });

    /**
     * @tc.name SerialPortReceiveTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTRECEIVE_1900
     * @tc.desc onDataRead accumulates 4 chunks of 255 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortReceiveTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(255, 3);
      for (let index: number = 0; index < 4; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(1020);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(255, 3)));
    });

    /**
     * @tc.name SerialPortReceiveTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTRECEIVE_2000
     * @tc.desc onDataRead accumulates 4 chunks of 256 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortReceiveTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(256, 3);
      for (let index: number = 0; index < 4; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(1024);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(256, 3)));
    });

    /**
     * @tc.name SerialPortReceiveTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTRECEIVE_2100
     * @tc.desc onDataRead accumulates 4 chunks of 511 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortReceiveTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(511, 3);
      for (let index: number = 0; index < 4; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(2044);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(511, 3)));
    });

    /**
     * @tc.name SerialPortReceiveTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTRECEIVE_2200
     * @tc.desc onDataRead accumulates 4 chunks of 512 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortReceiveTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(512, 3);
      for (let index: number = 0; index < 4; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(2048);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(512, 3)));
    });

    /**
     * @tc.name SerialPortReceiveTest023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTRECEIVE_2300
     * @tc.desc onDataRead accumulates 4 chunks of 1023 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortReceiveTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(1023, 3);
      for (let index: number = 0; index < 4; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(4092);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1023, 3)));
    });
  });
}
