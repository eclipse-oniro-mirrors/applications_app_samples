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

export default function SerialPortGuardsTest(): void {
  describe('SerialPortGuardsTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialPortGuards', 'begin');
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
      logSuite('SerialPortGuards', 'end');
    });

    /**
     * @tc.name SerialPortGuardsTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTGUARDS_0100
     * @tc.desc portInfo rejects a missing port after close of a 1 byte session vector 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortGuardsTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(1, 0))).assertEqual(1);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'portInfo'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialPortGuardsTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTGUARDS_0200
     * @tc.desc open rejects a missing port after close of a 2 byte session vector 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortGuardsTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(2, 0))).assertEqual(2);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'open'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialPortGuardsTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTGUARDS_0300
     * @tc.desc write rejects a missing port after close of a 3 byte session vector 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortGuardsTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(3, 0))).assertEqual(3);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'write'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialPortGuardsTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTGUARDS_0400
     * @tc.desc onDataRead rejects a missing port after close of a 4 byte session vector 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortGuardsTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(4, 0))).assertEqual(4);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'onDataRead'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialPortGuardsTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTGUARDS_0500
     * @tc.desc offDataRead rejects a missing port after close of a 5 byte session vector 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortGuardsTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(5, 0))).assertEqual(5);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'offDataRead'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialPortGuardsTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTGUARDS_0600
     * @tc.desc flush rejects a missing port after close of a 7 byte session vector 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortGuardsTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(7, 0))).assertEqual(7);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'flush'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialPortGuardsTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTGUARDS_0700
     * @tc.desc drain rejects a missing port after close of a 8 byte session vector 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortGuardsTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(8, 0))).assertEqual(8);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'drain'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialPortGuardsTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTGUARDS_0800
     * @tc.desc setRts rejects a missing port after close of a 16 byte session vector 7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortGuardsTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(16, 0))).assertEqual(16);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'setRts'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialPortGuardsTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTGUARDS_0900
     * @tc.desc getCts rejects a missing port after close of a 31 byte session vector 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortGuardsTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(31, 0))).assertEqual(31);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'getCts'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(31);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialPortGuardsTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTGUARDS_1000
     * @tc.desc setDtr rejects a missing port after close of a 32 byte session vector 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortGuardsTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(32, 0))).assertEqual(32);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'setDtr'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialPortGuardsTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTGUARDS_1100
     * @tc.desc getDsr rejects a missing port after close of a 63 byte session vector 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortGuardsTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(63, 0))).assertEqual(63);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'getDsr'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(63);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialPortGuardsTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTGUARDS_1200
     * @tc.desc sendBrk rejects a missing port after close of a 64 byte session vector 11
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortGuardsTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(64, 0))).assertEqual(64);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'sendBrk'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialPortGuardsTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTGUARDS_1300
     * @tc.desc close rejects a missing port after close of a 127 byte session vector 12
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortGuardsTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(127, 0))).assertEqual(127);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'close'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(127);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialPortGuardsTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTGUARDS_1400
     * @tc.desc onDisconnect rejects a missing port after close of a 128 byte session vector 13
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortGuardsTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(128, 0))).assertEqual(128);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'onDisconnect'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(128);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialPortGuardsTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTGUARDS_1500
     * @tc.desc offDisconnect rejects a missing port after close of a 255 byte session vector 14
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortGuardsTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(255, 0))).assertEqual(255);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'offDisconnect'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(255);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialPortGuardsTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTGUARDS_1600
     * @tc.desc portInfo rejects a missing port after close of a 256 byte session vector 15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortGuardsTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(256, 0))).assertEqual(256);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'portInfo'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(256);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialPortGuardsTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTGUARDS_1700
     * @tc.desc open rejects a missing port after close of a 511 byte session vector 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortGuardsTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(511, 0))).assertEqual(511);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'open'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(511);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialPortGuardsTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTGUARDS_1800
     * @tc.desc write rejects a missing port after close of a 512 byte session vector 17
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortGuardsTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(512, 0))).assertEqual(512);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'write'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(512);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialPortGuardsTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTGUARDS_1900
     * @tc.desc onDataRead rejects a missing port after close of a 1023 byte session vector 18
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortGuardsTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(1023, 0))).assertEqual(1023);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'onDataRead'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1023);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });

    /**
     * @tc.name SerialPortGuardsTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTGUARDS_2000
     * @tc.desc offDataRead rejects a missing port after close of a 1024 byte session vector 19
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortGuardsTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      expect(await fixture.controller.write(payload(1024, 0))).assertEqual(1024);
      await fixture.controller.close();
      const callsBefore: number = fixture.port.calls.length;
      await expectFailure(async () => invokeOperation(fixture.controller, 'offDataRead'), 'SerialStateError');
      expect(fixture.port.calls.length).assertEqual(callsBefore);
      expectReleased(fixture);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1024);
      await fixture.select();
      await fixture.controller.open();
      expectSession(fixture);
      expect(fixture.port.callCount('open')).assertEqual(2);
    });
  });
}
