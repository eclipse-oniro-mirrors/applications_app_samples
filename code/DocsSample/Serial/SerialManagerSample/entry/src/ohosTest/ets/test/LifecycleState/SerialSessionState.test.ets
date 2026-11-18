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

export default function SerialSessionStateTest(): void {
  describe('SerialSessionStateTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialSessionState', 'begin');
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
      logSuite('SerialSessionState', 'end');
    });

    /**
     * @tc.name SerialSessionStateTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONSTATE_0100
     * @tc.desc open write onDataRead flush drain signals close complete a 16 byte session seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionStateTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(16, 2);
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
     * @tc.name SerialSessionStateTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONSTATE_0200
     * @tc.desc open write onDataRead flush drain signals close complete a 31 byte session seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionStateTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(31, 2);
      expect(await fixture.controller.write(bytes)).assertEqual(31);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(31);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(31);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialSessionStateTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONSTATE_0300
     * @tc.desc open write onDataRead flush drain signals close complete a 32 byte session seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionStateTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(32, 2);
      expect(await fixture.controller.write(bytes)).assertEqual(32);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(32);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialSessionStateTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONSTATE_0400
     * @tc.desc open write onDataRead flush drain signals close complete a 63 byte session seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionStateTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(63, 2);
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
     * @tc.name SerialSessionStateTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONSTATE_0500
     * @tc.desc open write onDataRead flush drain signals close complete a 64 byte session seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionStateTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(64, 2);
      expect(await fixture.controller.write(bytes)).assertEqual(64);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(64);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialSessionStateTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONSTATE_0600
     * @tc.desc open write onDataRead flush drain signals close complete a 127 byte session seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionStateTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(127, 2);
      expect(await fixture.controller.write(bytes)).assertEqual(127);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(127);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(127);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialSessionStateTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONSTATE_0700
     * @tc.desc open write onDataRead flush drain signals close complete a 128 byte session seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionStateTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(128, 2);
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
     * @tc.name SerialSessionStateTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONSTATE_0800
     * @tc.desc open write onDataRead flush drain signals close complete a 255 byte session seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionStateTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(255, 2);
      expect(await fixture.controller.write(bytes)).assertEqual(255);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(255);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(255);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialSessionStateTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONSTATE_0900
     * @tc.desc open write onDataRead flush drain signals close complete a 256 byte session seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionStateTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(256, 2);
      expect(await fixture.controller.write(bytes)).assertEqual(256);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(256);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(256);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialSessionStateTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONSTATE_1000
     * @tc.desc open write onDataRead flush drain signals close complete a 511 byte session seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionStateTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(511, 2);
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
     * @tc.name SerialSessionStateTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONSTATE_1100
     * @tc.desc open write onDataRead flush drain signals close complete a 512 byte session seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionStateTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(512, 2);
      expect(await fixture.controller.write(bytes)).assertEqual(512);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(512);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(512);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialSessionStateTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONSTATE_1200
     * @tc.desc open write onDataRead flush drain signals close complete a 1023 byte session seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionStateTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(1023, 2);
      expect(await fixture.controller.write(bytes)).assertEqual(1023);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1023);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1023);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialSessionStateTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONSTATE_1300
     * @tc.desc open write onDataRead flush drain signals close complete a 1024 byte session seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionStateTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(1024, 2);
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

    /**
     * @tc.name SerialSessionStateTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONSTATE_1400
     * @tc.desc open write onDataRead flush drain signals close complete a 2048 byte session seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionStateTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(2048, 2);
      expect(await fixture.controller.write(bytes)).assertEqual(2048);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2048);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2048);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialSessionStateTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONSTATE_1500
     * @tc.desc open write onDataRead flush drain signals close complete a 4095 byte session seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionStateTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(4095, 2);
      expect(await fixture.controller.write(bytes)).assertEqual(4095);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4095);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4095);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialSessionStateTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONSTATE_1600
     * @tc.desc open write onDataRead flush drain signals close complete a 4096 byte session seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionStateTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(4096, 2);
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
     * @tc.name SerialSessionStateTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONSTATE_1700
     * @tc.desc open write onDataRead flush drain signals close complete a 1 byte session seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionStateTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(1, 3);
      expect(await fixture.controller.write(bytes)).assertEqual(1);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialSessionStateTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONSTATE_1800
     * @tc.desc open write onDataRead flush drain signals close complete a 2 byte session seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionStateTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(2, 3);
      expect(await fixture.controller.write(bytes)).assertEqual(2);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialSessionStateTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONSTATE_1900
     * @tc.desc open write onDataRead flush drain signals close complete a 3 byte session seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionStateTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(3, 3);
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
     * @tc.name SerialSessionStateTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONSTATE_2000
     * @tc.desc open write onDataRead flush drain signals close complete a 4 byte session seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionStateTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(4, 3);
      expect(await fixture.controller.write(bytes)).assertEqual(4);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialSessionStateTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONSTATE_2100
     * @tc.desc open write onDataRead flush drain signals close complete a 5 byte session seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionStateTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(5, 3);
      expect(await fixture.controller.write(bytes)).assertEqual(5);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialSessionStateTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONSTATE_2200
     * @tc.desc open write onDataRead flush drain signals close complete a 7 byte session seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionStateTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(7, 3);
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
     * @tc.name SerialSessionStateTest023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONSTATE_2300
     * @tc.desc open write onDataRead flush drain signals close complete a 8 byte session seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionStateTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(8, 3);
      expect(await fixture.controller.write(bytes)).assertEqual(8);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialSessionStateTest024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONSTATE_2400
     * @tc.desc open write onDataRead flush drain signals close complete a 16 byte session seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionStateTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(16, 3);
      expect(await fixture.controller.write(bytes)).assertEqual(16);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(16);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialSessionStateTest025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONSTATE_2500
     * @tc.desc open write onDataRead flush drain signals close complete a 31 byte session seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionStateTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(31, 3);
      expect(await fixture.controller.write(bytes)).assertEqual(31);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(31);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(31);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialSessionStateTest026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONSTATE_2600
     * @tc.desc open write onDataRead flush drain signals close complete a 32 byte session seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionStateTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(32, 3);
      expect(await fixture.controller.write(bytes)).assertEqual(32);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(32);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialSessionStateTest027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONSTATE_2700
     * @tc.desc open write onDataRead flush drain signals close complete a 63 byte session seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionStateTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(63, 3);
      expect(await fixture.controller.write(bytes)).assertEqual(63);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(63);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(63);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialSessionStateTest028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONSTATE_2800
     * @tc.desc open write onDataRead flush drain signals close complete a 64 byte session seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionStateTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(64, 3);
      expect(await fixture.controller.write(bytes)).assertEqual(64);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(64);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialSessionStateTest029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONSTATE_2900
     * @tc.desc open write onDataRead flush drain signals close complete a 127 byte session seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionStateTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(127, 3);
      expect(await fixture.controller.write(bytes)).assertEqual(127);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(127);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(127);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialSessionStateTest030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONSTATE_3000
     * @tc.desc open write onDataRead flush drain signals close complete a 128 byte session seed 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionStateTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(128, 3);
      expect(await fixture.controller.write(bytes)).assertEqual(128);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(128);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(128);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });
  });
}
