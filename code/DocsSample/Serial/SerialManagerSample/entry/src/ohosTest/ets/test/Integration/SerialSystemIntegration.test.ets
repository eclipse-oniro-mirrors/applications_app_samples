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

export default function SerialSystemIntegrationTest(): void {
  describe('SerialSystemIntegrationTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialSystemIntegration', 'begin');
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
      logSuite('SerialSystemIntegration', 'end');
    });

    /**
     * @tc.name SerialSystemIntegrationTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSYSTEMINTEGRATION_0100
     * @tc.desc open write onDataRead flush drain signals close complete a 2048 byte session seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSystemIntegrationTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(2048, 0);
      expect(await fixture.controller.write(bytes)).assertEqual(2048);
      fixture.port.emitData(bytes);
      await fixture.controller.flush();
      await fixture.controller.drain();
      await fixture.controller.setRts(true);
      await fixture.controller.setDtr(false);
      fixture.port.cts = false;
      fixture.port.dsr = true;
      expect(await fixture.controller.getCts()).assertEqual(false);
      expect(await fixture.controller.getDsr()).assertEqual(true);
      await fixture.controller.sendBrk();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2048);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2048);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialSystemIntegrationTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSYSTEMINTEGRATION_0200
     * @tc.desc open write onDataRead flush drain signals close complete a 4095 byte session seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSystemIntegrationTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(4095, 0);
      expect(await fixture.controller.write(bytes)).assertEqual(4095);
      fixture.port.emitData(bytes);
      await fixture.controller.flush();
      await fixture.controller.drain();
      await fixture.controller.setRts(false);
      await fixture.controller.setDtr(true);
      fixture.port.cts = true;
      fixture.port.dsr = false;
      expect(await fixture.controller.getCts()).assertEqual(true);
      expect(await fixture.controller.getDsr()).assertEqual(false);
      await fixture.controller.sendBrk();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4095);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4095);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialSystemIntegrationTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSYSTEMINTEGRATION_0300
     * @tc.desc open write onDataRead flush drain signals close complete a 4096 byte session seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSystemIntegrationTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(4096, 0);
      expect(await fixture.controller.write(bytes)).assertEqual(4096);
      fixture.port.emitData(bytes);
      await fixture.controller.flush();
      await fixture.controller.drain();
      await fixture.controller.setRts(true);
      await fixture.controller.setDtr(false);
      fixture.port.cts = false;
      fixture.port.dsr = true;
      expect(await fixture.controller.getCts()).assertEqual(false);
      expect(await fixture.controller.getDsr()).assertEqual(true);
      await fixture.controller.sendBrk();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4096);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4096);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialSystemIntegrationTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSYSTEMINTEGRATION_0400
     * @tc.desc open write onDataRead flush drain signals close complete a 1 byte session seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSystemIntegrationTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(1, 1);
      expect(await fixture.controller.write(bytes)).assertEqual(1);
      fixture.port.emitData(bytes);
      await fixture.controller.flush();
      await fixture.controller.drain();
      await fixture.controller.setRts(false);
      await fixture.controller.setDtr(false);
      fixture.port.cts = true;
      fixture.port.dsr = true;
      expect(await fixture.controller.getCts()).assertEqual(true);
      expect(await fixture.controller.getDsr()).assertEqual(true);
      await fixture.controller.sendBrk();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialSystemIntegrationTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSYSTEMINTEGRATION_0500
     * @tc.desc open write onDataRead flush drain signals close complete a 2 byte session seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSystemIntegrationTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(2, 1);
      expect(await fixture.controller.write(bytes)).assertEqual(2);
      fixture.port.emitData(bytes);
      await fixture.controller.flush();
      await fixture.controller.drain();
      await fixture.controller.setRts(true);
      await fixture.controller.setDtr(true);
      fixture.port.cts = false;
      fixture.port.dsr = false;
      expect(await fixture.controller.getCts()).assertEqual(false);
      expect(await fixture.controller.getDsr()).assertEqual(false);
      await fixture.controller.sendBrk();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialSystemIntegrationTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSYSTEMINTEGRATION_0600
     * @tc.desc open write onDataRead flush drain signals close complete a 3 byte session seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSystemIntegrationTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(3, 1);
      expect(await fixture.controller.write(bytes)).assertEqual(3);
      fixture.port.emitData(bytes);
      await fixture.controller.flush();
      await fixture.controller.drain();
      await fixture.controller.setRts(false);
      await fixture.controller.setDtr(false);
      fixture.port.cts = true;
      fixture.port.dsr = true;
      expect(await fixture.controller.getCts()).assertEqual(true);
      expect(await fixture.controller.getDsr()).assertEqual(true);
      await fixture.controller.sendBrk();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialSystemIntegrationTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSYSTEMINTEGRATION_0700
     * @tc.desc open write onDataRead flush drain signals close complete a 4 byte session seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSystemIntegrationTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(4, 1);
      expect(await fixture.controller.write(bytes)).assertEqual(4);
      fixture.port.emitData(bytes);
      await fixture.controller.flush();
      await fixture.controller.drain();
      await fixture.controller.setRts(true);
      await fixture.controller.setDtr(false);
      fixture.port.cts = false;
      fixture.port.dsr = true;
      expect(await fixture.controller.getCts()).assertEqual(false);
      expect(await fixture.controller.getDsr()).assertEqual(true);
      await fixture.controller.sendBrk();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialSystemIntegrationTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSYSTEMINTEGRATION_0800
     * @tc.desc open write onDataRead flush drain signals close complete a 5 byte session seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSystemIntegrationTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(5, 1);
      expect(await fixture.controller.write(bytes)).assertEqual(5);
      fixture.port.emitData(bytes);
      await fixture.controller.flush();
      await fixture.controller.drain();
      await fixture.controller.setRts(false);
      await fixture.controller.setDtr(true);
      fixture.port.cts = true;
      fixture.port.dsr = false;
      expect(await fixture.controller.getCts()).assertEqual(true);
      expect(await fixture.controller.getDsr()).assertEqual(false);
      await fixture.controller.sendBrk();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialSystemIntegrationTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSYSTEMINTEGRATION_0900
     * @tc.desc open write onDataRead flush drain signals close complete a 7 byte session seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSystemIntegrationTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(7, 1);
      expect(await fixture.controller.write(bytes)).assertEqual(7);
      fixture.port.emitData(bytes);
      await fixture.controller.flush();
      await fixture.controller.drain();
      await fixture.controller.setRts(true);
      await fixture.controller.setDtr(false);
      fixture.port.cts = false;
      fixture.port.dsr = true;
      expect(await fixture.controller.getCts()).assertEqual(false);
      expect(await fixture.controller.getDsr()).assertEqual(true);
      await fixture.controller.sendBrk();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialSystemIntegrationTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSYSTEMINTEGRATION_1000
     * @tc.desc open write onDataRead flush drain signals close complete a 8 byte session seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSystemIntegrationTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(8, 1);
      expect(await fixture.controller.write(bytes)).assertEqual(8);
      fixture.port.emitData(bytes);
      await fixture.controller.flush();
      await fixture.controller.drain();
      await fixture.controller.setRts(false);
      await fixture.controller.setDtr(false);
      fixture.port.cts = true;
      fixture.port.dsr = true;
      expect(await fixture.controller.getCts()).assertEqual(true);
      expect(await fixture.controller.getDsr()).assertEqual(true);
      await fixture.controller.sendBrk();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialSystemIntegrationTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSYSTEMINTEGRATION_1100
     * @tc.desc open write onDataRead flush drain signals close complete a 16 byte session seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSystemIntegrationTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(16, 1);
      expect(await fixture.controller.write(bytes)).assertEqual(16);
      fixture.port.emitData(bytes);
      await fixture.controller.flush();
      await fixture.controller.drain();
      await fixture.controller.setRts(true);
      await fixture.controller.setDtr(true);
      fixture.port.cts = false;
      fixture.port.dsr = false;
      expect(await fixture.controller.getCts()).assertEqual(false);
      expect(await fixture.controller.getDsr()).assertEqual(false);
      await fixture.controller.sendBrk();
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(16);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });
  });
}
