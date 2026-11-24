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

export default function SerialPortConfigurationTest(): void {
  describe('SerialPortConfigurationTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialPortConfiguration', 'begin');
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
      logSuite('SerialPortConfiguration', 'end');
    });

    /**
     * @tc.name SerialPortConfigurationTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONFIGURATION_0100
     * @tc.desc open forwards baudRate 230400 dataBits 7 stopBits 1 parity mark
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConfigurationTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 230400,
        dataBits: 7,
        stopBits: 1,
        parity: 'mark' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(230400);
      expect(actual.dataBits).assertEqual(7);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('mark');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConfigurationTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONFIGURATION_0200
     * @tc.desc open forwards baudRate 460800 dataBits 7 stopBits 1 parity space
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConfigurationTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 460800,
        dataBits: 7,
        stopBits: 1,
        parity: 'space' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(460800);
      expect(actual.dataBits).assertEqual(7);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('space');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConfigurationTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONFIGURATION_0300
     * @tc.desc open forwards baudRate 921600 dataBits 7 stopBits 1 parity none
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConfigurationTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 921600,
        dataBits: 7,
        stopBits: 1,
        parity: 'none' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(921600);
      expect(actual.dataBits).assertEqual(7);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('none');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConfigurationTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONFIGURATION_0400
     * @tc.desc open forwards baudRate 300 dataBits 8 stopBits 1 parity even
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConfigurationTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 300,
        dataBits: 8,
        stopBits: 1,
        parity: 'even' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(300);
      expect(actual.dataBits).assertEqual(8);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('even');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConfigurationTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONFIGURATION_0500
     * @tc.desc open forwards baudRate 1200 dataBits 8 stopBits 1 parity odd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConfigurationTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 1200,
        dataBits: 8,
        stopBits: 1,
        parity: 'odd' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(1200);
      expect(actual.dataBits).assertEqual(8);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('odd');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConfigurationTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONFIGURATION_0600
     * @tc.desc open forwards baudRate 2400 dataBits 8 stopBits 1 parity mark
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConfigurationTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 2400,
        dataBits: 8,
        stopBits: 1,
        parity: 'mark' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(2400);
      expect(actual.dataBits).assertEqual(8);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('mark');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConfigurationTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONFIGURATION_0700
     * @tc.desc open forwards baudRate 4800 dataBits 8 stopBits 1 parity space
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConfigurationTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 4800,
        dataBits: 8,
        stopBits: 1,
        parity: 'space' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(4800);
      expect(actual.dataBits).assertEqual(8);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('space');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConfigurationTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONFIGURATION_0800
     * @tc.desc open forwards baudRate 9600 dataBits 8 stopBits 1 parity none
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConfigurationTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 9600,
        dataBits: 8,
        stopBits: 1,
        parity: 'none' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(9600);
      expect(actual.dataBits).assertEqual(8);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('none');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConfigurationTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONFIGURATION_0900
     * @tc.desc open forwards baudRate 19200 dataBits 8 stopBits 1 parity even
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConfigurationTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 19200,
        dataBits: 8,
        stopBits: 1,
        parity: 'even' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(19200);
      expect(actual.dataBits).assertEqual(8);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('even');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConfigurationTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONFIGURATION_1000
     * @tc.desc open forwards baudRate 38400 dataBits 8 stopBits 1 parity odd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConfigurationTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 38400,
        dataBits: 8,
        stopBits: 1,
        parity: 'odd' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(38400);
      expect(actual.dataBits).assertEqual(8);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('odd');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConfigurationTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONFIGURATION_1100
     * @tc.desc open forwards baudRate 57600 dataBits 8 stopBits 1 parity mark
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConfigurationTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 57600,
        dataBits: 8,
        stopBits: 1,
        parity: 'mark' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(57600);
      expect(actual.dataBits).assertEqual(8);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('mark');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConfigurationTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONFIGURATION_1200
     * @tc.desc open forwards baudRate 115200 dataBits 8 stopBits 1 parity space
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConfigurationTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 115200,
        dataBits: 8,
        stopBits: 1,
        parity: 'space' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(115200);
      expect(actual.dataBits).assertEqual(8);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('space');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConfigurationTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONFIGURATION_1300
     * @tc.desc open forwards baudRate 230400 dataBits 8 stopBits 1 parity none
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConfigurationTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 230400,
        dataBits: 8,
        stopBits: 1,
        parity: 'none' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(230400);
      expect(actual.dataBits).assertEqual(8);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('none');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConfigurationTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONFIGURATION_1400
     * @tc.desc open forwards baudRate 460800 dataBits 8 stopBits 1 parity even
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConfigurationTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 460800,
        dataBits: 8,
        stopBits: 1,
        parity: 'even' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(460800);
      expect(actual.dataBits).assertEqual(8);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('even');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConfigurationTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONFIGURATION_1500
     * @tc.desc open forwards baudRate 921600 dataBits 8 stopBits 1 parity odd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConfigurationTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 921600,
        dataBits: 8,
        stopBits: 1,
        parity: 'odd' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(921600);
      expect(actual.dataBits).assertEqual(8);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('odd');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConfigurationTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONFIGURATION_1600
     * @tc.desc open forwards baudRate 300 dataBits 5 stopBits 2 parity mark
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConfigurationTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 300,
        dataBits: 5,
        stopBits: 2,
        parity: 'mark' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(300);
      expect(actual.dataBits).assertEqual(5);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('mark');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConfigurationTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONFIGURATION_1700
     * @tc.desc open forwards baudRate 1200 dataBits 5 stopBits 2 parity space
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConfigurationTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 1200,
        dataBits: 5,
        stopBits: 2,
        parity: 'space' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(1200);
      expect(actual.dataBits).assertEqual(5);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('space');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConfigurationTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONFIGURATION_1800
     * @tc.desc open forwards baudRate 2400 dataBits 5 stopBits 2 parity none
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConfigurationTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 2400,
        dataBits: 5,
        stopBits: 2,
        parity: 'none' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(2400);
      expect(actual.dataBits).assertEqual(5);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('none');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConfigurationTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONFIGURATION_1900
     * @tc.desc open forwards baudRate 4800 dataBits 5 stopBits 2 parity even
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConfigurationTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 4800,
        dataBits: 5,
        stopBits: 2,
        parity: 'even' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(4800);
      expect(actual.dataBits).assertEqual(5);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('even');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConfigurationTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONFIGURATION_2000
     * @tc.desc open forwards baudRate 9600 dataBits 5 stopBits 2 parity odd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConfigurationTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 9600,
        dataBits: 5,
        stopBits: 2,
        parity: 'odd' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(9600);
      expect(actual.dataBits).assertEqual(5);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('odd');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConfigurationTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONFIGURATION_2100
     * @tc.desc open forwards baudRate 19200 dataBits 5 stopBits 2 parity mark
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConfigurationTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 19200,
        dataBits: 5,
        stopBits: 2,
        parity: 'mark' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(19200);
      expect(actual.dataBits).assertEqual(5);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('mark');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConfigurationTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONFIGURATION_2200
     * @tc.desc open forwards baudRate 38400 dataBits 5 stopBits 2 parity space
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConfigurationTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 38400,
        dataBits: 5,
        stopBits: 2,
        parity: 'space' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(38400);
      expect(actual.dataBits).assertEqual(5);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('space');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConfigurationTest023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONFIGURATION_2300
     * @tc.desc open forwards baudRate 57600 dataBits 5 stopBits 2 parity none
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConfigurationTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 57600,
        dataBits: 5,
        stopBits: 2,
        parity: 'none' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(57600);
      expect(actual.dataBits).assertEqual(5);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('none');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConfigurationTest024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONFIGURATION_2400
     * @tc.desc open forwards baudRate 115200 dataBits 5 stopBits 2 parity even
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConfigurationTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 115200,
        dataBits: 5,
        stopBits: 2,
        parity: 'even' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(115200);
      expect(actual.dataBits).assertEqual(5);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('even');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConfigurationTest025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONFIGURATION_2500
     * @tc.desc open forwards baudRate 230400 dataBits 5 stopBits 2 parity odd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConfigurationTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 230400,
        dataBits: 5,
        stopBits: 2,
        parity: 'odd' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(230400);
      expect(actual.dataBits).assertEqual(5);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('odd');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConfigurationTest026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONFIGURATION_2600
     * @tc.desc open forwards baudRate 460800 dataBits 5 stopBits 2 parity mark
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConfigurationTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 460800,
        dataBits: 5,
        stopBits: 2,
        parity: 'mark' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(460800);
      expect(actual.dataBits).assertEqual(5);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('mark');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConfigurationTest027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONFIGURATION_2700
     * @tc.desc open forwards baudRate 921600 dataBits 5 stopBits 2 parity space
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConfigurationTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 921600,
        dataBits: 5,
        stopBits: 2,
        parity: 'space' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(921600);
      expect(actual.dataBits).assertEqual(5);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('space');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConfigurationTest028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONFIGURATION_2800
     * @tc.desc open forwards baudRate 300 dataBits 6 stopBits 2 parity none
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConfigurationTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 300,
        dataBits: 6,
        stopBits: 2,
        parity: 'none' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(300);
      expect(actual.dataBits).assertEqual(6);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('none');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConfigurationTest029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONFIGURATION_2900
     * @tc.desc open forwards baudRate 1200 dataBits 6 stopBits 2 parity even
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConfigurationTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 1200,
        dataBits: 6,
        stopBits: 2,
        parity: 'even' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(1200);
      expect(actual.dataBits).assertEqual(6);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('even');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConfigurationTest030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONFIGURATION_3000
     * @tc.desc open forwards baudRate 2400 dataBits 6 stopBits 2 parity odd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConfigurationTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 2400,
        dataBits: 6,
        stopBits: 2,
        parity: 'odd' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(2400);
      expect(actual.dataBits).assertEqual(6);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('odd');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConfigurationTest031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONFIGURATION_3100
     * @tc.desc open forwards baudRate 4800 dataBits 6 stopBits 2 parity mark
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConfigurationTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 4800,
        dataBits: 6,
        stopBits: 2,
        parity: 'mark' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(4800);
      expect(actual.dataBits).assertEqual(6);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('mark');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortConfigurationTest032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTCONFIGURATION_3200
     * @tc.desc open uses the sample default 115200 8N1 configuration without explicit arguments
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortConfigurationTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(115200);
      expect(actual.dataBits).assertEqual(SerialConfigValues.dataBitsEight);
      expect(actual.stopBits).assertEqual(SerialConfigValues.stopBitsOne);
      expect(actual.parity).assertEqual(SerialConfigValues.parityNone);
      expectSession(fixture);
    });
  });
}
