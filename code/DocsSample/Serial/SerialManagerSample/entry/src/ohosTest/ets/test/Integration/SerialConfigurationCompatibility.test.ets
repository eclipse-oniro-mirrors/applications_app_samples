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

export default function SerialConfigurationCompatibilityTest(): void {
  describe('SerialConfigurationCompatibilityTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialConfigurationCompatibility', 'begin');
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
      logSuite('SerialConfigurationCompatibility', 'end');
    });

    /**
     * @tc.name SerialConfigurationCompatibilityTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONCOMPATIBILITY_0100
     * @tc.desc open forwards baudRate 300 dataBits 5 stopBits 1 parity none
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationCompatibilityTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 300,
        dataBits: 5,
        stopBits: 1,
        parity: 'none' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(300);
      expect(actual.dataBits).assertEqual(5);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('none');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialConfigurationCompatibilityTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONCOMPATIBILITY_0200
     * @tc.desc open forwards baudRate 1200 dataBits 5 stopBits 1 parity even
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationCompatibilityTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 1200,
        dataBits: 5,
        stopBits: 1,
        parity: 'even' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(1200);
      expect(actual.dataBits).assertEqual(5);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('even');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialConfigurationCompatibilityTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONCOMPATIBILITY_0300
     * @tc.desc open forwards baudRate 2400 dataBits 5 stopBits 1 parity odd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationCompatibilityTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 2400,
        dataBits: 5,
        stopBits: 1,
        parity: 'odd' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(2400);
      expect(actual.dataBits).assertEqual(5);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('odd');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialConfigurationCompatibilityTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONCOMPATIBILITY_0400
     * @tc.desc open forwards baudRate 4800 dataBits 5 stopBits 1 parity mark
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationCompatibilityTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 4800,
        dataBits: 5,
        stopBits: 1,
        parity: 'mark' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(4800);
      expect(actual.dataBits).assertEqual(5);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('mark');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialConfigurationCompatibilityTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONCOMPATIBILITY_0500
     * @tc.desc open forwards baudRate 9600 dataBits 5 stopBits 1 parity space
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationCompatibilityTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 9600,
        dataBits: 5,
        stopBits: 1,
        parity: 'space' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(9600);
      expect(actual.dataBits).assertEqual(5);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('space');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialConfigurationCompatibilityTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONCOMPATIBILITY_0600
     * @tc.desc open forwards baudRate 19200 dataBits 5 stopBits 1 parity none
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationCompatibilityTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 19200,
        dataBits: 5,
        stopBits: 1,
        parity: 'none' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(19200);
      expect(actual.dataBits).assertEqual(5);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('none');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialConfigurationCompatibilityTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONCOMPATIBILITY_0700
     * @tc.desc open forwards baudRate 38400 dataBits 5 stopBits 1 parity even
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationCompatibilityTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 38400,
        dataBits: 5,
        stopBits: 1,
        parity: 'even' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(38400);
      expect(actual.dataBits).assertEqual(5);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('even');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialConfigurationCompatibilityTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONCOMPATIBILITY_0800
     * @tc.desc open forwards baudRate 57600 dataBits 5 stopBits 1 parity odd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationCompatibilityTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 57600,
        dataBits: 5,
        stopBits: 1,
        parity: 'odd' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
      await pending;
      expect(fixture.port.configs.length).assertEqual(1);
      const actual: serial.SerialConfigs = fixture.port.configs[0];
      expect(actual.baudRate).assertEqual(57600);
      expect(actual.dataBits).assertEqual(5);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('odd');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialConfigurationCompatibilityTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONCOMPATIBILITY_0900
     * @tc.desc open forwards baudRate 115200 dataBits 5 stopBits 1 parity mark
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationCompatibilityTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 115200,
        dataBits: 5,
        stopBits: 1,
        parity: 'mark' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
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
     * @tc.name SerialConfigurationCompatibilityTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONCOMPATIBILITY_1000
     * @tc.desc open forwards baudRate 230400 dataBits 5 stopBits 1 parity space
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationCompatibilityTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 230400,
        dataBits: 5,
        stopBits: 1,
        parity: 'space' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
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
     * @tc.name SerialConfigurationCompatibilityTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONCOMPATIBILITY_1100
     * @tc.desc open forwards baudRate 460800 dataBits 5 stopBits 1 parity none
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationCompatibilityTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 460800,
        dataBits: 5,
        stopBits: 1,
        parity: 'none' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
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
     * @tc.name SerialConfigurationCompatibilityTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONCOMPATIBILITY_1200
     * @tc.desc open forwards baudRate 921600 dataBits 5 stopBits 1 parity even
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationCompatibilityTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 921600,
        dataBits: 5,
        stopBits: 1,
        parity: 'even' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
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
     * @tc.name SerialConfigurationCompatibilityTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONCOMPATIBILITY_1300
     * @tc.desc open forwards baudRate 300 dataBits 6 stopBits 1 parity odd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationCompatibilityTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 300,
        dataBits: 6,
        stopBits: 1,
        parity: 'odd' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
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
     * @tc.name SerialConfigurationCompatibilityTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONCOMPATIBILITY_1400
     * @tc.desc open forwards baudRate 1200 dataBits 6 stopBits 1 parity mark
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationCompatibilityTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 1200,
        dataBits: 6,
        stopBits: 1,
        parity: 'mark' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
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
     * @tc.name SerialConfigurationCompatibilityTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONCOMPATIBILITY_1500
     * @tc.desc open forwards baudRate 2400 dataBits 6 stopBits 1 parity space
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationCompatibilityTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 2400,
        dataBits: 6,
        stopBits: 1,
        parity: 'space' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
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
     * @tc.name SerialConfigurationCompatibilityTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONCOMPATIBILITY_1600
     * @tc.desc open forwards baudRate 4800 dataBits 6 stopBits 1 parity none
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationCompatibilityTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 4800,
        dataBits: 6,
        stopBits: 1,
        parity: 'none' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
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
     * @tc.name SerialConfigurationCompatibilityTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONCOMPATIBILITY_1700
     * @tc.desc open forwards baudRate 9600 dataBits 6 stopBits 1 parity even
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationCompatibilityTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 9600,
        dataBits: 6,
        stopBits: 1,
        parity: 'even' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
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
     * @tc.name SerialConfigurationCompatibilityTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONCOMPATIBILITY_1800
     * @tc.desc open forwards baudRate 19200 dataBits 6 stopBits 1 parity odd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationCompatibilityTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 19200,
        dataBits: 6,
        stopBits: 1,
        parity: 'odd' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
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
     * @tc.name SerialConfigurationCompatibilityTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONCOMPATIBILITY_1900
     * @tc.desc open forwards baudRate 38400 dataBits 6 stopBits 1 parity mark
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationCompatibilityTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 38400,
        dataBits: 6,
        stopBits: 1,
        parity: 'mark' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
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
     * @tc.name SerialConfigurationCompatibilityTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGURATIONCOMPATIBILITY_2000
     * @tc.desc open forwards baudRate 57600 dataBits 6 stopBits 1 parity space
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigurationCompatibilityTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 57600,
        dataBits: 6,
        stopBits: 1,
        parity: 'space' as serial.Parity
      };
      const pending: Promise<void> = fixture.controller.open(config);
      expect(fixture.controller.snapshot().opened).assertFalse();
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
  });
}
