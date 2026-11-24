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

export default function SerialConfigOwnershipTest(): void {
  describe('SerialConfigOwnershipTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialConfigOwnership', 'begin');
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
      logSuite('SerialConfigOwnership', 'end');
    });

    /**
     * @tc.name SerialConfigOwnershipTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGOWNERSHIP_0100
     * @tc.desc open forwards baudRate 300 dataBits 5 stopBits 1 parity none and owns the queued config
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigOwnershipTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 300,
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
      expect(actual.baudRate).assertEqual(300);
      expect(actual.dataBits).assertEqual(5);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('none');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialConfigOwnershipTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGOWNERSHIP_0200
     * @tc.desc open forwards baudRate 1200 dataBits 5 stopBits 1 parity even and owns the queued config
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigOwnershipTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 1200,
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
      expect(actual.baudRate).assertEqual(1200);
      expect(actual.dataBits).assertEqual(5);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('even');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialConfigOwnershipTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGOWNERSHIP_0300
     * @tc.desc open forwards baudRate 2400 dataBits 5 stopBits 1 parity odd and owns the queued config
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigOwnershipTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 2400,
        dataBits: 5,
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
      expect(actual.baudRate).assertEqual(2400);
      expect(actual.dataBits).assertEqual(5);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('odd');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialConfigOwnershipTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGOWNERSHIP_0400
     * @tc.desc open forwards baudRate 4800 dataBits 5 stopBits 1 parity mark and owns the queued config
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigOwnershipTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 4800,
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
      expect(actual.baudRate).assertEqual(4800);
      expect(actual.dataBits).assertEqual(5);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('mark');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialConfigOwnershipTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGOWNERSHIP_0500
     * @tc.desc open forwards baudRate 9600 dataBits 5 stopBits 1 parity space and owns the queued config
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigOwnershipTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 9600,
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
      expect(actual.baudRate).assertEqual(9600);
      expect(actual.dataBits).assertEqual(5);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('space');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialConfigOwnershipTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGOWNERSHIP_0600
     * @tc.desc open forwards baudRate 19200 dataBits 5 stopBits 1 parity none and owns the queued config
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigOwnershipTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 19200,
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
      expect(actual.baudRate).assertEqual(19200);
      expect(actual.dataBits).assertEqual(5);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('none');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialConfigOwnershipTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGOWNERSHIP_0700
     * @tc.desc open forwards baudRate 38400 dataBits 5 stopBits 1 parity even and owns the queued config
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigOwnershipTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 38400,
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
      expect(actual.baudRate).assertEqual(38400);
      expect(actual.dataBits).assertEqual(5);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('even');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });

    /**
     * @tc.name SerialConfigOwnershipTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONFIGOWNERSHIP_0800
     * @tc.desc open forwards baudRate 57600 dataBits 5 stopBits 1 parity odd and owns the queued config
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialConfigOwnershipTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.select();
      const config: serial.SerialConfigs = {
        baudRate: 57600,
        dataBits: 5,
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
      expect(actual.baudRate).assertEqual(57600);
      expect(actual.dataBits).assertEqual(5);
      expect(actual.stopBits).assertEqual(1);
      expect(actual.parity).assertEqual('odd');
      expect(actual === config).assertFalse();
      expectSession(fixture);
    });
  });
}
