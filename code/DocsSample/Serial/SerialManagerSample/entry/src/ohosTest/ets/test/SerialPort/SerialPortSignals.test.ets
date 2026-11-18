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

export default function SerialPortSignalsTest(): void {
  describe('SerialPortSignalsTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialPortSignals', 'begin');
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
      logSuite('SerialPortSignals', 'end');
    });

    /**
     * @tc.name SerialPortSignalsTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSIGNALS_0100
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1010011
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortSignalsTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1010011';
      for (let index: number = 0; index < pattern.length; index++) {
        const enabled: boolean = pattern.charAt(index) === '1';
        fixture.port.cts = !enabled;
        fixture.port.dsr = enabled;
        await fixture.controller.setRts(enabled);
        await fixture.controller.setDtr(!enabled);
        expect(fixture.port.rts).assertEqual(enabled);
        expect(fixture.port.dtr).assertEqual(!enabled);
        expect(await fixture.controller.getCts()).assertEqual(!enabled);
        expect(await fixture.controller.getDsr()).assertEqual(enabled);
      }
      expect(fixture.port.callCount('setRts')).assertEqual(7);
      expect(fixture.port.callCount('setDtr')).assertEqual(7);
      expect(fixture.port.callCount('getCts')).assertEqual(7);
      expect(fixture.port.callCount('getDsr')).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortSignalsTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSIGNALS_0200
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1010100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortSignalsTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1010100';
      for (let index: number = 0; index < pattern.length; index++) {
        const enabled: boolean = pattern.charAt(index) === '1';
        fixture.port.cts = !enabled;
        fixture.port.dsr = enabled;
        await fixture.controller.setRts(enabled);
        await fixture.controller.setDtr(!enabled);
        expect(fixture.port.rts).assertEqual(enabled);
        expect(fixture.port.dtr).assertEqual(!enabled);
        expect(await fixture.controller.getCts()).assertEqual(!enabled);
        expect(await fixture.controller.getDsr()).assertEqual(enabled);
      }
      expect(fixture.port.callCount('setRts')).assertEqual(7);
      expect(fixture.port.callCount('setDtr')).assertEqual(7);
      expect(fixture.port.callCount('getCts')).assertEqual(7);
      expect(fixture.port.callCount('getDsr')).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortSignalsTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSIGNALS_0300
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1010101
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortSignalsTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1010101';
      for (let index: number = 0; index < pattern.length; index++) {
        const enabled: boolean = pattern.charAt(index) === '1';
        fixture.port.cts = !enabled;
        fixture.port.dsr = enabled;
        await fixture.controller.setRts(enabled);
        await fixture.controller.setDtr(!enabled);
        expect(fixture.port.rts).assertEqual(enabled);
        expect(fixture.port.dtr).assertEqual(!enabled);
        expect(await fixture.controller.getCts()).assertEqual(!enabled);
        expect(await fixture.controller.getDsr()).assertEqual(enabled);
      }
      expect(fixture.port.callCount('setRts')).assertEqual(7);
      expect(fixture.port.callCount('setDtr')).assertEqual(7);
      expect(fixture.port.callCount('getCts')).assertEqual(7);
      expect(fixture.port.callCount('getDsr')).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortSignalsTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSIGNALS_0400
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1010110
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortSignalsTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1010110';
      for (let index: number = 0; index < pattern.length; index++) {
        const enabled: boolean = pattern.charAt(index) === '1';
        fixture.port.cts = !enabled;
        fixture.port.dsr = enabled;
        await fixture.controller.setRts(enabled);
        await fixture.controller.setDtr(!enabled);
        expect(fixture.port.rts).assertEqual(enabled);
        expect(fixture.port.dtr).assertEqual(!enabled);
        expect(await fixture.controller.getCts()).assertEqual(!enabled);
        expect(await fixture.controller.getDsr()).assertEqual(enabled);
      }
      expect(fixture.port.callCount('setRts')).assertEqual(7);
      expect(fixture.port.callCount('setDtr')).assertEqual(7);
      expect(fixture.port.callCount('getCts')).assertEqual(7);
      expect(fixture.port.callCount('getDsr')).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortSignalsTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSIGNALS_0500
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1010111
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortSignalsTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1010111';
      for (let index: number = 0; index < pattern.length; index++) {
        const enabled: boolean = pattern.charAt(index) === '1';
        fixture.port.cts = !enabled;
        fixture.port.dsr = enabled;
        await fixture.controller.setRts(enabled);
        await fixture.controller.setDtr(!enabled);
        expect(fixture.port.rts).assertEqual(enabled);
        expect(fixture.port.dtr).assertEqual(!enabled);
        expect(await fixture.controller.getCts()).assertEqual(!enabled);
        expect(await fixture.controller.getDsr()).assertEqual(enabled);
      }
      expect(fixture.port.callCount('setRts')).assertEqual(7);
      expect(fixture.port.callCount('setDtr')).assertEqual(7);
      expect(fixture.port.callCount('getCts')).assertEqual(7);
      expect(fixture.port.callCount('getDsr')).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortSignalsTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSIGNALS_0600
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1011000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortSignalsTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1011000';
      for (let index: number = 0; index < pattern.length; index++) {
        const enabled: boolean = pattern.charAt(index) === '1';
        fixture.port.cts = !enabled;
        fixture.port.dsr = enabled;
        await fixture.controller.setRts(enabled);
        await fixture.controller.setDtr(!enabled);
        expect(fixture.port.rts).assertEqual(enabled);
        expect(fixture.port.dtr).assertEqual(!enabled);
        expect(await fixture.controller.getCts()).assertEqual(!enabled);
        expect(await fixture.controller.getDsr()).assertEqual(enabled);
      }
      expect(fixture.port.callCount('setRts')).assertEqual(7);
      expect(fixture.port.callCount('setDtr')).assertEqual(7);
      expect(fixture.port.callCount('getCts')).assertEqual(7);
      expect(fixture.port.callCount('getDsr')).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortSignalsTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSIGNALS_0700
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1011001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortSignalsTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1011001';
      for (let index: number = 0; index < pattern.length; index++) {
        const enabled: boolean = pattern.charAt(index) === '1';
        fixture.port.cts = !enabled;
        fixture.port.dsr = enabled;
        await fixture.controller.setRts(enabled);
        await fixture.controller.setDtr(!enabled);
        expect(fixture.port.rts).assertEqual(enabled);
        expect(fixture.port.dtr).assertEqual(!enabled);
        expect(await fixture.controller.getCts()).assertEqual(!enabled);
        expect(await fixture.controller.getDsr()).assertEqual(enabled);
      }
      expect(fixture.port.callCount('setRts')).assertEqual(7);
      expect(fixture.port.callCount('setDtr')).assertEqual(7);
      expect(fixture.port.callCount('getCts')).assertEqual(7);
      expect(fixture.port.callCount('getDsr')).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortSignalsTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSIGNALS_0800
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1011010
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortSignalsTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1011010';
      for (let index: number = 0; index < pattern.length; index++) {
        const enabled: boolean = pattern.charAt(index) === '1';
        fixture.port.cts = !enabled;
        fixture.port.dsr = enabled;
        await fixture.controller.setRts(enabled);
        await fixture.controller.setDtr(!enabled);
        expect(fixture.port.rts).assertEqual(enabled);
        expect(fixture.port.dtr).assertEqual(!enabled);
        expect(await fixture.controller.getCts()).assertEqual(!enabled);
        expect(await fixture.controller.getDsr()).assertEqual(enabled);
      }
      expect(fixture.port.callCount('setRts')).assertEqual(7);
      expect(fixture.port.callCount('setDtr')).assertEqual(7);
      expect(fixture.port.callCount('getCts')).assertEqual(7);
      expect(fixture.port.callCount('getDsr')).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortSignalsTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSIGNALS_0900
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1011011
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortSignalsTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1011011';
      for (let index: number = 0; index < pattern.length; index++) {
        const enabled: boolean = pattern.charAt(index) === '1';
        fixture.port.cts = !enabled;
        fixture.port.dsr = enabled;
        await fixture.controller.setRts(enabled);
        await fixture.controller.setDtr(!enabled);
        expect(fixture.port.rts).assertEqual(enabled);
        expect(fixture.port.dtr).assertEqual(!enabled);
        expect(await fixture.controller.getCts()).assertEqual(!enabled);
        expect(await fixture.controller.getDsr()).assertEqual(enabled);
      }
      expect(fixture.port.callCount('setRts')).assertEqual(7);
      expect(fixture.port.callCount('setDtr')).assertEqual(7);
      expect(fixture.port.callCount('getCts')).assertEqual(7);
      expect(fixture.port.callCount('getDsr')).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortSignalsTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSIGNALS_1000
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1011100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortSignalsTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1011100';
      for (let index: number = 0; index < pattern.length; index++) {
        const enabled: boolean = pattern.charAt(index) === '1';
        fixture.port.cts = !enabled;
        fixture.port.dsr = enabled;
        await fixture.controller.setRts(enabled);
        await fixture.controller.setDtr(!enabled);
        expect(fixture.port.rts).assertEqual(enabled);
        expect(fixture.port.dtr).assertEqual(!enabled);
        expect(await fixture.controller.getCts()).assertEqual(!enabled);
        expect(await fixture.controller.getDsr()).assertEqual(enabled);
      }
      expect(fixture.port.callCount('setRts')).assertEqual(7);
      expect(fixture.port.callCount('setDtr')).assertEqual(7);
      expect(fixture.port.callCount('getCts')).assertEqual(7);
      expect(fixture.port.callCount('getDsr')).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortSignalsTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSIGNALS_1100
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1011101
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortSignalsTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1011101';
      for (let index: number = 0; index < pattern.length; index++) {
        const enabled: boolean = pattern.charAt(index) === '1';
        fixture.port.cts = !enabled;
        fixture.port.dsr = enabled;
        await fixture.controller.setRts(enabled);
        await fixture.controller.setDtr(!enabled);
        expect(fixture.port.rts).assertEqual(enabled);
        expect(fixture.port.dtr).assertEqual(!enabled);
        expect(await fixture.controller.getCts()).assertEqual(!enabled);
        expect(await fixture.controller.getDsr()).assertEqual(enabled);
      }
      expect(fixture.port.callCount('setRts')).assertEqual(7);
      expect(fixture.port.callCount('setDtr')).assertEqual(7);
      expect(fixture.port.callCount('getCts')).assertEqual(7);
      expect(fixture.port.callCount('getDsr')).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortSignalsTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSIGNALS_1200
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1011110
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortSignalsTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1011110';
      for (let index: number = 0; index < pattern.length; index++) {
        const enabled: boolean = pattern.charAt(index) === '1';
        fixture.port.cts = !enabled;
        fixture.port.dsr = enabled;
        await fixture.controller.setRts(enabled);
        await fixture.controller.setDtr(!enabled);
        expect(fixture.port.rts).assertEqual(enabled);
        expect(fixture.port.dtr).assertEqual(!enabled);
        expect(await fixture.controller.getCts()).assertEqual(!enabled);
        expect(await fixture.controller.getDsr()).assertEqual(enabled);
      }
      expect(fixture.port.callCount('setRts')).assertEqual(7);
      expect(fixture.port.callCount('setDtr')).assertEqual(7);
      expect(fixture.port.callCount('getCts')).assertEqual(7);
      expect(fixture.port.callCount('getDsr')).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortSignalsTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSIGNALS_1300
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1011111
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortSignalsTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1011111';
      for (let index: number = 0; index < pattern.length; index++) {
        const enabled: boolean = pattern.charAt(index) === '1';
        fixture.port.cts = !enabled;
        fixture.port.dsr = enabled;
        await fixture.controller.setRts(enabled);
        await fixture.controller.setDtr(!enabled);
        expect(fixture.port.rts).assertEqual(enabled);
        expect(fixture.port.dtr).assertEqual(!enabled);
        expect(await fixture.controller.getCts()).assertEqual(!enabled);
        expect(await fixture.controller.getDsr()).assertEqual(enabled);
      }
      expect(fixture.port.callCount('setRts')).assertEqual(7);
      expect(fixture.port.callCount('setDtr')).assertEqual(7);
      expect(fixture.port.callCount('getCts')).assertEqual(7);
      expect(fixture.port.callCount('getDsr')).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortSignalsTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSIGNALS_1400
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1100000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortSignalsTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1100000';
      for (let index: number = 0; index < pattern.length; index++) {
        const enabled: boolean = pattern.charAt(index) === '1';
        fixture.port.cts = !enabled;
        fixture.port.dsr = enabled;
        await fixture.controller.setRts(enabled);
        await fixture.controller.setDtr(!enabled);
        expect(fixture.port.rts).assertEqual(enabled);
        expect(fixture.port.dtr).assertEqual(!enabled);
        expect(await fixture.controller.getCts()).assertEqual(!enabled);
        expect(await fixture.controller.getDsr()).assertEqual(enabled);
      }
      expect(fixture.port.callCount('setRts')).assertEqual(7);
      expect(fixture.port.callCount('setDtr')).assertEqual(7);
      expect(fixture.port.callCount('getCts')).assertEqual(7);
      expect(fixture.port.callCount('getDsr')).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortSignalsTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSIGNALS_1500
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1100001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortSignalsTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1100001';
      for (let index: number = 0; index < pattern.length; index++) {
        const enabled: boolean = pattern.charAt(index) === '1';
        fixture.port.cts = !enabled;
        fixture.port.dsr = enabled;
        await fixture.controller.setRts(enabled);
        await fixture.controller.setDtr(!enabled);
        expect(fixture.port.rts).assertEqual(enabled);
        expect(fixture.port.dtr).assertEqual(!enabled);
        expect(await fixture.controller.getCts()).assertEqual(!enabled);
        expect(await fixture.controller.getDsr()).assertEqual(enabled);
      }
      expect(fixture.port.callCount('setRts')).assertEqual(7);
      expect(fixture.port.callCount('setDtr')).assertEqual(7);
      expect(fixture.port.callCount('getCts')).assertEqual(7);
      expect(fixture.port.callCount('getDsr')).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortSignalsTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSIGNALS_1600
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1100010
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortSignalsTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1100010';
      for (let index: number = 0; index < pattern.length; index++) {
        const enabled: boolean = pattern.charAt(index) === '1';
        fixture.port.cts = !enabled;
        fixture.port.dsr = enabled;
        await fixture.controller.setRts(enabled);
        await fixture.controller.setDtr(!enabled);
        expect(fixture.port.rts).assertEqual(enabled);
        expect(fixture.port.dtr).assertEqual(!enabled);
        expect(await fixture.controller.getCts()).assertEqual(!enabled);
        expect(await fixture.controller.getDsr()).assertEqual(enabled);
      }
      expect(fixture.port.callCount('setRts')).assertEqual(7);
      expect(fixture.port.callCount('setDtr')).assertEqual(7);
      expect(fixture.port.callCount('getCts')).assertEqual(7);
      expect(fixture.port.callCount('getDsr')).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortSignalsTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSIGNALS_1700
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1100011
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortSignalsTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1100011';
      for (let index: number = 0; index < pattern.length; index++) {
        const enabled: boolean = pattern.charAt(index) === '1';
        fixture.port.cts = !enabled;
        fixture.port.dsr = enabled;
        await fixture.controller.setRts(enabled);
        await fixture.controller.setDtr(!enabled);
        expect(fixture.port.rts).assertEqual(enabled);
        expect(fixture.port.dtr).assertEqual(!enabled);
        expect(await fixture.controller.getCts()).assertEqual(!enabled);
        expect(await fixture.controller.getDsr()).assertEqual(enabled);
      }
      expect(fixture.port.callCount('setRts')).assertEqual(7);
      expect(fixture.port.callCount('setDtr')).assertEqual(7);
      expect(fixture.port.callCount('getCts')).assertEqual(7);
      expect(fixture.port.callCount('getDsr')).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortSignalsTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSIGNALS_1800
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1100100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortSignalsTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1100100';
      for (let index: number = 0; index < pattern.length; index++) {
        const enabled: boolean = pattern.charAt(index) === '1';
        fixture.port.cts = !enabled;
        fixture.port.dsr = enabled;
        await fixture.controller.setRts(enabled);
        await fixture.controller.setDtr(!enabled);
        expect(fixture.port.rts).assertEqual(enabled);
        expect(fixture.port.dtr).assertEqual(!enabled);
        expect(await fixture.controller.getCts()).assertEqual(!enabled);
        expect(await fixture.controller.getDsr()).assertEqual(enabled);
      }
      expect(fixture.port.callCount('setRts')).assertEqual(7);
      expect(fixture.port.callCount('setDtr')).assertEqual(7);
      expect(fixture.port.callCount('getCts')).assertEqual(7);
      expect(fixture.port.callCount('getDsr')).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortSignalsTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSIGNALS_1900
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1100101
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortSignalsTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1100101';
      for (let index: number = 0; index < pattern.length; index++) {
        const enabled: boolean = pattern.charAt(index) === '1';
        fixture.port.cts = !enabled;
        fixture.port.dsr = enabled;
        await fixture.controller.setRts(enabled);
        await fixture.controller.setDtr(!enabled);
        expect(fixture.port.rts).assertEqual(enabled);
        expect(fixture.port.dtr).assertEqual(!enabled);
        expect(await fixture.controller.getCts()).assertEqual(!enabled);
        expect(await fixture.controller.getDsr()).assertEqual(enabled);
      }
      expect(fixture.port.callCount('setRts')).assertEqual(7);
      expect(fixture.port.callCount('setDtr')).assertEqual(7);
      expect(fixture.port.callCount('getCts')).assertEqual(7);
      expect(fixture.port.callCount('getDsr')).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortSignalsTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSIGNALS_2000
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1100110
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortSignalsTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1100110';
      for (let index: number = 0; index < pattern.length; index++) {
        const enabled: boolean = pattern.charAt(index) === '1';
        fixture.port.cts = !enabled;
        fixture.port.dsr = enabled;
        await fixture.controller.setRts(enabled);
        await fixture.controller.setDtr(!enabled);
        expect(fixture.port.rts).assertEqual(enabled);
        expect(fixture.port.dtr).assertEqual(!enabled);
        expect(await fixture.controller.getCts()).assertEqual(!enabled);
        expect(await fixture.controller.getDsr()).assertEqual(enabled);
      }
      expect(fixture.port.callCount('setRts')).assertEqual(7);
      expect(fixture.port.callCount('setDtr')).assertEqual(7);
      expect(fixture.port.callCount('getCts')).assertEqual(7);
      expect(fixture.port.callCount('getDsr')).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortSignalsTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSIGNALS_2100
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1100111
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortSignalsTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1100111';
      for (let index: number = 0; index < pattern.length; index++) {
        const enabled: boolean = pattern.charAt(index) === '1';
        fixture.port.cts = !enabled;
        fixture.port.dsr = enabled;
        await fixture.controller.setRts(enabled);
        await fixture.controller.setDtr(!enabled);
        expect(fixture.port.rts).assertEqual(enabled);
        expect(fixture.port.dtr).assertEqual(!enabled);
        expect(await fixture.controller.getCts()).assertEqual(!enabled);
        expect(await fixture.controller.getDsr()).assertEqual(enabled);
      }
      expect(fixture.port.callCount('setRts')).assertEqual(7);
      expect(fixture.port.callCount('setDtr')).assertEqual(7);
      expect(fixture.port.callCount('getCts')).assertEqual(7);
      expect(fixture.port.callCount('getDsr')).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialPortSignalsTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTSIGNALS_2200
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1101000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortSignalsTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1101000';
      for (let index: number = 0; index < pattern.length; index++) {
        const enabled: boolean = pattern.charAt(index) === '1';
        fixture.port.cts = !enabled;
        fixture.port.dsr = enabled;
        await fixture.controller.setRts(enabled);
        await fixture.controller.setDtr(!enabled);
        expect(fixture.port.rts).assertEqual(enabled);
        expect(fixture.port.dtr).assertEqual(!enabled);
        expect(await fixture.controller.getCts()).assertEqual(!enabled);
        expect(await fixture.controller.getDsr()).assertEqual(enabled);
      }
      expect(fixture.port.callCount('setRts')).assertEqual(7);
      expect(fixture.port.callCount('setDtr')).assertEqual(7);
      expect(fixture.port.callCount('getCts')).assertEqual(7);
      expect(fixture.port.callCount('getDsr')).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });
  });
}
