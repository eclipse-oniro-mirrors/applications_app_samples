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

export default function SerialEnumerationTest(): void {
  describe('SerialEnumerationTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialEnumeration', 'begin');
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
      logSuite('SerialEnumeration', 'end');
    });

    /**
     * @tc.name SerialEnumerationTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALENUMERATION_0100
     * @tc.desc getSerialPortList selects the first of 4 ports and preserves optional portInfo fields vector 57
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEnumerationTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-57', 14649, undefined, "ACME");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 4; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(4);
      expect(ports[0].portName).assertEqual('tty-57');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-57');
      expect(info.vendorId).assertEqual(14649);
      expect(info.productId).assertEqual(undefined);
      expect(info.manufacturer).assertEqual("ACME");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialEnumerationTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALENUMERATION_0200
     * @tc.desc getSerialPortList selects the first of 5 ports and preserves optional portInfo fields vector 58
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEnumerationTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-58', 14906, 57937, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 5; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(5);
      expect(ports[0].portName).assertEqual('tty-58');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-58');
      expect(info.vendorId).assertEqual(14906);
      expect(info.productId).assertEqual(57937);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialEnumerationTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALENUMERATION_0300
     * @tc.desc getSerialPortList selects the first of 6 ports and preserves optional portInfo fields vector 59
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEnumerationTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-59', 15163, 57806, "Serial Vendor");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 6; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(6);
      expect(ports[0].portName).assertEqual('tty-59');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-59');
      expect(info.vendorId).assertEqual(15163);
      expect(info.productId).assertEqual(57806);
      expect(info.manufacturer).assertEqual("Serial Vendor");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialEnumerationTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALENUMERATION_0400
     * @tc.desc getSerialPortList selects the first of 1 ports and preserves optional portInfo fields vector 60
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEnumerationTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-60', undefined, undefined, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 1; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('tty-60');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-60');
      expect(info.vendorId).assertEqual(undefined);
      expect(info.productId).assertEqual(undefined);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialEnumerationTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALENUMERATION_0500
     * @tc.desc getSerialPortList selects the first of 2 ports and preserves optional portInfo fields vector 61
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEnumerationTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-61', 15677, 57544, "串口厂商");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 2; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(2);
      expect(ports[0].portName).assertEqual('tty-61');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-61');
      expect(info.vendorId).assertEqual(15677);
      expect(info.productId).assertEqual(57544);
      expect(info.manufacturer).assertEqual("串口厂商");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialEnumerationTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALENUMERATION_0600
     * @tc.desc getSerialPortList selects the first of 3 ports and preserves optional portInfo fields vector 62
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEnumerationTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-62', 15934, 57413, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 3; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(3);
      expect(ports[0].portName).assertEqual('tty-62');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-62');
      expect(info.vendorId).assertEqual(15934);
      expect(info.productId).assertEqual(57413);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialEnumerationTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALENUMERATION_0700
     * @tc.desc getSerialPortList selects the first of 4 ports and preserves optional portInfo fields vector 63
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEnumerationTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-63', 16191, undefined, "Vendor-ß");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 4; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(4);
      expect(ports[0].portName).assertEqual('tty-63');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-63');
      expect(info.vendorId).assertEqual(16191);
      expect(info.productId).assertEqual(undefined);
      expect(info.manufacturer).assertEqual("Vendor-ß");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialEnumerationTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALENUMERATION_0800
     * @tc.desc getSerialPortList selects the first of 5 ports and preserves optional portInfo fields vector 64
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEnumerationTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-64', undefined, 57151, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 5; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(5);
      expect(ports[0].portName).assertEqual('tty-64');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-64');
      expect(info.vendorId).assertEqual(undefined);
      expect(info.productId).assertEqual(57151);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialEnumerationTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALENUMERATION_0900
     * @tc.desc getSerialPortList selects the first of 6 ports and preserves optional portInfo fields vector 65
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEnumerationTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-65', 16705, 57020, "ACME");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 6; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(6);
      expect(ports[0].portName).assertEqual('tty-65');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-65');
      expect(info.vendorId).assertEqual(16705);
      expect(info.productId).assertEqual(57020);
      expect(info.manufacturer).assertEqual("ACME");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialEnumerationTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALENUMERATION_1000
     * @tc.desc getSerialPortList selects the first of 1 ports and preserves optional portInfo fields vector 66
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEnumerationTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-66', 16962, undefined, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 1; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('tty-66');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-66');
      expect(info.vendorId).assertEqual(16962);
      expect(info.productId).assertEqual(undefined);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialEnumerationTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALENUMERATION_1100
     * @tc.desc getSerialPortList selects the first of 2 ports and preserves optional portInfo fields vector 67
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEnumerationTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-67', 17219, 56758, "Serial Vendor");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 2; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(2);
      expect(ports[0].portName).assertEqual('tty-67');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-67');
      expect(info.vendorId).assertEqual(17219);
      expect(info.productId).assertEqual(56758);
      expect(info.manufacturer).assertEqual("Serial Vendor");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialEnumerationTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALENUMERATION_1200
     * @tc.desc getSerialPortList selects the first of 3 ports and preserves optional portInfo fields vector 68
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEnumerationTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-68', undefined, 56627, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 3; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(3);
      expect(ports[0].portName).assertEqual('tty-68');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-68');
      expect(info.vendorId).assertEqual(undefined);
      expect(info.productId).assertEqual(56627);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialEnumerationTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALENUMERATION_1300
     * @tc.desc getSerialPortList selects the first of 4 ports and preserves optional portInfo fields vector 69
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEnumerationTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-69', 17733, undefined, "串口厂商");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 4; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(4);
      expect(ports[0].portName).assertEqual('tty-69');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-69');
      expect(info.vendorId).assertEqual(17733);
      expect(info.productId).assertEqual(undefined);
      expect(info.manufacturer).assertEqual("串口厂商");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialEnumerationTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALENUMERATION_1400
     * @tc.desc getSerialPortList selects the first of 5 ports and preserves optional portInfo fields vector 70
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEnumerationTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-70', 17990, 56365, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 5; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(5);
      expect(ports[0].portName).assertEqual('tty-70');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-70');
      expect(info.vendorId).assertEqual(17990);
      expect(info.productId).assertEqual(56365);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialEnumerationTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALENUMERATION_1500
     * @tc.desc getSerialPortList selects the first of 6 ports and preserves optional portInfo fields vector 71
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEnumerationTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-71', 18247, 56234, "Vendor-ß");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 6; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(6);
      expect(ports[0].portName).assertEqual('tty-71');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-71');
      expect(info.vendorId).assertEqual(18247);
      expect(info.productId).assertEqual(56234);
      expect(info.manufacturer).assertEqual("Vendor-ß");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialEnumerationTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALENUMERATION_1600
     * @tc.desc getSerialPortList selects the first of 1 ports and preserves optional portInfo fields vector 72
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEnumerationTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-72', undefined, undefined, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 1; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('tty-72');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-72');
      expect(info.vendorId).assertEqual(undefined);
      expect(info.productId).assertEqual(undefined);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialEnumerationTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALENUMERATION_1700
     * @tc.desc getSerialPortList selects the first of 2 ports and preserves optional portInfo fields vector 73
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEnumerationTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-73', 18761, 55972, "ACME");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 2; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(2);
      expect(ports[0].portName).assertEqual('tty-73');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-73');
      expect(info.vendorId).assertEqual(18761);
      expect(info.productId).assertEqual(55972);
      expect(info.manufacturer).assertEqual("ACME");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialEnumerationTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALENUMERATION_1800
     * @tc.desc getSerialPortList selects the first of 3 ports and preserves optional portInfo fields vector 74
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEnumerationTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-74', 19018, 55841, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 3; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(3);
      expect(ports[0].portName).assertEqual('tty-74');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-74');
      expect(info.vendorId).assertEqual(19018);
      expect(info.productId).assertEqual(55841);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialEnumerationTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALENUMERATION_1900
     * @tc.desc getSerialPortList rejects enumeration while a port is open without calling the provider
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEnumerationTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'SerialStateError');
      expect(fixture.provider.calls).assertEqual(1);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialEnumerationTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALENUMERATION_2000
     * @tc.desc getSerialPortList rejects enumeration while a selected port has a data callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEnumerationTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      await fixture.controller.onDataRead();
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'SerialStateError');
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().dataSubscribed).assertTrue();
      await fixture.controller.offDataRead();
      await fixture.controller.getSerialPortList();
      expect(fixture.provider.calls).assertEqual(2);
    });

    /**
     * @tc.name SerialEnumerationTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALENUMERATION_2100
     * @tc.desc getSerialPortList rejects enumeration while a selected port has a disconnect callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEnumerationTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      await fixture.controller.onDisconnect();
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'SerialStateError');
      expect(fixture.provider.calls).assertEqual(1);
      await fixture.controller.offDisconnect();
      await fixture.controller.getSerialPortList();
      expect(fixture.provider.calls).assertEqual(2);
    });
  });
}
