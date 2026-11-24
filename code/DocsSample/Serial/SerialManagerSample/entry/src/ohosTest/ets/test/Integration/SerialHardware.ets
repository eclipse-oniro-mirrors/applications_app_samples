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
import SerialController from '../../../../main/ets/model/SerialController';
import SystemSerialProvider from '../../../../main/ets/model/SystemSerialProvider';
import { logSuite } from '../Shared/SharedDriver';

/* Register this suite only with serialHardware=true on a serial-capable 2in1 device. */
/* These tests require a connected port and explicit user authorization to open it. */
export default function SerialHardwareTest(): void {
  describe('SerialHardwareTest', () => {
    let controller: SerialController = new SerialController(new SystemSerialProvider());

    beforeAll(() => {
      logSuite('SerialHardware', 'begin');
    });

    beforeEach(async () => {
      controller = new SerialController(new SystemSerialProvider());
      await Promise.resolve();
    });

    afterEach(async () => {
      await controller.dispose();
      expect(controller.snapshot().opened).assertFalse();
    });

    afterAll(() => {
      logSuite('SerialHardware', 'end');
    });

    /**
     * @tc.name SerialHardwareTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALHARDWARE_0100
     * @tc.desc getSerialPortList returns at least one real serial port with a nonempty portName
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialHardwareTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const ports: serial.SerialPortInfo[] = await controller.getSerialPortList();
      expect(ports.length > 0).assertTrue();
      expect(ports[0].portName.length > 0).assertTrue();
      const info = await controller.portInfo();
      expect(info.portName).assertEqual(ports[0].portName);
      expect(controller.snapshot().opened).assertFalse();
    });

    /**
     * @tc.name SerialHardwareTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALHARDWARE_0200
     * @tc.desc open and close a real serial port using the sample default configuration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialHardwareTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const ports: serial.SerialPortInfo[] = await controller.getSerialPortList();
      expect(ports.length > 0).assertTrue();
      await controller.open();
      expect(controller.snapshot().opened).assertTrue();
      expect(controller.snapshot().portName).assertEqual(ports[0].portName);
      await controller.close();
      expect(controller.snapshot().opened).assertFalse();
      expect(controller.snapshot().portName).assertEqual('');
    });

    /**
     * @tc.name SerialHardwareTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALHARDWARE_0300
     * @tc.desc onDataRead and onDisconnect can be registered and removed from a real serial port
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialHardwareTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const ports: serial.SerialPortInfo[] = await controller.getSerialPortList();
      expect(ports.length > 0).assertTrue();
      await controller.open();
      await controller.onDataRead();
      await controller.onDisconnect();
      expect(controller.snapshot().dataSubscribed).assertTrue();
      expect(controller.snapshot().disconnectSubscribed).assertTrue();
      await controller.offDataRead();
      await controller.offDisconnect();
      expect(controller.snapshot().dataSubscribed).assertFalse();
      expect(controller.snapshot().disconnectSubscribed).assertFalse();
    });
  });
}
