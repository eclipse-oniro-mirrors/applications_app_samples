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

export default function SerialSignalSequencesTest(): void {
  describe('SerialSignalSequencesTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialSignalSequences', 'begin');
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
      logSuite('SerialSignalSequences', 'end');
    });

    /**
     * @tc.name SerialSignalSequencesTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_0100
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1101001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1101001';
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
     * @tc.name SerialSignalSequencesTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_0200
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1101010
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1101010';
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
     * @tc.name SerialSignalSequencesTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_0300
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1101011
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1101011';
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
     * @tc.name SerialSignalSequencesTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_0400
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1101100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1101100';
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
     * @tc.name SerialSignalSequencesTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_0500
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1101101
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1101101';
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
     * @tc.name SerialSignalSequencesTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_0600
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1101110
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1101110';
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
     * @tc.name SerialSignalSequencesTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_0700
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1101111
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1101111';
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
     * @tc.name SerialSignalSequencesTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_0800
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1110000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1110000';
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
     * @tc.name SerialSignalSequencesTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_0900
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1110001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1110001';
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
     * @tc.name SerialSignalSequencesTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_1000
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1110010
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1110010';
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
     * @tc.name SerialSignalSequencesTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_1100
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1110011
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1110011';
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
     * @tc.name SerialSignalSequencesTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_1200
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1110100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1110100';
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
     * @tc.name SerialSignalSequencesTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_1300
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1110101
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1110101';
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
     * @tc.name SerialSignalSequencesTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_1400
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1110110
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1110110';
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
     * @tc.name SerialSignalSequencesTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_1500
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1110111
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1110111';
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
     * @tc.name SerialSignalSequencesTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_1600
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1111000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1111000';
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
     * @tc.name SerialSignalSequencesTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_1700
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1111001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1111001';
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
     * @tc.name SerialSignalSequencesTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_1800
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1111010
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1111010';
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
     * @tc.name SerialSignalSequencesTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_1900
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1111011
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1111011';
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
     * @tc.name SerialSignalSequencesTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_2000
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1111100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1111100';
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
     * @tc.name SerialSignalSequencesTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_2100
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1111101
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1111101';
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
     * @tc.name SerialSignalSequencesTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_2200
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1111110
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1111110';
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
     * @tc.name SerialSignalSequencesTest023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_2300
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 1111111
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '1111111';
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
     * @tc.name SerialSignalSequencesTest024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_2400
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 10000000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '10000000';
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
      expect(fixture.port.callCount('setRts')).assertEqual(8);
      expect(fixture.port.callCount('setDtr')).assertEqual(8);
      expect(fixture.port.callCount('getCts')).assertEqual(8);
      expect(fixture.port.callCount('getDsr')).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalSequencesTest025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_2500
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 10000001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '10000001';
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
      expect(fixture.port.callCount('setRts')).assertEqual(8);
      expect(fixture.port.callCount('setDtr')).assertEqual(8);
      expect(fixture.port.callCount('getCts')).assertEqual(8);
      expect(fixture.port.callCount('getDsr')).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalSequencesTest026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_2600
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 10000010
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '10000010';
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
      expect(fixture.port.callCount('setRts')).assertEqual(8);
      expect(fixture.port.callCount('setDtr')).assertEqual(8);
      expect(fixture.port.callCount('getCts')).assertEqual(8);
      expect(fixture.port.callCount('getDsr')).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalSequencesTest027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_2700
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 10000011
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '10000011';
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
      expect(fixture.port.callCount('setRts')).assertEqual(8);
      expect(fixture.port.callCount('setDtr')).assertEqual(8);
      expect(fixture.port.callCount('getCts')).assertEqual(8);
      expect(fixture.port.callCount('getDsr')).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalSequencesTest028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_2800
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 10000100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '10000100';
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
      expect(fixture.port.callCount('setRts')).assertEqual(8);
      expect(fixture.port.callCount('setDtr')).assertEqual(8);
      expect(fixture.port.callCount('getCts')).assertEqual(8);
      expect(fixture.port.callCount('getDsr')).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalSequencesTest029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_2900
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 10000101
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '10000101';
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
      expect(fixture.port.callCount('setRts')).assertEqual(8);
      expect(fixture.port.callCount('setDtr')).assertEqual(8);
      expect(fixture.port.callCount('getCts')).assertEqual(8);
      expect(fixture.port.callCount('getDsr')).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalSequencesTest030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_3000
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 10000110
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '10000110';
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
      expect(fixture.port.callCount('setRts')).assertEqual(8);
      expect(fixture.port.callCount('setDtr')).assertEqual(8);
      expect(fixture.port.callCount('getCts')).assertEqual(8);
      expect(fixture.port.callCount('getDsr')).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalSequencesTest031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_3100
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 10000111
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '10000111';
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
      expect(fixture.port.callCount('setRts')).assertEqual(8);
      expect(fixture.port.callCount('setDtr')).assertEqual(8);
      expect(fixture.port.callCount('getCts')).assertEqual(8);
      expect(fixture.port.callCount('getDsr')).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalSequencesTest032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_3200
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 10001000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '10001000';
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
      expect(fixture.port.callCount('setRts')).assertEqual(8);
      expect(fixture.port.callCount('setDtr')).assertEqual(8);
      expect(fixture.port.callCount('getCts')).assertEqual(8);
      expect(fixture.port.callCount('getDsr')).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalSequencesTest033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_3300
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 10001001
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '10001001';
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
      expect(fixture.port.callCount('setRts')).assertEqual(8);
      expect(fixture.port.callCount('setDtr')).assertEqual(8);
      expect(fixture.port.callCount('getCts')).assertEqual(8);
      expect(fixture.port.callCount('getDsr')).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalSequencesTest034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_3400
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 10001010
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '10001010';
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
      expect(fixture.port.callCount('setRts')).assertEqual(8);
      expect(fixture.port.callCount('setDtr')).assertEqual(8);
      expect(fixture.port.callCount('getCts')).assertEqual(8);
      expect(fixture.port.callCount('getDsr')).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalSequencesTest035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_3500
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 10001011
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '10001011';
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
      expect(fixture.port.callCount('setRts')).assertEqual(8);
      expect(fixture.port.callCount('setDtr')).assertEqual(8);
      expect(fixture.port.callCount('getCts')).assertEqual(8);
      expect(fixture.port.callCount('getDsr')).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalSequencesTest036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_3600
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 10001100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '10001100';
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
      expect(fixture.port.callCount('setRts')).assertEqual(8);
      expect(fixture.port.callCount('setDtr')).assertEqual(8);
      expect(fixture.port.callCount('getCts')).assertEqual(8);
      expect(fixture.port.callCount('getDsr')).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalSequencesTest037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_3700
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 10001101
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '10001101';
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
      expect(fixture.port.callCount('setRts')).assertEqual(8);
      expect(fixture.port.callCount('setDtr')).assertEqual(8);
      expect(fixture.port.callCount('getCts')).assertEqual(8);
      expect(fixture.port.callCount('getDsr')).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialSignalSequencesTest038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSIGNALSEQUENCES_3800
     * @tc.desc setRts setDtr getCts getDsr preserve independent signal sequence 10001110
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSignalSequencesTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const pattern: string = '10001110';
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
      expect(fixture.port.callCount('setRts')).assertEqual(8);
      expect(fixture.port.callCount('setDtr')).assertEqual(8);
      expect(fixture.port.callCount('getCts')).assertEqual(8);
      expect(fixture.port.callCount('getDsr')).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      expectSession(fixture);
    });
  });
}
