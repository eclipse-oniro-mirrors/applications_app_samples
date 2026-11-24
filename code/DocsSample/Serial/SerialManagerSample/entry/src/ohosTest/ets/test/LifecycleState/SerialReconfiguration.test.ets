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

export default function SerialReconfigurationTest(): void {
  describe('SerialReconfigurationTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialReconfiguration', 'begin');
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
      logSuite('SerialReconfiguration', 'end');
    });

    /**
     * @tc.name SerialReconfigurationTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECONFIGURATION_0100
     * @tc.desc open forwards baudRate 115200 dataBits 6 stopBits 1 parity none
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReconfigurationTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 115200,
        dataBits: 6,
        stopBits: 1,
        parity: 'none' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(115200);
      expect(actual.dataBits).assertEqual(6);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('none');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialReconfigurationTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECONFIGURATION_0200
     * @tc.desc open forwards baudRate 230400 dataBits 6 stopBits 1 parity even
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReconfigurationTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 230400,
        dataBits: 6,
        stopBits: 1,
        parity: 'even' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(230400);
      expect(actual.dataBits).assertEqual(6);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('even');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialReconfigurationTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECONFIGURATION_0300
     * @tc.desc open forwards baudRate 460800 dataBits 6 stopBits 1 parity odd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReconfigurationTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 460800,
        dataBits: 6,
        stopBits: 1,
        parity: 'odd' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(460800);
      expect(actual.dataBits).assertEqual(6);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('odd');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialReconfigurationTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECONFIGURATION_0400
     * @tc.desc open forwards baudRate 921600 dataBits 6 stopBits 1 parity mark
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReconfigurationTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 921600,
        dataBits: 6,
        stopBits: 1,
        parity: 'mark' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(921600);
      expect(actual.dataBits).assertEqual(6);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('mark');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialReconfigurationTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECONFIGURATION_0500
     * @tc.desc open forwards baudRate 300 dataBits 7 stopBits 1 parity space
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReconfigurationTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 300,
        dataBits: 7,
        stopBits: 1,
        parity: 'space' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(300);
      expect(actual.dataBits).assertEqual(7);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('space');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialReconfigurationTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECONFIGURATION_0600
     * @tc.desc open forwards baudRate 1200 dataBits 7 stopBits 1 parity none
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReconfigurationTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 1200,
        dataBits: 7,
        stopBits: 1,
        parity: 'none' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(1200);
      expect(actual.dataBits).assertEqual(7);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('none');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialReconfigurationTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECONFIGURATION_0700
     * @tc.desc open forwards baudRate 2400 dataBits 7 stopBits 1 parity even
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReconfigurationTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 2400,
        dataBits: 7,
        stopBits: 1,
        parity: 'even' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(2400);
      expect(actual.dataBits).assertEqual(7);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('even');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialReconfigurationTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECONFIGURATION_0800
     * @tc.desc open forwards baudRate 4800 dataBits 7 stopBits 1 parity odd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReconfigurationTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 4800,
        dataBits: 7,
        stopBits: 1,
        parity: 'odd' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(4800);
      expect(actual.dataBits).assertEqual(7);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('odd');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialReconfigurationTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECONFIGURATION_0900
     * @tc.desc open forwards baudRate 9600 dataBits 7 stopBits 1 parity mark
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReconfigurationTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 9600,
        dataBits: 7,
        stopBits: 1,
        parity: 'mark' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(9600);
      expect(actual.dataBits).assertEqual(7);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('mark');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialReconfigurationTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECONFIGURATION_1000
     * @tc.desc open forwards baudRate 19200 dataBits 7 stopBits 1 parity space
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReconfigurationTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 19200,
        dataBits: 7,
        stopBits: 1,
        parity: 'space' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(19200);
      expect(actual.dataBits).assertEqual(7);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('space');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialReconfigurationTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECONFIGURATION_1100
     * @tc.desc open forwards baudRate 38400 dataBits 7 stopBits 1 parity none
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReconfigurationTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 38400,
        dataBits: 7,
        stopBits: 1,
        parity: 'none' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(38400);
      expect(actual.dataBits).assertEqual(7);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('none');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialReconfigurationTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECONFIGURATION_1200
     * @tc.desc open forwards baudRate 57600 dataBits 7 stopBits 1 parity even
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReconfigurationTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 57600,
        dataBits: 7,
        stopBits: 1,
        parity: 'even' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(57600);
      expect(actual.dataBits).assertEqual(7);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('even');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialReconfigurationTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALRECONFIGURATION_1300
     * @tc.desc open forwards baudRate 115200 dataBits 7 stopBits 1 parity odd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialReconfigurationTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 115200,
        dataBits: 7,
        stopBits: 1,
        parity: 'odd' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(115200);
      expect(actual.dataBits).assertEqual(7);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('odd');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });
  });
}
