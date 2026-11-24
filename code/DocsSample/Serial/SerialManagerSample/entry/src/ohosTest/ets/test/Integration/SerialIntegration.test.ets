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

export default function SerialIntegrationTest(): void {
  describe('SerialIntegrationTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialIntegration', 'begin');
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
      logSuite('SerialIntegration', 'end');
    });

    /**
     * @tc.name SerialIntegrationTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALINTEGRATION_0100
     * @tc.desc write drain flush sendBrk execute in submission order for 1 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialIntegrationTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(1, 0));
      const write: Promise<number> = fixture.controller.write(payload(1, 0));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(1);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(1, 0)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(1, 0)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialIntegrationTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALINTEGRATION_0200
     * @tc.desc write flush drain sendBrk execute in submission order for 2 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialIntegrationTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(2, 0));
      const write: Promise<number> = fixture.controller.write(payload(2, 0));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(2);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(2, 0)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(2, 0)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialIntegrationTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALINTEGRATION_0300
     * @tc.desc write drain flush sendBrk execute in submission order for 3 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialIntegrationTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(3, 0));
      const write: Promise<number> = fixture.controller.write(payload(3, 0));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(3);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(3, 0)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(3, 0)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialIntegrationTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALINTEGRATION_0400
     * @tc.desc write flush drain sendBrk execute in submission order for 4 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialIntegrationTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(4, 0));
      const write: Promise<number> = fixture.controller.write(payload(4, 0));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(4);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(4, 0)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(4, 0)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialIntegrationTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALINTEGRATION_0500
     * @tc.desc write drain flush sendBrk execute in submission order for 5 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialIntegrationTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(5, 0));
      const write: Promise<number> = fixture.controller.write(payload(5, 0));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(5);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(5, 0)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(5, 0)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialIntegrationTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALINTEGRATION_0600
     * @tc.desc write flush drain sendBrk execute in submission order for 7 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialIntegrationTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(7, 0));
      const write: Promise<number> = fixture.controller.write(payload(7, 0));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(7);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(7, 0)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(7, 0)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialIntegrationTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALINTEGRATION_0700
     * @tc.desc write drain flush sendBrk execute in submission order for 8 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialIntegrationTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(8, 0));
      const write: Promise<number> = fixture.controller.write(payload(8, 0));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(8);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(8, 0)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(8, 0)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialIntegrationTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALINTEGRATION_0800
     * @tc.desc write flush drain sendBrk execute in submission order for 16 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialIntegrationTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(16, 0));
      const write: Promise<number> = fixture.controller.write(payload(16, 0));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(16);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(16, 0)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(16, 0)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(16);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialIntegrationTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALINTEGRATION_0900
     * @tc.desc write drain flush sendBrk execute in submission order for 31 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialIntegrationTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(31, 0));
      const write: Promise<number> = fixture.controller.write(payload(31, 0));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(31);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(31, 0)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(31, 0)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(31);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(31);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialIntegrationTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALINTEGRATION_1000
     * @tc.desc write flush drain sendBrk execute in submission order for 32 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialIntegrationTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(32, 0));
      const write: Promise<number> = fixture.controller.write(payload(32, 0));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(32);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(32, 0)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(32, 0)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(32);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialIntegrationTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALINTEGRATION_1100
     * @tc.desc write drain flush sendBrk execute in submission order for 63 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialIntegrationTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(63, 0));
      const write: Promise<number> = fixture.controller.write(payload(63, 0));
      const first: Promise<void> = fixture.controller.drain();
      const second: Promise<void> = fixture.controller.flush();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(63);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'drain', 'flush', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(63, 0)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(63, 0)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(63);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(63);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialIntegrationTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALINTEGRATION_1200
     * @tc.desc write flush drain sendBrk execute in submission order for 64 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialIntegrationTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      await fixture.controller.onDataRead();
      fixture.port.emitData(payload(64, 0));
      const write: Promise<number> = fixture.controller.write(payload(64, 0));
      const first: Promise<void> = fixture.controller.flush();
      const second: Promise<void> = fixture.controller.drain();
      const brk: Promise<void> = fixture.controller.sendBrk();
      expect(await write).assertEqual(64);
      await Promise.all([first, second, brk]);
      expectCallSequence(fixture.port, ['open', 'onDataRead', 'write', 'flush', 'drain', 'sendBrk']);
      expectBytes(fixture.port.writes[0], Array.from(payload(64, 0)));
      expectBytes(fixture.controller.snapshot().lastData, Array.from(payload(64, 0)));
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(64);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
      expectSession(fixture);
    });
  });
}
