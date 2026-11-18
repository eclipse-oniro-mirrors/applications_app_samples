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

export default function SerialErrorRecoveryTest(): void {
  describe('SerialErrorRecoveryTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialErrorRecovery', 'begin');
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
      logSuite('SerialErrorRecovery', 'end');
    });

    /**
     * @tc.name SerialErrorRecoveryTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_0100
     * @tc.desc flush propagates code 35700001 without poisoning subsequent writes vector 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('flush', 35700001);
      await expectFailure(async () => invokeOperation(fixture.controller, 'flush'), 'BusinessError', 35700001);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(1, 0));
      expect(written).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(1, 0)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_0200
     * @tc.desc drain propagates code 35700002 without poisoning subsequent writes vector 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('drain', 35700002);
      await expectFailure(async () => invokeOperation(fixture.controller, 'drain'), 'BusinessError', 35700002);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(2, 0));
      expect(written).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(2, 0)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_0300
     * @tc.desc setRts propagates code 35700003 without poisoning subsequent writes vector 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('setRts', 35700003);
      await expectFailure(async () => invokeOperation(fixture.controller, 'setRts'), 'BusinessError', 35700003);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(3, 0));
      expect(written).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(3, 0)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_0400
     * @tc.desc getCts propagates code 35700004 without poisoning subsequent writes vector 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('getCts', 35700004);
      await expectFailure(async () => invokeOperation(fixture.controller, 'getCts'), 'BusinessError', 35700004);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(4, 0));
      expect(written).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(4, 0)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_0500
     * @tc.desc setDtr propagates code 35700005 without poisoning subsequent writes vector 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('setDtr', 35700005);
      await expectFailure(async () => invokeOperation(fixture.controller, 'setDtr'), 'BusinessError', 35700005);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(5, 0));
      expect(written).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(5, 0)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_0600
     * @tc.desc getDsr propagates code 35700006 without poisoning subsequent writes vector 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('getDsr', 35700006);
      await expectFailure(async () => invokeOperation(fixture.controller, 'getDsr'), 'BusinessError', 35700006);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(7, 0));
      expect(written).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(7, 0)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_0700
     * @tc.desc sendBrk propagates code 35700007 without poisoning subsequent writes vector 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('sendBrk', 35700007);
      await expectFailure(async () => invokeOperation(fixture.controller, 'sendBrk'), 'BusinessError', 35700007);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(8, 0));
      expect(written).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(8, 0)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_0800
     * @tc.desc write propagates code 35700001 without poisoning subsequent writes vector 7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('write', 35700001);
      await expectFailure(async () => invokeOperation(fixture.controller, 'write'), 'BusinessError', 35700001);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(16, 0));
      expect(written).assertEqual(16);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(16, 0)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_0900
     * @tc.desc onDataRead propagates code 35700002 without poisoning subsequent writes vector 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      await fixture.controller.offDataRead();
      fixture.port.failOnce('onDataRead', 35700002);
      await expectFailure(async () => invokeOperation(fixture.controller, 'onDataRead'), 'BusinessError', 35700002);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(31, 0));
      expect(written).assertEqual(31);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(31);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(31, 0)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_1000
     * @tc.desc offDataRead propagates code 35700003 without poisoning subsequent writes vector 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('offDataRead', 35700003);
      await expectFailure(async () => invokeOperation(fixture.controller, 'offDataRead'), 'BusinessError', 35700003);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(32, 0));
      expect(written).assertEqual(32);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(32, 0)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_1100
     * @tc.desc onDisconnect propagates code 35700004 without poisoning subsequent writes vector 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      await fixture.controller.offDisconnect();
      fixture.port.failOnce('onDisconnect', 35700004);
      await expectFailure(async () => invokeOperation(fixture.controller, 'onDisconnect'), 'BusinessError', 35700004);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(63, 0));
      expect(written).assertEqual(63);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(63);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(63, 0)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_1200
     * @tc.desc offDisconnect propagates code 35700005 without poisoning subsequent writes vector 11
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('offDisconnect', 35700005);
      await expectFailure(async () => invokeOperation(fixture.controller, 'offDisconnect'), 'BusinessError', 35700005);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(64, 0));
      expect(written).assertEqual(64);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(64, 0)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_1300
     * @tc.desc flush propagates code 35700006 without poisoning subsequent writes vector 12
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('flush', 35700006);
      await expectFailure(async () => invokeOperation(fixture.controller, 'flush'), 'BusinessError', 35700006);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(127, 0));
      expect(written).assertEqual(127);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(127);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(127, 0)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_1400
     * @tc.desc drain propagates code 35700007 without poisoning subsequent writes vector 13
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('drain', 35700007);
      await expectFailure(async () => invokeOperation(fixture.controller, 'drain'), 'BusinessError', 35700007);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(128, 0));
      expect(written).assertEqual(128);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(128);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(128, 0)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_1500
     * @tc.desc setRts propagates code 35700001 without poisoning subsequent writes vector 14
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('setRts', 35700001);
      await expectFailure(async () => invokeOperation(fixture.controller, 'setRts'), 'BusinessError', 35700001);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(255, 0));
      expect(written).assertEqual(255);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(255);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(255, 0)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_1600
     * @tc.desc getCts propagates code 35700002 without poisoning subsequent writes vector 15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('getCts', 35700002);
      await expectFailure(async () => invokeOperation(fixture.controller, 'getCts'), 'BusinessError', 35700002);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(256, 0));
      expect(written).assertEqual(256);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(256);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(256, 0)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_1700
     * @tc.desc setDtr propagates code 35700003 without poisoning subsequent writes vector 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('setDtr', 35700003);
      await expectFailure(async () => invokeOperation(fixture.controller, 'setDtr'), 'BusinessError', 35700003);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(511, 0));
      expect(written).assertEqual(511);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(511);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(511, 0)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_1800
     * @tc.desc getDsr propagates code 35700004 without poisoning subsequent writes vector 17
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('getDsr', 35700004);
      await expectFailure(async () => invokeOperation(fixture.controller, 'getDsr'), 'BusinessError', 35700004);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(512, 0));
      expect(written).assertEqual(512);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(512);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(512, 0)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_1900
     * @tc.desc sendBrk propagates code 35700005 without poisoning subsequent writes vector 18
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('sendBrk', 35700005);
      await expectFailure(async () => invokeOperation(fixture.controller, 'sendBrk'), 'BusinessError', 35700005);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(1023, 0));
      expect(written).assertEqual(1023);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1023);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(1023, 0)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_2000
     * @tc.desc write propagates code 35700006 without poisoning subsequent writes vector 19
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('write', 35700006);
      await expectFailure(async () => invokeOperation(fixture.controller, 'write'), 'BusinessError', 35700006);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(1024, 0));
      expect(written).assertEqual(1024);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1024);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(1024, 0)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_2100
     * @tc.desc onDataRead propagates code 35700007 without poisoning subsequent writes vector 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      await fixture.controller.offDataRead();
      fixture.port.failOnce('onDataRead', 35700007);
      await expectFailure(async () => invokeOperation(fixture.controller, 'onDataRead'), 'BusinessError', 35700007);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(2048, 0));
      expect(written).assertEqual(2048);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2048);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(2048, 0)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_2200
     * @tc.desc offDataRead propagates code 35700001 without poisoning subsequent writes vector 21
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('offDataRead', 35700001);
      await expectFailure(async () => invokeOperation(fixture.controller, 'offDataRead'), 'BusinessError', 35700001);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(4095, 0));
      expect(written).assertEqual(4095);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4095);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(4095, 0)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_2300
     * @tc.desc onDisconnect propagates code 35700002 without poisoning subsequent writes vector 22
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      await fixture.controller.offDisconnect();
      fixture.port.failOnce('onDisconnect', 35700002);
      await expectFailure(async () => invokeOperation(fixture.controller, 'onDisconnect'), 'BusinessError', 35700002);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(4096, 0));
      expect(written).assertEqual(4096);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4096);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(4096, 0)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_2400
     * @tc.desc offDisconnect propagates code 35700003 without poisoning subsequent writes vector 23
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('offDisconnect', 35700003);
      await expectFailure(async () => invokeOperation(fixture.controller, 'offDisconnect'), 'BusinessError', 35700003);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(1, 1));
      expect(written).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(1, 1)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_2500
     * @tc.desc flush propagates code 35700004 without poisoning subsequent writes vector 24
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('flush', 35700004);
      await expectFailure(async () => invokeOperation(fixture.controller, 'flush'), 'BusinessError', 35700004);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(2, 1));
      expect(written).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(2, 1)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_2600
     * @tc.desc drain propagates code 35700005 without poisoning subsequent writes vector 25
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('drain', 35700005);
      await expectFailure(async () => invokeOperation(fixture.controller, 'drain'), 'BusinessError', 35700005);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(3, 1));
      expect(written).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(3, 1)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_2700
     * @tc.desc setRts propagates code 35700006 without poisoning subsequent writes vector 26
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('setRts', 35700006);
      await expectFailure(async () => invokeOperation(fixture.controller, 'setRts'), 'BusinessError', 35700006);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(4, 1));
      expect(written).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(4, 1)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_2800
     * @tc.desc getCts propagates code 35700007 without poisoning subsequent writes vector 27
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('getCts', 35700007);
      await expectFailure(async () => invokeOperation(fixture.controller, 'getCts'), 'BusinessError', 35700007);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(5, 1));
      expect(written).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(5, 1)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_2900
     * @tc.desc setDtr propagates code 35700001 without poisoning subsequent writes vector 28
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('setDtr', 35700001);
      await expectFailure(async () => invokeOperation(fixture.controller, 'setDtr'), 'BusinessError', 35700001);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(7, 1));
      expect(written).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(7, 1)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_3000
     * @tc.desc getDsr propagates code 35700002 without poisoning subsequent writes vector 29
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('getDsr', 35700002);
      await expectFailure(async () => invokeOperation(fixture.controller, 'getDsr'), 'BusinessError', 35700002);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(8, 1));
      expect(written).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(8, 1)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_3100
     * @tc.desc sendBrk propagates code 35700003 without poisoning subsequent writes vector 30
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('sendBrk', 35700003);
      await expectFailure(async () => invokeOperation(fixture.controller, 'sendBrk'), 'BusinessError', 35700003);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(16, 1));
      expect(written).assertEqual(16);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(16, 1)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_3200
     * @tc.desc write propagates code 35700004 without poisoning subsequent writes vector 31
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('write', 35700004);
      await expectFailure(async () => invokeOperation(fixture.controller, 'write'), 'BusinessError', 35700004);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(31, 1));
      expect(written).assertEqual(31);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(31);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(31, 1)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_3300
     * @tc.desc onDataRead propagates code 35700005 without poisoning subsequent writes vector 32
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      await fixture.controller.offDataRead();
      fixture.port.failOnce('onDataRead', 35700005);
      await expectFailure(async () => invokeOperation(fixture.controller, 'onDataRead'), 'BusinessError', 35700005);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(32, 1));
      expect(written).assertEqual(32);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(32, 1)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_3400
     * @tc.desc offDataRead propagates code 35700006 without poisoning subsequent writes vector 33
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('offDataRead', 35700006);
      await expectFailure(async () => invokeOperation(fixture.controller, 'offDataRead'), 'BusinessError', 35700006);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(63, 1));
      expect(written).assertEqual(63);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(63);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(63, 1)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_3500
     * @tc.desc onDisconnect propagates code 35700007 without poisoning subsequent writes vector 34
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      await fixture.controller.offDisconnect();
      fixture.port.failOnce('onDisconnect', 35700007);
      await expectFailure(async () => invokeOperation(fixture.controller, 'onDisconnect'), 'BusinessError', 35700007);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(64, 1));
      expect(written).assertEqual(64);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(64, 1)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_3600
     * @tc.desc offDisconnect propagates code 35700001 without poisoning subsequent writes vector 35
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('offDisconnect', 35700001);
      await expectFailure(async () => invokeOperation(fixture.controller, 'offDisconnect'), 'BusinessError', 35700001);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(127, 1));
      expect(written).assertEqual(127);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(127);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(127, 1)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_3700
     * @tc.desc flush propagates code 35700002 without poisoning subsequent writes vector 36
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('flush', 35700002);
      await expectFailure(async () => invokeOperation(fixture.controller, 'flush'), 'BusinessError', 35700002);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(128, 1));
      expect(written).assertEqual(128);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(128);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(128, 1)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_3800
     * @tc.desc drain propagates code 35700003 without poisoning subsequent writes vector 37
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('drain', 35700003);
      await expectFailure(async () => invokeOperation(fixture.controller, 'drain'), 'BusinessError', 35700003);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(255, 1));
      expect(written).assertEqual(255);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(255);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(255, 1)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_3900
     * @tc.desc setRts propagates code 35700004 without poisoning subsequent writes vector 38
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('setRts', 35700004);
      await expectFailure(async () => invokeOperation(fixture.controller, 'setRts'), 'BusinessError', 35700004);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(256, 1));
      expect(written).assertEqual(256);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(256);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(256, 1)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_4000
     * @tc.desc getCts propagates code 35700005 without poisoning subsequent writes vector 39
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('getCts', 35700005);
      await expectFailure(async () => invokeOperation(fixture.controller, 'getCts'), 'BusinessError', 35700005);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(511, 1));
      expect(written).assertEqual(511);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(511);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(511, 1)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest041
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_4100
     * @tc.desc setDtr propagates code 35700006 without poisoning subsequent writes vector 40
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('setDtr', 35700006);
      await expectFailure(async () => invokeOperation(fixture.controller, 'setDtr'), 'BusinessError', 35700006);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(512, 1));
      expect(written).assertEqual(512);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(512);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(512, 1)));
    });

    /**
     * @tc.name SerialErrorRecoveryTest042
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALERRORRECOVERY_4200
     * @tc.desc getDsr propagates code 35700007 without poisoning subsequent writes vector 41
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialErrorRecoveryTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('getDsr', 35700007);
      await expectFailure(async () => invokeOperation(fixture.controller, 'getDsr'), 'BusinessError', 35700007);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(1023, 1));
      expect(written).assertEqual(1023);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1023);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(1023, 1)));
    });
  });
}
