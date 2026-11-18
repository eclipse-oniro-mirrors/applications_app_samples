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

export default function SerialPortInfoTest(): void {
  describe('SerialPortInfoTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialPortInfo', 'begin');
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
      logSuite('SerialPortInfo', 'end');
    });

    /**
     * @tc.name SerialPortInfoTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTINFO_0100
     * @tc.desc getSerialPortList selects the first of 1 ports and preserves optional portInfo fields vector 24
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortInfoTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-24', undefined, undefined, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 1; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('tty-24');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-24');
      expect(info.vendorId).assertEqual(undefined);
      expect(info.productId).assertEqual(undefined);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortInfoTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTINFO_0200
     * @tc.desc getSerialPortList selects the first of 2 ports and preserves optional portInfo fields vector 25
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortInfoTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-25', 6425, 62260, "ACME");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 2; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(2);
      expect(ports[0].portName).assertEqual('tty-25');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-25');
      expect(info.vendorId).assertEqual(6425);
      expect(info.productId).assertEqual(62260);
      expect(info.manufacturer).assertEqual("ACME");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortInfoTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTINFO_0300
     * @tc.desc getSerialPortList selects the first of 3 ports and preserves optional portInfo fields vector 26
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortInfoTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-26', 6682, 62129, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 3; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(3);
      expect(ports[0].portName).assertEqual('tty-26');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-26');
      expect(info.vendorId).assertEqual(6682);
      expect(info.productId).assertEqual(62129);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortInfoTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTINFO_0400
     * @tc.desc getSerialPortList selects the first of 4 ports and preserves optional portInfo fields vector 27
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortInfoTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-27', 6939, undefined, "Serial Vendor");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 4; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(4);
      expect(ports[0].portName).assertEqual('tty-27');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-27');
      expect(info.vendorId).assertEqual(6939);
      expect(info.productId).assertEqual(undefined);
      expect(info.manufacturer).assertEqual("Serial Vendor");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortInfoTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTINFO_0500
     * @tc.desc getSerialPortList selects the first of 5 ports and preserves optional portInfo fields vector 28
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortInfoTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-28', undefined, 61867, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 5; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(5);
      expect(ports[0].portName).assertEqual('tty-28');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-28');
      expect(info.vendorId).assertEqual(undefined);
      expect(info.productId).assertEqual(61867);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortInfoTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTINFO_0600
     * @tc.desc getSerialPortList selects the first of 6 ports and preserves optional portInfo fields vector 29
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortInfoTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-29', 7453, 61736, "串口厂商");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 6; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(6);
      expect(ports[0].portName).assertEqual('tty-29');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-29');
      expect(info.vendorId).assertEqual(7453);
      expect(info.productId).assertEqual(61736);
      expect(info.manufacturer).assertEqual("串口厂商");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortInfoTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTINFO_0700
     * @tc.desc getSerialPortList selects the first of 1 ports and preserves optional portInfo fields vector 30
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortInfoTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-30', 7710, undefined, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 1; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('tty-30');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-30');
      expect(info.vendorId).assertEqual(7710);
      expect(info.productId).assertEqual(undefined);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortInfoTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTINFO_0800
     * @tc.desc getSerialPortList selects the first of 2 ports and preserves optional portInfo fields vector 31
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortInfoTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-31', 7967, 61474, "Vendor-ß");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 2; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(2);
      expect(ports[0].portName).assertEqual('tty-31');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-31');
      expect(info.vendorId).assertEqual(7967);
      expect(info.productId).assertEqual(61474);
      expect(info.manufacturer).assertEqual("Vendor-ß");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortInfoTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTINFO_0900
     * @tc.desc getSerialPortList selects the first of 3 ports and preserves optional portInfo fields vector 32
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortInfoTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-32', undefined, 61343, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 3; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(3);
      expect(ports[0].portName).assertEqual('tty-32');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-32');
      expect(info.vendorId).assertEqual(undefined);
      expect(info.productId).assertEqual(61343);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortInfoTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTINFO_1000
     * @tc.desc getSerialPortList selects the first of 4 ports and preserves optional portInfo fields vector 33
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortInfoTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-33', 8481, undefined, "ACME");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 4; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(4);
      expect(ports[0].portName).assertEqual('tty-33');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-33');
      expect(info.vendorId).assertEqual(8481);
      expect(info.productId).assertEqual(undefined);
      expect(info.manufacturer).assertEqual("ACME");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortInfoTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTINFO_1100
     * @tc.desc getSerialPortList selects the first of 5 ports and preserves optional portInfo fields vector 34
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortInfoTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-34', 8738, 61081, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 5; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(5);
      expect(ports[0].portName).assertEqual('tty-34');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-34');
      expect(info.vendorId).assertEqual(8738);
      expect(info.productId).assertEqual(61081);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortInfoTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTINFO_1200
     * @tc.desc getSerialPortList selects the first of 6 ports and preserves optional portInfo fields vector 35
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortInfoTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-35', 8995, 60950, "Serial Vendor");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 6; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(6);
      expect(ports[0].portName).assertEqual('tty-35');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-35');
      expect(info.vendorId).assertEqual(8995);
      expect(info.productId).assertEqual(60950);
      expect(info.manufacturer).assertEqual("Serial Vendor");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortInfoTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTINFO_1300
     * @tc.desc getSerialPortList selects the first of 1 ports and preserves optional portInfo fields vector 36
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortInfoTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-36', undefined, undefined, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 1; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('tty-36');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-36');
      expect(info.vendorId).assertEqual(undefined);
      expect(info.productId).assertEqual(undefined);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortInfoTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTINFO_1400
     * @tc.desc getSerialPortList selects the first of 2 ports and preserves optional portInfo fields vector 37
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortInfoTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-37', 9509, 60688, "串口厂商");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 2; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(2);
      expect(ports[0].portName).assertEqual('tty-37');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-37');
      expect(info.vendorId).assertEqual(9509);
      expect(info.productId).assertEqual(60688);
      expect(info.manufacturer).assertEqual("串口厂商");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortInfoTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTINFO_1500
     * @tc.desc getSerialPortList selects the first of 3 ports and preserves optional portInfo fields vector 38
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortInfoTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-38', 9766, 60557, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 3; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(3);
      expect(ports[0].portName).assertEqual('tty-38');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-38');
      expect(info.vendorId).assertEqual(9766);
      expect(info.productId).assertEqual(60557);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortInfoTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTINFO_1600
     * @tc.desc getSerialPortList selects the first of 4 ports and preserves optional portInfo fields vector 39
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortInfoTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-39', 10023, undefined, "Vendor-ß");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 4; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(4);
      expect(ports[0].portName).assertEqual('tty-39');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-39');
      expect(info.vendorId).assertEqual(10023);
      expect(info.productId).assertEqual(undefined);
      expect(info.manufacturer).assertEqual("Vendor-ß");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortInfoTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTINFO_1700
     * @tc.desc getSerialPortList selects the first of 5 ports and preserves optional portInfo fields vector 40
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortInfoTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-40', undefined, 60295, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 5; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(5);
      expect(ports[0].portName).assertEqual('tty-40');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-40');
      expect(info.vendorId).assertEqual(undefined);
      expect(info.productId).assertEqual(60295);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortInfoTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTINFO_1800
     * @tc.desc getSerialPortList selects the first of 6 ports and preserves optional portInfo fields vector 41
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortInfoTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-41', 10537, 60164, "ACME");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 6; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(6);
      expect(ports[0].portName).assertEqual('tty-41');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-41');
      expect(info.vendorId).assertEqual(10537);
      expect(info.productId).assertEqual(60164);
      expect(info.manufacturer).assertEqual("ACME");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortInfoTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTINFO_1900
     * @tc.desc getSerialPortList selects the first of 1 ports and preserves optional portInfo fields vector 42
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortInfoTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-42', 10794, undefined, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 1; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('tty-42');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-42');
      expect(info.vendorId).assertEqual(10794);
      expect(info.productId).assertEqual(undefined);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortInfoTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTINFO_2000
     * @tc.desc getSerialPortList selects the first of 2 ports and preserves optional portInfo fields vector 43
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortInfoTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-43', 11051, 59902, "Serial Vendor");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 2; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(2);
      expect(ports[0].portName).assertEqual('tty-43');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-43');
      expect(info.vendorId).assertEqual(11051);
      expect(info.productId).assertEqual(59902);
      expect(info.manufacturer).assertEqual("Serial Vendor");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortInfoTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTINFO_2100
     * @tc.desc getSerialPortList selects the first of 3 ports and preserves optional portInfo fields vector 44
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortInfoTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-44', undefined, 59771, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 3; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(3);
      expect(ports[0].portName).assertEqual('tty-44');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-44');
      expect(info.vendorId).assertEqual(undefined);
      expect(info.productId).assertEqual(59771);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortInfoTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTINFO_2200
     * @tc.desc getSerialPortList selects the first of 4 ports and preserves optional portInfo fields vector 45
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortInfoTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-45', 11565, undefined, "串口厂商");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 4; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(4);
      expect(ports[0].portName).assertEqual('tty-45');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-45');
      expect(info.vendorId).assertEqual(11565);
      expect(info.productId).assertEqual(undefined);
      expect(info.manufacturer).assertEqual("串口厂商");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortInfoTest023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTINFO_2300
     * @tc.desc getSerialPortList selects the first of 5 ports and preserves optional portInfo fields vector 46
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortInfoTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-46', 11822, 59509, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 5; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(5);
      expect(ports[0].portName).assertEqual('tty-46');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-46');
      expect(info.vendorId).assertEqual(11822);
      expect(info.productId).assertEqual(59509);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortInfoTest024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTINFO_2400
     * @tc.desc getSerialPortList selects the first of 6 ports and preserves optional portInfo fields vector 47
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortInfoTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-47', 12079, 59378, "Vendor-ß");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 6; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(6);
      expect(ports[0].portName).assertEqual('tty-47');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-47');
      expect(info.vendorId).assertEqual(12079);
      expect(info.productId).assertEqual(59378);
      expect(info.manufacturer).assertEqual("Vendor-ß");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortInfoTest025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTINFO_2500
     * @tc.desc getSerialPortList selects the first of 1 ports and preserves optional portInfo fields vector 48
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortInfoTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-48', undefined, undefined, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 1; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('tty-48');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-48');
      expect(info.vendorId).assertEqual(undefined);
      expect(info.productId).assertEqual(undefined);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortInfoTest026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTINFO_2600
     * @tc.desc getSerialPortList selects the first of 2 ports and preserves optional portInfo fields vector 49
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortInfoTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-49', 12593, 59116, "ACME");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 2; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(2);
      expect(ports[0].portName).assertEqual('tty-49');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-49');
      expect(info.vendorId).assertEqual(12593);
      expect(info.productId).assertEqual(59116);
      expect(info.manufacturer).assertEqual("ACME");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortInfoTest027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTINFO_2700
     * @tc.desc getSerialPortList selects the first of 3 ports and preserves optional portInfo fields vector 50
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortInfoTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-50', 12850, 58985, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 3; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(3);
      expect(ports[0].portName).assertEqual('tty-50');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-50');
      expect(info.vendorId).assertEqual(12850);
      expect(info.productId).assertEqual(58985);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortInfoTest028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTINFO_2800
     * @tc.desc getSerialPortList selects the first of 4 ports and preserves optional portInfo fields vector 51
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortInfoTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-51', 13107, undefined, "Serial Vendor");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 4; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(4);
      expect(ports[0].portName).assertEqual('tty-51');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-51');
      expect(info.vendorId).assertEqual(13107);
      expect(info.productId).assertEqual(undefined);
      expect(info.manufacturer).assertEqual("Serial Vendor");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortInfoTest029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTINFO_2900
     * @tc.desc getSerialPortList selects the first of 5 ports and preserves optional portInfo fields vector 52
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortInfoTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-52', undefined, 58723, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 5; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(5);
      expect(ports[0].portName).assertEqual('tty-52');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-52');
      expect(info.vendorId).assertEqual(undefined);
      expect(info.productId).assertEqual(58723);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortInfoTest030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTINFO_3000
     * @tc.desc getSerialPortList selects the first of 6 ports and preserves optional portInfo fields vector 53
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortInfoTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-53', 13621, 58592, "串口厂商");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 6; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(6);
      expect(ports[0].portName).assertEqual('tty-53');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-53');
      expect(info.vendorId).assertEqual(13621);
      expect(info.productId).assertEqual(58592);
      expect(info.manufacturer).assertEqual("串口厂商");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortInfoTest031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTINFO_3100
     * @tc.desc getSerialPortList selects the first of 1 ports and preserves optional portInfo fields vector 54
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortInfoTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-54', 13878, undefined, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 1; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('tty-54');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-54');
      expect(info.vendorId).assertEqual(13878);
      expect(info.productId).assertEqual(undefined);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortInfoTest032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTINFO_3200
     * @tc.desc getSerialPortList selects the first of 2 ports and preserves optional portInfo fields vector 55
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortInfoTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-55', 14135, 58330, "Vendor-ß");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 2; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(2);
      expect(ports[0].portName).assertEqual('tty-55');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-55');
      expect(info.vendorId).assertEqual(14135);
      expect(info.productId).assertEqual(58330);
      expect(info.manufacturer).assertEqual("Vendor-ß");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortInfoTest033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTINFO_3300
     * @tc.desc getSerialPortList selects the first of 3 ports and preserves optional portInfo fields vector 56
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortInfoTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-56', undefined, 58199, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 3; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(3);
      expect(ports[0].portName).assertEqual('tty-56');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-56');
      expect(info.vendorId).assertEqual(undefined);
      expect(info.productId).assertEqual(58199);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });
  });
}
