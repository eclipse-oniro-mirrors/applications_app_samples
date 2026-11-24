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

export default function SerialCloseFailureRecoveryTest(): void {
  describe('SerialCloseFailureRecoveryTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialCloseFailureRecovery', 'begin');
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
      logSuite('SerialCloseFailureRecovery', 'end');
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_0100
     * @tc.desc close preserves the active session on code 35700001 and releases callbacks after retry vector 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(1, 0));
      fixture.port.failOnce('close', 35700001);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700001);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1, 0)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_0200
     * @tc.desc close preserves the active session on code 35700002 and releases callbacks after retry vector 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(2, 0));
      fixture.port.failOnce('close', 35700002);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700002);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(2, 0)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_0300
     * @tc.desc close preserves the active session on code 35700003 and releases callbacks after retry vector 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(3, 0));
      fixture.port.failOnce('close', 35700003);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700003);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(3);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(3, 0)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_0400
     * @tc.desc close preserves the active session on code 35700004 and releases callbacks after retry vector 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(4, 0));
      fixture.port.failOnce('close', 35700004);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700004);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4, 0)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_0500
     * @tc.desc close preserves the active session on code 35700005 and releases callbacks after retry vector 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(5, 0));
      fixture.port.failOnce('close', 35700005);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700005);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(5);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(5, 0)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_0600
     * @tc.desc close preserves the active session on code 35700006 and releases callbacks after retry vector 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(7, 0));
      fixture.port.failOnce('close', 35700006);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700006);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(7);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(7, 0)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_0700
     * @tc.desc close preserves the active session on code 35700007 and releases callbacks after retry vector 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(8, 0));
      fixture.port.failOnce('close', 35700007);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700007);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(8, 0)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_0800
     * @tc.desc close preserves the active session on code 35700001 and releases callbacks after retry vector 7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(16, 0));
      fixture.port.failOnce('close', 35700001);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700001);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(16);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(16, 0)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_0900
     * @tc.desc close preserves the active session on code 35700002 and releases callbacks after retry vector 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(31, 0));
      fixture.port.failOnce('close', 35700002);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700002);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(31);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(31, 0)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_1000
     * @tc.desc close preserves the active session on code 35700003 and releases callbacks after retry vector 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(32, 0));
      fixture.port.failOnce('close', 35700003);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700003);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(32);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(32, 0)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_1100
     * @tc.desc close preserves the active session on code 35700004 and releases callbacks after retry vector 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(63, 0));
      fixture.port.failOnce('close', 35700004);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700004);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(63);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(63, 0)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_1200
     * @tc.desc close preserves the active session on code 35700005 and releases callbacks after retry vector 11
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(64, 0));
      fixture.port.failOnce('close', 35700005);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700005);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(64);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(64, 0)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_1300
     * @tc.desc close preserves the active session on code 35700006 and releases callbacks after retry vector 12
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(127, 0));
      fixture.port.failOnce('close', 35700006);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700006);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(127);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(127, 0)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_1400
     * @tc.desc close preserves the active session on code 35700007 and releases callbacks after retry vector 13
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(128, 0));
      fixture.port.failOnce('close', 35700007);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700007);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(128);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(128, 0)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_1500
     * @tc.desc close preserves the active session on code 35700001 and releases callbacks after retry vector 14
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(255, 0));
      fixture.port.failOnce('close', 35700001);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700001);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(255);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(255, 0)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_1600
     * @tc.desc close preserves the active session on code 35700002 and releases callbacks after retry vector 15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(256, 0));
      fixture.port.failOnce('close', 35700002);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700002);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(256);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(256, 0)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_1700
     * @tc.desc close preserves the active session on code 35700003 and releases callbacks after retry vector 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(511, 0));
      fixture.port.failOnce('close', 35700003);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700003);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(511);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(511, 0)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_1800
     * @tc.desc close preserves the active session on code 35700004 and releases callbacks after retry vector 17
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(512, 0));
      fixture.port.failOnce('close', 35700004);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700004);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(512);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(512, 0)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_1900
     * @tc.desc close preserves the active session on code 35700005 and releases callbacks after retry vector 18
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(1023, 0));
      fixture.port.failOnce('close', 35700005);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700005);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1023);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1023, 0)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_2000
     * @tc.desc close preserves the active session on code 35700006 and releases callbacks after retry vector 19
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(1024, 0));
      fixture.port.failOnce('close', 35700006);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700006);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1024);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1024, 0)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_2100
     * @tc.desc close preserves the active session on code 35700007 and releases callbacks after retry vector 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(2048, 0));
      fixture.port.failOnce('close', 35700007);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700007);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2048);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(2048, 0)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_2200
     * @tc.desc close preserves the active session on code 35700001 and releases callbacks after retry vector 21
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(4095, 0));
      fixture.port.failOnce('close', 35700001);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700001);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4095);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4095, 0)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_2300
     * @tc.desc close preserves the active session on code 35700002 and releases callbacks after retry vector 22
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(4096, 0));
      fixture.port.failOnce('close', 35700002);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700002);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4096);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4096, 0)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_2400
     * @tc.desc close preserves the active session on code 35700003 and releases callbacks after retry vector 23
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(1, 1));
      fixture.port.failOnce('close', 35700003);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700003);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1, 1)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_2500
     * @tc.desc close preserves the active session on code 35700004 and releases callbacks after retry vector 24
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(2, 1));
      fixture.port.failOnce('close', 35700004);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700004);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(2, 1)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_2600
     * @tc.desc close preserves the active session on code 35700005 and releases callbacks after retry vector 25
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(3, 1));
      fixture.port.failOnce('close', 35700005);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700005);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(3);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(3, 1)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_2700
     * @tc.desc close preserves the active session on code 35700006 and releases callbacks after retry vector 26
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(4, 1));
      fixture.port.failOnce('close', 35700006);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700006);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4, 1)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_2800
     * @tc.desc close preserves the active session on code 35700007 and releases callbacks after retry vector 27
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(5, 1));
      fixture.port.failOnce('close', 35700007);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700007);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(5);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(5, 1)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_2900
     * @tc.desc close preserves the active session on code 35700001 and releases callbacks after retry vector 28
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(7, 1));
      fixture.port.failOnce('close', 35700001);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700001);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(7);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(7, 1)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_3000
     * @tc.desc close preserves the active session on code 35700002 and releases callbacks after retry vector 29
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(8, 1));
      fixture.port.failOnce('close', 35700002);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700002);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(8, 1)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_3100
     * @tc.desc close preserves the active session on code 35700003 and releases callbacks after retry vector 30
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(16, 1));
      fixture.port.failOnce('close', 35700003);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700003);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(16);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(16, 1)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_3200
     * @tc.desc close preserves the active session on code 35700004 and releases callbacks after retry vector 31
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(31, 1));
      fixture.port.failOnce('close', 35700004);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700004);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(31);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(31, 1)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_3300
     * @tc.desc close preserves the active session on code 35700005 and releases callbacks after retry vector 32
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(32, 1));
      fixture.port.failOnce('close', 35700005);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700005);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(32);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(32, 1)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_3400
     * @tc.desc close preserves the active session on code 35700006 and releases callbacks after retry vector 33
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(63, 1));
      fixture.port.failOnce('close', 35700006);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700006);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(63);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(63, 1)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_3500
     * @tc.desc close preserves the active session on code 35700007 and releases callbacks after retry vector 34
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(64, 1));
      fixture.port.failOnce('close', 35700007);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700007);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(64);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(64, 1)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_3600
     * @tc.desc close preserves the active session on code 35700001 and releases callbacks after retry vector 35
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(127, 1));
      fixture.port.failOnce('close', 35700001);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700001);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(127);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(127, 1)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_3700
     * @tc.desc close preserves the active session on code 35700002 and releases callbacks after retry vector 36
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(128, 1));
      fixture.port.failOnce('close', 35700002);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700002);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(128);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(128, 1)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_3800
     * @tc.desc close preserves the active session on code 35700003 and releases callbacks after retry vector 37
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(255, 1));
      fixture.port.failOnce('close', 35700003);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700003);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(255);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(255, 1)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_3900
     * @tc.desc close preserves the active session on code 35700004 and releases callbacks after retry vector 38
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(256, 1));
      fixture.port.failOnce('close', 35700004);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700004);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(256);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(256, 1)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_4000
     * @tc.desc close preserves the active session on code 35700005 and releases callbacks after retry vector 39
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(511, 1));
      fixture.port.failOnce('close', 35700005);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700005);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(511);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(511, 1)));
    });

    /**
     * @tc.name SerialCloseFailureRecoveryTest041
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCLOSEFAILURERECOVERY_4100
     * @tc.desc close preserves the active session on code 35700006 and releases callbacks after retry vector 40
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialCloseFailureRecoveryTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.emitData(payload(512, 1));
      fixture.port.failOnce('close', 35700006);
      await expectFailure(async () => fixture.controller.close(), 'BusinessError', 35700006);
      expectSession(fixture);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      expect(fixture.controller.snapshot().disconnectSubscribed).assertTrue();
      expect(fixture.port.dataCallbacks.length).assertEqual(1);
      expect(fixture.port.disconnectCallbacks.length).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(512);
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(512, 1)));
    });
  });
}
