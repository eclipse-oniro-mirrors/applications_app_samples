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

export default function SerialCallbackRemovalTest(): void {
  describe('SerialCallbackRemovalTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialCallbackRemoval', 'begin');
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
      logSuite('SerialCallbackRemoval', 'end');
    });

    /**
     * @tc.name SerialCallbackRemovalTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREMOVAL_0100
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 1 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRemovalTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(1, 0));
      await fixture.controller.offDataRead();
      stale(payload(1, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(1, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1);
      fixture.port.emitData(payload(1, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackRemovalTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREMOVAL_0200
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 2 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRemovalTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(2, 0));
      await fixture.controller.offDataRead();
      stale(payload(2, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(2, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2);
      fixture.port.emitData(payload(2, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackRemovalTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREMOVAL_0300
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 3 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRemovalTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(3, 0));
      await fixture.controller.offDataRead();
      stale(payload(3, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(3);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(3, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(3);
      fixture.port.emitData(payload(3, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(6);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackRemovalTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREMOVAL_0400
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 4 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRemovalTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(4, 0));
      await fixture.controller.offDataRead();
      stale(payload(4, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(4, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4);
      fixture.port.emitData(payload(4, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackRemovalTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREMOVAL_0500
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 5 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRemovalTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(5, 0));
      await fixture.controller.offDataRead();
      stale(payload(5, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(5);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(5, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(5);
      fixture.port.emitData(payload(5, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(10);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackRemovalTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREMOVAL_0600
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 7 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRemovalTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(7, 0));
      await fixture.controller.offDataRead();
      stale(payload(7, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(7);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(7, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(7);
      fixture.port.emitData(payload(7, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(14);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackRemovalTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREMOVAL_0700
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 8 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRemovalTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(8, 0));
      await fixture.controller.offDataRead();
      stale(payload(8, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(8, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8);
      fixture.port.emitData(payload(8, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(16);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackRemovalTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREMOVAL_0800
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 16 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRemovalTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(16, 0));
      await fixture.controller.offDataRead();
      stale(payload(16, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(16);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(16, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(16);
      fixture.port.emitData(payload(16, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(32);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackRemovalTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREMOVAL_0900
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 31 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRemovalTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(31, 0));
      await fixture.controller.offDataRead();
      stale(payload(31, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(31);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(31, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(31);
      fixture.port.emitData(payload(31, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(62);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackRemovalTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREMOVAL_1000
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 32 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRemovalTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(32, 0));
      await fixture.controller.offDataRead();
      stale(payload(32, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(32);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(32, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(32);
      fixture.port.emitData(payload(32, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(64);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackRemovalTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREMOVAL_1100
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 63 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRemovalTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(63, 0));
      await fixture.controller.offDataRead();
      stale(payload(63, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(63);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(63, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(63);
      fixture.port.emitData(payload(63, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(126);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackRemovalTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREMOVAL_1200
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 64 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRemovalTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(64, 0));
      await fixture.controller.offDataRead();
      stale(payload(64, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(64);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(64, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(64);
      fixture.port.emitData(payload(64, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(128);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackRemovalTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREMOVAL_1300
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 127 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRemovalTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(127, 0));
      await fixture.controller.offDataRead();
      stale(payload(127, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(127);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(127, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(127);
      fixture.port.emitData(payload(127, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(254);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackRemovalTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREMOVAL_1400
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 128 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRemovalTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(128, 0));
      await fixture.controller.offDataRead();
      stale(payload(128, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(128);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(128, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(128);
      fixture.port.emitData(payload(128, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(256);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackRemovalTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREMOVAL_1500
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 255 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRemovalTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(255, 0));
      await fixture.controller.offDataRead();
      stale(payload(255, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(255);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(255, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(255);
      fixture.port.emitData(payload(255, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(510);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackRemovalTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREMOVAL_1600
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 256 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRemovalTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(256, 0));
      await fixture.controller.offDataRead();
      stale(payload(256, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(256);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(256, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(256);
      fixture.port.emitData(payload(256, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(512);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackRemovalTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREMOVAL_1700
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 511 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRemovalTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(511, 0));
      await fixture.controller.offDataRead();
      stale(payload(511, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(511);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(511, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(511);
      fixture.port.emitData(payload(511, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1022);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackRemovalTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREMOVAL_1800
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 512 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRemovalTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(512, 0));
      await fixture.controller.offDataRead();
      stale(payload(512, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(512);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(512, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(512);
      fixture.port.emitData(payload(512, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1024);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackRemovalTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREMOVAL_1900
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 1023 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRemovalTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(1023, 0));
      await fixture.controller.offDataRead();
      stale(payload(1023, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1023);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(1023, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1023);
      fixture.port.emitData(payload(1023, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2046);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackRemovalTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREMOVAL_2000
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 1024 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRemovalTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(1024, 0));
      await fixture.controller.offDataRead();
      stale(payload(1024, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1024);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(1024, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1024);
      fixture.port.emitData(payload(1024, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2048);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackRemovalTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREMOVAL_2100
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 2048 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRemovalTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(2048, 0));
      await fixture.controller.offDataRead();
      stale(payload(2048, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2048);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(2048, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2048);
      fixture.port.emitData(payload(2048, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4096);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackRemovalTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREMOVAL_2200
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 4095 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRemovalTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(4095, 0));
      await fixture.controller.offDataRead();
      stale(payload(4095, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4095);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(4095, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4095);
      fixture.port.emitData(payload(4095, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8190);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackRemovalTest023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREMOVAL_2300
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 4096 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRemovalTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(4096, 0));
      await fixture.controller.offDataRead();
      stale(payload(4096, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4096);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(4096, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4096);
      fixture.port.emitData(payload(4096, 0));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8192);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackRemovalTest024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREMOVAL_2400
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 1 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRemovalTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(1, 1));
      await fixture.controller.offDataRead();
      stale(payload(1, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(1, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1);
      fixture.port.emitData(payload(1, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackRemovalTest025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREMOVAL_2500
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 2 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRemovalTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(2, 1));
      await fixture.controller.offDataRead();
      stale(payload(2, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(2, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2);
      fixture.port.emitData(payload(2, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackRemovalTest026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREMOVAL_2600
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 3 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRemovalTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(3, 1));
      await fixture.controller.offDataRead();
      stale(payload(3, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(3);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(3, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(3);
      fixture.port.emitData(payload(3, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(6);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackRemovalTest027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREMOVAL_2700
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 4 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRemovalTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(4, 1));
      await fixture.controller.offDataRead();
      stale(payload(4, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(4, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4);
      fixture.port.emitData(payload(4, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackRemovalTest028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREMOVAL_2800
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 5 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRemovalTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(5, 1));
      await fixture.controller.offDataRead();
      stale(payload(5, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(5);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(5, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(5);
      fixture.port.emitData(payload(5, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(10);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackRemovalTest029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREMOVAL_2900
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 7 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRemovalTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(7, 1));
      await fixture.controller.offDataRead();
      stale(payload(7, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(7);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(7, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(7);
      fixture.port.emitData(payload(7, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(14);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });

    /**
     * @tc.name SerialCallbackRemovalTest030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCALLBACKREMOVAL_3000
     * @tc.desc offDataRead suppresses stale callbacks and supports re-registration with 8 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCallbackRemovalTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      const stale: (data: Uint8Array) => void = fixture.port.dataCallbacks[0];
      fixture.port.emitData(payload(8, 1));
      await fixture.controller.offDataRead();
      stale(payload(8, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8);
      expect(fixture.controller.snapshot().dataSubscribed).assertFalse();
      expect(fixture.port.dataCallbacks.length).assertEqual(0);
      await fixture.controller.onDataRead();
      stale(payload(8, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8);
      fixture.port.emitData(payload(8, 1));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(16);
      expect(fixture.port.callCount('onDataRead')).assertEqual(2);
      expect(fixture.port.callCount('offDataRead')).assertEqual(1);
    });
  });
}
