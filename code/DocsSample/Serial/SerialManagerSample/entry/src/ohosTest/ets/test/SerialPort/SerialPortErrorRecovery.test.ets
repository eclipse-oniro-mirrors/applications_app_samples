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

export default function SerialPortErrorRecoveryTest(): void {
  describe('SerialPortErrorRecoveryTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialPortErrorRecovery', 'begin');
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
      logSuite('SerialPortErrorRecovery', 'end');
    });

    /**
     * @tc.name SerialPortErrorRecoveryTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTERRORRECOVERY_0100
     * @tc.desc offDisconnect propagates code 35700007 without poisoning subsequent writes vector 83
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortErrorRecoveryTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('offDisconnect', 35700007);
      await expectFailure(async () => invokeOperation(fixture.controller, 'offDisconnect'), 'BusinessError', 35700007);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(255, 3));
      expect(written).assertEqual(255);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(255);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(255, 3)));
    });

    /**
     * @tc.name SerialPortErrorRecoveryTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTERRORRECOVERY_0200
     * @tc.desc flush propagates code 35700001 without poisoning subsequent writes vector 84
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortErrorRecoveryTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('flush', 35700001);
      await expectFailure(async () => invokeOperation(fixture.controller, 'flush'), 'BusinessError', 35700001);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(256, 3));
      expect(written).assertEqual(256);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(256);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(256, 3)));
    });

    /**
     * @tc.name SerialPortErrorRecoveryTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTERRORRECOVERY_0300
     * @tc.desc drain propagates code 35700002 without poisoning subsequent writes vector 85
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortErrorRecoveryTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('drain', 35700002);
      await expectFailure(async () => invokeOperation(fixture.controller, 'drain'), 'BusinessError', 35700002);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(511, 3));
      expect(written).assertEqual(511);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(511);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(511, 3)));
    });

    /**
     * @tc.name SerialPortErrorRecoveryTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTERRORRECOVERY_0400
     * @tc.desc setRts propagates code 35700003 without poisoning subsequent writes vector 86
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortErrorRecoveryTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('setRts', 35700003);
      await expectFailure(async () => invokeOperation(fixture.controller, 'setRts'), 'BusinessError', 35700003);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(512, 3));
      expect(written).assertEqual(512);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(512);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(512, 3)));
    });

    /**
     * @tc.name SerialPortErrorRecoveryTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTERRORRECOVERY_0500
     * @tc.desc getCts propagates code 35700004 without poisoning subsequent writes vector 87
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortErrorRecoveryTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('getCts', 35700004);
      await expectFailure(async () => invokeOperation(fixture.controller, 'getCts'), 'BusinessError', 35700004);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(1023, 3));
      expect(written).assertEqual(1023);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1023);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(1023, 3)));
    });

    /**
     * @tc.name SerialPortErrorRecoveryTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTERRORRECOVERY_0600
     * @tc.desc setDtr propagates code 35700005 without poisoning subsequent writes vector 88
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortErrorRecoveryTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('setDtr', 35700005);
      await expectFailure(async () => invokeOperation(fixture.controller, 'setDtr'), 'BusinessError', 35700005);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(1024, 3));
      expect(written).assertEqual(1024);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1024);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(1024, 3)));
    });

    /**
     * @tc.name SerialPortErrorRecoveryTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTERRORRECOVERY_0700
     * @tc.desc getDsr propagates code 35700006 without poisoning subsequent writes vector 89
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortErrorRecoveryTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('getDsr', 35700006);
      await expectFailure(async () => invokeOperation(fixture.controller, 'getDsr'), 'BusinessError', 35700006);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(2048, 3));
      expect(written).assertEqual(2048);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2048);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(2048, 3)));
    });

    /**
     * @tc.name SerialPortErrorRecoveryTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTERRORRECOVERY_0800
     * @tc.desc sendBrk propagates code 35700007 without poisoning subsequent writes vector 90
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortErrorRecoveryTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('sendBrk', 35700007);
      await expectFailure(async () => invokeOperation(fixture.controller, 'sendBrk'), 'BusinessError', 35700007);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(4095, 3));
      expect(written).assertEqual(4095);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4095);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(4095, 3)));
    });

    /**
     * @tc.name SerialPortErrorRecoveryTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTERRORRECOVERY_0900
     * @tc.desc write propagates code 35700001 without poisoning subsequent writes vector 91
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortErrorRecoveryTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('write', 35700001);
      await expectFailure(async () => invokeOperation(fixture.controller, 'write'), 'BusinessError', 35700001);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(4096, 3));
      expect(written).assertEqual(4096);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4096);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(4096, 3)));
    });

    /**
     * @tc.name SerialPortErrorRecoveryTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTERRORRECOVERY_1000
     * @tc.desc onDataRead propagates code 35700002 without poisoning subsequent writes vector 92
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortErrorRecoveryTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
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
      const written: number = await fixture.controller.write(payload(1, 4));
      expect(written).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(1, 4)));
    });

    /**
     * @tc.name SerialPortErrorRecoveryTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTERRORRECOVERY_1100
     * @tc.desc offDataRead propagates code 35700003 without poisoning subsequent writes vector 93
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortErrorRecoveryTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('offDataRead', 35700003);
      await expectFailure(async () => invokeOperation(fixture.controller, 'offDataRead'), 'BusinessError', 35700003);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(2, 4));
      expect(written).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(2, 4)));
    });

    /**
     * @tc.name SerialPortErrorRecoveryTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTERRORRECOVERY_1200
     * @tc.desc onDisconnect propagates code 35700004 without poisoning subsequent writes vector 94
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortErrorRecoveryTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
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
      const written: number = await fixture.controller.write(payload(3, 4));
      expect(written).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(3, 4)));
    });

    /**
     * @tc.name SerialPortErrorRecoveryTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTERRORRECOVERY_1300
     * @tc.desc offDisconnect propagates code 35700005 without poisoning subsequent writes vector 95
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortErrorRecoveryTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('offDisconnect', 35700005);
      await expectFailure(async () => invokeOperation(fixture.controller, 'offDisconnect'), 'BusinessError', 35700005);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(4, 4));
      expect(written).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(4, 4)));
    });

    /**
     * @tc.name SerialPortErrorRecoveryTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTERRORRECOVERY_1400
     * @tc.desc flush propagates code 35700006 without poisoning subsequent writes vector 96
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortErrorRecoveryTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('flush', 35700006);
      await expectFailure(async () => invokeOperation(fixture.controller, 'flush'), 'BusinessError', 35700006);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(5, 4));
      expect(written).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(5, 4)));
    });

    /**
     * @tc.name SerialPortErrorRecoveryTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTERRORRECOVERY_1500
     * @tc.desc drain propagates code 35700007 without poisoning subsequent writes vector 97
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortErrorRecoveryTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('drain', 35700007);
      await expectFailure(async () => invokeOperation(fixture.controller, 'drain'), 'BusinessError', 35700007);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(7, 4));
      expect(written).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(7, 4)));
    });

    /**
     * @tc.name SerialPortErrorRecoveryTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTERRORRECOVERY_1600
     * @tc.desc setRts propagates code 35700001 without poisoning subsequent writes vector 98
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortErrorRecoveryTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('setRts', 35700001);
      await expectFailure(async () => invokeOperation(fixture.controller, 'setRts'), 'BusinessError', 35700001);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(8, 4));
      expect(written).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(8, 4)));
    });

    /**
     * @tc.name SerialPortErrorRecoveryTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTERRORRECOVERY_1700
     * @tc.desc getCts propagates code 35700002 without poisoning subsequent writes vector 99
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortErrorRecoveryTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('getCts', 35700002);
      await expectFailure(async () => invokeOperation(fixture.controller, 'getCts'), 'BusinessError', 35700002);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(16, 4));
      expect(written).assertEqual(16);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(16, 4)));
    });

    /**
     * @tc.name SerialPortErrorRecoveryTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTERRORRECOVERY_1800
     * @tc.desc setDtr propagates code 35700003 without poisoning subsequent writes vector 100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortErrorRecoveryTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('setDtr', 35700003);
      await expectFailure(async () => invokeOperation(fixture.controller, 'setDtr'), 'BusinessError', 35700003);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(31, 4));
      expect(written).assertEqual(31);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(31);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(31, 4)));
    });

    /**
     * @tc.name SerialPortErrorRecoveryTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTERRORRECOVERY_1900
     * @tc.desc getDsr propagates code 35700004 without poisoning subsequent writes vector 101
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortErrorRecoveryTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('getDsr', 35700004);
      await expectFailure(async () => invokeOperation(fixture.controller, 'getDsr'), 'BusinessError', 35700004);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(32, 4));
      expect(written).assertEqual(32);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(32, 4)));
    });

    /**
     * @tc.name SerialPortErrorRecoveryTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTERRORRECOVERY_2000
     * @tc.desc sendBrk propagates code 35700005 without poisoning subsequent writes vector 102
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortErrorRecoveryTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('sendBrk', 35700005);
      await expectFailure(async () => invokeOperation(fixture.controller, 'sendBrk'), 'BusinessError', 35700005);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(63, 4));
      expect(written).assertEqual(63);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(63);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(63, 4)));
    });

    /**
     * @tc.name SerialPortErrorRecoveryTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTERRORRECOVERY_2100
     * @tc.desc write propagates code 35700006 without poisoning subsequent writes vector 103
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortErrorRecoveryTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('write', 35700006);
      await expectFailure(async () => invokeOperation(fixture.controller, 'write'), 'BusinessError', 35700006);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(64, 4));
      expect(written).assertEqual(64);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(64, 4)));
    });

    /**
     * @tc.name SerialPortErrorRecoveryTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTERRORRECOVERY_2200
     * @tc.desc onDataRead propagates code 35700007 without poisoning subsequent writes vector 104
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortErrorRecoveryTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
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
      const written: number = await fixture.controller.write(payload(127, 4));
      expect(written).assertEqual(127);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(127);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(127, 4)));
    });
  });
}
