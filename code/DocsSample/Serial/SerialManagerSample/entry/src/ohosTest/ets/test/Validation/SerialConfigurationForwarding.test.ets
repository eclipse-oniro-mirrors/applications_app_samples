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
import SerialConfigValues from '../../../../main/ets/model/SerialConfigValues';
import { SerialFixture, FakeSerialPort, expectBytes, expectFailure, payload, logSuite,
  expectReleased, expectSession, expectCallSequence, invokeOperation } from '../Shared/SharedDriver';

export default function SerialConfigurationForwardingTest(): void {
  describe('SerialConfigurationForwardingTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialConfigurationForwarding', 'begin');
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
      logSuite('SerialConfigurationForwarding', 'end');
    });

    /**
     * @tc.name SerialConfigurationForwardingTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONFORWARDING_0100
     * @tc.desc open forwards baudRate 115200 dataBits 5 stopBits 1 parity mark and owns the queued config
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationForwardingTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 115200,
        dataBits: 5,
        stopBits: 1,
        parity: 'mark' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      config.baudRate = 999999;
      config.dataBits = SerialConfigValues.dataBitsEight;
      config.stopBits = SerialConfigValues.stopBitsTwo;
      config.parity = SerialConfigValues.parityNone;
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(115200);
      expect(actual.dataBits).assertEqual(5);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('mark');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialConfigurationForwardingTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONFORWARDING_0200
     * @tc.desc open forwards baudRate 230400 dataBits 5 stopBits 1 parity space and owns the queued config
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationForwardingTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 230400,
        dataBits: 5,
        stopBits: 1,
        parity: 'space' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      config.baudRate = 999999;
      config.dataBits = SerialConfigValues.dataBitsEight;
      config.stopBits = SerialConfigValues.stopBitsTwo;
      config.parity = SerialConfigValues.parityNone;
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(230400);
      expect(actual.dataBits).assertEqual(5);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('space');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialConfigurationForwardingTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONFORWARDING_0300
     * @tc.desc open forwards baudRate 460800 dataBits 5 stopBits 1 parity none and owns the queued config
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationForwardingTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 460800,
        dataBits: 5,
        stopBits: 1,
        parity: 'none' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      config.baudRate = 999999;
      config.dataBits = SerialConfigValues.dataBitsEight;
      config.stopBits = SerialConfigValues.stopBitsTwo;
      config.parity = SerialConfigValues.parityNone;
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(460800);
      expect(actual.dataBits).assertEqual(5);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('none');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialConfigurationForwardingTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONFORWARDING_0400
     * @tc.desc open forwards baudRate 921600 dataBits 5 stopBits 1 parity even and owns the queued config
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationForwardingTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 921600,
        dataBits: 5,
        stopBits: 1,
        parity: 'even' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      config.baudRate = 999999;
      config.dataBits = SerialConfigValues.dataBitsEight;
      config.stopBits = SerialConfigValues.stopBitsTwo;
      config.parity = SerialConfigValues.parityNone;
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(921600);
      expect(actual.dataBits).assertEqual(5);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('even');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialConfigurationForwardingTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONFORWARDING_0500
     * @tc.desc open forwards baudRate 300 dataBits 6 stopBits 1 parity odd and owns the queued config
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationForwardingTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 300,
        dataBits: 6,
        stopBits: 1,
        parity: 'odd' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      config.baudRate = 999999;
      config.dataBits = SerialConfigValues.dataBitsEight;
      config.stopBits = SerialConfigValues.stopBitsTwo;
      config.parity = SerialConfigValues.parityNone;
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(300);
      expect(actual.dataBits).assertEqual(6);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('odd');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialConfigurationForwardingTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONFORWARDING_0600
     * @tc.desc open forwards baudRate 1200 dataBits 6 stopBits 1 parity mark and owns the queued config
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationForwardingTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 1200,
        dataBits: 6,
        stopBits: 1,
        parity: 'mark' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      config.baudRate = 999999;
      config.dataBits = SerialConfigValues.dataBitsEight;
      config.stopBits = SerialConfigValues.stopBitsTwo;
      config.parity = SerialConfigValues.parityNone;
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(1200);
      expect(actual.dataBits).assertEqual(6);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('mark');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialConfigurationForwardingTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONFORWARDING_0700
     * @tc.desc open forwards baudRate 2400 dataBits 6 stopBits 1 parity space and owns the queued config
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationForwardingTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 2400,
        dataBits: 6,
        stopBits: 1,
        parity: 'space' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      config.baudRate = 999999;
      config.dataBits = SerialConfigValues.dataBitsEight;
      config.stopBits = SerialConfigValues.stopBitsTwo;
      config.parity = SerialConfigValues.parityNone;
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(2400);
      expect(actual.dataBits).assertEqual(6);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('space');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialConfigurationForwardingTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONFORWARDING_0800
     * @tc.desc open forwards baudRate 4800 dataBits 6 stopBits 1 parity none and owns the queued config
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationForwardingTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 4800,
        dataBits: 6,
        stopBits: 1,
        parity: 'none' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      config.baudRate = 999999;
      config.dataBits = SerialConfigValues.dataBitsEight;
      config.stopBits = SerialConfigValues.stopBitsTwo;
      config.parity = SerialConfigValues.parityNone;
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(4800);
      expect(actual.dataBits).assertEqual(6);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('none');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialConfigurationForwardingTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONFORWARDING_0900
     * @tc.desc open forwards baudRate 9600 dataBits 6 stopBits 1 parity even and owns the queued config
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationForwardingTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 9600,
        dataBits: 6,
        stopBits: 1,
        parity: 'even' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      config.baudRate = 999999;
      config.dataBits = SerialConfigValues.dataBitsEight;
      config.stopBits = SerialConfigValues.stopBitsTwo;
      config.parity = SerialConfigValues.parityNone;
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(9600);
      expect(actual.dataBits).assertEqual(6);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('even');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialConfigurationForwardingTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONFORWARDING_1000
     * @tc.desc open forwards baudRate 19200 dataBits 6 stopBits 1 parity odd and owns the queued config
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationForwardingTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 19200,
        dataBits: 6,
        stopBits: 1,
        parity: 'odd' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      config.baudRate = 999999;
      config.dataBits = SerialConfigValues.dataBitsEight;
      config.stopBits = SerialConfigValues.stopBitsTwo;
      config.parity = SerialConfigValues.parityNone;
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(19200);
      expect(actual.dataBits).assertEqual(6);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('odd');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialConfigurationForwardingTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONFORWARDING_1100
     * @tc.desc open forwards baudRate 38400 dataBits 6 stopBits 1 parity mark and owns the queued config
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationForwardingTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 38400,
        dataBits: 6,
        stopBits: 1,
        parity: 'mark' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      config.baudRate = 999999;
      config.dataBits = SerialConfigValues.dataBitsEight;
      config.stopBits = SerialConfigValues.stopBitsTwo;
      config.parity = SerialConfigValues.parityNone;
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(38400);
      expect(actual.dataBits).assertEqual(6);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('mark');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialConfigurationForwardingTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONFORWARDING_1200
     * @tc.desc open forwards baudRate 57600 dataBits 6 stopBits 1 parity space and owns the queued config
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationForwardingTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 57600,
        dataBits: 6,
        stopBits: 1,
        parity: 'space' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      config.baudRate = 999999;
      config.dataBits = SerialConfigValues.dataBitsEight;
      config.stopBits = SerialConfigValues.stopBitsTwo;
      config.parity = SerialConfigValues.parityNone;
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(57600);
      expect(actual.dataBits).assertEqual(6);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('space');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialConfigurationForwardingTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONFORWARDING_1300
     * @tc.desc open forwards baudRate 115200 dataBits 6 stopBits 1 parity none and owns the queued config
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationForwardingTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 115200,
        dataBits: 6,
        stopBits: 1,
        parity: 'none' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      config.baudRate = 999999;
      config.dataBits = SerialConfigValues.dataBitsEight;
      config.stopBits = SerialConfigValues.stopBitsTwo;
      config.parity = SerialConfigValues.parityNone;
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
     * @tc.name SerialConfigurationForwardingTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONFORWARDING_1400
     * @tc.desc open forwards baudRate 230400 dataBits 6 stopBits 1 parity even and owns the queued config
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationForwardingTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 230400,
        dataBits: 6,
        stopBits: 1,
        parity: 'even' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      config.baudRate = 999999;
      config.dataBits = SerialConfigValues.dataBitsEight;
      config.stopBits = SerialConfigValues.stopBitsTwo;
      config.parity = SerialConfigValues.parityNone;
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
     * @tc.name SerialConfigurationForwardingTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONFORWARDING_1500
     * @tc.desc open forwards baudRate 460800 dataBits 6 stopBits 1 parity odd and owns the queued config
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationForwardingTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 460800,
        dataBits: 6,
        stopBits: 1,
        parity: 'odd' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      config.baudRate = 999999;
      config.dataBits = SerialConfigValues.dataBitsEight;
      config.stopBits = SerialConfigValues.stopBitsTwo;
      config.parity = SerialConfigValues.parityNone;
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
     * @tc.name SerialConfigurationForwardingTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONFORWARDING_1600
     * @tc.desc open forwards baudRate 921600 dataBits 6 stopBits 1 parity mark and owns the queued config
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationForwardingTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 921600,
        dataBits: 6,
        stopBits: 1,
        parity: 'mark' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      config.baudRate = 999999;
      config.dataBits = SerialConfigValues.dataBitsEight;
      config.stopBits = SerialConfigValues.stopBitsTwo;
      config.parity = SerialConfigValues.parityNone;
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
     * @tc.name SerialConfigurationForwardingTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONFORWARDING_1700
     * @tc.desc open forwards baudRate 300 dataBits 7 stopBits 1 parity space and owns the queued config
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationForwardingTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 300,
        dataBits: 7,
        stopBits: 1,
        parity: 'space' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      config.baudRate = 999999;
      config.dataBits = SerialConfigValues.dataBitsEight;
      config.stopBits = SerialConfigValues.stopBitsTwo;
      config.parity = SerialConfigValues.parityNone;
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
  });
}
