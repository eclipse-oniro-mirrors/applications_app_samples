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

export default function SerialPortMetadataTest(): void {
  describe('SerialPortMetadataTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialPortMetadata', 'begin');
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
      logSuite('SerialPortMetadata', 'end');
    });

    /**
     * @tc.name SerialPortMetadataTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTMETADATA_0100
     * @tc.desc getSerialPortList selects the first of 1 ports and preserves optional portInfo fields vector 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortMetadataTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-0', undefined, undefined, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 1; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('tty-0');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-0');
      expect(info.vendorId).assertEqual(undefined);
      expect(info.productId).assertEqual(undefined);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortMetadataTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTMETADATA_0200
     * @tc.desc getSerialPortList selects the first of 2 ports and preserves optional portInfo fields vector 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortMetadataTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-1', 257, 65404, "ACME");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 2; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(2);
      expect(ports[0].portName).assertEqual('tty-1');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-1');
      expect(info.vendorId).assertEqual(257);
      expect(info.productId).assertEqual(65404);
      expect(info.manufacturer).assertEqual("ACME");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortMetadataTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTMETADATA_0300
     * @tc.desc getSerialPortList selects the first of 3 ports and preserves optional portInfo fields vector 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortMetadataTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-2', 514, 65273, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 3; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(3);
      expect(ports[0].portName).assertEqual('tty-2');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-2');
      expect(info.vendorId).assertEqual(514);
      expect(info.productId).assertEqual(65273);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortMetadataTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTMETADATA_0400
     * @tc.desc getSerialPortList selects the first of 4 ports and preserves optional portInfo fields vector 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortMetadataTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-3', 771, undefined, "Serial Vendor");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 4; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(4);
      expect(ports[0].portName).assertEqual('tty-3');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-3');
      expect(info.vendorId).assertEqual(771);
      expect(info.productId).assertEqual(undefined);
      expect(info.manufacturer).assertEqual("Serial Vendor");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortMetadataTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTMETADATA_0500
     * @tc.desc getSerialPortList selects the first of 5 ports and preserves optional portInfo fields vector 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortMetadataTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-4', undefined, 65011, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 5; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(5);
      expect(ports[0].portName).assertEqual('tty-4');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-4');
      expect(info.vendorId).assertEqual(undefined);
      expect(info.productId).assertEqual(65011);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortMetadataTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTMETADATA_0600
     * @tc.desc getSerialPortList selects the first of 6 ports and preserves optional portInfo fields vector 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortMetadataTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-5', 1285, 64880, "串口厂商");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 6; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(6);
      expect(ports[0].portName).assertEqual('tty-5');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-5');
      expect(info.vendorId).assertEqual(1285);
      expect(info.productId).assertEqual(64880);
      expect(info.manufacturer).assertEqual("串口厂商");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortMetadataTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTMETADATA_0700
     * @tc.desc getSerialPortList selects the first of 1 ports and preserves optional portInfo fields vector 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortMetadataTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-6', 1542, undefined, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 1; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('tty-6');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-6');
      expect(info.vendorId).assertEqual(1542);
      expect(info.productId).assertEqual(undefined);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortMetadataTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTMETADATA_0800
     * @tc.desc getSerialPortList selects the first of 2 ports and preserves optional portInfo fields vector 7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortMetadataTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-7', 1799, 64618, "Vendor-ß");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 2; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(2);
      expect(ports[0].portName).assertEqual('tty-7');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-7');
      expect(info.vendorId).assertEqual(1799);
      expect(info.productId).assertEqual(64618);
      expect(info.manufacturer).assertEqual("Vendor-ß");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortMetadataTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTMETADATA_0900
     * @tc.desc getSerialPortList selects the first of 3 ports and preserves optional portInfo fields vector 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortMetadataTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-8', undefined, 64487, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 3; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(3);
      expect(ports[0].portName).assertEqual('tty-8');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-8');
      expect(info.vendorId).assertEqual(undefined);
      expect(info.productId).assertEqual(64487);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortMetadataTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTMETADATA_1000
     * @tc.desc getSerialPortList selects the first of 4 ports and preserves optional portInfo fields vector 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortMetadataTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-9', 2313, undefined, "ACME");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 4; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(4);
      expect(ports[0].portName).assertEqual('tty-9');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-9');
      expect(info.vendorId).assertEqual(2313);
      expect(info.productId).assertEqual(undefined);
      expect(info.manufacturer).assertEqual("ACME");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortMetadataTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTMETADATA_1100
     * @tc.desc getSerialPortList selects the first of 5 ports and preserves optional portInfo fields vector 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortMetadataTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-10', 2570, 64225, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 5; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(5);
      expect(ports[0].portName).assertEqual('tty-10');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-10');
      expect(info.vendorId).assertEqual(2570);
      expect(info.productId).assertEqual(64225);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortMetadataTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTMETADATA_1200
     * @tc.desc getSerialPortList selects the first of 6 ports and preserves optional portInfo fields vector 11
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortMetadataTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-11', 2827, 64094, "Serial Vendor");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 6; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(6);
      expect(ports[0].portName).assertEqual('tty-11');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-11');
      expect(info.vendorId).assertEqual(2827);
      expect(info.productId).assertEqual(64094);
      expect(info.manufacturer).assertEqual("Serial Vendor");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortMetadataTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTMETADATA_1300
     * @tc.desc getSerialPortList selects the first of 1 ports and preserves optional portInfo fields vector 12
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortMetadataTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-12', undefined, undefined, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 1; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('tty-12');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-12');
      expect(info.vendorId).assertEqual(undefined);
      expect(info.productId).assertEqual(undefined);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortMetadataTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTMETADATA_1400
     * @tc.desc getSerialPortList selects the first of 2 ports and preserves optional portInfo fields vector 13
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortMetadataTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-13', 3341, 63832, "串口厂商");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 2; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(2);
      expect(ports[0].portName).assertEqual('tty-13');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-13');
      expect(info.vendorId).assertEqual(3341);
      expect(info.productId).assertEqual(63832);
      expect(info.manufacturer).assertEqual("串口厂商");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortMetadataTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTMETADATA_1500
     * @tc.desc getSerialPortList selects the first of 3 ports and preserves optional portInfo fields vector 14
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortMetadataTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-14', 3598, 63701, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 3; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(3);
      expect(ports[0].portName).assertEqual('tty-14');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-14');
      expect(info.vendorId).assertEqual(3598);
      expect(info.productId).assertEqual(63701);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortMetadataTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTMETADATA_1600
     * @tc.desc getSerialPortList selects the first of 4 ports and preserves optional portInfo fields vector 15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortMetadataTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-15', 3855, undefined, "Vendor-ß");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 4; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(4);
      expect(ports[0].portName).assertEqual('tty-15');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-15');
      expect(info.vendorId).assertEqual(3855);
      expect(info.productId).assertEqual(undefined);
      expect(info.manufacturer).assertEqual("Vendor-ß");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortMetadataTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTMETADATA_1700
     * @tc.desc getSerialPortList selects the first of 5 ports and preserves optional portInfo fields vector 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortMetadataTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-16', undefined, 63439, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 5; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(5);
      expect(ports[0].portName).assertEqual('tty-16');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-16');
      expect(info.vendorId).assertEqual(undefined);
      expect(info.productId).assertEqual(63439);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortMetadataTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTMETADATA_1800
     * @tc.desc getSerialPortList selects the first of 6 ports and preserves optional portInfo fields vector 17
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortMetadataTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-17', 4369, 63308, "ACME");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 6; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(6);
      expect(ports[0].portName).assertEqual('tty-17');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-17');
      expect(info.vendorId).assertEqual(4369);
      expect(info.productId).assertEqual(63308);
      expect(info.manufacturer).assertEqual("ACME");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortMetadataTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTMETADATA_1900
     * @tc.desc getSerialPortList selects the first of 1 ports and preserves optional portInfo fields vector 18
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortMetadataTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-18', 4626, undefined, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 1; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('tty-18');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-18');
      expect(info.vendorId).assertEqual(4626);
      expect(info.productId).assertEqual(undefined);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortMetadataTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTMETADATA_2000
     * @tc.desc getSerialPortList selects the first of 2 ports and preserves optional portInfo fields vector 19
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortMetadataTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-19', 4883, 63046, "Serial Vendor");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 2; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(2);
      expect(ports[0].portName).assertEqual('tty-19');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-19');
      expect(info.vendorId).assertEqual(4883);
      expect(info.productId).assertEqual(63046);
      expect(info.manufacturer).assertEqual("Serial Vendor");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortMetadataTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTMETADATA_2100
     * @tc.desc getSerialPortList selects the first of 3 ports and preserves optional portInfo fields vector 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortMetadataTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-20', undefined, 62915, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 3; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(3);
      expect(ports[0].portName).assertEqual('tty-20');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-20');
      expect(info.vendorId).assertEqual(undefined);
      expect(info.productId).assertEqual(62915);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortMetadataTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTMETADATA_2200
     * @tc.desc getSerialPortList selects the first of 4 ports and preserves optional portInfo fields vector 21
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortMetadataTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-21', 5397, undefined, "串口厂商");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 4; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(4);
      expect(ports[0].portName).assertEqual('tty-21');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-21');
      expect(info.vendorId).assertEqual(5397);
      expect(info.productId).assertEqual(undefined);
      expect(info.manufacturer).assertEqual("串口厂商");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortMetadataTest023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTMETADATA_2300
     * @tc.desc getSerialPortList selects the first of 5 ports and preserves optional portInfo fields vector 22
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortMetadataTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-22', 5654, 62653, undefined);
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 5; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(5);
      expect(ports[0].portName).assertEqual('tty-22');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-22');
      expect(info.vendorId).assertEqual(5654);
      expect(info.productId).assertEqual(62653);
      expect(info.manufacturer).assertEqual(undefined);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialPortMetadataTest024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTMETADATA_2400
     * @tc.desc getSerialPortList selects the first of 6 ports and preserves optional portInfo fields vector 23
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortMetadataTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [];
      const first: FakeSerialPort = new FakeSerialPort('tty-23', 5911, 62522, "Vendor-ß");
      fixture.provider.ports.push(first);
      for (let index: number = 1; index < 6; index++) {
        fixture.provider.ports.push(new FakeSerialPort('extra-' + index));
      }
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(6);
      expect(ports[0].portName).assertEqual('tty-23');
      const info: serial.SerialPortInfo = await fixture.controller.portInfo();
      expect(info.portName).assertEqual('tty-23');
      expect(info.vendorId).assertEqual(5911);
      expect(info.productId).assertEqual(62522);
      expect(info.manufacturer).assertEqual("Vendor-ß");
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().opened).assertFalse();
      expect(fixture.port.calls.length).assertEqual(0);
    });
  });
}
