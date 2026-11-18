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

export default function SerialStatusReadbackTest(): void {
  describe('SerialStatusReadbackTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialStatusReadback', 'begin');
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
      logSuite('SerialStatusReadback', 'end');
    });

    /**
     * @tc.name SerialStatusReadbackTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSTATUSREADBACK_0100
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 101000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialStatusReadbackTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '101000';
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
     * @tc.name SerialStatusReadbackTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSTATUSREADBACK_0200
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 101001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialStatusReadbackTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '101001';
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
     * @tc.name SerialStatusReadbackTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSTATUSREADBACK_0300
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 101010
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialStatusReadbackTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '101010';
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
     * @tc.name SerialStatusReadbackTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSTATUSREADBACK_0400
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 101011
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialStatusReadbackTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '101011';
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
     * @tc.name SerialStatusReadbackTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSTATUSREADBACK_0500
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 101100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialStatusReadbackTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '101100';
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
     * @tc.name SerialStatusReadbackTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSTATUSREADBACK_0600
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 101101
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialStatusReadbackTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '101101';
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
     * @tc.name SerialStatusReadbackTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSTATUSREADBACK_0700
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 101110
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialStatusReadbackTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '101110';
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
     * @tc.name SerialStatusReadbackTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSTATUSREADBACK_0800
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 101111
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialStatusReadbackTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '101111';
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
     * @tc.name SerialStatusReadbackTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSTATUSREADBACK_0900
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 110000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialStatusReadbackTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '110000';
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
     * @tc.name SerialStatusReadbackTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSTATUSREADBACK_1000
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 110001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialStatusReadbackTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '110001';
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
     * @tc.name SerialStatusReadbackTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSTATUSREADBACK_1100
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 110010
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialStatusReadbackTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '110010';
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
     * @tc.name SerialStatusReadbackTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSTATUSREADBACK_1200
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 110011
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialStatusReadbackTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '110011';
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
     * @tc.name SerialStatusReadbackTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSTATUSREADBACK_1300
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 110100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialStatusReadbackTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '110100';
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
     * @tc.name SerialStatusReadbackTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSTATUSREADBACK_1400
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 110101
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialStatusReadbackTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '110101';
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
     * @tc.name SerialStatusReadbackTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSTATUSREADBACK_1500
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 110110
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialStatusReadbackTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '110110';
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
     * @tc.name SerialStatusReadbackTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSTATUSREADBACK_1600
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 110111
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialStatusReadbackTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '110111';
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
     * @tc.name SerialStatusReadbackTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSTATUSREADBACK_1700
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 111000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialStatusReadbackTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '111000';
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
     * @tc.name SerialStatusReadbackTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSTATUSREADBACK_1800
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 111001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialStatusReadbackTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '111001';
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
     * @tc.name SerialStatusReadbackTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSTATUSREADBACK_1900
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 111010
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialStatusReadbackTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '111010';
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
     * @tc.name SerialStatusReadbackTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSTATUSREADBACK_2000
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 111011
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialStatusReadbackTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '111011';
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
     * @tc.name SerialStatusReadbackTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSTATUSREADBACK_2100
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 111100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialStatusReadbackTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '111100';
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
     * @tc.name SerialStatusReadbackTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSTATUSREADBACK_2200
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 111101
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialStatusReadbackTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '111101';
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
