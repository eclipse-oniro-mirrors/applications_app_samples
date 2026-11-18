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

export default function SerialDiscoveryFailuresTest(): void {
  describe('SerialDiscoveryFailuresTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialDiscoveryFailures', 'begin');
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
      logSuite('SerialDiscoveryFailures', 'end');
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_0100
     * @tc.desc getSerialPortList propagates service code 35700004 and permits retry with port metadata vector 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700004;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700004);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-3', 3);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-3');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(3);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_0200
     * @tc.desc getSerialPortList propagates service code 35700005 and permits retry with port metadata vector 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700005;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700005);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-4', 4);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-4');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(4);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_0300
     * @tc.desc getSerialPortList propagates service code 35700006 and permits retry with port metadata vector 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700006;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700006);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-5', 5);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-5');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(5);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_0400
     * @tc.desc getSerialPortList propagates service code 35700007 and permits retry with port metadata vector 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700007;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700007);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-6', 6);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-6');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(6);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_0500
     * @tc.desc getSerialPortList propagates service code 35700001 and permits retry with port metadata vector 7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700001;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700001);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-7', 7);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-7');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(7);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_0600
     * @tc.desc getSerialPortList propagates service code 35700002 and permits retry with port metadata vector 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700002;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700002);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-8', 8);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-8');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(8);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_0700
     * @tc.desc getSerialPortList propagates service code 35700003 and permits retry with port metadata vector 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700003;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700003);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-9', 9);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-9');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(9);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_0800
     * @tc.desc getSerialPortList propagates service code 35700004 and permits retry with port metadata vector 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700004;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700004);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-10', 10);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-10');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(10);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_0900
     * @tc.desc getSerialPortList propagates service code 35700005 and permits retry with port metadata vector 11
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700005;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700005);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-11', 11);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-11');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(11);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_1000
     * @tc.desc getSerialPortList propagates service code 35700006 and permits retry with port metadata vector 12
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700006;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700006);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-12', 12);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-12');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(12);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_1100
     * @tc.desc getSerialPortList propagates service code 35700007 and permits retry with port metadata vector 13
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700007;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700007);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-13', 13);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-13');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(13);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_1200
     * @tc.desc getSerialPortList propagates service code 35700001 and permits retry with port metadata vector 14
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700001;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700001);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-14', 14);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-14');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(14);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_1300
     * @tc.desc getSerialPortList propagates service code 35700002 and permits retry with port metadata vector 15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700002;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700002);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-15', 15);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-15');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(15);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_1400
     * @tc.desc getSerialPortList propagates service code 35700003 and permits retry with port metadata vector 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700003;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700003);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-16', 16);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-16');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(16);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_1500
     * @tc.desc getSerialPortList propagates service code 35700004 and permits retry with port metadata vector 17
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700004;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700004);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-17', 17);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-17');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(17);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_1600
     * @tc.desc getSerialPortList propagates service code 35700005 and permits retry with port metadata vector 18
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700005;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700005);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-18', 18);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-18');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(18);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_1700
     * @tc.desc getSerialPortList propagates service code 35700006 and permits retry with port metadata vector 19
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700006;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700006);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-19', 19);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-19');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(19);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_1800
     * @tc.desc getSerialPortList propagates service code 35700007 and permits retry with port metadata vector 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700007;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700007);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-20', 20);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-20');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(20);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_1900
     * @tc.desc getSerialPortList propagates service code 35700001 and permits retry with port metadata vector 21
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700001;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700001);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-21', 21);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-21');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(21);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_2000
     * @tc.desc getSerialPortList propagates service code 35700002 and permits retry with port metadata vector 22
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700002;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700002);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-22', 22);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-22');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(22);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_2100
     * @tc.desc getSerialPortList propagates service code 35700003 and permits retry with port metadata vector 23
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700003;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700003);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-23', 23);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-23');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(23);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_2200
     * @tc.desc getSerialPortList propagates service code 35700004 and permits retry with port metadata vector 24
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700004;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700004);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-24', 24);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-24');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(24);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_2300
     * @tc.desc getSerialPortList propagates service code 35700005 and permits retry with port metadata vector 25
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700005;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700005);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-25', 25);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-25');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(25);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_2400
     * @tc.desc getSerialPortList propagates service code 35700006 and permits retry with port metadata vector 26
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700006;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700006);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-26', 26);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-26');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(26);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_2500
     * @tc.desc getSerialPortList propagates service code 35700007 and permits retry with port metadata vector 27
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700007;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700007);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-27', 27);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-27');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(27);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_2600
     * @tc.desc getSerialPortList propagates service code 35700001 and permits retry with port metadata vector 28
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700001;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700001);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-28', 28);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-28');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(28);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_2700
     * @tc.desc getSerialPortList propagates service code 35700002 and permits retry with port metadata vector 29
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700002;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700002);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-29', 29);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-29');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(29);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_2800
     * @tc.desc getSerialPortList propagates service code 35700003 and permits retry with port metadata vector 30
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700003;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700003);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-30', 30);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-30');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(30);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_2900
     * @tc.desc getSerialPortList propagates service code 35700004 and permits retry with port metadata vector 31
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700004;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700004);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-31', 31);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-31');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(31);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_3000
     * @tc.desc getSerialPortList propagates service code 35700005 and permits retry with port metadata vector 32
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700005;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700005);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-32', 32);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-32');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(32);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_3100
     * @tc.desc getSerialPortList propagates service code 35700006 and permits retry with port metadata vector 33
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700006;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700006);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-33', 33);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-33');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(33);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_3200
     * @tc.desc getSerialPortList propagates service code 35700007 and permits retry with port metadata vector 34
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700007;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700007);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-34', 34);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-34');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(34);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_3300
     * @tc.desc getSerialPortList propagates service code 35700001 and permits retry with port metadata vector 35
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700001;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700001);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-35', 35);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-35');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(35);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_3400
     * @tc.desc getSerialPortList propagates service code 35700002 and permits retry with port metadata vector 36
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700002;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700002);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-36', 36);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-36');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(36);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_3500
     * @tc.desc getSerialPortList propagates service code 35700003 and permits retry with port metadata vector 37
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700003;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700003);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-37', 37);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-37');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(37);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialDiscoveryFailuresTest036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCOVERYFAILURES_3600
     * @tc.desc getSerialPortList propagates service code 35700004 and permits retry with port metadata vector 38
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDiscoveryFailuresTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700004;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700004);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-38', 38);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-38');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(38);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });
  });
}
