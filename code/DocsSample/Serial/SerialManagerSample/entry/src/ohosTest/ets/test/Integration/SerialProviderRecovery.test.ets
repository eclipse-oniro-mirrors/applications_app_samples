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

export default function SerialProviderRecoveryTest(): void {
  describe('SerialProviderRecoveryTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialProviderRecovery', 'begin');
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
      logSuite('SerialProviderRecovery', 'end');
    });

    /**
     * @tc.name SerialProviderRecoveryTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPROVIDERRECOVERY_0100
     * @tc.desc getSerialPortList propagates service code 35700001 and permits retry with port metadata vector 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialProviderRecoveryTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700001;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700001);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-0', 0);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-0');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(0);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialProviderRecoveryTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPROVIDERRECOVERY_0200
     * @tc.desc getSerialPortList propagates service code 35700002 and permits retry with port metadata vector 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialProviderRecoveryTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700002;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700002);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-1', 1);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-1');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(1);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });

    /**
     * @tc.name SerialProviderRecoveryTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPROVIDERRECOVERY_0300
     * @tc.desc getSerialPortList propagates service code 35700003 and permits retry with port metadata vector 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialProviderRecoveryTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      fixture.provider.failureCode = 35700003;
      await expectFailure(async () => fixture.controller.getSerialPortList(), 'BusinessError', 35700003);
      expect(fixture.controller.snapshot().portName).assertEqual('ttyUSB0');
      expect(fixture.controller.snapshot().opened).assertFalse();
      const replacement: FakeSerialPort = new FakeSerialPort('retry-2', 2);
      fixture.provider.ports = [replacement];
      const ports: serial.SerialPortInfo[] = await fixture.controller.getSerialPortList();
      expect(ports.length).assertEqual(1);
      expect(ports[0].portName).assertEqual('retry-2');
      expect((await fixture.controller.portInfo()).vendorId).assertEqual(2);
      expect(fixture.provider.calls).assertEqual(3);
      expect(fixture.port.calls.length).assertEqual(0);
    });
  });
}
