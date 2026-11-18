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

export default function SerialWriteBufferOwnershipTest(): void {
  describe('SerialWriteBufferOwnershipTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialWriteBufferOwnership', 'begin');
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
      logSuite('SerialWriteBufferOwnership', 'end');
    });

    /**
     * @tc.name SerialWriteBufferOwnershipTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBUFFEROWNERSHIP_0100
     * @tc.desc write snapshots 1 input bytes with seed 0 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBufferOwnershipTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(1, 0);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(1);
      const written: number = await pending;
      expect(written).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(1);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBufferOwnershipTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBUFFEROWNERSHIP_0200
     * @tc.desc write snapshots 2 input bytes with seed 0 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBufferOwnershipTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(2, 0);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(1);
      const written: number = await pending;
      expect(written).assertEqual(2);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(1);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBufferOwnershipTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBUFFEROWNERSHIP_0300
     * @tc.desc write snapshots 3 input bytes with seed 0 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBufferOwnershipTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(3, 0);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(1);
      const written: number = await pending;
      expect(written).assertEqual(3);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(1);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBufferOwnershipTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBUFFEROWNERSHIP_0400
     * @tc.desc write snapshots 4 input bytes with seed 0 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBufferOwnershipTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(4, 0);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(1);
      const written: number = await pending;
      expect(written).assertEqual(4);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(1);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBufferOwnershipTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBUFFEROWNERSHIP_0500
     * @tc.desc write snapshots 5 input bytes with seed 0 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBufferOwnershipTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(5, 0);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(1);
      const written: number = await pending;
      expect(written).assertEqual(5);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(1);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBufferOwnershipTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBUFFEROWNERSHIP_0600
     * @tc.desc write snapshots 7 input bytes with seed 0 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBufferOwnershipTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(7, 0);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(1);
      const written: number = await pending;
      expect(written).assertEqual(7);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(1);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBufferOwnershipTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBUFFEROWNERSHIP_0700
     * @tc.desc write snapshots 8 input bytes with seed 0 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBufferOwnershipTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(8, 0);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(1);
      const written: number = await pending;
      expect(written).assertEqual(8);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(1);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBufferOwnershipTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBUFFEROWNERSHIP_0800
     * @tc.desc write snapshots 16 input bytes with seed 0 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBufferOwnershipTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(16, 0);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(1);
      const written: number = await pending;
      expect(written).assertEqual(16);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(1);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBufferOwnershipTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBUFFEROWNERSHIP_0900
     * @tc.desc write snapshots 31 input bytes with seed 0 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBufferOwnershipTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(31, 0);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(1);
      const written: number = await pending;
      expect(written).assertEqual(31);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(1);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(31);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBufferOwnershipTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBUFFEROWNERSHIP_1000
     * @tc.desc write snapshots 32 input bytes with seed 0 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBufferOwnershipTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(32, 0);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(1);
      const written: number = await pending;
      expect(written).assertEqual(32);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(1);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBufferOwnershipTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBUFFEROWNERSHIP_1100
     * @tc.desc write snapshots 63 input bytes with seed 0 before the queued call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBufferOwnershipTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(63, 0);
      const expected: number[] = Array.from(bytes);
      const pending: Promise<number> = fixture.controller.write(bytes);
      bytes.fill(1);
      const written: number = await pending;
      expect(written).assertEqual(63);
      expectBytes(fixture.port.writes[0], expected);
      expect(bytes[0]).assertEqual(1);
      expect(fixture.port.writes[0] === bytes).assertFalse();
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(63);
      expectSession(fixture);
    });
  });
}
