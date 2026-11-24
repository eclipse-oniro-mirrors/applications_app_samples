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

export default function SerialDisconnectRecoveryTest(): void {
  describe('SerialDisconnectRecoveryTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialDisconnectRecovery', 'begin');
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
      logSuite('SerialDisconnectRecovery', 'end');
    });

    /**
     * @tc.name SerialDisconnectRecoveryTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTRECOVERY_0100
     * @tc.desc getSerialPortList recovers to a new port after onDisconnect with 1 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectRecoveryTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(1, 0));
      fixture.port.emitDisconnect();
      const replacement: FakeSerialPort = new FakeSerialPort('reconnected-0');
      fixture.provider.ports = [replacement];
      await fixture.controller.getSerialPortList();
      await fixture.controller.open();
      stale();
      expect(fixture.controller.snapshot().portName).assertEqual('reconnected-0');
      expect(fixture.controller.snapshot().opened).assertTrue();
      expect(await fixture.controller.write(payload(1, 0))).assertEqual(1);
      expect(replacement.writes.length).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
    });

    /**
     * @tc.name SerialDisconnectRecoveryTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTRECOVERY_0200
     * @tc.desc getSerialPortList recovers to a new port after onDisconnect with 2 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectRecoveryTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(2, 0));
      fixture.port.emitDisconnect();
      const replacement: FakeSerialPort = new FakeSerialPort('reconnected-1');
      fixture.provider.ports = [replacement];
      await fixture.controller.getSerialPortList();
      await fixture.controller.open();
      stale();
      expect(fixture.controller.snapshot().portName).assertEqual('reconnected-1');
      expect(fixture.controller.snapshot().opened).assertTrue();
      expect(await fixture.controller.write(payload(2, 0))).assertEqual(2);
      expect(replacement.writes.length).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
    });

    /**
     * @tc.name SerialDisconnectRecoveryTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTRECOVERY_0300
     * @tc.desc getSerialPortList recovers to a new port after onDisconnect with 3 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectRecoveryTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(3, 0));
      fixture.port.emitDisconnect();
      const replacement: FakeSerialPort = new FakeSerialPort('reconnected-2');
      fixture.provider.ports = [replacement];
      await fixture.controller.getSerialPortList();
      await fixture.controller.open();
      stale();
      expect(fixture.controller.snapshot().portName).assertEqual('reconnected-2');
      expect(fixture.controller.snapshot().opened).assertTrue();
      expect(await fixture.controller.write(payload(3, 0))).assertEqual(3);
      expect(replacement.writes.length).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
    });

    /**
     * @tc.name SerialDisconnectRecoveryTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTRECOVERY_0400
     * @tc.desc getSerialPortList recovers to a new port after onDisconnect with 4 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectRecoveryTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(4, 0));
      fixture.port.emitDisconnect();
      const replacement: FakeSerialPort = new FakeSerialPort('reconnected-3');
      fixture.provider.ports = [replacement];
      await fixture.controller.getSerialPortList();
      await fixture.controller.open();
      stale();
      expect(fixture.controller.snapshot().portName).assertEqual('reconnected-3');
      expect(fixture.controller.snapshot().opened).assertTrue();
      expect(await fixture.controller.write(payload(4, 0))).assertEqual(4);
      expect(replacement.writes.length).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
    });

    /**
     * @tc.name SerialDisconnectRecoveryTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTRECOVERY_0500
     * @tc.desc getSerialPortList recovers to a new port after onDisconnect with 5 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectRecoveryTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(5, 0));
      fixture.port.emitDisconnect();
      const replacement: FakeSerialPort = new FakeSerialPort('reconnected-4');
      fixture.provider.ports = [replacement];
      await fixture.controller.getSerialPortList();
      await fixture.controller.open();
      stale();
      expect(fixture.controller.snapshot().portName).assertEqual('reconnected-4');
      expect(fixture.controller.snapshot().opened).assertTrue();
      expect(await fixture.controller.write(payload(5, 0))).assertEqual(5);
      expect(replacement.writes.length).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
    });

    /**
     * @tc.name SerialDisconnectRecoveryTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTRECOVERY_0600
     * @tc.desc getSerialPortList recovers to a new port after onDisconnect with 7 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectRecoveryTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(7, 0));
      fixture.port.emitDisconnect();
      const replacement: FakeSerialPort = new FakeSerialPort('reconnected-5');
      fixture.provider.ports = [replacement];
      await fixture.controller.getSerialPortList();
      await fixture.controller.open();
      stale();
      expect(fixture.controller.snapshot().portName).assertEqual('reconnected-5');
      expect(fixture.controller.snapshot().opened).assertTrue();
      expect(await fixture.controller.write(payload(7, 0))).assertEqual(7);
      expect(replacement.writes.length).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
    });

    /**
     * @tc.name SerialDisconnectRecoveryTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTRECOVERY_0700
     * @tc.desc getSerialPortList recovers to a new port after onDisconnect with 8 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectRecoveryTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(8, 0));
      fixture.port.emitDisconnect();
      const replacement: FakeSerialPort = new FakeSerialPort('reconnected-6');
      fixture.provider.ports = [replacement];
      await fixture.controller.getSerialPortList();
      await fixture.controller.open();
      stale();
      expect(fixture.controller.snapshot().portName).assertEqual('reconnected-6');
      expect(fixture.controller.snapshot().opened).assertTrue();
      expect(await fixture.controller.write(payload(8, 0))).assertEqual(8);
      expect(replacement.writes.length).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
    });

    /**
     * @tc.name SerialDisconnectRecoveryTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTRECOVERY_0800
     * @tc.desc getSerialPortList recovers to a new port after onDisconnect with 16 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectRecoveryTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(16, 0));
      fixture.port.emitDisconnect();
      const replacement: FakeSerialPort = new FakeSerialPort('reconnected-7');
      fixture.provider.ports = [replacement];
      await fixture.controller.getSerialPortList();
      await fixture.controller.open();
      stale();
      expect(fixture.controller.snapshot().portName).assertEqual('reconnected-7');
      expect(fixture.controller.snapshot().opened).assertTrue();
      expect(await fixture.controller.write(payload(16, 0))).assertEqual(16);
      expect(replacement.writes.length).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(16);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
    });

    /**
     * @tc.name SerialDisconnectRecoveryTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALDISCONNECTRECOVERY_0900
     * @tc.desc getSerialPortList recovers to a new port after onDisconnect with 31 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialDisconnectRecoveryTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const stale: () => void = fixture.port.disconnectCallbacks[0];
      fixture.port.emitData(payload(31, 0));
      fixture.port.emitDisconnect();
      const replacement: FakeSerialPort = new FakeSerialPort('reconnected-8');
      fixture.provider.ports = [replacement];
      await fixture.controller.getSerialPortList();
      await fixture.controller.open();
      stale();
      expect(fixture.controller.snapshot().portName).assertEqual('reconnected-8');
      expect(fixture.controller.snapshot().opened).assertTrue();
      expect(await fixture.controller.write(payload(31, 0))).assertEqual(31);
      expect(replacement.writes.length).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(0);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(31);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(31);
    });
  });
}
