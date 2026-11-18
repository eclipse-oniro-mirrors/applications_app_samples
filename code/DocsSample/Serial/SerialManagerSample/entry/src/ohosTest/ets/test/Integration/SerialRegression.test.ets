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

export default function SerialRegressionTest(): void {
  describe('SerialRegressionTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialRegression', 'begin');
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
      logSuite('SerialRegression', 'end');
    });

    /**
     * @tc.name SerialRegressionTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALREGRESSION_0100
     * @tc.desc open write onDataRead flush drain signals close complete a 8 byte session seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialRegressionTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(8, 0);
      expect(await fixture.controller.write(bytes)).assertEqual(8);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialRegressionTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALREGRESSION_0200
     * @tc.desc open write onDataRead flush drain signals close complete a 16 byte session seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialRegressionTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(16, 0);
      expect(await fixture.controller.write(bytes)).assertEqual(16);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(16);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialRegressionTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALREGRESSION_0300
     * @tc.desc open write onDataRead flush drain signals close complete a 31 byte session seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialRegressionTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(31, 0);
      expect(await fixture.controller.write(bytes)).assertEqual(31);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(31);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(31);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialRegressionTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALREGRESSION_0400
     * @tc.desc open write onDataRead flush drain signals close complete a 32 byte session seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialRegressionTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(32, 0);
      expect(await fixture.controller.write(bytes)).assertEqual(32);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(32);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialRegressionTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALREGRESSION_0500
     * @tc.desc open write onDataRead flush drain signals close complete a 63 byte session seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialRegressionTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(63, 0);
      expect(await fixture.controller.write(bytes)).assertEqual(63);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(63);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(63);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialRegressionTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALREGRESSION_0600
     * @tc.desc open write onDataRead flush drain signals close complete a 64 byte session seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialRegressionTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(64, 0);
      expect(await fixture.controller.write(bytes)).assertEqual(64);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(64);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialRegressionTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALREGRESSION_0700
     * @tc.desc open write onDataRead flush drain signals close complete a 127 byte session seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialRegressionTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(127, 0);
      expect(await fixture.controller.write(bytes)).assertEqual(127);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(127);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(127);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialRegressionTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALREGRESSION_0800
     * @tc.desc open write onDataRead flush drain signals close complete a 128 byte session seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialRegressionTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(128, 0);
      expect(await fixture.controller.write(bytes)).assertEqual(128);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(128);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(128);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialRegressionTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALREGRESSION_0900
     * @tc.desc open write onDataRead flush drain signals close complete a 255 byte session seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialRegressionTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(255, 0);
      expect(await fixture.controller.write(bytes)).assertEqual(255);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(255);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(255);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialRegressionTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALREGRESSION_1000
     * @tc.desc open write onDataRead flush drain signals close complete a 256 byte session seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialRegressionTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(256, 0);
      expect(await fixture.controller.write(bytes)).assertEqual(256);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(256);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(256);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialRegressionTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALREGRESSION_1100
     * @tc.desc open write onDataRead flush drain signals close complete a 511 byte session seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialRegressionTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(511, 0);
      expect(await fixture.controller.write(bytes)).assertEqual(511);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(511);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(511);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialRegressionTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALREGRESSION_1200
     * @tc.desc open write onDataRead flush drain signals close complete a 512 byte session seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialRegressionTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(512, 0);
      expect(await fixture.controller.write(bytes)).assertEqual(512);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(512);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(512);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialRegressionTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALREGRESSION_1300
     * @tc.desc open write onDataRead flush drain signals close complete a 1023 byte session seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialRegressionTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(1023, 0);
      expect(await fixture.controller.write(bytes)).assertEqual(1023);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1023);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1023);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialRegressionTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALREGRESSION_1400
     * @tc.desc open write onDataRead flush drain signals close complete a 1024 byte session seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialRegressionTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(1024, 0);
      expect(await fixture.controller.write(bytes)).assertEqual(1024);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1024);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1024);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });
  });
}
