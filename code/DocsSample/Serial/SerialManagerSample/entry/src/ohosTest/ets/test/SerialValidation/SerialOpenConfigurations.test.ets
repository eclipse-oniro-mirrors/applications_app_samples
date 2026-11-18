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

export default function SerialOpenConfigurationsTest(): void {
  describe('SerialOpenConfigurationsTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialOpenConfigurations', 'begin');
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
      logSuite('SerialOpenConfigurations', 'end');
    });

    /**
     * @tc.name SerialOpenConfigurationsTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCONFIGURATIONS_0100
     * @tc.desc open forwards baudRate 9600 dataBits 6 stopBits 2 parity space
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenConfigurationsTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 9600,
        dataBits: 6,
        stopBits: 2,
        parity: 'space' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(9600);
      expect(actual.dataBits).assertEqual(6);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('space');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOpenConfigurationsTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCONFIGURATIONS_0200
     * @tc.desc open forwards baudRate 19200 dataBits 6 stopBits 2 parity none
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenConfigurationsTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 19200,
        dataBits: 6,
        stopBits: 2,
        parity: 'none' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(19200);
      expect(actual.dataBits).assertEqual(6);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('none');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOpenConfigurationsTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCONFIGURATIONS_0300
     * @tc.desc open forwards baudRate 38400 dataBits 6 stopBits 2 parity even
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenConfigurationsTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 38400,
        dataBits: 6,
        stopBits: 2,
        parity: 'even' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(38400);
      expect(actual.dataBits).assertEqual(6);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('even');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOpenConfigurationsTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCONFIGURATIONS_0400
     * @tc.desc open forwards baudRate 57600 dataBits 6 stopBits 2 parity odd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenConfigurationsTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 57600,
        dataBits: 6,
        stopBits: 2,
        parity: 'odd' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(57600);
      expect(actual.dataBits).assertEqual(6);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('odd');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOpenConfigurationsTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCONFIGURATIONS_0500
     * @tc.desc open forwards baudRate 115200 dataBits 6 stopBits 2 parity mark
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenConfigurationsTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 115200,
        dataBits: 6,
        stopBits: 2,
        parity: 'mark' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(115200);
      expect(actual.dataBits).assertEqual(6);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('mark');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOpenConfigurationsTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCONFIGURATIONS_0600
     * @tc.desc open forwards baudRate 230400 dataBits 6 stopBits 2 parity space
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenConfigurationsTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 230400,
        dataBits: 6,
        stopBits: 2,
        parity: 'space' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(230400);
      expect(actual.dataBits).assertEqual(6);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('space');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOpenConfigurationsTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCONFIGURATIONS_0700
     * @tc.desc open forwards baudRate 460800 dataBits 6 stopBits 2 parity none
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenConfigurationsTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 460800,
        dataBits: 6,
        stopBits: 2,
        parity: 'none' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(460800);
      expect(actual.dataBits).assertEqual(6);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('none');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOpenConfigurationsTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCONFIGURATIONS_0800
     * @tc.desc open forwards baudRate 921600 dataBits 6 stopBits 2 parity even
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenConfigurationsTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 921600,
        dataBits: 6,
        stopBits: 2,
        parity: 'even' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(921600);
      expect(actual.dataBits).assertEqual(6);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('even');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOpenConfigurationsTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCONFIGURATIONS_0900
     * @tc.desc open forwards baudRate 300 dataBits 7 stopBits 2 parity odd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenConfigurationsTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 300,
        dataBits: 7,
        stopBits: 2,
        parity: 'odd' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(300);
      expect(actual.dataBits).assertEqual(7);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('odd');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOpenConfigurationsTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCONFIGURATIONS_1000
     * @tc.desc open forwards baudRate 1200 dataBits 7 stopBits 2 parity mark
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenConfigurationsTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 1200,
        dataBits: 7,
        stopBits: 2,
        parity: 'mark' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(1200);
      expect(actual.dataBits).assertEqual(7);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('mark');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOpenConfigurationsTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCONFIGURATIONS_1100
     * @tc.desc open forwards baudRate 2400 dataBits 7 stopBits 2 parity space
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenConfigurationsTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 2400,
        dataBits: 7,
        stopBits: 2,
        parity: 'space' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(2400);
      expect(actual.dataBits).assertEqual(7);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('space');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOpenConfigurationsTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCONFIGURATIONS_1200
     * @tc.desc open forwards baudRate 4800 dataBits 7 stopBits 2 parity none
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenConfigurationsTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 4800,
        dataBits: 7,
        stopBits: 2,
        parity: 'none' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(4800);
      expect(actual.dataBits).assertEqual(7);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('none');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOpenConfigurationsTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCONFIGURATIONS_1300
     * @tc.desc open forwards baudRate 9600 dataBits 7 stopBits 2 parity even
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenConfigurationsTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 9600,
        dataBits: 7,
        stopBits: 2,
        parity: 'even' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(9600);
      expect(actual.dataBits).assertEqual(7);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('even');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOpenConfigurationsTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCONFIGURATIONS_1400
     * @tc.desc open forwards baudRate 19200 dataBits 7 stopBits 2 parity odd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenConfigurationsTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 19200,
        dataBits: 7,
        stopBits: 2,
        parity: 'odd' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(19200);
      expect(actual.dataBits).assertEqual(7);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('odd');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOpenConfigurationsTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCONFIGURATIONS_1500
     * @tc.desc open forwards baudRate 38400 dataBits 7 stopBits 2 parity mark
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenConfigurationsTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 38400,
        dataBits: 7,
        stopBits: 2,
        parity: 'mark' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(38400);
      expect(actual.dataBits).assertEqual(7);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('mark');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOpenConfigurationsTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCONFIGURATIONS_1600
     * @tc.desc open forwards baudRate 57600 dataBits 7 stopBits 2 parity space
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenConfigurationsTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 57600,
        dataBits: 7,
        stopBits: 2,
        parity: 'space' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(57600);
      expect(actual.dataBits).assertEqual(7);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('space');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOpenConfigurationsTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCONFIGURATIONS_1700
     * @tc.desc open forwards baudRate 115200 dataBits 7 stopBits 2 parity none
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenConfigurationsTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 115200,
        dataBits: 7,
        stopBits: 2,
        parity: 'none' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(115200);
      expect(actual.dataBits).assertEqual(7);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('none');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOpenConfigurationsTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCONFIGURATIONS_1800
     * @tc.desc open forwards baudRate 230400 dataBits 7 stopBits 2 parity even
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenConfigurationsTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 230400,
        dataBits: 7,
        stopBits: 2,
        parity: 'even' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(230400);
      expect(actual.dataBits).assertEqual(7);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('even');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOpenConfigurationsTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCONFIGURATIONS_1900
     * @tc.desc open forwards baudRate 460800 dataBits 7 stopBits 2 parity odd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenConfigurationsTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 460800,
        dataBits: 7,
        stopBits: 2,
        parity: 'odd' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(460800);
      expect(actual.dataBits).assertEqual(7);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('odd');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOpenConfigurationsTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCONFIGURATIONS_2000
     * @tc.desc open forwards baudRate 921600 dataBits 7 stopBits 2 parity mark
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenConfigurationsTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 921600,
        dataBits: 7,
        stopBits: 2,
        parity: 'mark' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(921600);
      expect(actual.dataBits).assertEqual(7);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('mark');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOpenConfigurationsTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCONFIGURATIONS_2100
     * @tc.desc open forwards baudRate 300 dataBits 8 stopBits 2 parity space
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenConfigurationsTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 300,
        dataBits: 8,
        stopBits: 2,
        parity: 'space' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(300);
      expect(actual.dataBits).assertEqual(8);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('space');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOpenConfigurationsTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCONFIGURATIONS_2200
     * @tc.desc open forwards baudRate 1200 dataBits 8 stopBits 2 parity none
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenConfigurationsTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 1200,
        dataBits: 8,
        stopBits: 2,
        parity: 'none' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(1200);
      expect(actual.dataBits).assertEqual(8);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('none');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOpenConfigurationsTest023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCONFIGURATIONS_2300
     * @tc.desc open forwards baudRate 2400 dataBits 8 stopBits 2 parity even
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenConfigurationsTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 2400,
        dataBits: 8,
        stopBits: 2,
        parity: 'even' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(2400);
      expect(actual.dataBits).assertEqual(8);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('even');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOpenConfigurationsTest024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCONFIGURATIONS_2400
     * @tc.desc open forwards baudRate 4800 dataBits 8 stopBits 2 parity odd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenConfigurationsTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 4800,
        dataBits: 8,
        stopBits: 2,
        parity: 'odd' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(4800);
      expect(actual.dataBits).assertEqual(8);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('odd');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOpenConfigurationsTest025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCONFIGURATIONS_2500
     * @tc.desc open forwards baudRate 9600 dataBits 8 stopBits 2 parity mark
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenConfigurationsTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 9600,
        dataBits: 8,
        stopBits: 2,
        parity: 'mark' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(9600);
      expect(actual.dataBits).assertEqual(8);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('mark');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOpenConfigurationsTest026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCONFIGURATIONS_2600
     * @tc.desc open forwards baudRate 19200 dataBits 8 stopBits 2 parity space
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenConfigurationsTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 19200,
        dataBits: 8,
        stopBits: 2,
        parity: 'space' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(19200);
      expect(actual.dataBits).assertEqual(8);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('space');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOpenConfigurationsTest027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCONFIGURATIONS_2700
     * @tc.desc open forwards baudRate 38400 dataBits 8 stopBits 2 parity none
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenConfigurationsTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 38400,
        dataBits: 8,
        stopBits: 2,
        parity: 'none' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(38400);
      expect(actual.dataBits).assertEqual(8);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('none');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOpenConfigurationsTest028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCONFIGURATIONS_2800
     * @tc.desc open forwards baudRate 57600 dataBits 8 stopBits 2 parity even
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenConfigurationsTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 57600,
        dataBits: 8,
        stopBits: 2,
        parity: 'even' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(57600);
      expect(actual.dataBits).assertEqual(8);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('even');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOpenConfigurationsTest029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCONFIGURATIONS_2900
     * @tc.desc open forwards baudRate 115200 dataBits 8 stopBits 2 parity odd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenConfigurationsTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 115200,
        dataBits: 8,
        stopBits: 2,
        parity: 'odd' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(115200);
      expect(actual.dataBits).assertEqual(8);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('odd');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOpenConfigurationsTest030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCONFIGURATIONS_3000
     * @tc.desc open forwards baudRate 230400 dataBits 8 stopBits 2 parity mark
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenConfigurationsTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 230400,
        dataBits: 8,
        stopBits: 2,
        parity: 'mark' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(230400);
      expect(actual.dataBits).assertEqual(8);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('mark');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialOpenConfigurationsTest031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCONFIGURATIONS_3100
     * @tc.desc open forwards baudRate 460800 dataBits 8 stopBits 2 parity space
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenConfigurationsTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 460800,
        dataBits: 8,
        stopBits: 2,
        parity: 'space' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(460800);
      expect(actual.dataBits).assertEqual(8);
      expect(actual.stopBits).assertEqual(2);
      expect(actual.parity).assertEqual('space');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });
  });
}
