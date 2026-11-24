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

export default function SerialFailurePropagationTest(): void {
  describe('SerialFailurePropagationTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialFailurePropagation', 'begin');
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
      logSuite('SerialFailurePropagation', 'end');
    });

    /**
     * @tc.name SerialFailurePropagationTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_0100
     * @tc.desc sendBrk propagates code 35700001 without poisoning subsequent writes vector 42
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('sendBrk', 35700001);
      await expectFailure(async () => invokeOperation(fixture.controller, 'sendBrk'), 'BusinessError', 35700001);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(1024, 1));
      expect(written).assertEqual(1024);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1024);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(1024, 1)));
    });

    /**
     * @tc.name SerialFailurePropagationTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_0200
     * @tc.desc write propagates code 35700002 without poisoning subsequent writes vector 43
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('write', 35700002);
      await expectFailure(async () => invokeOperation(fixture.controller, 'write'), 'BusinessError', 35700002);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(2048, 1));
      expect(written).assertEqual(2048);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2048);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(2048, 1)));
    });

    /**
     * @tc.name SerialFailurePropagationTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_0300
     * @tc.desc onDataRead propagates code 35700003 without poisoning subsequent writes vector 44
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
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
      const written: number = await fixture.controller.write(payload(4095, 1));
      expect(written).assertEqual(4095);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4095);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(4095, 1)));
    });

    /**
     * @tc.name SerialFailurePropagationTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_0400
     * @tc.desc offDataRead propagates code 35700004 without poisoning subsequent writes vector 45
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('offDataRead', 35700004);
      await expectFailure(async () => invokeOperation(fixture.controller, 'offDataRead'), 'BusinessError', 35700004);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(4096, 1));
      expect(written).assertEqual(4096);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4096);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(4096, 1)));
    });

    /**
     * @tc.name SerialFailurePropagationTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_0500
     * @tc.desc onDisconnect propagates code 35700005 without poisoning subsequent writes vector 46
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
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
      const written: number = await fixture.controller.write(payload(1, 2));
      expect(written).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(1, 2)));
    });

    /**
     * @tc.name SerialFailurePropagationTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_0600
     * @tc.desc offDisconnect propagates code 35700006 without poisoning subsequent writes vector 47
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('offDisconnect', 35700006);
      await expectFailure(async () => invokeOperation(fixture.controller, 'offDisconnect'), 'BusinessError', 35700006);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(2, 2));
      expect(written).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(2, 2)));
    });

    /**
     * @tc.name SerialFailurePropagationTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_0700
     * @tc.desc flush propagates code 35700007 without poisoning subsequent writes vector 48
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('flush', 35700007);
      await expectFailure(async () => invokeOperation(fixture.controller, 'flush'), 'BusinessError', 35700007);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(3, 2));
      expect(written).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(3, 2)));
    });

    /**
     * @tc.name SerialFailurePropagationTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_0800
     * @tc.desc drain propagates code 35700001 without poisoning subsequent writes vector 49
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('drain', 35700001);
      await expectFailure(async () => invokeOperation(fixture.controller, 'drain'), 'BusinessError', 35700001);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(4, 2));
      expect(written).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(4, 2)));
    });

    /**
     * @tc.name SerialFailurePropagationTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_0900
     * @tc.desc setRts propagates code 35700002 without poisoning subsequent writes vector 50
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('setRts', 35700002);
      await expectFailure(async () => invokeOperation(fixture.controller, 'setRts'), 'BusinessError', 35700002);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(5, 2));
      expect(written).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(5, 2)));
    });

    /**
     * @tc.name SerialFailurePropagationTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_1000
     * @tc.desc getCts propagates code 35700003 without poisoning subsequent writes vector 51
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('getCts', 35700003);
      await expectFailure(async () => invokeOperation(fixture.controller, 'getCts'), 'BusinessError', 35700003);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(7, 2));
      expect(written).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(7, 2)));
    });

    /**
     * @tc.name SerialFailurePropagationTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_1100
     * @tc.desc setDtr propagates code 35700004 without poisoning subsequent writes vector 52
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('setDtr', 35700004);
      await expectFailure(async () => invokeOperation(fixture.controller, 'setDtr'), 'BusinessError', 35700004);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(8, 2));
      expect(written).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(8, 2)));
    });

    /**
     * @tc.name SerialFailurePropagationTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_1200
     * @tc.desc getDsr propagates code 35700005 without poisoning subsequent writes vector 53
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('getDsr', 35700005);
      await expectFailure(async () => invokeOperation(fixture.controller, 'getDsr'), 'BusinessError', 35700005);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(16, 2));
      expect(written).assertEqual(16);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(16, 2)));
    });

    /**
     * @tc.name SerialFailurePropagationTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_1300
     * @tc.desc sendBrk propagates code 35700006 without poisoning subsequent writes vector 54
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('sendBrk', 35700006);
      await expectFailure(async () => invokeOperation(fixture.controller, 'sendBrk'), 'BusinessError', 35700006);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(31, 2));
      expect(written).assertEqual(31);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(31);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(31, 2)));
    });

    /**
     * @tc.name SerialFailurePropagationTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_1400
     * @tc.desc write propagates code 35700007 without poisoning subsequent writes vector 55
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('write', 35700007);
      await expectFailure(async () => invokeOperation(fixture.controller, 'write'), 'BusinessError', 35700007);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(32, 2));
      expect(written).assertEqual(32);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(32, 2)));
    });

    /**
     * @tc.name SerialFailurePropagationTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_1500
     * @tc.desc onDataRead propagates code 35700001 without poisoning subsequent writes vector 56
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
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
      const written: number = await fixture.controller.write(payload(63, 2));
      expect(written).assertEqual(63);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(63);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(63, 2)));
    });

    /**
     * @tc.name SerialFailurePropagationTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_1600
     * @tc.desc offDataRead propagates code 35700002 without poisoning subsequent writes vector 57
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('offDataRead', 35700002);
      await expectFailure(async () => invokeOperation(fixture.controller, 'offDataRead'), 'BusinessError', 35700002);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(64, 2));
      expect(written).assertEqual(64);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(64, 2)));
    });

    /**
     * @tc.name SerialFailurePropagationTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_1700
     * @tc.desc onDisconnect propagates code 35700003 without poisoning subsequent writes vector 58
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
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
      const written: number = await fixture.controller.write(payload(127, 2));
      expect(written).assertEqual(127);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(127);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(127, 2)));
    });

    /**
     * @tc.name SerialFailurePropagationTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_1800
     * @tc.desc offDisconnect propagates code 35700004 without poisoning subsequent writes vector 59
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('offDisconnect', 35700004);
      await expectFailure(async () => invokeOperation(fixture.controller, 'offDisconnect'), 'BusinessError', 35700004);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(128, 2));
      expect(written).assertEqual(128);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(128);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(128, 2)));
    });

    /**
     * @tc.name SerialFailurePropagationTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_1900
     * @tc.desc flush propagates code 35700005 without poisoning subsequent writes vector 60
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('flush', 35700005);
      await expectFailure(async () => invokeOperation(fixture.controller, 'flush'), 'BusinessError', 35700005);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(255, 2));
      expect(written).assertEqual(255);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(255);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(255, 2)));
    });

    /**
     * @tc.name SerialFailurePropagationTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_2000
     * @tc.desc drain propagates code 35700006 without poisoning subsequent writes vector 61
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('drain', 35700006);
      await expectFailure(async () => invokeOperation(fixture.controller, 'drain'), 'BusinessError', 35700006);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(256, 2));
      expect(written).assertEqual(256);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(256);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(256, 2)));
    });

    /**
     * @tc.name SerialFailurePropagationTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_2100
     * @tc.desc setRts propagates code 35700007 without poisoning subsequent writes vector 62
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('setRts', 35700007);
      await expectFailure(async () => invokeOperation(fixture.controller, 'setRts'), 'BusinessError', 35700007);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(511, 2));
      expect(written).assertEqual(511);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(511);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(511, 2)));
    });

    /**
     * @tc.name SerialFailurePropagationTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_2200
     * @tc.desc getCts propagates code 35700001 without poisoning subsequent writes vector 63
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('getCts', 35700001);
      await expectFailure(async () => invokeOperation(fixture.controller, 'getCts'), 'BusinessError', 35700001);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(512, 2));
      expect(written).assertEqual(512);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(512);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(512, 2)));
    });

    /**
     * @tc.name SerialFailurePropagationTest023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_2300
     * @tc.desc setDtr propagates code 35700002 without poisoning subsequent writes vector 64
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('setDtr', 35700002);
      await expectFailure(async () => invokeOperation(fixture.controller, 'setDtr'), 'BusinessError', 35700002);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(1023, 2));
      expect(written).assertEqual(1023);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1023);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(1023, 2)));
    });

    /**
     * @tc.name SerialFailurePropagationTest024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_2400
     * @tc.desc getDsr propagates code 35700003 without poisoning subsequent writes vector 65
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('getDsr', 35700003);
      await expectFailure(async () => invokeOperation(fixture.controller, 'getDsr'), 'BusinessError', 35700003);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(1024, 2));
      expect(written).assertEqual(1024);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1024);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(1024, 2)));
    });

    /**
     * @tc.name SerialFailurePropagationTest025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_2500
     * @tc.desc sendBrk propagates code 35700004 without poisoning subsequent writes vector 66
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('sendBrk', 35700004);
      await expectFailure(async () => invokeOperation(fixture.controller, 'sendBrk'), 'BusinessError', 35700004);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(2048, 2));
      expect(written).assertEqual(2048);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2048);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(2048, 2)));
    });

    /**
     * @tc.name SerialFailurePropagationTest026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_2600
     * @tc.desc write propagates code 35700005 without poisoning subsequent writes vector 67
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('write', 35700005);
      await expectFailure(async () => invokeOperation(fixture.controller, 'write'), 'BusinessError', 35700005);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(4095, 2));
      expect(written).assertEqual(4095);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4095);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(4095, 2)));
    });

    /**
     * @tc.name SerialFailurePropagationTest027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_2700
     * @tc.desc onDataRead propagates code 35700006 without poisoning subsequent writes vector 68
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      await fixture.controller.offDataRead();
      fixture.port.failOnce('onDataRead', 35700006);
      await expectFailure(async () => invokeOperation(fixture.controller, 'onDataRead'), 'BusinessError', 35700006);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(4096, 2));
      expect(written).assertEqual(4096);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4096);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(4096, 2)));
    });

    /**
     * @tc.name SerialFailurePropagationTest028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_2800
     * @tc.desc offDataRead propagates code 35700007 without poisoning subsequent writes vector 69
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('offDataRead', 35700007);
      await expectFailure(async () => invokeOperation(fixture.controller, 'offDataRead'), 'BusinessError', 35700007);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(1, 3));
      expect(written).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(1, 3)));
    });

    /**
     * @tc.name SerialFailurePropagationTest029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_2900
     * @tc.desc onDisconnect propagates code 35700001 without poisoning subsequent writes vector 70
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      await fixture.controller.offDisconnect();
      fixture.port.failOnce('onDisconnect', 35700001);
      await expectFailure(async () => invokeOperation(fixture.controller, 'onDisconnect'), 'BusinessError', 35700001);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(2, 3));
      expect(written).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(2, 3)));
    });

    /**
     * @tc.name SerialFailurePropagationTest030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_3000
     * @tc.desc offDisconnect propagates code 35700002 without poisoning subsequent writes vector 71
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('offDisconnect', 35700002);
      await expectFailure(async () => invokeOperation(fixture.controller, 'offDisconnect'), 'BusinessError', 35700002);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(3, 3));
      expect(written).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(3, 3)));
    });

    /**
     * @tc.name SerialFailurePropagationTest031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_3100
     * @tc.desc flush propagates code 35700003 without poisoning subsequent writes vector 72
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('flush', 35700003);
      await expectFailure(async () => invokeOperation(fixture.controller, 'flush'), 'BusinessError', 35700003);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(4, 3));
      expect(written).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(4, 3)));
    });

    /**
     * @tc.name SerialFailurePropagationTest032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_3200
     * @tc.desc drain propagates code 35700004 without poisoning subsequent writes vector 73
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('drain', 35700004);
      await expectFailure(async () => invokeOperation(fixture.controller, 'drain'), 'BusinessError', 35700004);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(5, 3));
      expect(written).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(5, 3)));
    });

    /**
     * @tc.name SerialFailurePropagationTest033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_3300
     * @tc.desc setRts propagates code 35700005 without poisoning subsequent writes vector 74
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('setRts', 35700005);
      await expectFailure(async () => invokeOperation(fixture.controller, 'setRts'), 'BusinessError', 35700005);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(7, 3));
      expect(written).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(7, 3)));
    });

    /**
     * @tc.name SerialFailurePropagationTest034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_3400
     * @tc.desc getCts propagates code 35700006 without poisoning subsequent writes vector 75
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('getCts', 35700006);
      await expectFailure(async () => invokeOperation(fixture.controller, 'getCts'), 'BusinessError', 35700006);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(8, 3));
      expect(written).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(8, 3)));
    });

    /**
     * @tc.name SerialFailurePropagationTest035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_3500
     * @tc.desc setDtr propagates code 35700007 without poisoning subsequent writes vector 76
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('setDtr', 35700007);
      await expectFailure(async () => invokeOperation(fixture.controller, 'setDtr'), 'BusinessError', 35700007);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(16, 3));
      expect(written).assertEqual(16);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(16, 3)));
    });

    /**
     * @tc.name SerialFailurePropagationTest036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_3600
     * @tc.desc getDsr propagates code 35700001 without poisoning subsequent writes vector 77
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('getDsr', 35700001);
      await expectFailure(async () => invokeOperation(fixture.controller, 'getDsr'), 'BusinessError', 35700001);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(31, 3));
      expect(written).assertEqual(31);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(31);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(31, 3)));
    });

    /**
     * @tc.name SerialFailurePropagationTest037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_3700
     * @tc.desc sendBrk propagates code 35700002 without poisoning subsequent writes vector 78
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('sendBrk', 35700002);
      await expectFailure(async () => invokeOperation(fixture.controller, 'sendBrk'), 'BusinessError', 35700002);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(32, 3));
      expect(written).assertEqual(32);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(32, 3)));
    });

    /**
     * @tc.name SerialFailurePropagationTest038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_3800
     * @tc.desc write propagates code 35700003 without poisoning subsequent writes vector 79
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('write', 35700003);
      await expectFailure(async () => invokeOperation(fixture.controller, 'write'), 'BusinessError', 35700003);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(63, 3));
      expect(written).assertEqual(63);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(63);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(63, 3)));
    });

    /**
     * @tc.name SerialFailurePropagationTest039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_3900
     * @tc.desc onDataRead propagates code 35700004 without poisoning subsequent writes vector 80
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      await fixture.controller.offDataRead();
      fixture.port.failOnce('onDataRead', 35700004);
      await expectFailure(async () => invokeOperation(fixture.controller, 'onDataRead'), 'BusinessError', 35700004);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(64, 3));
      expect(written).assertEqual(64);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(64, 3)));
    });

    /**
     * @tc.name SerialFailurePropagationTest040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_4000
     * @tc.desc offDataRead propagates code 35700005 without poisoning subsequent writes vector 81
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      fixture.port.failOnce('offDataRead', 35700005);
      await expectFailure(async () => invokeOperation(fixture.controller, 'offDataRead'), 'BusinessError', 35700005);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(127, 3));
      expect(written).assertEqual(127);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(127);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(127, 3)));
    });

    /**
     * @tc.name SerialFailurePropagationTest041
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALFAILUREPROPAGATION_4100
     * @tc.desc onDisconnect propagates code 35700006 without poisoning subsequent writes vector 82
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialFailurePropagationTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      await fixture.controller.offDisconnect();
      fixture.port.failOnce('onDisconnect', 35700006);
      await expectFailure(async () => invokeOperation(fixture.controller, 'onDisconnect'), 'BusinessError', 35700006);
      expectSession(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.failures.length).assertEqual(0);
      const written: number = await fixture.controller.write(payload(128, 3));
      expect(written).assertEqual(128);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(128);
      expectBytes(fixture.port.writes[fixture.port.writes.length - 1], Array.from(payload(128, 3)));
    });
  });
}
