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

export default function SerialUserScenariosTest(): void {
  describe('SerialUserScenariosTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialUserScenarios', 'begin');
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
      logSuite('SerialUserScenarios', 'end');
    });

    /**
     * @tc.name SerialUserScenariosTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUSERSCENARIOS_0100
     * @tc.desc open write onDataRead flush drain signals close complete a 31 byte session seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUserScenariosTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(31, 1);
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
     * @tc.name SerialUserScenariosTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUSERSCENARIOS_0200
     * @tc.desc open write onDataRead flush drain signals close complete a 32 byte session seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUserScenariosTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(32, 1);
      expect(await fixture.controller.write(bytes)).assertEqual(32);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(32);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialUserScenariosTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUSERSCENARIOS_0300
     * @tc.desc open write onDataRead flush drain signals close complete a 63 byte session seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUserScenariosTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(63, 1);
      expect(await fixture.controller.write(bytes)).assertEqual(63);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(63);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(63);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialUserScenariosTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUSERSCENARIOS_0400
     * @tc.desc open write onDataRead flush drain signals close complete a 64 byte session seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUserScenariosTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(64, 1);
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
     * @tc.name SerialUserScenariosTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUSERSCENARIOS_0500
     * @tc.desc open write onDataRead flush drain signals close complete a 127 byte session seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUserScenariosTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(127, 1);
      expect(await fixture.controller.write(bytes)).assertEqual(127);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(127);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(127);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialUserScenariosTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUSERSCENARIOS_0600
     * @tc.desc open write onDataRead flush drain signals close complete a 128 byte session seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUserScenariosTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(128, 1);
      expect(await fixture.controller.write(bytes)).assertEqual(128);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(128);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(128);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialUserScenariosTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUSERSCENARIOS_0700
     * @tc.desc open write onDataRead flush drain signals close complete a 255 byte session seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUserScenariosTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(255, 1);
      expect(await fixture.controller.write(bytes)).assertEqual(255);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(255);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(255);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialUserScenariosTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUSERSCENARIOS_0800
     * @tc.desc open write onDataRead flush drain signals close complete a 256 byte session seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUserScenariosTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(256, 1);
      expect(await fixture.controller.write(bytes)).assertEqual(256);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(256);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(256);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialUserScenariosTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUSERSCENARIOS_0900
     * @tc.desc open write onDataRead flush drain signals close complete a 511 byte session seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUserScenariosTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(511, 1);
      expect(await fixture.controller.write(bytes)).assertEqual(511);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(511);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(511);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialUserScenariosTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUSERSCENARIOS_1000
     * @tc.desc open write onDataRead flush drain signals close complete a 512 byte session seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUserScenariosTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(512, 1);
      expect(await fixture.controller.write(bytes)).assertEqual(512);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(512);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(512);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialUserScenariosTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUSERSCENARIOS_1100
     * @tc.desc open write onDataRead flush drain signals close complete a 1023 byte session seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUserScenariosTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(1023, 1);
      expect(await fixture.controller.write(bytes)).assertEqual(1023);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1023);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1023);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialUserScenariosTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUSERSCENARIOS_1200
     * @tc.desc open write onDataRead flush drain signals close complete a 1024 byte session seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUserScenariosTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(1024, 1);
      expect(await fixture.controller.write(bytes)).assertEqual(1024);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1024);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1024);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialUserScenariosTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUSERSCENARIOS_1300
     * @tc.desc open write onDataRead flush drain signals close complete a 2048 byte session seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUserScenariosTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(2048, 1);
      expect(await fixture.controller.write(bytes)).assertEqual(2048);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2048);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2048);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialUserScenariosTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUSERSCENARIOS_1400
     * @tc.desc open write onDataRead flush drain signals close complete a 4095 byte session seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUserScenariosTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(4095, 1);
      expect(await fixture.controller.write(bytes)).assertEqual(4095);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4095);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4095);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialUserScenariosTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUSERSCENARIOS_1500
     * @tc.desc open write onDataRead flush drain signals close complete a 4096 byte session seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUserScenariosTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(4096, 1);
      expect(await fixture.controller.write(bytes)).assertEqual(4096);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4096);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4096);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialUserScenariosTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUSERSCENARIOS_1600
     * @tc.desc open write onDataRead flush drain signals close complete a 1 byte session seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUserScenariosTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(1, 2);
      expect(await fixture.controller.write(bytes)).assertEqual(1);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialUserScenariosTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUSERSCENARIOS_1700
     * @tc.desc open write onDataRead flush drain signals close complete a 2 byte session seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUserScenariosTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(2, 2);
      expect(await fixture.controller.write(bytes)).assertEqual(2);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialUserScenariosTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUSERSCENARIOS_1800
     * @tc.desc open write onDataRead flush drain signals close complete a 3 byte session seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUserScenariosTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(3, 2);
      expect(await fixture.controller.write(bytes)).assertEqual(3);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialUserScenariosTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUSERSCENARIOS_1900
     * @tc.desc open write onDataRead flush drain signals close complete a 4 byte session seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUserScenariosTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(4, 2);
      expect(await fixture.controller.write(bytes)).assertEqual(4);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialUserScenariosTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUSERSCENARIOS_2000
     * @tc.desc open write onDataRead flush drain signals close complete a 5 byte session seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUserScenariosTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(5, 2);
      expect(await fixture.controller.write(bytes)).assertEqual(5);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialUserScenariosTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUSERSCENARIOS_2100
     * @tc.desc open write onDataRead flush drain signals close complete a 7 byte session seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUserScenariosTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(7, 2);
      expect(await fixture.controller.write(bytes)).assertEqual(7);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialUserScenariosTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALUSERSCENARIOS_2200
     * @tc.desc open write onDataRead flush drain signals close complete a 8 byte session seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialUserScenariosTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(8, 2);
      expect(await fixture.controller.write(bytes)).assertEqual(8);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });
  });
}
