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

export default function SerialDisconnectUnsubscribeTest(): void {
  describe('SerialDisconnectUnsubscribeTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialDisconnectUnsubscribe', 'begin');
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
      logSuite('SerialDisconnectUnsubscribe', 'end');
    });

    /**
     * @tc.name SerialDisconnectUnsubscribeTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTUNSUBSCRIBE_0100
     * @tc.desc offDisconnect invalidates the removed callback while preserving 1 written bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectUnsubscribeTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.write(payload(1, 0));
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      await fixture.controller.offDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.controller.snapshot().disconnectSubscribed).assertFalse();
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
      await fixture.controller.onDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(2);
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
    });

    /**
     * @tc.name SerialDisconnectUnsubscribeTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTUNSUBSCRIBE_0200
     * @tc.desc offDisconnect invalidates the removed callback while preserving 2 written bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectUnsubscribeTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.write(payload(2, 0));
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      await fixture.controller.offDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.controller.snapshot().disconnectSubscribed).assertFalse();
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
      await fixture.controller.onDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(2);
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
    });

    /**
     * @tc.name SerialDisconnectUnsubscribeTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTUNSUBSCRIBE_0300
     * @tc.desc offDisconnect invalidates the removed callback while preserving 3 written bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectUnsubscribeTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.write(payload(3, 0));
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      await fixture.controller.offDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.controller.snapshot().disconnectSubscribed).assertFalse();
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
      await fixture.controller.onDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(2);
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
    });

    /**
     * @tc.name SerialDisconnectUnsubscribeTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTUNSUBSCRIBE_0400
     * @tc.desc offDisconnect invalidates the removed callback while preserving 4 written bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectUnsubscribeTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.write(payload(4, 0));
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      await fixture.controller.offDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.controller.snapshot().disconnectSubscribed).assertFalse();
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
      await fixture.controller.onDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(2);
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
    });

    /**
     * @tc.name SerialDisconnectUnsubscribeTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTUNSUBSCRIBE_0500
     * @tc.desc offDisconnect invalidates the removed callback while preserving 5 written bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectUnsubscribeTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.write(payload(5, 0));
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      await fixture.controller.offDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.controller.snapshot().disconnectSubscribed).assertFalse();
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
      await fixture.controller.onDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(2);
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
    });

    /**
     * @tc.name SerialDisconnectUnsubscribeTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTUNSUBSCRIBE_0600
     * @tc.desc offDisconnect invalidates the removed callback while preserving 7 written bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectUnsubscribeTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.write(payload(7, 0));
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      await fixture.controller.offDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.controller.snapshot().disconnectSubscribed).assertFalse();
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
      await fixture.controller.onDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(2);
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
    });

    /**
     * @tc.name SerialDisconnectUnsubscribeTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTUNSUBSCRIBE_0700
     * @tc.desc offDisconnect invalidates the removed callback while preserving 8 written bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectUnsubscribeTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.write(payload(8, 0));
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      await fixture.controller.offDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.controller.snapshot().disconnectSubscribed).assertFalse();
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
      await fixture.controller.onDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(2);
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
    });

    /**
     * @tc.name SerialDisconnectUnsubscribeTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTUNSUBSCRIBE_0800
     * @tc.desc offDisconnect invalidates the removed callback while preserving 16 written bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectUnsubscribeTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.write(payload(16, 0));
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      await fixture.controller.offDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.controller.snapshot().disconnectSubscribed).assertFalse();
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
      await fixture.controller.onDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(2);
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
    });

    /**
     * @tc.name SerialDisconnectUnsubscribeTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTUNSUBSCRIBE_0900
     * @tc.desc offDisconnect invalidates the removed callback while preserving 31 written bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectUnsubscribeTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.write(payload(31, 0));
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      await fixture.controller.offDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.controller.snapshot().disconnectSubscribed).assertFalse();
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
      await fixture.controller.onDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(2);
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(31);
    });

    /**
     * @tc.name SerialDisconnectUnsubscribeTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTUNSUBSCRIBE_1000
     * @tc.desc offDisconnect invalidates the removed callback while preserving 32 written bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectUnsubscribeTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.write(payload(32, 0));
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      await fixture.controller.offDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.controller.snapshot().disconnectSubscribed).assertFalse();
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
      await fixture.controller.onDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(2);
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
    });

    /**
     * @tc.name SerialDisconnectUnsubscribeTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTUNSUBSCRIBE_1100
     * @tc.desc offDisconnect invalidates the removed callback while preserving 63 written bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectUnsubscribeTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.write(payload(63, 0));
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      await fixture.controller.offDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.controller.snapshot().disconnectSubscribed).assertFalse();
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
      await fixture.controller.onDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(2);
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(63);
    });

    /**
     * @tc.name SerialDisconnectUnsubscribeTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTUNSUBSCRIBE_1200
     * @tc.desc offDisconnect invalidates the removed callback while preserving 64 written bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectUnsubscribeTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.write(payload(64, 0));
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      await fixture.controller.offDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.controller.snapshot().disconnectSubscribed).assertFalse();
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
      await fixture.controller.onDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(2);
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
    });

    /**
     * @tc.name SerialDisconnectUnsubscribeTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTUNSUBSCRIBE_1300
     * @tc.desc offDisconnect invalidates the removed callback while preserving 127 written bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectUnsubscribeTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.write(payload(127, 0));
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      await fixture.controller.offDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.controller.snapshot().disconnectSubscribed).assertFalse();
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
      await fixture.controller.onDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(2);
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(127);
    });

    /**
     * @tc.name SerialDisconnectUnsubscribeTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTUNSUBSCRIBE_1400
     * @tc.desc offDisconnect invalidates the removed callback while preserving 128 written bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectUnsubscribeTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.write(payload(128, 0));
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      await fixture.controller.offDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.controller.snapshot().disconnectSubscribed).assertFalse();
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
      await fixture.controller.onDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(2);
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(128);
    });

    /**
     * @tc.name SerialDisconnectUnsubscribeTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTUNSUBSCRIBE_1500
     * @tc.desc offDisconnect invalidates the removed callback while preserving 255 written bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectUnsubscribeTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.write(payload(255, 0));
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      await fixture.controller.offDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.controller.snapshot().disconnectSubscribed).assertFalse();
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
      await fixture.controller.onDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(2);
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(255);
    });

    /**
     * @tc.name SerialDisconnectUnsubscribeTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTUNSUBSCRIBE_1600
     * @tc.desc offDisconnect invalidates the removed callback while preserving 256 written bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectUnsubscribeTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.write(payload(256, 0));
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      await fixture.controller.offDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.controller.snapshot().disconnectSubscribed).assertFalse();
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
      await fixture.controller.onDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(2);
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(256);
    });

    /**
     * @tc.name SerialDisconnectUnsubscribeTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTUNSUBSCRIBE_1700
     * @tc.desc offDisconnect invalidates the removed callback while preserving 511 written bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectUnsubscribeTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.write(payload(511, 0));
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      await fixture.controller.offDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.controller.snapshot().disconnectSubscribed).assertFalse();
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
      await fixture.controller.onDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(2);
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(511);
    });

    /**
     * @tc.name SerialDisconnectUnsubscribeTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTUNSUBSCRIBE_1800
     * @tc.desc offDisconnect invalidates the removed callback while preserving 512 written bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectUnsubscribeTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.write(payload(512, 0));
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      await fixture.controller.offDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.controller.snapshot().disconnectSubscribed).assertFalse();
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
      await fixture.controller.onDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(2);
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(512);
    });

    /**
     * @tc.name SerialDisconnectUnsubscribeTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTUNSUBSCRIBE_1900
     * @tc.desc offDisconnect invalidates the removed callback while preserving 1023 written bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectUnsubscribeTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.write(payload(1023, 0));
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      await fixture.controller.offDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.controller.snapshot().disconnectSubscribed).assertFalse();
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
      await fixture.controller.onDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(2);
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1023);
    });

    /**
     * @tc.name SerialDisconnectUnsubscribeTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTUNSUBSCRIBE_2000
     * @tc.desc offDisconnect invalidates the removed callback while preserving 1024 written bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectUnsubscribeTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.write(payload(1024, 0));
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      await fixture.controller.offDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.controller.snapshot().disconnectSubscribed).assertFalse();
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
      await fixture.controller.onDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(2);
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1024);
    });

    /**
     * @tc.name SerialDisconnectUnsubscribeTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTUNSUBSCRIBE_2100
     * @tc.desc offDisconnect invalidates the removed callback while preserving 2048 written bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectUnsubscribeTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.write(payload(2048, 0));
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      await fixture.controller.offDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.controller.snapshot().disconnectSubscribed).assertFalse();
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
      await fixture.controller.onDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(2);
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2048);
    });

    /**
     * @tc.name SerialDisconnectUnsubscribeTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTUNSUBSCRIBE_2200
     * @tc.desc offDisconnect invalidates the removed callback while preserving 4095 written bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectUnsubscribeTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.write(payload(4095, 0));
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      await fixture.controller.offDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.controller.snapshot().disconnectSubscribed).assertFalse();
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
      await fixture.controller.onDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(2);
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4095);
    });

    /**
     * @tc.name SerialDisconnectUnsubscribeTest023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTUNSUBSCRIBE_2300
     * @tc.desc offDisconnect invalidates the removed callback while preserving 4096 written bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectUnsubscribeTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.write(payload(4096, 0));
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      await fixture.controller.offDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.controller.snapshot().disconnectSubscribed).assertFalse();
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
      await fixture.controller.onDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(2);
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4096);
    });

    /**
     * @tc.name SerialDisconnectUnsubscribeTest024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTUNSUBSCRIBE_2400
     * @tc.desc offDisconnect invalidates the removed callback while preserving 1 written bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectUnsubscribeTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.write(payload(1, 1));
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      await fixture.controller.offDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.controller.snapshot().disconnectSubscribed).assertFalse();
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
      await fixture.controller.onDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(2);
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
    });

    /**
     * @tc.name SerialDisconnectUnsubscribeTest025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTUNSUBSCRIBE_2500
     * @tc.desc offDisconnect invalidates the removed callback while preserving 2 written bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectUnsubscribeTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.write(payload(2, 1));
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      await fixture.controller.offDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.controller.snapshot().disconnectSubscribed).assertFalse();
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
      await fixture.controller.onDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(2);
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
    });

    /**
     * @tc.name SerialDisconnectUnsubscribeTest026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTUNSUBSCRIBE_2600
     * @tc.desc offDisconnect invalidates the removed callback while preserving 3 written bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectUnsubscribeTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.write(payload(3, 1));
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      await fixture.controller.offDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.controller.snapshot().disconnectSubscribed).assertFalse();
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
      await fixture.controller.onDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(2);
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
    });

    /**
     * @tc.name SerialDisconnectUnsubscribeTest027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTUNSUBSCRIBE_2700
     * @tc.desc offDisconnect invalidates the removed callback while preserving 4 written bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectUnsubscribeTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.write(payload(4, 1));
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      await fixture.controller.offDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.controller.snapshot().disconnectSubscribed).assertFalse();
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
      await fixture.controller.onDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(2);
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
    });

    /**
     * @tc.name SerialDisconnectUnsubscribeTest028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTUNSUBSCRIBE_2800
     * @tc.desc offDisconnect invalidates the removed callback while preserving 5 written bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectUnsubscribeTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.write(payload(5, 1));
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      await fixture.controller.offDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.controller.snapshot().disconnectSubscribed).assertFalse();
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
      await fixture.controller.onDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(2);
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
    });

    /**
     * @tc.name SerialDisconnectUnsubscribeTest029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTUNSUBSCRIBE_2900
     * @tc.desc offDisconnect invalidates the removed callback while preserving 7 written bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectUnsubscribeTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.write(payload(7, 1));
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      await fixture.controller.offDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.controller.snapshot().disconnectSubscribed).assertFalse();
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
      await fixture.controller.onDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(2);
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
    });

    /**
     * @tc.name SerialDisconnectUnsubscribeTest030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTUNSUBSCRIBE_3000
     * @tc.desc offDisconnect invalidates the removed callback while preserving 8 written bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectUnsubscribeTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.write(payload(8, 1));
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      await fixture.controller.offDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.controller.snapshot().disconnectSubscribed).assertFalse();
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
      await fixture.controller.onDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(2);
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
    });

    /**
     * @tc.name SerialDisconnectUnsubscribeTest031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTUNSUBSCRIBE_3100
     * @tc.desc offDisconnect invalidates the removed callback while preserving 16 written bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectUnsubscribeTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.write(payload(16, 1));
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      await fixture.controller.offDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.controller.snapshot().disconnectSubscribed).assertFalse();
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
      await fixture.controller.onDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(2);
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
    });

    /**
     * @tc.name SerialDisconnectUnsubscribeTest032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTUNSUBSCRIBE_3200
     * @tc.desc offDisconnect invalidates the removed callback while preserving 31 written bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectUnsubscribeTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.write(payload(31, 1));
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      await fixture.controller.offDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.controller.snapshot().disconnectSubscribed).assertFalse();
      expect(fixture.port.disconnectCallbacks.length).assertEqual(0);
      await fixture.controller.onDisconnect();
      stale();
      expectSession(fixture);
      expect(fixture.port.callCount('onDisconnect')).assertEqual(2);
      fixture.port.emitDisconnect();
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(31);
    });
  });
}
