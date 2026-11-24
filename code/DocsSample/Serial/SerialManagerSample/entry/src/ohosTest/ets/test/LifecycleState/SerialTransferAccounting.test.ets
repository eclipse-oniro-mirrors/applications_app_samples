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

export default function SerialTransferAccountingTest(): void {
  describe('SerialTransferAccountingTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialTransferAccounting', 'begin');
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
      logSuite('SerialTransferAccounting', 'end');
    });

    /**
     * @tc.name SerialTransferAccountingTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERACCOUNTING_0100
     * @tc.desc write accounts for 0 accepted bytes out of 1 seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferAccountingTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(1, 0);
      fixture.port.writeResult = 0;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(0);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([0]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [0]);
    });

    /**
     * @tc.name SerialTransferAccountingTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERACCOUNTING_0200
     * @tc.desc write accounts for 1 accepted bytes out of 2 seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferAccountingTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(2, 0);
      fixture.port.writeResult = 1;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([1]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [1]);
    });

    /**
     * @tc.name SerialTransferAccountingTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERACCOUNTING_0300
     * @tc.desc write accounts for 3 accepted bytes out of 3 seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferAccountingTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(3, 0);
      fixture.port.writeResult = 3;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(3);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([2]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [2]);
    });

    /**
     * @tc.name SerialTransferAccountingTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERACCOUNTING_0400
     * @tc.desc write accounts for 0 accepted bytes out of 4 seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferAccountingTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(4, 0);
      fixture.port.writeResult = 0;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(0);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([3]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [3]);
    });

    /**
     * @tc.name SerialTransferAccountingTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERACCOUNTING_0500
     * @tc.desc write accounts for 2 accepted bytes out of 5 seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferAccountingTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(5, 0);
      fixture.port.writeResult = 2;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([4]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [4]);
    });

    /**
     * @tc.name SerialTransferAccountingTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERACCOUNTING_0600
     * @tc.desc write accounts for 7 accepted bytes out of 7 seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferAccountingTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(7, 0);
      fixture.port.writeResult = 7;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(7);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([5]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [5]);
    });

    /**
     * @tc.name SerialTransferAccountingTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERACCOUNTING_0700
     * @tc.desc write accounts for 0 accepted bytes out of 8 seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferAccountingTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(8, 0);
      fixture.port.writeResult = 0;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(0);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([6]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [6]);
    });

    /**
     * @tc.name SerialTransferAccountingTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERACCOUNTING_0800
     * @tc.desc write accounts for 8 accepted bytes out of 16 seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferAccountingTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(16, 0);
      fixture.port.writeResult = 8;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([7]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(9);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [7]);
    });

    /**
     * @tc.name SerialTransferAccountingTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERACCOUNTING_0900
     * @tc.desc write accounts for 31 accepted bytes out of 31 seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferAccountingTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(31, 0);
      fixture.port.writeResult = 31;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(31);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(31);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([8]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [8]);
    });

    /**
     * @tc.name SerialTransferAccountingTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERACCOUNTING_1000
     * @tc.desc write accounts for 0 accepted bytes out of 32 seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferAccountingTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(32, 0);
      fixture.port.writeResult = 0;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(0);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(0);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([9]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [9]);
    });

    /**
     * @tc.name SerialTransferAccountingTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALTRANSFERACCOUNTING_1100
     * @tc.desc write accounts for 31 accepted bytes out of 63 seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialTransferAccountingTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(63, 0);
      fixture.port.writeResult = 31;
      const first: number = await fixture.controller.write(bytes);
      expect(first).assertEqual(31);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(31);
      fixture.port.writeResult = null;
      const second: number = await fixture.controller.write(new Uint8Array([10]));
      expect(second).assertEqual(1);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
      expect(fixture.port.writes.length).assertEqual(2);
      expectBytes(fixture.port.writes[0], Array.from(bytes));
      expectBytes(fixture.port.writes[1], [10]);
    });
  });
}
