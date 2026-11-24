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

export default function SerialPartialWriteAccountingTest(): void {
  describe('SerialPartialWriteAccountingTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialPartialWriteAccounting', 'begin');
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
      logSuite('SerialPartialWriteAccounting', 'end');
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_0100
     * @tc.desc write accounts for 64 accepted bytes out of 64 seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(64, 0);
      fixture.port.writeResult = 64;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(64);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([11]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(65);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [11]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_0200
     * @tc.desc write accounts for 0 accepted bytes out of 127 seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(127, 0);
      fixture.port.writeResult = 0;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(0);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([12]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [12]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_0300
     * @tc.desc write accounts for 64 accepted bytes out of 128 seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(128, 0);
      fixture.port.writeResult = 64;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(64);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([13]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(65);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [13]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_0400
     * @tc.desc write accounts for 255 accepted bytes out of 255 seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(255, 0);
      fixture.port.writeResult = 255;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(255);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(255);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([14]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(256);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [14]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_0500
     * @tc.desc write accounts for 0 accepted bytes out of 256 seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(256, 0);
      fixture.port.writeResult = 0;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(0);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([15]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [15]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_0600
     * @tc.desc write accounts for 255 accepted bytes out of 511 seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(511, 0);
      fixture.port.writeResult = 255;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(255);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(255);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([16]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(256);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [16]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_0700
     * @tc.desc write accounts for 512 accepted bytes out of 512 seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(512, 0);
      fixture.port.writeResult = 512;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(512);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(512);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([17]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(513);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [17]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_0800
     * @tc.desc write accounts for 0 accepted bytes out of 1023 seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(1023, 0);
      fixture.port.writeResult = 0;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(0);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([18]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [18]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_0900
     * @tc.desc write accounts for 512 accepted bytes out of 1024 seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(1024, 0);
      fixture.port.writeResult = 512;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(512);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(512);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([19]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(513);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [19]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_1000
     * @tc.desc write accounts for 2048 accepted bytes out of 2048 seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(2048, 0);
      fixture.port.writeResult = 2048;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(2048);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2048);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([20]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2049);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [20]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_1100
     * @tc.desc write accounts for 0 accepted bytes out of 4095 seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(4095, 0);
      fixture.port.writeResult = 0;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(0);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([21]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [21]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_1200
     * @tc.desc write accounts for 2048 accepted bytes out of 4096 seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(4096, 0);
      fixture.port.writeResult = 2048;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(2048);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2048);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([22]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2049);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [22]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_1300
     * @tc.desc write accounts for 1 accepted bytes out of 1 seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(1, 1);
      fixture.port.writeResult = 1;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([23]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [23]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_1400
     * @tc.desc write accounts for 0 accepted bytes out of 2 seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(2, 1);
      fixture.port.writeResult = 0;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(0);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([24]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [24]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_1500
     * @tc.desc write accounts for 1 accepted bytes out of 3 seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(3, 1);
      fixture.port.writeResult = 1;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([25]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [25]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_1600
     * @tc.desc write accounts for 4 accepted bytes out of 4 seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(4, 1);
      fixture.port.writeResult = 4;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([26]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [26]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_1700
     * @tc.desc write accounts for 0 accepted bytes out of 5 seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(5, 1);
      fixture.port.writeResult = 0;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(0);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([27]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [27]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_1800
     * @tc.desc write accounts for 3 accepted bytes out of 7 seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(7, 1);
      fixture.port.writeResult = 3;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([28]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [28]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_1900
     * @tc.desc write accounts for 8 accepted bytes out of 8 seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(8, 1);
      fixture.port.writeResult = 8;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([29]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(9);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [29]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_2000
     * @tc.desc write accounts for 0 accepted bytes out of 16 seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(16, 1);
      fixture.port.writeResult = 0;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(0);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([30]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [30]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_2100
     * @tc.desc write accounts for 15 accepted bytes out of 31 seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(31, 1);
      fixture.port.writeResult = 15;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(15);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(15);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([31]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [31]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_2200
     * @tc.desc write accounts for 32 accepted bytes out of 32 seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(32, 1);
      fixture.port.writeResult = 32;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(32);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([32]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(33);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [32]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_2300
     * @tc.desc write accounts for 0 accepted bytes out of 63 seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(63, 1);
      fixture.port.writeResult = 0;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(0);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([33]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [33]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_2400
     * @tc.desc write accounts for 32 accepted bytes out of 64 seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(64, 1);
      fixture.port.writeResult = 32;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(32);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([34]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(33);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [34]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_2500
     * @tc.desc write accounts for 127 accepted bytes out of 127 seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(127, 1);
      fixture.port.writeResult = 127;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(127);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(127);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([35]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(128);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [35]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_2600
     * @tc.desc write accounts for 0 accepted bytes out of 128 seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(128, 1);
      fixture.port.writeResult = 0;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(0);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([36]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [36]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_2700
     * @tc.desc write accounts for 127 accepted bytes out of 255 seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(255, 1);
      fixture.port.writeResult = 127;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(127);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(127);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([37]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(128);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [37]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_2800
     * @tc.desc write accounts for 256 accepted bytes out of 256 seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(256, 1);
      fixture.port.writeResult = 256;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(256);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(256);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([38]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(257);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [38]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_2900
     * @tc.desc write accounts for 0 accepted bytes out of 511 seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(511, 1);
      fixture.port.writeResult = 0;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(0);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([39]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [39]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_3000
     * @tc.desc write accounts for 256 accepted bytes out of 512 seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(512, 1);
      fixture.port.writeResult = 256;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(256);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(256);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([40]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(257);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [40]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_3100
     * @tc.desc write accounts for 1023 accepted bytes out of 1023 seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(1023, 1);
      fixture.port.writeResult = 1023;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(1023);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1023);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([41]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1024);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [41]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_3200
     * @tc.desc write accounts for 0 accepted bytes out of 1024 seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(1024, 1);
      fixture.port.writeResult = 0;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(0);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([42]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [42]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_3300
     * @tc.desc write accounts for 1024 accepted bytes out of 2048 seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(2048, 1);
      fixture.port.writeResult = 1024;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(1024);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1024);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([43]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1025);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [43]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_3400
     * @tc.desc write accounts for 4095 accepted bytes out of 4095 seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(4095, 1);
      fixture.port.writeResult = 4095;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(4095);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4095);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([44]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4096);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [44]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_3500
     * @tc.desc write accounts for 0 accepted bytes out of 4096 seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(4096, 1);
      fixture.port.writeResult = 0;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(0);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([45]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [45]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_3600
     * @tc.desc write accounts for 0 accepted bytes out of 1 seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(1, 2);
      fixture.port.writeResult = 0;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(0);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([46]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [46]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_3700
     * @tc.desc write accounts for 2 accepted bytes out of 2 seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(2, 2);
      fixture.port.writeResult = 2;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([47]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [47]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_3800
     * @tc.desc write accounts for 0 accepted bytes out of 3 seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(3, 2);
      fixture.port.writeResult = 0;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(0);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([48]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [48]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_3900
     * @tc.desc write accounts for 2 accepted bytes out of 4 seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(4, 2);
      fixture.port.writeResult = 2;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([49]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [49]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_4000
     * @tc.desc write accounts for 5 accepted bytes out of 5 seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(5, 2);
      fixture.port.writeResult = 5;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(5);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([50]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(6);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [50]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest041
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_4100
     * @tc.desc write accounts for 0 accepted bytes out of 7 seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(7, 2);
      fixture.port.writeResult = 0;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(0);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([51]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [51]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest042
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_4200
     * @tc.desc write accounts for 4 accepted bytes out of 8 seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(8, 2);
      fixture.port.writeResult = 4;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([52]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [52]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest043
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_4300
     * @tc.desc write accounts for 16 accepted bytes out of 16 seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(16, 2);
      fixture.port.writeResult = 16;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(16);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([53]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(17);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [53]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest044
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_4400
     * @tc.desc write accounts for 0 accepted bytes out of 31 seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(31, 2);
      fixture.port.writeResult = 0;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(0);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([54]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [54]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest045
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_4500
     * @tc.desc write accounts for 16 accepted bytes out of 32 seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(32, 2);
      fixture.port.writeResult = 16;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(16);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([55]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(17);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [55]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest046
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_4600
     * @tc.desc write accounts for 63 accepted bytes out of 63 seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(63, 2);
      fixture.port.writeResult = 63;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(63);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(63);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([56]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [56]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest047
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_4700
     * @tc.desc write accounts for 0 accepted bytes out of 64 seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(64, 2);
      fixture.port.writeResult = 0;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(0);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([57]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [57]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest048
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_4800
     * @tc.desc write accounts for 63 accepted bytes out of 127 seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(127, 2);
      fixture.port.writeResult = 63;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(63);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(63);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([58]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [58]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest049
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_4900
     * @tc.desc write accounts for 128 accepted bytes out of 128 seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(128, 2);
      fixture.port.writeResult = 128;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(128);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(128);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([59]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(129);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [59]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest050
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_5000
     * @tc.desc write accounts for 0 accepted bytes out of 255 seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(255, 2);
      fixture.port.writeResult = 0;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(0);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([60]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [60]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest051
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_5100
     * @tc.desc write accounts for 128 accepted bytes out of 256 seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(256, 2);
      fixture.port.writeResult = 128;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(128);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(128);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([61]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(129);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [61]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest052
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_5200
     * @tc.desc write accounts for 511 accepted bytes out of 511 seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(511, 2);
      fixture.port.writeResult = 511;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(511);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(511);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([62]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(512);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [62]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest053
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_5300
     * @tc.desc write accounts for 0 accepted bytes out of 512 seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(512, 2);
      fixture.port.writeResult = 0;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(0);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([63]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [63]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest054
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_5400
     * @tc.desc write accounts for 511 accepted bytes out of 1023 seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(1023, 2);
      fixture.port.writeResult = 511;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(511);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(511);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([64]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(512);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [64]);
    });

    /**
     * @tc.name SerialPartialWriteAccountingTest055
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPARTIALWRITEACCOUNTING_5500
     * @tc.desc write accounts for 1024 accepted bytes out of 1024 seed 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPartialWriteAccountingTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(1024, 2);
      fixture.port.writeResult = 1024;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(1024);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1024);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([65]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1025);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [65]);
    });
  });
}
