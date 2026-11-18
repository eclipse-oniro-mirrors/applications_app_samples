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

export default function SerialAuthorizationErrorsTest(): void {
  describe('SerialAuthorizationErrorsTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialAuthorizationErrors', 'begin');
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
      logSuite('SerialAuthorizationErrors', 'end');
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_0100
     * @tc.desc open retains selected port on service code 35700001 then retries baudRate 300 vector 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700001);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700001);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 300, dataBits: 5, stopBits: 1, parity: 'none' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(300);
      expect(await fixture.controller.write(payload(1, 0))).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_0200
     * @tc.desc open retains selected port on service code 35700002 then retries baudRate 1200 vector 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700002);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700002);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 1200, dataBits: 5, stopBits: 1, parity: 'even' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(1200);
      expect(await fixture.controller.write(payload(2, 0))).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_0300
     * @tc.desc open retains selected port on service code 35700003 then retries baudRate 2400 vector 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700003);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700003);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 2400, dataBits: 5, stopBits: 1, parity: 'odd' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(2400);
      expect(await fixture.controller.write(payload(3, 0))).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_0400
     * @tc.desc open retains selected port on service code 35700004 then retries baudRate 4800 vector 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700004);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700004);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 4800, dataBits: 5, stopBits: 1, parity: 'mark' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(4800);
      expect(await fixture.controller.write(payload(4, 0))).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_0500
     * @tc.desc open retains selected port on service code 35700005 then retries baudRate 9600 vector 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700005);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700005);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 9600, dataBits: 5, stopBits: 1, parity: 'space' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(9600);
      expect(await fixture.controller.write(payload(5, 0))).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_0600
     * @tc.desc open retains selected port on service code 35700006 then retries baudRate 19200 vector 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700006);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700006);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 19200, dataBits: 5, stopBits: 1, parity: 'none' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(19200);
      expect(await fixture.controller.write(payload(7, 0))).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_0700
     * @tc.desc open retains selected port on service code 35700007 then retries baudRate 38400 vector 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700007);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700007);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 38400, dataBits: 5, stopBits: 1, parity: 'even' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(38400);
      expect(await fixture.controller.write(payload(8, 0))).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_0800
     * @tc.desc open retains selected port on service code 35700001 then retries baudRate 57600 vector 7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700001);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700001);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 57600, dataBits: 5, stopBits: 1, parity: 'odd' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(57600);
      expect(await fixture.controller.write(payload(16, 0))).assertEqual(16);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_0900
     * @tc.desc open retains selected port on service code 35700002 then retries baudRate 115200 vector 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700002);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700002);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 115200, dataBits: 5, stopBits: 1, parity: 'mark' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(115200);
      expect(await fixture.controller.write(payload(31, 0))).assertEqual(31);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(31);
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_1000
     * @tc.desc open retains selected port on service code 35700003 then retries baudRate 230400 vector 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700003);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700003);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 230400, dataBits: 5, stopBits: 1, parity: 'space' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(230400);
      expect(await fixture.controller.write(payload(32, 0))).assertEqual(32);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_1100
     * @tc.desc open retains selected port on service code 35700004 then retries baudRate 460800 vector 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700004);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700004);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 460800, dataBits: 5, stopBits: 1, parity: 'none' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(460800);
      expect(await fixture.controller.write(payload(63, 0))).assertEqual(63);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(63);
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_1200
     * @tc.desc open retains selected port on service code 35700005 then retries baudRate 921600 vector 11
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700005);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700005);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 921600, dataBits: 5, stopBits: 1, parity: 'even' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(921600);
      expect(await fixture.controller.write(payload(64, 0))).assertEqual(64);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_1300
     * @tc.desc open retains selected port on service code 35700006 then retries baudRate 300 vector 12
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700006);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700006);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 300, dataBits: 6, stopBits: 1, parity: 'odd' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(300);
      expect(await fixture.controller.write(payload(127, 0))).assertEqual(127);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(127);
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_1400
     * @tc.desc open retains selected port on service code 35700007 then retries baudRate 1200 vector 13
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700007);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700007);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 1200, dataBits: 6, stopBits: 1, parity: 'mark' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(1200);
      expect(await fixture.controller.write(payload(128, 0))).assertEqual(128);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(128);
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_1500
     * @tc.desc open retains selected port on service code 35700001 then retries baudRate 2400 vector 14
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700001);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700001);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 2400, dataBits: 6, stopBits: 1, parity: 'space' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(2400);
      expect(await fixture.controller.write(payload(255, 0))).assertEqual(255);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(255);
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_1600
     * @tc.desc open retains selected port on service code 35700002 then retries baudRate 4800 vector 15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700002);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700002);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 4800, dataBits: 6, stopBits: 1, parity: 'none' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(4800);
      expect(await fixture.controller.write(payload(256, 0))).assertEqual(256);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(256);
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_1700
     * @tc.desc open retains selected port on service code 35700003 then retries baudRate 9600 vector 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700003);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700003);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 9600, dataBits: 6, stopBits: 1, parity: 'even' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(9600);
      expect(await fixture.controller.write(payload(511, 0))).assertEqual(511);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(511);
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_1800
     * @tc.desc open retains selected port on service code 35700004 then retries baudRate 19200 vector 17
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700004);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700004);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 19200, dataBits: 6, stopBits: 1, parity: 'odd' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(19200);
      expect(await fixture.controller.write(payload(512, 0))).assertEqual(512);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(512);
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_1900
     * @tc.desc open retains selected port on service code 35700005 then retries baudRate 38400 vector 18
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700005);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700005);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 38400, dataBits: 6, stopBits: 1, parity: 'mark' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(38400);
      expect(await fixture.controller.write(payload(1023, 0))).assertEqual(1023);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1023);
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_2000
     * @tc.desc open retains selected port on service code 35700006 then retries baudRate 57600 vector 19
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700006);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700006);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 57600, dataBits: 6, stopBits: 1, parity: 'space' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(57600);
      expect(await fixture.controller.write(payload(1024, 0))).assertEqual(1024);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1024);
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_2100
     * @tc.desc open retains selected port on service code 35700007 then retries baudRate 115200 vector 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700007);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700007);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 115200, dataBits: 6, stopBits: 1, parity: 'none' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(115200);
      expect(await fixture.controller.write(payload(2048, 0))).assertEqual(2048);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2048);
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_2200
     * @tc.desc open retains selected port on service code 35700001 then retries baudRate 230400 vector 21
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700001);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700001);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 230400, dataBits: 6, stopBits: 1, parity: 'even' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(230400);
      expect(await fixture.controller.write(payload(4095, 0))).assertEqual(4095);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4095);
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_2300
     * @tc.desc open retains selected port on service code 35700002 then retries baudRate 460800 vector 22
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700002);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700002);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 460800, dataBits: 6, stopBits: 1, parity: 'odd' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(460800);
      expect(await fixture.controller.write(payload(4096, 0))).assertEqual(4096);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4096);
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_2400
     * @tc.desc open retains selected port on service code 35700003 then retries baudRate 921600 vector 23
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700003);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700003);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 921600, dataBits: 6, stopBits: 1, parity: 'mark' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(921600);
      expect(await fixture.controller.write(payload(1, 1))).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_2500
     * @tc.desc open retains selected port on service code 35700004 then retries baudRate 300 vector 24
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700004);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700004);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 300, dataBits: 7, stopBits: 1, parity: 'space' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(300);
      expect(await fixture.controller.write(payload(2, 1))).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_2600
     * @tc.desc open retains selected port on service code 35700005 then retries baudRate 1200 vector 25
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700005);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700005);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 1200, dataBits: 7, stopBits: 1, parity: 'none' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(1200);
      expect(await fixture.controller.write(payload(3, 1))).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_2700
     * @tc.desc open retains selected port on service code 35700006 then retries baudRate 2400 vector 26
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700006);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700006);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 2400, dataBits: 7, stopBits: 1, parity: 'even' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(2400);
      expect(await fixture.controller.write(payload(4, 1))).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_2800
     * @tc.desc open retains selected port on service code 35700007 then retries baudRate 4800 vector 27
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700007);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700007);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 4800, dataBits: 7, stopBits: 1, parity: 'odd' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(4800);
      expect(await fixture.controller.write(payload(5, 1))).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_2900
     * @tc.desc open retains selected port on service code 35700001 then retries baudRate 9600 vector 28
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700001);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700001);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 9600, dataBits: 7, stopBits: 1, parity: 'mark' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(9600);
      expect(await fixture.controller.write(payload(7, 1))).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_3000
     * @tc.desc open retains selected port on service code 35700002 then retries baudRate 19200 vector 29
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700002);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700002);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 19200, dataBits: 7, stopBits: 1, parity: 'space' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(19200);
      expect(await fixture.controller.write(payload(8, 1))).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_3100
     * @tc.desc open retains selected port on service code 35700003 then retries baudRate 38400 vector 30
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700003);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700003);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 38400, dataBits: 7, stopBits: 1, parity: 'none' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(38400);
      expect(await fixture.controller.write(payload(16, 1))).assertEqual(16);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_3200
     * @tc.desc open retains selected port on service code 35700004 then retries baudRate 57600 vector 31
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700004);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700004);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 57600, dataBits: 7, stopBits: 1, parity: 'even' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(57600);
      expect(await fixture.controller.write(payload(31, 1))).assertEqual(31);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(31);
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_3300
     * @tc.desc open retains selected port on service code 35700005 then retries baudRate 115200 vector 32
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700005);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700005);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 115200, dataBits: 7, stopBits: 1, parity: 'odd' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(115200);
      expect(await fixture.controller.write(payload(32, 1))).assertEqual(32);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_3400
     * @tc.desc open retains selected port on service code 35700006 then retries baudRate 230400 vector 33
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700006);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700006);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 230400, dataBits: 7, stopBits: 1, parity: 'mark' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(230400);
      expect(await fixture.controller.write(payload(63, 1))).assertEqual(63);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(63);
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_3500
     * @tc.desc open retains selected port on service code 35700007 then retries baudRate 460800 vector 34
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700007);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700007);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 460800, dataBits: 7, stopBits: 1, parity: 'space' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(460800);
      expect(await fixture.controller.write(payload(64, 1))).assertEqual(64);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
    });

    /**
     * @tc.name SerialAuthorizationErrorsTest036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALAUTHORIZATIONERRORS_3600
     * @tc.desc open retains selected port on service code 35700001 then retries baudRate 921600 vector 35
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialAuthorizationErrorsTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.port.failOnce('open', 35700001);
      await expectFailure(async () => fixture.controller.open(), 'BusinessError', 35700001);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.port.configs.length).assertEqual(0);
      await fixture.controller.open({ baudRate: 921600, dataBits: 7, stopBits: 1, parity: 'none' as serial.Parity });
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.configs[0].baudRate).assertEqual(921600);
      expect(await fixture.controller.write(payload(127, 1))).assertEqual(127);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(127);
    });
  });
}
