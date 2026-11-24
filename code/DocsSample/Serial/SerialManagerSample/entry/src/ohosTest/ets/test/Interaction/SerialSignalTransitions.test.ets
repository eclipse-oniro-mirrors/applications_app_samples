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

export default function SerialSignalTransitionsTest(): void {
  describe('SerialSignalTransitionsTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialSignalTransitions', 'begin');
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
      logSuite('SerialSignalTransitions', 'end');
    });

    /**
     * @tc.name SerialSignalTransitionsTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_0100
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1';
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
      expect(fixture.port.callCount('setRts')).assertEqual(1);
      expect(fixture.port.callCount('setDtr')).assertEqual(1);
      expect(fixture.port.callCount('getCts')).assertEqual(1);
      expect(fixture.port.callCount('getDsr')).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalTransitionsTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_0200
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '10';
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
      expect(fixture.port.callCount('setRts')).assertEqual(2);
      expect(fixture.port.callCount('setDtr')).assertEqual(2);
      expect(fixture.port.callCount('getCts')).assertEqual(2);
      expect(fixture.port.callCount('getDsr')).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalTransitionsTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_0300
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 11
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '11';
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
      expect(fixture.port.callCount('setRts')).assertEqual(2);
      expect(fixture.port.callCount('setDtr')).assertEqual(2);
      expect(fixture.port.callCount('getCts')).assertEqual(2);
      expect(fixture.port.callCount('getDsr')).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalTransitionsTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_0400
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '100';
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
      expect(fixture.port.callCount('setRts')).assertEqual(3);
      expect(fixture.port.callCount('setDtr')).assertEqual(3);
      expect(fixture.port.callCount('getCts')).assertEqual(3);
      expect(fixture.port.callCount('getDsr')).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalTransitionsTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_0500
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 101
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '101';
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
      expect(fixture.port.callCount('setRts')).assertEqual(3);
      expect(fixture.port.callCount('setDtr')).assertEqual(3);
      expect(fixture.port.callCount('getCts')).assertEqual(3);
      expect(fixture.port.callCount('getDsr')).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalTransitionsTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_0600
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 110
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '110';
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
      expect(fixture.port.callCount('setRts')).assertEqual(3);
      expect(fixture.port.callCount('setDtr')).assertEqual(3);
      expect(fixture.port.callCount('getCts')).assertEqual(3);
      expect(fixture.port.callCount('getDsr')).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalTransitionsTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_0700
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 111
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '111';
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
      expect(fixture.port.callCount('setRts')).assertEqual(3);
      expect(fixture.port.callCount('setDtr')).assertEqual(3);
      expect(fixture.port.callCount('getCts')).assertEqual(3);
      expect(fixture.port.callCount('getDsr')).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalTransitionsTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_0800
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1000';
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
      expect(fixture.port.callCount('setRts')).assertEqual(4);
      expect(fixture.port.callCount('setDtr')).assertEqual(4);
      expect(fixture.port.callCount('getCts')).assertEqual(4);
      expect(fixture.port.callCount('getDsr')).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalTransitionsTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_0900
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1001';
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
      expect(fixture.port.callCount('setRts')).assertEqual(4);
      expect(fixture.port.callCount('setDtr')).assertEqual(4);
      expect(fixture.port.callCount('getCts')).assertEqual(4);
      expect(fixture.port.callCount('getDsr')).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalTransitionsTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_1000
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1010
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1010';
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
      expect(fixture.port.callCount('setRts')).assertEqual(4);
      expect(fixture.port.callCount('setDtr')).assertEqual(4);
      expect(fixture.port.callCount('getCts')).assertEqual(4);
      expect(fixture.port.callCount('getDsr')).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalTransitionsTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_1100
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1011
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1011';
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
      expect(fixture.port.callCount('setRts')).assertEqual(4);
      expect(fixture.port.callCount('setDtr')).assertEqual(4);
      expect(fixture.port.callCount('getCts')).assertEqual(4);
      expect(fixture.port.callCount('getDsr')).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalTransitionsTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_1200
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1100';
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
      expect(fixture.port.callCount('setRts')).assertEqual(4);
      expect(fixture.port.callCount('setDtr')).assertEqual(4);
      expect(fixture.port.callCount('getCts')).assertEqual(4);
      expect(fixture.port.callCount('getDsr')).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalTransitionsTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_1300
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1101
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1101';
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
      expect(fixture.port.callCount('setRts')).assertEqual(4);
      expect(fixture.port.callCount('setDtr')).assertEqual(4);
      expect(fixture.port.callCount('getCts')).assertEqual(4);
      expect(fixture.port.callCount('getDsr')).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalTransitionsTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_1400
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1110
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1110';
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
      expect(fixture.port.callCount('setRts')).assertEqual(4);
      expect(fixture.port.callCount('setDtr')).assertEqual(4);
      expect(fixture.port.callCount('getCts')).assertEqual(4);
      expect(fixture.port.callCount('getDsr')).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalTransitionsTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_1500
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1111
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1111';
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
      expect(fixture.port.callCount('setRts')).assertEqual(4);
      expect(fixture.port.callCount('setDtr')).assertEqual(4);
      expect(fixture.port.callCount('getCts')).assertEqual(4);
      expect(fixture.port.callCount('getDsr')).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalTransitionsTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_1600
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 10000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '10000';
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
      expect(fixture.port.callCount('setRts')).assertEqual(5);
      expect(fixture.port.callCount('setDtr')).assertEqual(5);
      expect(fixture.port.callCount('getCts')).assertEqual(5);
      expect(fixture.port.callCount('getDsr')).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalTransitionsTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_1700
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 10001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '10001';
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
      expect(fixture.port.callCount('setRts')).assertEqual(5);
      expect(fixture.port.callCount('setDtr')).assertEqual(5);
      expect(fixture.port.callCount('getCts')).assertEqual(5);
      expect(fixture.port.callCount('getDsr')).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalTransitionsTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_1800
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 10010
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '10010';
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
      expect(fixture.port.callCount('setRts')).assertEqual(5);
      expect(fixture.port.callCount('setDtr')).assertEqual(5);
      expect(fixture.port.callCount('getCts')).assertEqual(5);
      expect(fixture.port.callCount('getDsr')).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalTransitionsTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_1900
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 10011
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '10011';
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
      expect(fixture.port.callCount('setRts')).assertEqual(5);
      expect(fixture.port.callCount('setDtr')).assertEqual(5);
      expect(fixture.port.callCount('getCts')).assertEqual(5);
      expect(fixture.port.callCount('getDsr')).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalTransitionsTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_2000
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 10100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '10100';
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
      expect(fixture.port.callCount('setRts')).assertEqual(5);
      expect(fixture.port.callCount('setDtr')).assertEqual(5);
      expect(fixture.port.callCount('getCts')).assertEqual(5);
      expect(fixture.port.callCount('getDsr')).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalTransitionsTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_2100
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 10101
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '10101';
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
      expect(fixture.port.callCount('setRts')).assertEqual(5);
      expect(fixture.port.callCount('setDtr')).assertEqual(5);
      expect(fixture.port.callCount('getCts')).assertEqual(5);
      expect(fixture.port.callCount('getDsr')).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalTransitionsTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_2200
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 10110
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '10110';
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
      expect(fixture.port.callCount('setRts')).assertEqual(5);
      expect(fixture.port.callCount('setDtr')).assertEqual(5);
      expect(fixture.port.callCount('getCts')).assertEqual(5);
      expect(fixture.port.callCount('getDsr')).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalTransitionsTest023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_2300
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 10111
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '10111';
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
      expect(fixture.port.callCount('setRts')).assertEqual(5);
      expect(fixture.port.callCount('setDtr')).assertEqual(5);
      expect(fixture.port.callCount('getCts')).assertEqual(5);
      expect(fixture.port.callCount('getDsr')).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalTransitionsTest024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_2400
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 11000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '11000';
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
      expect(fixture.port.callCount('setRts')).assertEqual(5);
      expect(fixture.port.callCount('setDtr')).assertEqual(5);
      expect(fixture.port.callCount('getCts')).assertEqual(5);
      expect(fixture.port.callCount('getDsr')).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalTransitionsTest025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_2500
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 11001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '11001';
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
      expect(fixture.port.callCount('setRts')).assertEqual(5);
      expect(fixture.port.callCount('setDtr')).assertEqual(5);
      expect(fixture.port.callCount('getCts')).assertEqual(5);
      expect(fixture.port.callCount('getDsr')).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalTransitionsTest026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_2600
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 11010
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '11010';
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
      expect(fixture.port.callCount('setRts')).assertEqual(5);
      expect(fixture.port.callCount('setDtr')).assertEqual(5);
      expect(fixture.port.callCount('getCts')).assertEqual(5);
      expect(fixture.port.callCount('getDsr')).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalTransitionsTest027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_2700
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 11011
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '11011';
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
      expect(fixture.port.callCount('setRts')).assertEqual(5);
      expect(fixture.port.callCount('setDtr')).assertEqual(5);
      expect(fixture.port.callCount('getCts')).assertEqual(5);
      expect(fixture.port.callCount('getDsr')).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalTransitionsTest028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_2800
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 11100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '11100';
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
      expect(fixture.port.callCount('setRts')).assertEqual(5);
      expect(fixture.port.callCount('setDtr')).assertEqual(5);
      expect(fixture.port.callCount('getCts')).assertEqual(5);
      expect(fixture.port.callCount('getDsr')).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalTransitionsTest029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_2900
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 11101
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '11101';
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
      expect(fixture.port.callCount('setRts')).assertEqual(5);
      expect(fixture.port.callCount('setDtr')).assertEqual(5);
      expect(fixture.port.callCount('getCts')).assertEqual(5);
      expect(fixture.port.callCount('getDsr')).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalTransitionsTest030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_3000
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 11110
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '11110';
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
      expect(fixture.port.callCount('setRts')).assertEqual(5);
      expect(fixture.port.callCount('setDtr')).assertEqual(5);
      expect(fixture.port.callCount('getCts')).assertEqual(5);
      expect(fixture.port.callCount('getDsr')).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalTransitionsTest031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_3100
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 11111
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '11111';
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
      expect(fixture.port.callCount('setRts')).assertEqual(5);
      expect(fixture.port.callCount('setDtr')).assertEqual(5);
      expect(fixture.port.callCount('getCts')).assertEqual(5);
      expect(fixture.port.callCount('getDsr')).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalTransitionsTest032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_3200
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 100000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '100000';
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
     * @tc.name SerialSignalTransitionsTest033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_3300
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 100001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '100001';
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
     * @tc.name SerialSignalTransitionsTest034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_3400
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 100010
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '100010';
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
     * @tc.name SerialSignalTransitionsTest035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_3500
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 100011
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '100011';
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
     * @tc.name SerialSignalTransitionsTest036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_3600
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 100100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '100100';
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
     * @tc.name SerialSignalTransitionsTest037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_3700
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 100101
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '100101';
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
     * @tc.name SerialSignalTransitionsTest038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_3800
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 100110
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '100110';
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
     * @tc.name SerialSignalTransitionsTest039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALTRANSITIONS_3900
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 100111
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalTransitionsTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '100111';
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
  });
}
