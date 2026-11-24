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

export default function SerialUnselectedGuardsTest(): void {
  describe('SerialUnselectedGuardsTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialUnselectedGuards', 'begin');
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
      logSuite('SerialUnselectedGuards', 'end');
    });

    /**
     * @tc.name SerialUnselectedGuardsTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUNSELECTEDGUARDS_0100
     * @tc.desc flush rejects a missing port after close of a 2048 byte session vector 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUnselectedGuardsTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(2048, 0))).assertEqual(2048);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'flush'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2048);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialUnselectedGuardsTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUNSELECTEDGUARDS_0200
     * @tc.desc drain rejects a missing port after close of a 4095 byte session vector 21
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUnselectedGuardsTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(4095, 0))).assertEqual(4095);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'drain'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4095);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialUnselectedGuardsTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUNSELECTEDGUARDS_0300
     * @tc.desc setRts rejects a missing port after close of a 4096 byte session vector 22
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUnselectedGuardsTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(4096, 0))).assertEqual(4096);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'setRts'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4096);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialUnselectedGuardsTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUNSELECTEDGUARDS_0400
     * @tc.desc getCts rejects a missing port after close of a 1 byte session vector 23
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUnselectedGuardsTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(1, 1))).assertEqual(1);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'getCts'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialUnselectedGuardsTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUNSELECTEDGUARDS_0500
     * @tc.desc setDtr rejects a missing port after close of a 2 byte session vector 24
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUnselectedGuardsTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(2, 1))).assertEqual(2);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'setDtr'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialUnselectedGuardsTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUNSELECTEDGUARDS_0600
     * @tc.desc getDsr rejects a missing port after close of a 3 byte session vector 25
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUnselectedGuardsTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(3, 1))).assertEqual(3);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'getDsr'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialUnselectedGuardsTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUNSELECTEDGUARDS_0700
     * @tc.desc sendBrk rejects a missing port after close of a 4 byte session vector 26
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUnselectedGuardsTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(4, 1))).assertEqual(4);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'sendBrk'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialUnselectedGuardsTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUNSELECTEDGUARDS_0800
     * @tc.desc close rejects a missing port after close of a 5 byte session vector 27
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUnselectedGuardsTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(5, 1))).assertEqual(5);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'close'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialUnselectedGuardsTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUNSELECTEDGUARDS_0900
     * @tc.desc onDisconnect rejects a missing port after close of a 7 byte session vector 28
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUnselectedGuardsTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(7, 1))).assertEqual(7);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'onDisconnect'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialUnselectedGuardsTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUNSELECTEDGUARDS_1000
     * @tc.desc offDisconnect rejects a missing port after close of a 8 byte session vector 29
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUnselectedGuardsTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(8, 1))).assertEqual(8);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'offDisconnect'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialUnselectedGuardsTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUNSELECTEDGUARDS_1100
     * @tc.desc portInfo rejects a missing port after close of a 16 byte session vector 30
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUnselectedGuardsTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(16, 1))).assertEqual(16);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'portInfo'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialUnselectedGuardsTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUNSELECTEDGUARDS_1200
     * @tc.desc open rejects a missing port after close of a 31 byte session vector 31
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUnselectedGuardsTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(31, 1))).assertEqual(31);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'open'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(31);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialUnselectedGuardsTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUNSELECTEDGUARDS_1300
     * @tc.desc write rejects a missing port after close of a 32 byte session vector 32
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUnselectedGuardsTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(32, 1))).assertEqual(32);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'write'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialUnselectedGuardsTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUNSELECTEDGUARDS_1400
     * @tc.desc onDataRead rejects a missing port after close of a 63 byte session vector 33
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUnselectedGuardsTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(63, 1))).assertEqual(63);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'onDataRead'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(63);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialUnselectedGuardsTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUNSELECTEDGUARDS_1500
     * @tc.desc offDataRead rejects a missing port after close of a 64 byte session vector 34
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUnselectedGuardsTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(64, 1))).assertEqual(64);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'offDataRead'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialUnselectedGuardsTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUNSELECTEDGUARDS_1600
     * @tc.desc flush rejects a missing port after close of a 127 byte session vector 35
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUnselectedGuardsTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(127, 1))).assertEqual(127);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'flush'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(127);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialUnselectedGuardsTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUNSELECTEDGUARDS_1700
     * @tc.desc drain rejects a missing port after close of a 128 byte session vector 36
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUnselectedGuardsTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(128, 1))).assertEqual(128);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'drain'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(128);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialUnselectedGuardsTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUNSELECTEDGUARDS_1800
     * @tc.desc setRts rejects a missing port after close of a 255 byte session vector 37
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUnselectedGuardsTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(255, 1))).assertEqual(255);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'setRts'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(255);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialUnselectedGuardsTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUNSELECTEDGUARDS_1900
     * @tc.desc getCts rejects a missing port after close of a 256 byte session vector 38
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUnselectedGuardsTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(256, 1))).assertEqual(256);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'getCts'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(256);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialUnselectedGuardsTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUNSELECTEDGUARDS_2000
     * @tc.desc setDtr rejects a missing port after close of a 511 byte session vector 39
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUnselectedGuardsTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(511, 1))).assertEqual(511);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'setDtr'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(511);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialUnselectedGuardsTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUNSELECTEDGUARDS_2100
     * @tc.desc getDsr rejects a missing port after close of a 512 byte session vector 40
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUnselectedGuardsTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(512, 1))).assertEqual(512);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'getDsr'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(512);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialUnselectedGuardsTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUNSELECTEDGUARDS_2200
     * @tc.desc sendBrk rejects a missing port after close of a 1023 byte session vector 41
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUnselectedGuardsTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(1023, 1))).assertEqual(1023);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'sendBrk'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1023);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialUnselectedGuardsTest023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUNSELECTEDGUARDS_2300
     * @tc.desc close rejects a missing port after close of a 1024 byte session vector 42
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUnselectedGuardsTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(1024, 1))).assertEqual(1024);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'close'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1024);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialUnselectedGuardsTest024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUNSELECTEDGUARDS_2400
     * @tc.desc onDisconnect rejects a missing port after close of a 2048 byte session vector 43
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUnselectedGuardsTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(2048, 1))).assertEqual(2048);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'onDisconnect'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2048);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });
  });
}
