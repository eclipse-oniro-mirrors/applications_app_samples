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

export default function SerialReceiveBoundariesTest(): void {
  describe('SerialReceiveBoundariesTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialReceiveBoundaries', 'begin');
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
      logSuite('SerialReceiveBoundaries', 'end');
    });

    /**
     * @tc.name SerialReceiveBoundariesTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_0100
     * @tc.desc onDataRead accumulates 4 chunks of 1024 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(1024, 3);
      for (let index: number = 0; index < 4; index++) {
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1024, 3)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_0200
     * @tc.desc onDataRead accumulates 4 chunks of 2048 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(2048, 3);
      for (let index: number = 0; index < 4; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(8192);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(2048, 3)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_0300
     * @tc.desc onDataRead accumulates 4 chunks of 4095 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(4095, 3);
      for (let index: number = 0; index < 4; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(16380);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4095, 3)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_0400
     * @tc.desc onDataRead accumulates 4 chunks of 4096 bytes seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(4096, 3);
      for (let index: number = 0; index < 4; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(16384);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4096, 3)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_0500
     * @tc.desc onDataRead accumulates 5 chunks of 1 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(1, 4);
      for (let index: number = 0; index < 5; index++) {
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1, 4)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_0600
     * @tc.desc onDataRead accumulates 5 chunks of 2 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(2, 4);
      for (let index: number = 0; index < 5; index++) {
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(2, 4)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_0700
     * @tc.desc onDataRead accumulates 5 chunks of 3 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(3, 4);
      for (let index: number = 0; index < 5; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(15);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(3, 4)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_0800
     * @tc.desc onDataRead accumulates 5 chunks of 4 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(4, 4);
      for (let index: number = 0; index < 5; index++) {
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4, 4)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_0900
     * @tc.desc onDataRead accumulates 5 chunks of 5 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(5, 4);
      for (let index: number = 0; index < 5; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(25);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(5, 4)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_1000
     * @tc.desc onDataRead accumulates 5 chunks of 7 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(7, 4);
      for (let index: number = 0; index < 5; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(35);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(7, 4)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_1100
     * @tc.desc onDataRead accumulates 5 chunks of 8 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(8, 4);
      for (let index: number = 0; index < 5; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(40);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(8, 4)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_1200
     * @tc.desc onDataRead accumulates 5 chunks of 16 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(16, 4);
      for (let index: number = 0; index < 5; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(80);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(16, 4)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_1300
     * @tc.desc onDataRead accumulates 5 chunks of 31 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(31, 4);
      for (let index: number = 0; index < 5; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(155);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(31, 4)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_1400
     * @tc.desc onDataRead accumulates 5 chunks of 32 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(32, 4);
      for (let index: number = 0; index < 5; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(160);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(32, 4)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_1500
     * @tc.desc onDataRead accumulates 5 chunks of 63 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(63, 4);
      for (let index: number = 0; index < 5; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(315);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(63, 4)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_1600
     * @tc.desc onDataRead accumulates 5 chunks of 64 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(64, 4);
      for (let index: number = 0; index < 5; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(320);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(64, 4)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_1700
     * @tc.desc onDataRead accumulates 5 chunks of 127 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(127, 4);
      for (let index: number = 0; index < 5; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(635);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(127, 4)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_1800
     * @tc.desc onDataRead accumulates 5 chunks of 128 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(128, 4);
      for (let index: number = 0; index < 5; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(640);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(128, 4)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_1900
     * @tc.desc onDataRead accumulates 5 chunks of 255 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(255, 4);
      for (let index: number = 0; index < 5; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(1275);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(255, 4)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_2000
     * @tc.desc onDataRead accumulates 5 chunks of 256 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(256, 4);
      for (let index: number = 0; index < 5; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(1280);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(256, 4)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_2100
     * @tc.desc onDataRead accumulates 5 chunks of 511 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(511, 4);
      for (let index: number = 0; index < 5; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(2555);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(511, 4)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_2200
     * @tc.desc onDataRead accumulates 5 chunks of 512 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(512, 4);
      for (let index: number = 0; index < 5; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(2560);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(512, 4)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_2300
     * @tc.desc onDataRead accumulates 5 chunks of 1023 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(1023, 4);
      for (let index: number = 0; index < 5; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(5115);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1023, 4)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_2400
     * @tc.desc onDataRead accumulates 5 chunks of 1024 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(1024, 4);
      for (let index: number = 0; index < 5; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(5120);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1024, 4)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_2500
     * @tc.desc onDataRead accumulates 5 chunks of 2048 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(2048, 4);
      for (let index: number = 0; index < 5; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(10240);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(2048, 4)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_2600
     * @tc.desc onDataRead accumulates 5 chunks of 4095 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(4095, 4);
      for (let index: number = 0; index < 5; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(20475);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4095, 4)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_2700
     * @tc.desc onDataRead accumulates 5 chunks of 4096 bytes seed 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(4096, 4);
      for (let index: number = 0; index < 5; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(20480);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4096, 4)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_2800
     * @tc.desc onDataRead accumulates 1 chunks of 1 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(1, 5);
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1, 5)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_2900
     * @tc.desc onDataRead accumulates 1 chunks of 2 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(2, 5);
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(2, 5)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_3000
     * @tc.desc onDataRead accumulates 1 chunks of 3 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(3, 5);
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(3, 5)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_3100
     * @tc.desc onDataRead accumulates 1 chunks of 4 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(4, 5);
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4, 5)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_3200
     * @tc.desc onDataRead accumulates 1 chunks of 5 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(5, 5);
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(5, 5)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_3300
     * @tc.desc onDataRead accumulates 1 chunks of 7 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(7, 5);
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(7, 5)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_3400
     * @tc.desc onDataRead accumulates 1 chunks of 8 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(8, 5);
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(8, 5)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_3500
     * @tc.desc onDataRead accumulates 1 chunks of 16 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(16, 5);
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(16, 5)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_3600
     * @tc.desc onDataRead accumulates 1 chunks of 31 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(31, 5);
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(31, 5)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_3700
     * @tc.desc onDataRead accumulates 1 chunks of 32 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(32, 5);
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(32, 5)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_3800
     * @tc.desc onDataRead accumulates 1 chunks of 63 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(63, 5);
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(63, 5)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_3900
     * @tc.desc onDataRead accumulates 1 chunks of 64 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(64, 5);
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(64, 5)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_4000
     * @tc.desc onDataRead accumulates 1 chunks of 127 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(127, 5);
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(127, 5)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest041
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_4100
     * @tc.desc onDataRead accumulates 1 chunks of 128 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(128, 5);
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(128, 5)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest042
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_4200
     * @tc.desc onDataRead accumulates 1 chunks of 255 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(255, 5);
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(255, 5)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest043
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_4300
     * @tc.desc onDataRead accumulates 1 chunks of 256 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(256, 5);
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(256, 5)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest044
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_4400
     * @tc.desc onDataRead accumulates 1 chunks of 511 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(511, 5);
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(511, 5)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest045
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_4500
     * @tc.desc onDataRead accumulates 1 chunks of 512 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(512, 5);
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(512, 5)));
    });

    /**
     * @tc.name SerialReceiveBoundariesTest046
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECEIVEBOUNDARIES_4600
     * @tc.desc onDataRead accumulates 1 chunks of 1023 bytes seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReceiveBoundariesTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(1023, 5);
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1023, 5)));
    });
  });
}
