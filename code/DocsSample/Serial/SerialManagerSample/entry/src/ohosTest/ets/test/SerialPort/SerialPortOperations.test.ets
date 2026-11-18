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

export default function SerialPortOperationsTest(): void {
  describe('SerialPortOperationsTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialPortOperations', 'begin');
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
      logSuite('SerialPortOperations', 'end');
    });

    /**
     * @tc.name SerialPortOperationsTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_0100
     * @tc.desc offDataRead propagates code 35700001 without poisoning subsequent writes vector 105
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('offDataRead', 35700001);
      await expectFailure(async () => invokeOperation(fixture.controller, 'offDataRead'), 'BusinessError', 35700001);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(128, 4));
      expect(written).assertEqual(128);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(128);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(128, 4)));
    });

    /**
     * @tc.name SerialPortOperationsTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_0200
     * @tc.desc onDisconnect propagates code 35700002 without poisoning subsequent writes vector 106
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
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
      const written: number = await fixture.controller.write(payload(255, 4));
      expect(written).assertEqual(255);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(255);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(255, 4)));
    });

    /**
     * @tc.name SerialPortOperationsTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_0300
     * @tc.desc offDisconnect propagates code 35700003 without poisoning subsequent writes vector 107
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('offDisconnect', 35700003);
      await expectFailure(async () => invokeOperation(fixture.controller, 'offDisconnect'), 'BusinessError', 35700003);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(256, 4));
      expect(written).assertEqual(256);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(256);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(256, 4)));
    });

    /**
     * @tc.name SerialPortOperationsTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_0400
     * @tc.desc flush propagates code 35700004 without poisoning subsequent writes vector 108
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('flush', 35700004);
      await expectFailure(async () => invokeOperation(fixture.controller, 'flush'), 'BusinessError', 35700004);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(511, 4));
      expect(written).assertEqual(511);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(511);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(511, 4)));
    });

    /**
     * @tc.name SerialPortOperationsTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_0500
     * @tc.desc drain propagates code 35700005 without poisoning subsequent writes vector 109
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('drain', 35700005);
      await expectFailure(async () => invokeOperation(fixture.controller, 'drain'), 'BusinessError', 35700005);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(512, 4));
      expect(written).assertEqual(512);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(512);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(512, 4)));
    });

    /**
     * @tc.name SerialPortOperationsTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_0600
     * @tc.desc setRts propagates code 35700006 without poisoning subsequent writes vector 110
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('setRts', 35700006);
      await expectFailure(async () => invokeOperation(fixture.controller, 'setRts'), 'BusinessError', 35700006);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(1023, 4));
      expect(written).assertEqual(1023);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1023);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(1023, 4)));
    });

    /**
     * @tc.name SerialPortOperationsTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_0700
     * @tc.desc getCts propagates code 35700007 without poisoning subsequent writes vector 111
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('getCts', 35700007);
      await expectFailure(async () => invokeOperation(fixture.controller, 'getCts'), 'BusinessError', 35700007);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(1024, 4));
      expect(written).assertEqual(1024);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1024);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(1024, 4)));
    });

    /**
     * @tc.name SerialPortOperationsTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_0800
     * @tc.desc setDtr propagates code 35700001 without poisoning subsequent writes vector 112
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('setDtr', 35700001);
      await expectFailure(async () => invokeOperation(fixture.controller, 'setDtr'), 'BusinessError', 35700001);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(2048, 4));
      expect(written).assertEqual(2048);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2048);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(2048, 4)));
    });

    /**
     * @tc.name SerialPortOperationsTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_0900
     * @tc.desc getDsr propagates code 35700002 without poisoning subsequent writes vector 113
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('getDsr', 35700002);
      await expectFailure(async () => invokeOperation(fixture.controller, 'getDsr'), 'BusinessError', 35700002);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(4095, 4));
      expect(written).assertEqual(4095);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4095);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(4095, 4)));
    });

    /**
     * @tc.name SerialPortOperationsTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_1000
     * @tc.desc sendBrk propagates code 35700003 without poisoning subsequent writes vector 114
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('sendBrk', 35700003);
      await expectFailure(async () => invokeOperation(fixture.controller, 'sendBrk'), 'BusinessError', 35700003);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(4096, 4));
      expect(written).assertEqual(4096);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4096);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(4096, 4)));
    });

    /**
     * @tc.name SerialPortOperationsTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_1100
     * @tc.desc write propagates code 35700004 without poisoning subsequent writes vector 115
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('write', 35700004);
      await expectFailure(async () => invokeOperation(fixture.controller, 'write'), 'BusinessError', 35700004);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(1, 5));
      expect(written).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(1, 5)));
    });

    /**
     * @tc.name SerialPortOperationsTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_1200
     * @tc.desc onDataRead propagates code 35700005 without poisoning subsequent writes vector 116
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
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
      const written: number = await fixture.controller.write(payload(2, 5));
      expect(written).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(2, 5)));
    });

    /**
     * @tc.name SerialPortOperationsTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_1300
     * @tc.desc offDataRead propagates code 35700006 without poisoning subsequent writes vector 117
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('offDataRead', 35700006);
      await expectFailure(async () => invokeOperation(fixture.controller, 'offDataRead'), 'BusinessError', 35700006);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(3, 5));
      expect(written).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(3, 5)));
    });

    /**
     * @tc.name SerialPortOperationsTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_1400
     * @tc.desc onDisconnect propagates code 35700007 without poisoning subsequent writes vector 118
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
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
      const written: number = await fixture.controller.write(payload(4, 5));
      expect(written).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(4, 5)));
    });

    /**
     * @tc.name SerialPortOperationsTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_1500
     * @tc.desc offDisconnect propagates code 35700001 without poisoning subsequent writes vector 119
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('offDisconnect', 35700001);
      await expectFailure(async () => invokeOperation(fixture.controller, 'offDisconnect'), 'BusinessError', 35700001);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(5, 5));
      expect(written).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(5, 5)));
    });

    /**
     * @tc.name SerialPortOperationsTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_1600
     * @tc.desc flush propagates code 35700002 without poisoning subsequent writes vector 120
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('flush', 35700002);
      await expectFailure(async () => invokeOperation(fixture.controller, 'flush'), 'BusinessError', 35700002);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(7, 5));
      expect(written).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(7, 5)));
    });

    /**
     * @tc.name SerialPortOperationsTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_1700
     * @tc.desc drain propagates code 35700003 without poisoning subsequent writes vector 121
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('drain', 35700003);
      await expectFailure(async () => invokeOperation(fixture.controller, 'drain'), 'BusinessError', 35700003);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(8, 5));
      expect(written).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(8, 5)));
    });

    /**
     * @tc.name SerialPortOperationsTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_1800
     * @tc.desc setRts propagates code 35700004 without poisoning subsequent writes vector 122
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('setRts', 35700004);
      await expectFailure(async () => invokeOperation(fixture.controller, 'setRts'), 'BusinessError', 35700004);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(16, 5));
      expect(written).assertEqual(16);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(16, 5)));
    });

    /**
     * @tc.name SerialPortOperationsTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_1900
     * @tc.desc getCts propagates code 35700005 without poisoning subsequent writes vector 123
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('getCts', 35700005);
      await expectFailure(async () => invokeOperation(fixture.controller, 'getCts'), 'BusinessError', 35700005);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(31, 5));
      expect(written).assertEqual(31);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(31);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(31, 5)));
    });

    /**
     * @tc.name SerialPortOperationsTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_2000
     * @tc.desc setDtr propagates code 35700006 without poisoning subsequent writes vector 124
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('setDtr', 35700006);
      await expectFailure(async () => invokeOperation(fixture.controller, 'setDtr'), 'BusinessError', 35700006);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(32, 5));
      expect(written).assertEqual(32);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(32, 5)));
    });

    /**
     * @tc.name SerialPortOperationsTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_2100
     * @tc.desc getDsr propagates code 35700007 without poisoning subsequent writes vector 125
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('getDsr', 35700007);
      await expectFailure(async () => invokeOperation(fixture.controller, 'getDsr'), 'BusinessError', 35700007);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(63, 5));
      expect(written).assertEqual(63);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(63);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(63, 5)));
    });

    /**
     * @tc.name SerialPortOperationsTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_2200
     * @tc.desc sendBrk propagates code 35700001 without poisoning subsequent writes vector 126
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('sendBrk', 35700001);
      await expectFailure(async () => invokeOperation(fixture.controller, 'sendBrk'), 'BusinessError', 35700001);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(64, 5));
      expect(written).assertEqual(64);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(64, 5)));
    });

    /**
     * @tc.name SerialPortOperationsTest023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_2300
     * @tc.desc write propagates code 35700002 without poisoning subsequent writes vector 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('write', 35700002);
      await expectFailure(async () => invokeOperation(fixture.controller, 'write'), 'BusinessError', 35700002);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(127, 5));
      expect(written).assertEqual(127);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(127);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(127, 5)));
    });

    /**
     * @tc.name SerialPortOperationsTest024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_2400
     * @tc.desc onDataRead propagates code 35700003 without poisoning subsequent writes vector 128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      await fixture.controller.offDataRead();
      fixture.port.failOnce('onDataRead', 35700003);
      await expectFailure(async () => invokeOperation(fixture.controller, 'onDataRead'), 'BusinessError', 35700003);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(128, 5));
      expect(written).assertEqual(128);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(128);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(128, 5)));
    });

    /**
     * @tc.name SerialPortOperationsTest025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_2500
     * @tc.desc offDataRead propagates code 35700004 without poisoning subsequent writes vector 129
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('offDataRead', 35700004);
      await expectFailure(async () => invokeOperation(fixture.controller, 'offDataRead'), 'BusinessError', 35700004);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(255, 5));
      expect(written).assertEqual(255);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(255);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(255, 5)));
    });

    /**
     * @tc.name SerialPortOperationsTest026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_2600
     * @tc.desc onDisconnect propagates code 35700005 without poisoning subsequent writes vector 130
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      await fixture.controller.offDisconnect();
      fixture.port.failOnce('onDisconnect', 35700005);
      await expectFailure(async () => invokeOperation(fixture.controller, 'onDisconnect'), 'BusinessError', 35700005);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(256, 5));
      expect(written).assertEqual(256);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(256);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(256, 5)));
    });

    /**
     * @tc.name SerialPortOperationsTest027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_2700
     * @tc.desc offDisconnect propagates code 35700006 without poisoning subsequent writes vector 131
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('offDisconnect', 35700006);
      await expectFailure(async () => invokeOperation(fixture.controller, 'offDisconnect'), 'BusinessError', 35700006);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(511, 5));
      expect(written).assertEqual(511);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(511);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(511, 5)));
    });

    /**
     * @tc.name SerialPortOperationsTest028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_2800
     * @tc.desc flush propagates code 35700007 without poisoning subsequent writes vector 132
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('flush', 35700007);
      await expectFailure(async () => invokeOperation(fixture.controller, 'flush'), 'BusinessError', 35700007);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(512, 5));
      expect(written).assertEqual(512);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(512);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(512, 5)));
    });

    /**
     * @tc.name SerialPortOperationsTest029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_2900
     * @tc.desc drain propagates code 35700001 without poisoning subsequent writes vector 133
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('drain', 35700001);
      await expectFailure(async () => invokeOperation(fixture.controller, 'drain'), 'BusinessError', 35700001);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(1023, 5));
      expect(written).assertEqual(1023);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1023);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(1023, 5)));
    });

    /**
     * @tc.name SerialPortOperationsTest030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_3000
     * @tc.desc setRts propagates code 35700002 without poisoning subsequent writes vector 134
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('setRts', 35700002);
      await expectFailure(async () => invokeOperation(fixture.controller, 'setRts'), 'BusinessError', 35700002);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(1024, 5));
      expect(written).assertEqual(1024);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1024);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(1024, 5)));
    });

    /**
     * @tc.name SerialPortOperationsTest031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_3100
     * @tc.desc getCts propagates code 35700003 without poisoning subsequent writes vector 135
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('getCts', 35700003);
      await expectFailure(async () => invokeOperation(fixture.controller, 'getCts'), 'BusinessError', 35700003);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(2048, 5));
      expect(written).assertEqual(2048);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2048);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(2048, 5)));
    });

    /**
     * @tc.name SerialPortOperationsTest032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_3200
     * @tc.desc setDtr propagates code 35700004 without poisoning subsequent writes vector 136
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('setDtr', 35700004);
      await expectFailure(async () => invokeOperation(fixture.controller, 'setDtr'), 'BusinessError', 35700004);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(4095, 5));
      expect(written).assertEqual(4095);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4095);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(4095, 5)));
    });

    /**
     * @tc.name SerialPortOperationsTest033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_3300
     * @tc.desc getDsr propagates code 35700005 without poisoning subsequent writes vector 137
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('getDsr', 35700005);
      await expectFailure(async () => invokeOperation(fixture.controller, 'getDsr'), 'BusinessError', 35700005);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(4096, 5));
      expect(written).assertEqual(4096);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4096);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(4096, 5)));
    });

    /**
     * @tc.name SerialPortOperationsTest034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_3400
     * @tc.desc sendBrk propagates code 35700006 without poisoning subsequent writes vector 138
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('sendBrk', 35700006);
      await expectFailure(async () => invokeOperation(fixture.controller, 'sendBrk'), 'BusinessError', 35700006);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(1, 6));
      expect(written).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(1, 6)));
    });

    /**
     * @tc.name SerialPortOperationsTest035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_3500
     * @tc.desc write propagates code 35700007 without poisoning subsequent writes vector 139
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('write', 35700007);
      await expectFailure(async () => invokeOperation(fixture.controller, 'write'), 'BusinessError', 35700007);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(2, 6));
      expect(written).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(2, 6)));
    });

    /**
     * @tc.name SerialPortOperationsTest036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_3600
     * @tc.desc onDataRead propagates code 35700001 without poisoning subsequent writes vector 140
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      await fixture.controller.offDataRead();
      fixture.port.failOnce('onDataRead', 35700001);
      await expectFailure(async () => invokeOperation(fixture.controller, 'onDataRead'), 'BusinessError', 35700001);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(3, 6));
      expect(written).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(3, 6)));
    });

    /**
     * @tc.name SerialPortOperationsTest037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_3700
     * @tc.desc offDataRead propagates code 35700002 without poisoning subsequent writes vector 141
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('offDataRead', 35700002);
      await expectFailure(async () => invokeOperation(fixture.controller, 'offDataRead'), 'BusinessError', 35700002);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(4, 6));
      expect(written).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(4, 6)));
    });

    /**
     * @tc.name SerialPortOperationsTest038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_3800
     * @tc.desc onDisconnect propagates code 35700003 without poisoning subsequent writes vector 142
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      await fixture.controller.offDisconnect();
      fixture.port.failOnce('onDisconnect', 35700003);
      await expectFailure(async () => invokeOperation(fixture.controller, 'onDisconnect'), 'BusinessError', 35700003);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(5, 6));
      expect(written).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(5, 6)));
    });

    /**
     * @tc.name SerialPortOperationsTest039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_3900
     * @tc.desc offDisconnect propagates code 35700004 without poisoning subsequent writes vector 143
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('offDisconnect', 35700004);
      await expectFailure(async () => invokeOperation(fixture.controller, 'offDisconnect'), 'BusinessError', 35700004);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(7, 6));
      expect(written).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(7, 6)));
    });

    /**
     * @tc.name SerialPortOperationsTest040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_4000
     * @tc.desc flush propagates code 35700005 without poisoning subsequent writes vector 144
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('flush', 35700005);
      await expectFailure(async () => invokeOperation(fixture.controller, 'flush'), 'BusinessError', 35700005);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(8, 6));
      expect(written).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(8, 6)));
    });

    /**
     * @tc.name SerialPortOperationsTest041
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_4100
     * @tc.desc drain propagates code 35700006 without poisoning subsequent writes vector 145
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('drain', 35700006);
      await expectFailure(async () => invokeOperation(fixture.controller, 'drain'), 'BusinessError', 35700006);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(16, 6));
      expect(written).assertEqual(16);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(16, 6)));
    });

    /**
     * @tc.name SerialPortOperationsTest042
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTOPERATIONS_4200
     * @tc.desc setRts propagates code 35700007 without poisoning subsequent writes vector 146
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortOperationsTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('setRts', 35700007);
      await expectFailure(async () => invokeOperation(fixture.controller, 'setRts'), 'BusinessError', 35700007);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(31, 6));
      expect(written).assertEqual(31);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(31);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(31, 6)));
    });
  });
}
