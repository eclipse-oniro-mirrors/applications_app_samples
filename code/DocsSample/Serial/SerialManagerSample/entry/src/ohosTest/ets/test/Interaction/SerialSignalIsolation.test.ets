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

export default function SerialSignalIsolationTest(): void {
  describe('SerialSignalIsolationTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialSignalIsolation', 'begin');
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
      logSuite('SerialSignalIsolation', 'end');
    });

    /**
     * @tc.name SerialSignalIsolationTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALISOLATION_0100
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 111110
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalIsolationTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '111110';
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
      expect(fixture.port.callCount('setRts')).assertEqual(6);
      expect(fixture.port.callCount('setDtr')).assertEqual(6);
      expect(fixture.port.callCount('getCts')).assertEqual(6);
      expect(fixture.port.callCount('getDsr')).assertEqual(6);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalIsolationTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALISOLATION_0200
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 111111
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalIsolationTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '111111';
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
      expect(fixture.port.callCount('setRts')).assertEqual(6);
      expect(fixture.port.callCount('setDtr')).assertEqual(6);
      expect(fixture.port.callCount('getCts')).assertEqual(6);
      expect(fixture.port.callCount('getDsr')).assertEqual(6);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalIsolationTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALISOLATION_0300
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1000000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalIsolationTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1000000';
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
     * @tc.name SerialSignalIsolationTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALISOLATION_0400
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1000001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalIsolationTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1000001';
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
     * @tc.name SerialSignalIsolationTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALISOLATION_0500
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1000010
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalIsolationTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1000010';
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
     * @tc.name SerialSignalIsolationTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALISOLATION_0600
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1000011
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalIsolationTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1000011';
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
     * @tc.name SerialSignalIsolationTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALISOLATION_0700
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1000100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalIsolationTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1000100';
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
     * @tc.name SerialSignalIsolationTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALISOLATION_0800
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1000101
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalIsolationTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1000101';
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
     * @tc.name SerialSignalIsolationTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALISOLATION_0900
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1000110
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalIsolationTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1000110';
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
     * @tc.name SerialSignalIsolationTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALISOLATION_1000
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1000111
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalIsolationTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1000111';
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
     * @tc.name SerialSignalIsolationTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALISOLATION_1100
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1001000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalIsolationTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1001000';
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
     * @tc.name SerialSignalIsolationTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALISOLATION_1200
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1001001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalIsolationTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1001001';
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
     * @tc.name SerialSignalIsolationTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALISOLATION_1300
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1001010
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalIsolationTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1001010';
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
     * @tc.name SerialSignalIsolationTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALISOLATION_1400
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1001011
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalIsolationTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1001011';
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
     * @tc.name SerialSignalIsolationTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALISOLATION_1500
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1001100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalIsolationTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1001100';
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
     * @tc.name SerialSignalIsolationTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALISOLATION_1600
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1001101
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalIsolationTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1001101';
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
     * @tc.name SerialSignalIsolationTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALISOLATION_1700
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1001110
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalIsolationTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1001110';
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
     * @tc.name SerialSignalIsolationTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALISOLATION_1800
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1001111
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalIsolationTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1001111';
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
     * @tc.name SerialSignalIsolationTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALISOLATION_1900
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1010000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalIsolationTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1010000';
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
     * @tc.name SerialSignalIsolationTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALISOLATION_2000
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1010001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalIsolationTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1010001';
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
     * @tc.name SerialSignalIsolationTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALISOLATION_2100
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1010010
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalIsolationTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1010010';
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
