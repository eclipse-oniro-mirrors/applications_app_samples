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

export default function SerialPortWorkflowTest(): void {
  describe('SerialPortWorkflowTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialPortWorkflow', 'begin');
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
      logSuite('SerialPortWorkflow', 'end');
    });

    /**
     * @tc.name SerialPortWorkflowTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTWORKFLOW_0100
     * @tc.desc open write onDataRead flush drain signals close complete a 255 byte session seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortWorkflowTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(255, 5);
      expect(await fixture.controller.write(bytes)).assertEqual(255);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(255);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(255);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialPortWorkflowTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTWORKFLOW_0200
     * @tc.desc open write onDataRead flush drain signals close complete a 256 byte session seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortWorkflowTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(256, 5);
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
     * @tc.name SerialPortWorkflowTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTWORKFLOW_0300
     * @tc.desc open write onDataRead flush drain signals close complete a 511 byte session seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortWorkflowTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(511, 5);
      expect(await fixture.controller.write(bytes)).assertEqual(511);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(511);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(511);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialPortWorkflowTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTWORKFLOW_0400
     * @tc.desc open write onDataRead flush drain signals close complete a 512 byte session seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortWorkflowTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(512, 5);
      expect(await fixture.controller.write(bytes)).assertEqual(512);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(512);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(512);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialPortWorkflowTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTWORKFLOW_0500
     * @tc.desc open write onDataRead flush drain signals close complete a 1023 byte session seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortWorkflowTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(1023, 5);
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
     * @tc.name SerialPortWorkflowTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTWORKFLOW_0600
     * @tc.desc open write onDataRead flush drain signals close complete a 1024 byte session seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortWorkflowTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(1024, 5);
      expect(await fixture.controller.write(bytes)).assertEqual(1024);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1024);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1024);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialPortWorkflowTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTWORKFLOW_0700
     * @tc.desc open write onDataRead flush drain signals close complete a 2048 byte session seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortWorkflowTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(2048, 5);
      expect(await fixture.controller.write(bytes)).assertEqual(2048);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2048);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2048);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialPortWorkflowTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTWORKFLOW_0800
     * @tc.desc open write onDataRead flush drain signals close complete a 4095 byte session seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortWorkflowTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(4095, 5);
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
     * @tc.name SerialPortWorkflowTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTWORKFLOW_0900
     * @tc.desc open write onDataRead flush drain signals close complete a 4096 byte session seed 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortWorkflowTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(4096, 5);
      expect(await fixture.controller.write(bytes)).assertEqual(4096);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4096);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4096);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialPortWorkflowTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTWORKFLOW_1000
     * @tc.desc open write onDataRead flush drain signals close complete a 1 byte session seed 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortWorkflowTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(1, 6);
      expect(await fixture.controller.write(bytes)).assertEqual(1);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialPortWorkflowTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTWORKFLOW_1100
     * @tc.desc open write onDataRead flush drain signals close complete a 2 byte session seed 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortWorkflowTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(2, 6);
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
     * @tc.name SerialPortWorkflowTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTWORKFLOW_1200
     * @tc.desc open write onDataRead flush drain signals close complete a 3 byte session seed 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortWorkflowTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(3, 6);
      expect(await fixture.controller.write(bytes)).assertEqual(3);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialPortWorkflowTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTWORKFLOW_1300
     * @tc.desc open write onDataRead flush drain signals close complete a 4 byte session seed 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortWorkflowTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(4, 6);
      expect(await fixture.controller.write(bytes)).assertEqual(4);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialPortWorkflowTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTWORKFLOW_1400
     * @tc.desc open write onDataRead flush drain signals close complete a 5 byte session seed 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortWorkflowTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(5, 6);
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
     * @tc.name SerialPortWorkflowTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTWORKFLOW_1500
     * @tc.desc open write onDataRead flush drain signals close complete a 7 byte session seed 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortWorkflowTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(7, 6);
      expect(await fixture.controller.write(bytes)).assertEqual(7);
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
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
      expectBytes(fixture.controller.snapshot().lastData, Array.from(bytes));
      await fixture.controller.close();
      expectReleased(fixture);
      expect(fixture.port.callCount('sendBrk')).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
    });

    /**
     * @tc.name SerialPortWorkflowTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTWORKFLOW_1600
     * @tc.desc open write onDataRead flush drain signals close complete a 8 byte session seed 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortWorkflowTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(8, 6);
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
     * @tc.name SerialPortWorkflowTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTWORKFLOW_1700
     * @tc.desc open write onDataRead flush drain signals close complete a 16 byte session seed 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortWorkflowTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(16, 6);
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
     * @tc.name SerialPortWorkflowTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTWORKFLOW_1800
     * @tc.desc open write onDataRead flush drain signals close complete a 31 byte session seed 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortWorkflowTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(31, 6);
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
     * @tc.name SerialPortWorkflowTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTWORKFLOW_1900
     * @tc.desc open write onDataRead flush drain signals close complete a 32 byte session seed 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortWorkflowTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      await fixture.controller.onDisconnect();
      const bytes: Uint8Array = payload(32, 6);
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
  });
}
