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

export default function SerialDataChunkingTest(): void {
  describe('SerialDataChunkingTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialDataChunking', 'begin');
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
      logSuite('SerialDataChunking', 'end');
    });

    /**
     * @tc.name SerialDataChunkingTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATACHUNKING_0100
     * @tc.desc onDataRead accumulates 2 chunks of 63 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataChunkingTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(63, 1);
      for (let index: number = 0; index < 2; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(126);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(63, 1)));
    });

    /**
     * @tc.name SerialDataChunkingTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATACHUNKING_0200
     * @tc.desc onDataRead accumulates 2 chunks of 64 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataChunkingTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(64, 1);
      for (let index: number = 0; index < 2; index++) {
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(64, 1)));
    });

    /**
     * @tc.name SerialDataChunkingTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATACHUNKING_0300
     * @tc.desc onDataRead accumulates 2 chunks of 127 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataChunkingTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(127, 1);
      for (let index: number = 0; index < 2; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(254);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(127, 1)));
    });

    /**
     * @tc.name SerialDataChunkingTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATACHUNKING_0400
     * @tc.desc onDataRead accumulates 2 chunks of 128 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataChunkingTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(128, 1);
      for (let index: number = 0; index < 2; index++) {
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(128, 1)));
    });

    /**
     * @tc.name SerialDataChunkingTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATACHUNKING_0500
     * @tc.desc onDataRead accumulates 2 chunks of 255 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataChunkingTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(255, 1);
      for (let index: number = 0; index < 2; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(510);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(255, 1)));
    });

    /**
     * @tc.name SerialDataChunkingTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATACHUNKING_0600
     * @tc.desc onDataRead accumulates 2 chunks of 256 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataChunkingTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(256, 1);
      for (let index: number = 0; index < 2; index++) {
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(256, 1)));
    });

    /**
     * @tc.name SerialDataChunkingTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATACHUNKING_0700
     * @tc.desc onDataRead accumulates 2 chunks of 511 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataChunkingTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(511, 1);
      for (let index: number = 0; index < 2; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(1022);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(511, 1)));
    });

    /**
     * @tc.name SerialDataChunkingTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATACHUNKING_0800
     * @tc.desc onDataRead accumulates 2 chunks of 512 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataChunkingTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(512, 1);
      for (let index: number = 0; index < 2; index++) {
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(512, 1)));
    });

    /**
     * @tc.name SerialDataChunkingTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATACHUNKING_0900
     * @tc.desc onDataRead accumulates 2 chunks of 1023 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataChunkingTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(1023, 1);
      for (let index: number = 0; index < 2; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(2046);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1023, 1)));
    });

    /**
     * @tc.name SerialDataChunkingTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATACHUNKING_1000
     * @tc.desc onDataRead accumulates 2 chunks of 1024 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataChunkingTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(1024, 1);
      for (let index: number = 0; index < 2; index++) {
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1024, 1)));
    });

    /**
     * @tc.name SerialDataChunkingTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATACHUNKING_1100
     * @tc.desc onDataRead accumulates 2 chunks of 2048 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataChunkingTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(2048, 1);
      for (let index: number = 0; index < 2; index++) {
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(2048, 1)));
    });

    /**
     * @tc.name SerialDataChunkingTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATACHUNKING_1200
     * @tc.desc onDataRead accumulates 2 chunks of 4095 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataChunkingTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(4095, 1);
      for (let index: number = 0; index < 2; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(8190);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4095, 1)));
    });

    /**
     * @tc.name SerialDataChunkingTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATACHUNKING_1300
     * @tc.desc onDataRead accumulates 2 chunks of 4096 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataChunkingTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(4096, 1);
      for (let index: number = 0; index < 2; index++) {
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4096, 1)));
    });

    /**
     * @tc.name SerialDataChunkingTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATACHUNKING_1400
     * @tc.desc onDataRead accumulates 3 chunks of 1 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataChunkingTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(1, 2);
      for (let index: number = 0; index < 3; index++) {
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1, 2)));
    });

    /**
     * @tc.name SerialDataChunkingTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATACHUNKING_1500
     * @tc.desc onDataRead accumulates 3 chunks of 2 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataChunkingTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(2, 2);
      for (let index: number = 0; index < 3; index++) {
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(2, 2)));
    });

    /**
     * @tc.name SerialDataChunkingTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATACHUNKING_1600
     * @tc.desc onDataRead accumulates 3 chunks of 3 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataChunkingTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(3, 2);
      for (let index: number = 0; index < 3; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(9);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(3, 2)));
    });

    /**
     * @tc.name SerialDataChunkingTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATACHUNKING_1700
     * @tc.desc onDataRead accumulates 3 chunks of 4 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataChunkingTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(4, 2);
      for (let index: number = 0; index < 3; index++) {
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4, 2)));
    });

    /**
     * @tc.name SerialDataChunkingTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATACHUNKING_1800
     * @tc.desc onDataRead accumulates 3 chunks of 5 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataChunkingTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(5, 2);
      for (let index: number = 0; index < 3; index++) {
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
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(5, 2)));
    });

    /**
     * @tc.name SerialDataChunkingTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATACHUNKING_1900
     * @tc.desc onDataRead accumulates 3 chunks of 7 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataChunkingTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(7, 2);
      for (let index: number = 0; index < 3; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(21);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(7, 2)));
    });

    /**
     * @tc.name SerialDataChunkingTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATACHUNKING_2000
     * @tc.desc onDataRead accumulates 3 chunks of 8 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataChunkingTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(8, 2);
      for (let index: number = 0; index < 3; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(24);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(8, 2)));
    });

    /**
     * @tc.name SerialDataChunkingTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATACHUNKING_2100
     * @tc.desc onDataRead accumulates 3 chunks of 16 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataChunkingTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(16, 2);
      for (let index: number = 0; index < 3; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(48);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(16, 2)));
    });

    /**
     * @tc.name SerialDataChunkingTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATACHUNKING_2200
     * @tc.desc onDataRead accumulates 3 chunks of 31 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataChunkingTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(31, 2);
      for (let index: number = 0; index < 3; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(93);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(31, 2)));
    });

    /**
     * @tc.name SerialDataChunkingTest023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATACHUNKING_2300
     * @tc.desc onDataRead accumulates 3 chunks of 32 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataChunkingTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(32, 2);
      for (let index: number = 0; index < 3; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(96);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(32, 2)));
    });

    /**
     * @tc.name SerialDataChunkingTest024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATACHUNKING_2400
     * @tc.desc onDataRead accumulates 3 chunks of 63 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataChunkingTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(63, 2);
      for (let index: number = 0; index < 3; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(189);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(63, 2)));
    });

    /**
     * @tc.name SerialDataChunkingTest025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATACHUNKING_2500
     * @tc.desc onDataRead accumulates 3 chunks of 64 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataChunkingTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(64, 2);
      for (let index: number = 0; index < 3; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(192);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(64, 2)));
    });

    /**
     * @tc.name SerialDataChunkingTest026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATACHUNKING_2600
     * @tc.desc onDataRead accumulates 3 chunks of 127 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataChunkingTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(127, 2);
      for (let index: number = 0; index < 3; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(381);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(127, 2)));
    });

    /**
     * @tc.name SerialDataChunkingTest027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATACHUNKING_2700
     * @tc.desc onDataRead accumulates 3 chunks of 128 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataChunkingTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(128, 2);
      for (let index: number = 0; index < 3; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(384);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(128, 2)));
    });

    /**
     * @tc.name SerialDataChunkingTest028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATACHUNKING_2800
     * @tc.desc onDataRead accumulates 3 chunks of 255 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataChunkingTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(255, 2);
      for (let index: number = 0; index < 3; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(765);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(255, 2)));
    });

    /**
     * @tc.name SerialDataChunkingTest029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATACHUNKING_2900
     * @tc.desc onDataRead accumulates 3 chunks of 256 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataChunkingTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(256, 2);
      for (let index: number = 0; index < 3; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(768);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(256, 2)));
    });

    /**
     * @tc.name SerialDataChunkingTest030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATACHUNKING_3000
     * @tc.desc onDataRead accumulates 3 chunks of 511 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataChunkingTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(511, 2);
      for (let index: number = 0; index < 3; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(1533);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(511, 2)));
    });

    /**
     * @tc.name SerialDataChunkingTest031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATACHUNKING_3100
     * @tc.desc onDataRead accumulates 3 chunks of 512 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataChunkingTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(512, 2);
      for (let index: number = 0; index < 3; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(1536);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(512, 2)));
    });

    /**
     * @tc.name SerialDataChunkingTest032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDATACHUNKING_3200
     * @tc.desc onDataRead accumulates 3 chunks of 1023 bytes seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDataChunkingTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const bytes: Uint8Array = payload(1023, 2);
      for (let index: number = 0; index < 3; index++) {
        fixture.port.emitData(bytes);
      }
      const state = fixture.controller.snapshot();
      expect(state.receivedBytes).assertEqual(3069);
      expectBytes(state.lastData, Array.from(bytes));
      expect(state.transmittedBytes).assertEqual(0);
      expect(state.dataSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.callCount('onDataRead')).assertEqual(1);
      bytes.fill(0);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1023, 2)));
    });
  });
}
