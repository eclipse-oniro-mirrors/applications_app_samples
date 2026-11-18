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

export default function SerialInterruptedTransfersTest(): void {
  describe('SerialInterruptedTransfersTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialInterruptedTransfers', 'begin');
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
      logSuite('SerialInterruptedTransfers', 'end');
    });

    /**
     * @tc.name SerialInterruptedTransfersTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALINTERRUPTEDTRANSFERS_0100
     * @tc.desc getSerialPortList recovers to a new port after onDisconnect with 32 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialInterruptedTransfersTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(32, 0));
      fixture.port.emitDisconnect();
      const replacement: FakeSerialPort = new FakeSerialPort('reconnected-9');
      fixture.provider.ports = [replacement];
      await fixture.controller.getSerialPortList();
      await fixture.controller.open();
      stale();
      expect(fixture.controller.snapshot().portName).assertEqual('reconnected-9');
      expect(fixture.controller.snapshot().opened).assertTrue();
      expect(await fixture.controller.write(payload(32, 0))).assertEqual(32);
      expect(replacement.writes.length).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(32);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
    });

    /**
     * @tc.name SerialInterruptedTransfersTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALINTERRUPTEDTRANSFERS_0200
     * @tc.desc getSerialPortList recovers to a new port after onDisconnect with 63 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialInterruptedTransfersTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(63, 0));
      fixture.port.emitDisconnect();
      const replacement: FakeSerialPort = new FakeSerialPort('reconnected-10');
      fixture.provider.ports = [replacement];
      await fixture.controller.getSerialPortList();
      await fixture.controller.open();
      stale();
      expect(fixture.controller.snapshot().portName).assertEqual('reconnected-10');
      expect(fixture.controller.snapshot().opened).assertTrue();
      expect(await fixture.controller.write(payload(63, 0))).assertEqual(63);
      expect(replacement.writes.length).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(63);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(63);
    });

    /**
     * @tc.name SerialInterruptedTransfersTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALINTERRUPTEDTRANSFERS_0300
     * @tc.desc getSerialPortList recovers to a new port after onDisconnect with 64 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialInterruptedTransfersTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(64, 0));
      fixture.port.emitDisconnect();
      const replacement: FakeSerialPort = new FakeSerialPort('reconnected-11');
      fixture.provider.ports = [replacement];
      await fixture.controller.getSerialPortList();
      await fixture.controller.open();
      stale();
      expect(fixture.controller.snapshot().portName).assertEqual('reconnected-11');
      expect(fixture.controller.snapshot().opened).assertTrue();
      expect(await fixture.controller.write(payload(64, 0))).assertEqual(64);
      expect(replacement.writes.length).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(64);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
    });

    /**
     * @tc.name SerialInterruptedTransfersTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALINTERRUPTEDTRANSFERS_0400
     * @tc.desc getSerialPortList recovers to a new port after onDisconnect with 127 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialInterruptedTransfersTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(127, 0));
      fixture.port.emitDisconnect();
      const replacement: FakeSerialPort = new FakeSerialPort('reconnected-12');
      fixture.provider.ports = [replacement];
      await fixture.controller.getSerialPortList();
      await fixture.controller.open();
      stale();
      expect(fixture.controller.snapshot().portName).assertEqual('reconnected-12');
      expect(fixture.controller.snapshot().opened).assertTrue();
      expect(await fixture.controller.write(payload(127, 0))).assertEqual(127);
      expect(replacement.writes.length).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(127);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(127);
    });

    /**
     * @tc.name SerialInterruptedTransfersTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALINTERRUPTEDTRANSFERS_0500
     * @tc.desc getSerialPortList recovers to a new port after onDisconnect with 128 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialInterruptedTransfersTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(128, 0));
      fixture.port.emitDisconnect();
      const replacement: FakeSerialPort = new FakeSerialPort('reconnected-13');
      fixture.provider.ports = [replacement];
      await fixture.controller.getSerialPortList();
      await fixture.controller.open();
      stale();
      expect(fixture.controller.snapshot().portName).assertEqual('reconnected-13');
      expect(fixture.controller.snapshot().opened).assertTrue();
      expect(await fixture.controller.write(payload(128, 0))).assertEqual(128);
      expect(replacement.writes.length).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(128);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(128);
    });

    /**
     * @tc.name SerialInterruptedTransfersTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALINTERRUPTEDTRANSFERS_0600
     * @tc.desc getSerialPortList recovers to a new port after onDisconnect with 255 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialInterruptedTransfersTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(255, 0));
      fixture.port.emitDisconnect();
      const replacement: FakeSerialPort = new FakeSerialPort('reconnected-14');
      fixture.provider.ports = [replacement];
      await fixture.controller.getSerialPortList();
      await fixture.controller.open();
      stale();
      expect(fixture.controller.snapshot().portName).assertEqual('reconnected-14');
      expect(fixture.controller.snapshot().opened).assertTrue();
      expect(await fixture.controller.write(payload(255, 0))).assertEqual(255);
      expect(replacement.writes.length).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(255);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(255);
    });

    /**
     * @tc.name SerialInterruptedTransfersTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALINTERRUPTEDTRANSFERS_0700
     * @tc.desc getSerialPortList recovers to a new port after onDisconnect with 256 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialInterruptedTransfersTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(256, 0));
      fixture.port.emitDisconnect();
      const replacement: FakeSerialPort = new FakeSerialPort('reconnected-15');
      fixture.provider.ports = [replacement];
      await fixture.controller.getSerialPortList();
      await fixture.controller.open();
      stale();
      expect(fixture.controller.snapshot().portName).assertEqual('reconnected-15');
      expect(fixture.controller.snapshot().opened).assertTrue();
      expect(await fixture.controller.write(payload(256, 0))).assertEqual(256);
      expect(replacement.writes.length).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(256);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(256);
    });

    /**
     * @tc.name SerialInterruptedTransfersTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALINTERRUPTEDTRANSFERS_0800
     * @tc.desc getSerialPortList recovers to a new port after onDisconnect with 511 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialInterruptedTransfersTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(511, 0));
      fixture.port.emitDisconnect();
      const replacement: FakeSerialPort = new FakeSerialPort('reconnected-16');
      fixture.provider.ports = [replacement];
      await fixture.controller.getSerialPortList();
      await fixture.controller.open();
      stale();
      expect(fixture.controller.snapshot().portName).assertEqual('reconnected-16');
      expect(fixture.controller.snapshot().opened).assertTrue();
      expect(await fixture.controller.write(payload(511, 0))).assertEqual(511);
      expect(replacement.writes.length).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(511);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(511);
    });

    /**
     * @tc.name SerialInterruptedTransfersTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALINTERRUPTEDTRANSFERS_0900
     * @tc.desc getSerialPortList recovers to a new port after onDisconnect with 512 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialInterruptedTransfersTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(512, 0));
      fixture.port.emitDisconnect();
      const replacement: FakeSerialPort = new FakeSerialPort('reconnected-17');
      fixture.provider.ports = [replacement];
      await fixture.controller.getSerialPortList();
      await fixture.controller.open();
      stale();
      expect(fixture.controller.snapshot().portName).assertEqual('reconnected-17');
      expect(fixture.controller.snapshot().opened).assertTrue();
      expect(await fixture.controller.write(payload(512, 0))).assertEqual(512);
      expect(replacement.writes.length).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(512);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(512);
    });

    /**
     * @tc.name SerialInterruptedTransfersTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALINTERRUPTEDTRANSFERS_1000
     * @tc.desc getSerialPortList recovers to a new port after onDisconnect with 1023 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialInterruptedTransfersTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(1023, 0));
      fixture.port.emitDisconnect();
      const replacement: FakeSerialPort = new FakeSerialPort('reconnected-18');
      fixture.provider.ports = [replacement];
      await fixture.controller.getSerialPortList();
      await fixture.controller.open();
      stale();
      expect(fixture.controller.snapshot().portName).assertEqual('reconnected-18');
      expect(fixture.controller.snapshot().opened).assertTrue();
      expect(await fixture.controller.write(payload(1023, 0))).assertEqual(1023);
      expect(replacement.writes.length).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1023);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1023);
    });

    /**
     * @tc.name SerialInterruptedTransfersTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALINTERRUPTEDTRANSFERS_1100
     * @tc.desc getSerialPortList recovers to a new port after onDisconnect with 1024 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialInterruptedTransfersTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(1024, 0));
      fixture.port.emitDisconnect();
      const replacement: FakeSerialPort = new FakeSerialPort('reconnected-19');
      fixture.provider.ports = [replacement];
      await fixture.controller.getSerialPortList();
      await fixture.controller.open();
      stale();
      expect(fixture.controller.snapshot().portName).assertEqual('reconnected-19');
      expect(fixture.controller.snapshot().opened).assertTrue();
      expect(await fixture.controller.write(payload(1024, 0))).assertEqual(1024);
      expect(replacement.writes.length).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1024);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1024);
    });

    /**
     * @tc.name SerialInterruptedTransfersTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALINTERRUPTEDTRANSFERS_1200
     * @tc.desc getSerialPortList recovers to a new port after onDisconnect with 2048 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialInterruptedTransfersTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(2048, 0));
      fixture.port.emitDisconnect();
      const replacement: FakeSerialPort = new FakeSerialPort('reconnected-20');
      fixture.provider.ports = [replacement];
      await fixture.controller.getSerialPortList();
      await fixture.controller.open();
      stale();
      expect(fixture.controller.snapshot().portName).assertEqual('reconnected-20');
      expect(fixture.controller.snapshot().opened).assertTrue();
      expect(await fixture.controller.write(payload(2048, 0))).assertEqual(2048);
      expect(replacement.writes.length).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2048);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2048);
    });

    /**
     * @tc.name SerialInterruptedTransfersTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALINTERRUPTEDTRANSFERS_1300
     * @tc.desc getSerialPortList recovers to a new port after onDisconnect with 4095 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialInterruptedTransfersTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(4095, 0));
      fixture.port.emitDisconnect();
      const replacement: FakeSerialPort = new FakeSerialPort('reconnected-21');
      fixture.provider.ports = [replacement];
      await fixture.controller.getSerialPortList();
      await fixture.controller.open();
      stale();
      expect(fixture.controller.snapshot().portName).assertEqual('reconnected-21');
      expect(fixture.controller.snapshot().opened).assertTrue();
      expect(await fixture.controller.write(payload(4095, 0))).assertEqual(4095);
      expect(replacement.writes.length).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4095);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4095);
    });

    /**
     * @tc.name SerialInterruptedTransfersTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALINTERRUPTEDTRANSFERS_1400
     * @tc.desc getSerialPortList recovers to a new port after onDisconnect with 4096 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialInterruptedTransfersTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(4096, 0));
      fixture.port.emitDisconnect();
      const replacement: FakeSerialPort = new FakeSerialPort('reconnected-22');
      fixture.provider.ports = [replacement];
      await fixture.controller.getSerialPortList();
      await fixture.controller.open();
      stale();
      expect(fixture.controller.snapshot().portName).assertEqual('reconnected-22');
      expect(fixture.controller.snapshot().opened).assertTrue();
      expect(await fixture.controller.write(payload(4096, 0))).assertEqual(4096);
      expect(replacement.writes.length).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4096);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4096);
    });

    /**
     * @tc.name SerialInterruptedTransfersTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALINTERRUPTEDTRANSFERS_1500
     * @tc.desc getSerialPortList recovers to a new port after onDisconnect with 1 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialInterruptedTransfersTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(1, 1));
      fixture.port.emitDisconnect();
      const replacement: FakeSerialPort = new FakeSerialPort('reconnected-23');
      fixture.provider.ports = [replacement];
      await fixture.controller.getSerialPortList();
      await fixture.controller.open();
      stale();
      expect(fixture.controller.snapshot().portName).assertEqual('reconnected-23');
      expect(fixture.controller.snapshot().opened).assertTrue();
      expect(await fixture.controller.write(payload(1, 1))).assertEqual(1);
      expect(replacement.writes.length).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
    });

    /**
     * @tc.name SerialInterruptedTransfersTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALINTERRUPTEDTRANSFERS_1600
     * @tc.desc getSerialPortList recovers to a new port after onDisconnect with 2 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialInterruptedTransfersTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(2, 1));
      fixture.port.emitDisconnect();
      const replacement: FakeSerialPort = new FakeSerialPort('reconnected-24');
      fixture.provider.ports = [replacement];
      await fixture.controller.getSerialPortList();
      await fixture.controller.open();
      stale();
      expect(fixture.controller.snapshot().portName).assertEqual('reconnected-24');
      expect(fixture.controller.snapshot().opened).assertTrue();
      expect(await fixture.controller.write(payload(2, 1))).assertEqual(2);
      expect(replacement.writes.length).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
    });

    /**
     * @tc.name SerialInterruptedTransfersTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALINTERRUPTEDTRANSFERS_1700
     * @tc.desc getSerialPortList recovers to a new port after onDisconnect with 3 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialInterruptedTransfersTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(3, 1));
      fixture.port.emitDisconnect();
      const replacement: FakeSerialPort = new FakeSerialPort('reconnected-25');
      fixture.provider.ports = [replacement];
      await fixture.controller.getSerialPortList();
      await fixture.controller.open();
      stale();
      expect(fixture.controller.snapshot().portName).assertEqual('reconnected-25');
      expect(fixture.controller.snapshot().opened).assertTrue();
      expect(await fixture.controller.write(payload(3, 1))).assertEqual(3);
      expect(replacement.writes.length).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
    });

    /**
     * @tc.name SerialInterruptedTransfersTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALINTERRUPTEDTRANSFERS_1800
     * @tc.desc getSerialPortList recovers to a new port after onDisconnect with 4 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialInterruptedTransfersTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(4, 1));
      fixture.port.emitDisconnect();
      const replacement: FakeSerialPort = new FakeSerialPort('reconnected-26');
      fixture.provider.ports = [replacement];
      await fixture.controller.getSerialPortList();
      await fixture.controller.open();
      stale();
      expect(fixture.controller.snapshot().portName).assertEqual('reconnected-26');
      expect(fixture.controller.snapshot().opened).assertTrue();
      expect(await fixture.controller.write(payload(4, 1))).assertEqual(4);
      expect(replacement.writes.length).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
    });

    /**
     * @tc.name SerialInterruptedTransfersTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALINTERRUPTEDTRANSFERS_1900
     * @tc.desc getSerialPortList recovers to a new port after onDisconnect with 5 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialInterruptedTransfersTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(5, 1));
      fixture.port.emitDisconnect();
      const replacement: FakeSerialPort = new FakeSerialPort('reconnected-27');
      fixture.provider.ports = [replacement];
      await fixture.controller.getSerialPortList();
      await fixture.controller.open();
      stale();
      expect(fixture.controller.snapshot().portName).assertEqual('reconnected-27');
      expect(fixture.controller.snapshot().opened).assertTrue();
      expect(await fixture.controller.write(payload(5, 1))).assertEqual(5);
      expect(replacement.writes.length).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
    });

    /**
     * @tc.name SerialInterruptedTransfersTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALINTERRUPTEDTRANSFERS_2000
     * @tc.desc getSerialPortList recovers to a new port after onDisconnect with 7 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialInterruptedTransfersTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(7, 1));
      fixture.port.emitDisconnect();
      const replacement: FakeSerialPort = new FakeSerialPort('reconnected-28');
      fixture.provider.ports = [replacement];
      await fixture.controller.getSerialPortList();
      await fixture.controller.open();
      stale();
      expect(fixture.controller.snapshot().portName).assertEqual('reconnected-28');
      expect(fixture.controller.snapshot().opened).assertTrue();
      expect(await fixture.controller.write(payload(7, 1))).assertEqual(7);
      expect(replacement.writes.length).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
    });

    /**
     * @tc.name SerialInterruptedTransfersTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALINTERRUPTEDTRANSFERS_2100
     * @tc.desc getSerialPortList recovers to a new port after onDisconnect with 8 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialInterruptedTransfersTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(8, 1));
      fixture.port.emitDisconnect();
      const replacement: FakeSerialPort = new FakeSerialPort('reconnected-29');
      fixture.provider.ports = [replacement];
      await fixture.controller.getSerialPortList();
      await fixture.controller.open();
      stale();
      expect(fixture.controller.snapshot().portName).assertEqual('reconnected-29');
      expect(fixture.controller.snapshot().opened).assertTrue();
      expect(await fixture.controller.write(payload(8, 1))).assertEqual(8);
      expect(replacement.writes.length).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
    });

    /**
     * @tc.name SerialInterruptedTransfersTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALINTERRUPTEDTRANSFERS_2200
     * @tc.desc getSerialPortList recovers to a new port after onDisconnect with 16 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialInterruptedTransfersTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(16, 1));
      fixture.port.emitDisconnect();
      const replacement: FakeSerialPort = new FakeSerialPort('reconnected-30');
      fixture.provider.ports = [replacement];
      await fixture.controller.getSerialPortList();
      await fixture.controller.open();
      stale();
      expect(fixture.controller.snapshot().portName).assertEqual('reconnected-30');
      expect(fixture.controller.snapshot().opened).assertTrue();
      expect(await fixture.controller.write(payload(16, 1))).assertEqual(16);
      expect(replacement.writes.length).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(16);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
    });
  });
}
