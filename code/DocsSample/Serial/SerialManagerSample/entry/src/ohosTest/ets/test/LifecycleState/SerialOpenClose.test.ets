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

export default function SerialOpenCloseTest(): void {
  describe('SerialOpenCloseTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialOpenClose', 'begin');
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
      logSuite('SerialOpenClose', 'end');
    });

    /**
     * @tc.name SerialOpenCloseTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCLOSE_0100
     * @tc.desc getSerialPortList open close repeat 1 sessions with 1 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenCloseTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index: number = 0; index < 1; index++) {
        await fixture.select();
        await fixture.controller.open();
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
        expect(await fixture.controller.write(payload(1, 0))).assertEqual(1);
        fixture.port.emitData(payload(1, 0));
        expectSession(fixture);
        await fixture.controller.close();
        expectReleased(fixture);
      }
      expect(fixture.port.callCount('open')).assertEqual(1);
      expect(fixture.port.callCount('close')).assertEqual(1);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
    });

    /**
     * @tc.name SerialOpenCloseTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCLOSE_0200
     * @tc.desc getSerialPortList open close repeat 1 sessions with 2 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenCloseTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index: number = 0; index < 1; index++) {
        await fixture.select();
        await fixture.controller.open();
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
        expect(await fixture.controller.write(payload(2, 0))).assertEqual(2);
        fixture.port.emitData(payload(2, 0));
        expectSession(fixture);
        await fixture.controller.close();
        expectReleased(fixture);
      }
      expect(fixture.port.callCount('open')).assertEqual(1);
      expect(fixture.port.callCount('close')).assertEqual(1);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
    });

    /**
     * @tc.name SerialOpenCloseTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCLOSE_0300
     * @tc.desc getSerialPortList open close repeat 1 sessions with 3 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenCloseTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index: number = 0; index < 1; index++) {
        await fixture.select();
        await fixture.controller.open();
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
        expect(await fixture.controller.write(payload(3, 0))).assertEqual(3);
        fixture.port.emitData(payload(3, 0));
        expectSession(fixture);
        await fixture.controller.close();
        expectReleased(fixture);
      }
      expect(fixture.port.callCount('open')).assertEqual(1);
      expect(fixture.port.callCount('close')).assertEqual(1);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
    });

    /**
     * @tc.name SerialOpenCloseTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCLOSE_0400
     * @tc.desc getSerialPortList open close repeat 1 sessions with 4 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenCloseTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index: number = 0; index < 1; index++) {
        await fixture.select();
        await fixture.controller.open();
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
        expect(await fixture.controller.write(payload(4, 0))).assertEqual(4);
        fixture.port.emitData(payload(4, 0));
        expectSession(fixture);
        await fixture.controller.close();
        expectReleased(fixture);
      }
      expect(fixture.port.callCount('open')).assertEqual(1);
      expect(fixture.port.callCount('close')).assertEqual(1);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
    });

    /**
     * @tc.name SerialOpenCloseTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCLOSE_0500
     * @tc.desc getSerialPortList open close repeat 1 sessions with 5 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenCloseTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index: number = 0; index < 1; index++) {
        await fixture.select();
        await fixture.controller.open();
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
        expect(await fixture.controller.write(payload(5, 0))).assertEqual(5);
        fixture.port.emitData(payload(5, 0));
        expectSession(fixture);
        await fixture.controller.close();
        expectReleased(fixture);
      }
      expect(fixture.port.callCount('open')).assertEqual(1);
      expect(fixture.port.callCount('close')).assertEqual(1);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
    });

    /**
     * @tc.name SerialOpenCloseTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCLOSE_0600
     * @tc.desc getSerialPortList open close repeat 1 sessions with 7 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenCloseTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index: number = 0; index < 1; index++) {
        await fixture.select();
        await fixture.controller.open();
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
        expect(await fixture.controller.write(payload(7, 0))).assertEqual(7);
        fixture.port.emitData(payload(7, 0));
        expectSession(fixture);
        await fixture.controller.close();
        expectReleased(fixture);
      }
      expect(fixture.port.callCount('open')).assertEqual(1);
      expect(fixture.port.callCount('close')).assertEqual(1);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
    });

    /**
     * @tc.name SerialOpenCloseTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCLOSE_0700
     * @tc.desc getSerialPortList open close repeat 1 sessions with 8 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenCloseTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index: number = 0; index < 1; index++) {
        await fixture.select();
        await fixture.controller.open();
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
        expect(await fixture.controller.write(payload(8, 0))).assertEqual(8);
        fixture.port.emitData(payload(8, 0));
        expectSession(fixture);
        await fixture.controller.close();
        expectReleased(fixture);
      }
      expect(fixture.port.callCount('open')).assertEqual(1);
      expect(fixture.port.callCount('close')).assertEqual(1);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
    });

    /**
     * @tc.name SerialOpenCloseTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCLOSE_0800
     * @tc.desc getSerialPortList open close repeat 1 sessions with 16 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenCloseTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index: number = 0; index < 1; index++) {
        await fixture.select();
        await fixture.controller.open();
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
        expect(await fixture.controller.write(payload(16, 0))).assertEqual(16);
        fixture.port.emitData(payload(16, 0));
        expectSession(fixture);
        await fixture.controller.close();
        expectReleased(fixture);
      }
      expect(fixture.port.callCount('open')).assertEqual(1);
      expect(fixture.port.callCount('close')).assertEqual(1);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(16);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
    });

    /**
     * @tc.name SerialOpenCloseTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALOPENCLOSE_0900
     * @tc.desc getSerialPortList open close repeat 1 sessions with 31 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialOpenCloseTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index: number = 0; index < 1; index++) {
        await fixture.select();
        await fixture.controller.open();
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
        expect(await fixture.controller.write(payload(31, 0))).assertEqual(31);
        fixture.port.emitData(payload(31, 0));
        expectSession(fixture);
        await fixture.controller.close();
        expectReleased(fixture);
      }
      expect(fixture.port.callCount('open')).assertEqual(1);
      expect(fixture.port.callCount('close')).assertEqual(1);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(31);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(31);
    });
  });
}
