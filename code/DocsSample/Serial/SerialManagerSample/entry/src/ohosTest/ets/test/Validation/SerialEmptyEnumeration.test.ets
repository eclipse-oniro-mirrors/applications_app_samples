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

export default function SerialEmptyEnumerationTest(): void {
  describe('SerialEmptyEnumerationTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialEmptyEnumeration', 'begin');
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
      logSuite('SerialEmptyEnumeration', 'end');
    });

    /**
     * @tc.name SerialEmptyEnumerationTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEMPTYENUMERATION_0100
     * @tc.desc getSerialPortList clears an idle selection when enumeration becomes empty after metadata vector 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEmptyEnumerationTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [new FakeSerialPort('empty-transition-0', 0)];
      await fixture.select();
      expect(fixture.controller.snapshot().portName).assertEqual('empty-transition-0');
      fixture.provider.ports = [];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(0);
      expect(fixture.controller.snapshot().portName).assertEqual('');
      await expectFailure(async () => fixture.controller.portInfo(), 'SerialStateError');
      await expectFailure(async () => fixture.controller.open(), 'SerialStateError');
      fixture.provider.ports = [fixture.port];
      await fixture.open();
      expectSession(fixture);
      expect(fixture.provider.calls).assertEqual(3);
    });

    /**
     * @tc.name SerialEmptyEnumerationTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEMPTYENUMERATION_0200
     * @tc.desc getSerialPortList clears an idle selection when enumeration becomes empty after metadata vector 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEmptyEnumerationTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [new FakeSerialPort('empty-transition-1', 1)];
      await fixture.select();
      expect(fixture.controller.snapshot().portName).assertEqual('empty-transition-1');
      fixture.provider.ports = [];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(0);
      expect(fixture.controller.snapshot().portName).assertEqual('');
      await expectFailure(async () => fixture.controller.portInfo(), 'SerialStateError');
      await expectFailure(async () => fixture.controller.open(), 'SerialStateError');
      fixture.provider.ports = [fixture.port];
      await fixture.open();
      expectSession(fixture);
      expect(fixture.provider.calls).assertEqual(3);
    });

    /**
     * @tc.name SerialEmptyEnumerationTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEMPTYENUMERATION_0300
     * @tc.desc getSerialPortList clears an idle selection when enumeration becomes empty after metadata vector 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEmptyEnumerationTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [new FakeSerialPort('empty-transition-2', 2)];
      await fixture.select();
      expect(fixture.controller.snapshot().portName).assertEqual('empty-transition-2');
      fixture.provider.ports = [];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(0);
      expect(fixture.controller.snapshot().portName).assertEqual('');
      await expectFailure(async () => fixture.controller.portInfo(), 'SerialStateError');
      await expectFailure(async () => fixture.controller.open(), 'SerialStateError');
      fixture.provider.ports = [fixture.port];
      await fixture.open();
      expectSession(fixture);
      expect(fixture.provider.calls).assertEqual(3);
    });

    /**
     * @tc.name SerialEmptyEnumerationTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEMPTYENUMERATION_0400
     * @tc.desc getSerialPortList clears an idle selection when enumeration becomes empty after metadata vector 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEmptyEnumerationTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [new FakeSerialPort('empty-transition-3', 3)];
      await fixture.select();
      expect(fixture.controller.snapshot().portName).assertEqual('empty-transition-3');
      fixture.provider.ports = [];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(0);
      expect(fixture.controller.snapshot().portName).assertEqual('');
      await expectFailure(async () => fixture.controller.portInfo(), 'SerialStateError');
      await expectFailure(async () => fixture.controller.open(), 'SerialStateError');
      fixture.provider.ports = [fixture.port];
      await fixture.open();
      expectSession(fixture);
      expect(fixture.provider.calls).assertEqual(3);
    });

    /**
     * @tc.name SerialEmptyEnumerationTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEMPTYENUMERATION_0500
     * @tc.desc getSerialPortList clears an idle selection when enumeration becomes empty after metadata vector 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEmptyEnumerationTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [new FakeSerialPort('empty-transition-4', 4)];
      await fixture.select();
      expect(fixture.controller.snapshot().portName).assertEqual('empty-transition-4');
      fixture.provider.ports = [];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(0);
      expect(fixture.controller.snapshot().portName).assertEqual('');
      await expectFailure(async () => fixture.controller.portInfo(), 'SerialStateError');
      await expectFailure(async () => fixture.controller.open(), 'SerialStateError');
      fixture.provider.ports = [fixture.port];
      await fixture.open();
      expectSession(fixture);
      expect(fixture.provider.calls).assertEqual(3);
    });

    /**
     * @tc.name SerialEmptyEnumerationTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEMPTYENUMERATION_0600
     * @tc.desc getSerialPortList clears an idle selection when enumeration becomes empty after metadata vector 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEmptyEnumerationTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [new FakeSerialPort('empty-transition-5', 5)];
      await fixture.select();
      expect(fixture.controller.snapshot().portName).assertEqual('empty-transition-5');
      fixture.provider.ports = [];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(0);
      expect(fixture.controller.snapshot().portName).assertEqual('');
      await expectFailure(async () => fixture.controller.portInfo(), 'SerialStateError');
      await expectFailure(async () => fixture.controller.open(), 'SerialStateError');
      fixture.provider.ports = [fixture.port];
      await fixture.open();
      expectSession(fixture);
      expect(fixture.provider.calls).assertEqual(3);
    });

    /**
     * @tc.name SerialEmptyEnumerationTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEMPTYENUMERATION_0700
     * @tc.desc getSerialPortList clears an idle selection when enumeration becomes empty after metadata vector 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEmptyEnumerationTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [new FakeSerialPort('empty-transition-6', 6)];
      await fixture.select();
      expect(fixture.controller.snapshot().portName).assertEqual('empty-transition-6');
      fixture.provider.ports = [];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(0);
      expect(fixture.controller.snapshot().portName).assertEqual('');
      await expectFailure(async () => fixture.controller.portInfo(), 'SerialStateError');
      await expectFailure(async () => fixture.controller.open(), 'SerialStateError');
      fixture.provider.ports = [fixture.port];
      await fixture.open();
      expectSession(fixture);
      expect(fixture.provider.calls).assertEqual(3);
    });

    /**
     * @tc.name SerialEmptyEnumerationTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEMPTYENUMERATION_0800
     * @tc.desc getSerialPortList clears an idle selection when enumeration becomes empty after metadata vector 7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEmptyEnumerationTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [new FakeSerialPort('empty-transition-7', 7)];
      await fixture.select();
      expect(fixture.controller.snapshot().portName).assertEqual('empty-transition-7');
      fixture.provider.ports = [];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(0);
      expect(fixture.controller.snapshot().portName).assertEqual('');
      await expectFailure(async () => fixture.controller.portInfo(), 'SerialStateError');
      await expectFailure(async () => fixture.controller.open(), 'SerialStateError');
      fixture.provider.ports = [fixture.port];
      await fixture.open();
      expectSession(fixture);
      expect(fixture.provider.calls).assertEqual(3);
    });

    /**
     * @tc.name SerialEmptyEnumerationTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEMPTYENUMERATION_0900
     * @tc.desc getSerialPortList clears an idle selection when enumeration becomes empty after metadata vector 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEmptyEnumerationTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [new FakeSerialPort('empty-transition-8', 8)];
      await fixture.select();
      expect(fixture.controller.snapshot().portName).assertEqual('empty-transition-8');
      fixture.provider.ports = [];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(0);
      expect(fixture.controller.snapshot().portName).assertEqual('');
      await expectFailure(async () => fixture.controller.portInfo(), 'SerialStateError');
      await expectFailure(async () => fixture.controller.open(), 'SerialStateError');
      fixture.provider.ports = [fixture.port];
      await fixture.open();
      expectSession(fixture);
      expect(fixture.provider.calls).assertEqual(3);
    });

    /**
     * @tc.name SerialEmptyEnumerationTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEMPTYENUMERATION_1000
     * @tc.desc getSerialPortList clears an idle selection when enumeration becomes empty after metadata vector 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEmptyEnumerationTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [new FakeSerialPort('empty-transition-9', 9)];
      await fixture.select();
      expect(fixture.controller.snapshot().portName).assertEqual('empty-transition-9');
      fixture.provider.ports = [];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(0);
      expect(fixture.controller.snapshot().portName).assertEqual('');
      await expectFailure(async () => fixture.controller.portInfo(), 'SerialStateError');
      await expectFailure(async () => fixture.controller.open(), 'SerialStateError');
      fixture.provider.ports = [fixture.port];
      await fixture.open();
      expectSession(fixture);
      expect(fixture.provider.calls).assertEqual(3);
    });

    /**
     * @tc.name SerialEmptyEnumerationTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEMPTYENUMERATION_1100
     * @tc.desc getSerialPortList clears an idle selection when enumeration becomes empty after metadata vector 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEmptyEnumerationTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [new FakeSerialPort('empty-transition-10', 10)];
      await fixture.select();
      expect(fixture.controller.snapshot().portName).assertEqual('empty-transition-10');
      fixture.provider.ports = [];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(0);
      expect(fixture.controller.snapshot().portName).assertEqual('');
      await expectFailure(async () => fixture.controller.portInfo(), 'SerialStateError');
      await expectFailure(async () => fixture.controller.open(), 'SerialStateError');
      fixture.provider.ports = [fixture.port];
      await fixture.open();
      expectSession(fixture);
      expect(fixture.provider.calls).assertEqual(3);
    });

    /**
     * @tc.name SerialEmptyEnumerationTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEMPTYENUMERATION_1200
     * @tc.desc getSerialPortList clears an idle selection when enumeration becomes empty after metadata vector 11
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEmptyEnumerationTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [new FakeSerialPort('empty-transition-11', 11)];
      await fixture.select();
      expect(fixture.controller.snapshot().portName).assertEqual('empty-transition-11');
      fixture.provider.ports = [];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(0);
      expect(fixture.controller.snapshot().portName).assertEqual('');
      await expectFailure(async () => fixture.controller.portInfo(), 'SerialStateError');
      await expectFailure(async () => fixture.controller.open(), 'SerialStateError');
      fixture.provider.ports = [fixture.port];
      await fixture.open();
      expectSession(fixture);
      expect(fixture.provider.calls).assertEqual(3);
    });

    /**
     * @tc.name SerialEmptyEnumerationTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEMPTYENUMERATION_1300
     * @tc.desc getSerialPortList clears an idle selection when enumeration becomes empty after metadata vector 12
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEmptyEnumerationTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [new FakeSerialPort('empty-transition-12', 12)];
      await fixture.select();
      expect(fixture.controller.snapshot().portName).assertEqual('empty-transition-12');
      fixture.provider.ports = [];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(0);
      expect(fixture.controller.snapshot().portName).assertEqual('');
      await expectFailure(async () => fixture.controller.portInfo(), 'SerialStateError');
      await expectFailure(async () => fixture.controller.open(), 'SerialStateError');
      fixture.provider.ports = [fixture.port];
      await fixture.open();
      expectSession(fixture);
      expect(fixture.provider.calls).assertEqual(3);
    });

    /**
     * @tc.name SerialEmptyEnumerationTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEMPTYENUMERATION_1400
     * @tc.desc getSerialPortList clears an idle selection when enumeration becomes empty after metadata vector 13
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEmptyEnumerationTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [new FakeSerialPort('empty-transition-13', 13)];
      await fixture.select();
      expect(fixture.controller.snapshot().portName).assertEqual('empty-transition-13');
      fixture.provider.ports = [];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(0);
      expect(fixture.controller.snapshot().portName).assertEqual('');
      await expectFailure(async () => fixture.controller.portInfo(), 'SerialStateError');
      await expectFailure(async () => fixture.controller.open(), 'SerialStateError');
      fixture.provider.ports = [fixture.port];
      await fixture.open();
      expectSession(fixture);
      expect(fixture.provider.calls).assertEqual(3);
    });

    /**
     * @tc.name SerialEmptyEnumerationTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEMPTYENUMERATION_1500
     * @tc.desc getSerialPortList clears an idle selection when enumeration becomes empty after metadata vector 14
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEmptyEnumerationTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [new FakeSerialPort('empty-transition-14', 14)];
      await fixture.select();
      expect(fixture.controller.snapshot().portName).assertEqual('empty-transition-14');
      fixture.provider.ports = [];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(0);
      expect(fixture.controller.snapshot().portName).assertEqual('');
      await expectFailure(async () => fixture.controller.portInfo(), 'SerialStateError');
      await expectFailure(async () => fixture.controller.open(), 'SerialStateError');
      fixture.provider.ports = [fixture.port];
      await fixture.open();
      expectSession(fixture);
      expect(fixture.provider.calls).assertEqual(3);
    });

    /**
     * @tc.name SerialEmptyEnumerationTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEMPTYENUMERATION_1600
     * @tc.desc getSerialPortList clears an idle selection when enumeration becomes empty after metadata vector 15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEmptyEnumerationTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [new FakeSerialPort('empty-transition-15', 15)];
      await fixture.select();
      expect(fixture.controller.snapshot().portName).assertEqual('empty-transition-15');
      fixture.provider.ports = [];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(0);
      expect(fixture.controller.snapshot().portName).assertEqual('');
      await expectFailure(async () => fixture.controller.portInfo(), 'SerialStateError');
      await expectFailure(async () => fixture.controller.open(), 'SerialStateError');
      fixture.provider.ports = [fixture.port];
      await fixture.open();
      expectSession(fixture);
      expect(fixture.provider.calls).assertEqual(3);
    });

    /**
     * @tc.name SerialEmptyEnumerationTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEMPTYENUMERATION_1700
     * @tc.desc getSerialPortList clears an idle selection when enumeration becomes empty after metadata vector 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEmptyEnumerationTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [new FakeSerialPort('empty-transition-16', 16)];
      await fixture.select();
      expect(fixture.controller.snapshot().portName).assertEqual('empty-transition-16');
      fixture.provider.ports = [];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(0);
      expect(fixture.controller.snapshot().portName).assertEqual('');
      await expectFailure(async () => fixture.controller.portInfo(), 'SerialStateError');
      await expectFailure(async () => fixture.controller.open(), 'SerialStateError');
      fixture.provider.ports = [fixture.port];
      await fixture.open();
      expectSession(fixture);
      expect(fixture.provider.calls).assertEqual(3);
    });

    /**
     * @tc.name SerialEmptyEnumerationTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEMPTYENUMERATION_1800
     * @tc.desc getSerialPortList clears an idle selection when enumeration becomes empty after metadata vector 17
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEmptyEnumerationTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [new FakeSerialPort('empty-transition-17', 17)];
      await fixture.select();
      expect(fixture.controller.snapshot().portName).assertEqual('empty-transition-17');
      fixture.provider.ports = [];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(0);
      expect(fixture.controller.snapshot().portName).assertEqual('');
      await expectFailure(async () => fixture.controller.portInfo(), 'SerialStateError');
      await expectFailure(async () => fixture.controller.open(), 'SerialStateError');
      fixture.provider.ports = [fixture.port];
      await fixture.open();
      expectSession(fixture);
      expect(fixture.provider.calls).assertEqual(3);
    });

    /**
     * @tc.name SerialEmptyEnumerationTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEMPTYENUMERATION_1900
     * @tc.desc getSerialPortList clears an idle selection when enumeration becomes empty after metadata vector 18
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEmptyEnumerationTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [new FakeSerialPort('empty-transition-18', 18)];
      await fixture.select();
      expect(fixture.controller.snapshot().portName).assertEqual('empty-transition-18');
      fixture.provider.ports = [];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(0);
      expect(fixture.controller.snapshot().portName).assertEqual('');
      await expectFailure(async () => fixture.controller.portInfo(), 'SerialStateError');
      await expectFailure(async () => fixture.controller.open(), 'SerialStateError');
      fixture.provider.ports = [fixture.port];
      await fixture.open();
      expectSession(fixture);
      expect(fixture.provider.calls).assertEqual(3);
    });

    /**
     * @tc.name SerialEmptyEnumerationTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALEMPTYENUMERATION_2000
     * @tc.desc getSerialPortList clears an idle selection when enumeration becomes empty after metadata vector 19
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialEmptyEnumerationTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      fixture.provider.ports = [new FakeSerialPort('empty-transition-19', 19)];
      await fixture.select();
      expect(fixture.controller.snapshot().portName).assertEqual('empty-transition-19');
      fixture.provider.ports = [];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(0);
      expect(fixture.controller.snapshot().portName).assertEqual('');
      await expectFailure(async () => fixture.controller.portInfo(), 'SerialStateError');
      await expectFailure(async () => fixture.controller.open(), 'SerialStateError');
      fixture.provider.ports = [fixture.port];
      await fixture.open();
      expectSession(fixture);
      expect(fixture.provider.calls).assertEqual(3);
    });
  });
}
