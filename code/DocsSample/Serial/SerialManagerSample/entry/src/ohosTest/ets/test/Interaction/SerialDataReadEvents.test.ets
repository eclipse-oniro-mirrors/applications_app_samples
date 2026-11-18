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

export default function SerialDataReadEventsTest(): void {
  describe('SerialDataReadEventsTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialDataReadEvents', 'begin');
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
      logSuite('SerialDataReadEvents', 'end');
    });

    /**
     * @tc.name SerialDataReadEventsTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATAREADEVENTS_0100
     * @tc.desc onDataRead accumulates 1 chunks of 1 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataReadEventsTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(1, 0);
      for (let index: number = 0; index < 1; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(1);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1, 0)));
    });

    /**
     * @tc.name SerialDataReadEventsTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATAREADEVENTS_0200
     * @tc.desc onDataRead accumulates 1 chunks of 2 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataReadEventsTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(2, 0);
      for (let index: number = 0; index < 1; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(2);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(2, 0)));
    });

    /**
     * @tc.name SerialDataReadEventsTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATAREADEVENTS_0300
     * @tc.desc onDataRead accumulates 1 chunks of 3 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataReadEventsTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(3, 0);
      for (let index: number = 0; index < 1; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(3);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(3, 0)));
    });

    /**
     * @tc.name SerialDataReadEventsTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATAREADEVENTS_0400
     * @tc.desc onDataRead accumulates 1 chunks of 4 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataReadEventsTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(4, 0);
      for (let index: number = 0; index < 1; index++) {
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4, 0)));
    });

    /**
     * @tc.name SerialDataReadEventsTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATAREADEVENTS_0500
     * @tc.desc onDataRead accumulates 1 chunks of 5 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataReadEventsTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(5, 0);
      for (let index: number = 0; index < 1; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(5);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(5, 0)));
    });

    /**
     * @tc.name SerialDataReadEventsTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATAREADEVENTS_0600
     * @tc.desc onDataRead accumulates 1 chunks of 7 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataReadEventsTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(7, 0);
      for (let index: number = 0; index < 1; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(7);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(7, 0)));
    });

    /**
     * @tc.name SerialDataReadEventsTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATAREADEVENTS_0700
     * @tc.desc onDataRead accumulates 1 chunks of 8 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataReadEventsTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(8, 0);
      for (let index: number = 0; index < 1; index++) {
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(8, 0)));
    });

    /**
     * @tc.name SerialDataReadEventsTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATAREADEVENTS_0800
     * @tc.desc onDataRead accumulates 1 chunks of 16 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataReadEventsTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(16, 0);
      for (let index: number = 0; index < 1; index++) {
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(16, 0)));
    });

    /**
     * @tc.name SerialDataReadEventsTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATAREADEVENTS_0900
     * @tc.desc onDataRead accumulates 1 chunks of 31 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataReadEventsTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(31, 0);
      for (let index: number = 0; index < 1; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(31);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(31, 0)));
    });

    /**
     * @tc.name SerialDataReadEventsTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATAREADEVENTS_1000
     * @tc.desc onDataRead accumulates 1 chunks of 32 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataReadEventsTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(32, 0);
      for (let index: number = 0; index < 1; index++) {
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(32, 0)));
    });

    /**
     * @tc.name SerialDataReadEventsTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATAREADEVENTS_1100
     * @tc.desc onDataRead accumulates 1 chunks of 63 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataReadEventsTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(63, 0);
      for (let index: number = 0; index < 1; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(63);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(63, 0)));
    });

    /**
     * @tc.name SerialDataReadEventsTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATAREADEVENTS_1200
     * @tc.desc onDataRead accumulates 1 chunks of 64 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataReadEventsTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(64, 0);
      for (let index: number = 0; index < 1; index++) {
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(64, 0)));
    });

    /**
     * @tc.name SerialDataReadEventsTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATAREADEVENTS_1300
     * @tc.desc onDataRead accumulates 1 chunks of 127 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataReadEventsTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(127, 0);
      for (let index: number = 0; index < 1; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(127);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(127, 0)));
    });

    /**
     * @tc.name SerialDataReadEventsTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATAREADEVENTS_1400
     * @tc.desc onDataRead accumulates 1 chunks of 128 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataReadEventsTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(128, 0);
      for (let index: number = 0; index < 1; index++) {
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(128, 0)));
    });

    /**
     * @tc.name SerialDataReadEventsTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATAREADEVENTS_1500
     * @tc.desc onDataRead accumulates 1 chunks of 255 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataReadEventsTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(255, 0);
      for (let index: number = 0; index < 1; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(255);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(255, 0)));
    });

    /**
     * @tc.name SerialDataReadEventsTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATAREADEVENTS_1600
     * @tc.desc onDataRead accumulates 1 chunks of 256 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataReadEventsTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(256, 0);
      for (let index: number = 0; index < 1; index++) {
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(256, 0)));
    });

    /**
     * @tc.name SerialDataReadEventsTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATAREADEVENTS_1700
     * @tc.desc onDataRead accumulates 1 chunks of 511 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataReadEventsTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(511, 0);
      for (let index: number = 0; index < 1; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(511);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(511, 0)));
    });

    /**
     * @tc.name SerialDataReadEventsTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATAREADEVENTS_1800
     * @tc.desc onDataRead accumulates 1 chunks of 512 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataReadEventsTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(512, 0);
      for (let index: number = 0; index < 1; index++) {
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(512, 0)));
    });

    /**
     * @tc.name SerialDataReadEventsTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATAREADEVENTS_1900
     * @tc.desc onDataRead accumulates 1 chunks of 1023 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataReadEventsTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(1023, 0);
      for (let index: number = 0; index < 1; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(1023);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1023, 0)));
    });

    /**
     * @tc.name SerialDataReadEventsTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATAREADEVENTS_2000
     * @tc.desc onDataRead accumulates 1 chunks of 1024 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataReadEventsTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(1024, 0);
      for (let index: number = 0; index < 1; index++) {
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1024, 0)));
    });

    /**
     * @tc.name SerialDataReadEventsTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATAREADEVENTS_2100
     * @tc.desc onDataRead accumulates 1 chunks of 2048 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataReadEventsTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(2048, 0);
      for (let index: number = 0; index < 1; index++) {
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(2048, 0)));
    });

    /**
     * @tc.name SerialDataReadEventsTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATAREADEVENTS_2200
     * @tc.desc onDataRead accumulates 1 chunks of 4095 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataReadEventsTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(4095, 0);
      for (let index: number = 0; index < 1; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(4095);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4095, 0)));
    });

    /**
     * @tc.name SerialDataReadEventsTest023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATAREADEVENTS_2300
     * @tc.desc onDataRead accumulates 1 chunks of 4096 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataReadEventsTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(4096, 0);
      for (let index: number = 0; index < 1; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(4096);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4096, 0)));
    });

    /**
     * @tc.name SerialDataReadEventsTest024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATAREADEVENTS_2400
     * @tc.desc onDataRead accumulates 2 chunks of 1 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataReadEventsTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(1, 1);
      for (let index: number = 0; index < 2; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(2);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1, 1)));
    });

    /**
     * @tc.name SerialDataReadEventsTest025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATAREADEVENTS_2500
     * @tc.desc onDataRead accumulates 2 chunks of 2 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataReadEventsTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(2, 1);
      for (let index: number = 0; index < 2; index++) {
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(2, 1)));
    });

    /**
     * @tc.name SerialDataReadEventsTest026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATAREADEVENTS_2600
     * @tc.desc onDataRead accumulates 2 chunks of 3 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataReadEventsTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(3, 1);
      for (let index: number = 0; index < 2; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(6);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(3, 1)));
    });

    /**
     * @tc.name SerialDataReadEventsTest027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATAREADEVENTS_2700
     * @tc.desc onDataRead accumulates 2 chunks of 4 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataReadEventsTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(4, 1);
      for (let index: number = 0; index < 2; index++) {
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4, 1)));
    });

    /**
     * @tc.name SerialDataReadEventsTest028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATAREADEVENTS_2800
     * @tc.desc onDataRead accumulates 2 chunks of 5 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataReadEventsTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(5, 1);
      for (let index: number = 0; index < 2; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(10);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(5, 1)));
    });

    /**
     * @tc.name SerialDataReadEventsTest029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATAREADEVENTS_2900
     * @tc.desc onDataRead accumulates 2 chunks of 7 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataReadEventsTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(7, 1);
      for (let index: number = 0; index < 2; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(14);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(7, 1)));
    });

    /**
     * @tc.name SerialDataReadEventsTest030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATAREADEVENTS_3000
     * @tc.desc onDataRead accumulates 2 chunks of 8 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataReadEventsTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(8, 1);
      for (let index: number = 0; index < 2; index++) {
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(8, 1)));
    });

    /**
     * @tc.name SerialDataReadEventsTest031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATAREADEVENTS_3100
     * @tc.desc onDataRead accumulates 2 chunks of 16 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataReadEventsTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(16, 1);
      for (let index: number = 0; index < 2; index++) {
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(16, 1)));
    });

    /**
     * @tc.name SerialDataReadEventsTest032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATAREADEVENTS_3200
     * @tc.desc onDataRead accumulates 2 chunks of 31 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataReadEventsTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(31, 1);
      for (let index: number = 0; index < 2; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(62);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(31, 1)));
    });

    /**
     * @tc.name SerialDataReadEventsTest033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATAREADEVENTS_3300
     * @tc.desc onDataRead accumulates 2 chunks of 32 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataReadEventsTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(32, 1);
      for (let index: number = 0; index < 2; index++) {
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(32, 1)));
    });
  });
}
