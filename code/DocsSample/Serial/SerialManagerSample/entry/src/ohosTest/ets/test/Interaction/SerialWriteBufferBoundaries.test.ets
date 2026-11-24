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

export default function SerialWriteBufferBoundariesTest(): void {
  describe('SerialWriteBufferBoundariesTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialWriteBufferBoundaries', 'begin');
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
      logSuite('SerialWriteBufferBoundaries', 'end');
    });

    /**
     * @tc.name SerialWriteBufferBoundariesTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBUFFERBOUNDARIES_0100
     * @tc.desc write forwards 1 bytes with seed 0 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBufferBoundariesTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(1, 0);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(1);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBufferBoundariesTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBUFFERBOUNDARIES_0200
     * @tc.desc write forwards 2 bytes with seed 0 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBufferBoundariesTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(2, 0);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBufferBoundariesTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBUFFERBOUNDARIES_0300
     * @tc.desc write forwards 3 bytes with seed 0 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBufferBoundariesTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(3, 0);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(3);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBufferBoundariesTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBUFFERBOUNDARIES_0400
     * @tc.desc write forwards 4 bytes with seed 0 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBufferBoundariesTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(4, 0);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(4);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBufferBoundariesTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBUFFERBOUNDARIES_0500
     * @tc.desc write forwards 5 bytes with seed 0 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBufferBoundariesTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(5, 0);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(5);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBufferBoundariesTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBUFFERBOUNDARIES_0600
     * @tc.desc write forwards 7 bytes with seed 0 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBufferBoundariesTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(7, 0);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(7);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBufferBoundariesTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBUFFERBOUNDARIES_0700
     * @tc.desc write forwards 8 bytes with seed 0 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBufferBoundariesTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(8, 0);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(8);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBufferBoundariesTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBUFFERBOUNDARIES_0800
     * @tc.desc write forwards 16 bytes with seed 0 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBufferBoundariesTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(16, 0);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(16);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBufferBoundariesTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBUFFERBOUNDARIES_0900
     * @tc.desc write forwards 31 bytes with seed 0 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBufferBoundariesTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(31, 0);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(31);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(31);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBufferBoundariesTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBUFFERBOUNDARIES_1000
     * @tc.desc write forwards 32 bytes with seed 0 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBufferBoundariesTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(32, 0);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(32);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBufferBoundariesTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBUFFERBOUNDARIES_1100
     * @tc.desc write forwards 63 bytes with seed 0 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBufferBoundariesTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(63, 0);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(63);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(63);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialWriteBufferBoundariesTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALWRITEBUFFERBOUNDARIES_1200
     * @tc.desc write forwards 64 bytes with seed 0 without altering the payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialWriteBufferBoundariesTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      const bytes: Uint8Array = payload(64, 0);
      const expected: number[] = Array.from(bytes);
      const written: number = await fixture.controller.write(bytes);
      expect(written).assertEqual(64);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], expected);
      expectBytes(bytes, expected);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
      expect(fixture.port.timeouts[0]).assertEqual(undefined);
      expectSession(fixture);
    });
  });
}
