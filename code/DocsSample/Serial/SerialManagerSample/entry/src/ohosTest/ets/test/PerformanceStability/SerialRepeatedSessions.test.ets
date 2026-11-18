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

export default function SerialRepeatedSessionsTest(): void {
  describe('SerialRepeatedSessionsTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialRepeatedSessions', 'begin');
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
      logSuite('SerialRepeatedSessions', 'end');
    });

    /**
     * @tc.name SerialRepeatedSessionsTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALREPEATEDSESSIONS_0100
     * @tc.desc getSerialPortList open close repeat 1 sessions with 32 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialRepeatedSessionsTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index: number = 0; index < 1; index++) {
        await fixture.select();
        await fixture.controller.open();
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
        expect(await fixture.controller.write(payload(32, 0))).assertEqual(32);
        fixture.port.emitData(payload(32, 0));
        expectSession(fixture);
        await fixture.controller.close();
        expectReleased(fixture);
      }
      expect(fixture.port.callCount('open')).assertEqual(1);
      expect(fixture.port.callCount('close')).assertEqual(1);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(32);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
    });

    /**
     * @tc.name SerialRepeatedSessionsTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALREPEATEDSESSIONS_0200
     * @tc.desc getSerialPortList open close repeat 1 sessions with 63 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialRepeatedSessionsTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index: number = 0; index < 1; index++) {
        await fixture.select();
        await fixture.controller.open();
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
        expect(await fixture.controller.write(payload(63, 0))).assertEqual(63);
        fixture.port.emitData(payload(63, 0));
        expectSession(fixture);
        await fixture.controller.close();
        expectReleased(fixture);
      }
      expect(fixture.port.callCount('open')).assertEqual(1);
      expect(fixture.port.callCount('close')).assertEqual(1);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(63);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(63);
    });

    /**
     * @tc.name SerialRepeatedSessionsTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALREPEATEDSESSIONS_0300
     * @tc.desc getSerialPortList open close repeat 1 sessions with 64 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialRepeatedSessionsTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index: number = 0; index < 1; index++) {
        await fixture.select();
        await fixture.controller.open();
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
        expect(await fixture.controller.write(payload(64, 0))).assertEqual(64);
        fixture.port.emitData(payload(64, 0));
        expectSession(fixture);
        await fixture.controller.close();
        expectReleased(fixture);
      }
      expect(fixture.port.callCount('open')).assertEqual(1);
      expect(fixture.port.callCount('close')).assertEqual(1);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(64);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
    });

    /**
     * @tc.name SerialRepeatedSessionsTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALREPEATEDSESSIONS_0400
     * @tc.desc getSerialPortList open close repeat 1 sessions with 127 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialRepeatedSessionsTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index: number = 0; index < 1; index++) {
        await fixture.select();
        await fixture.controller.open();
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
        expect(await fixture.controller.write(payload(127, 0))).assertEqual(127);
        fixture.port.emitData(payload(127, 0));
        expectSession(fixture);
        await fixture.controller.close();
        expectReleased(fixture);
      }
      expect(fixture.port.callCount('open')).assertEqual(1);
      expect(fixture.port.callCount('close')).assertEqual(1);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(127);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(127);
    });

    /**
     * @tc.name SerialRepeatedSessionsTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALREPEATEDSESSIONS_0500
     * @tc.desc getSerialPortList open close repeat 1 sessions with 128 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialRepeatedSessionsTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index: number = 0; index < 1; index++) {
        await fixture.select();
        await fixture.controller.open();
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
        expect(await fixture.controller.write(payload(128, 0))).assertEqual(128);
        fixture.port.emitData(payload(128, 0));
        expectSession(fixture);
        await fixture.controller.close();
        expectReleased(fixture);
      }
      expect(fixture.port.callCount('open')).assertEqual(1);
      expect(fixture.port.callCount('close')).assertEqual(1);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(128);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(128);
    });

    /**
     * @tc.name SerialRepeatedSessionsTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALREPEATEDSESSIONS_0600
     * @tc.desc getSerialPortList open close repeat 1 sessions with 255 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialRepeatedSessionsTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index: number = 0; index < 1; index++) {
        await fixture.select();
        await fixture.controller.open();
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
        expect(await fixture.controller.write(payload(255, 0))).assertEqual(255);
        fixture.port.emitData(payload(255, 0));
        expectSession(fixture);
        await fixture.controller.close();
        expectReleased(fixture);
      }
      expect(fixture.port.callCount('open')).assertEqual(1);
      expect(fixture.port.callCount('close')).assertEqual(1);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(255);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(255);
    });
  });
}
