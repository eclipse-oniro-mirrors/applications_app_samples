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

export default function SerialSessionIsolationTest(): void {
  describe('SerialSessionIsolationTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialSessionIsolation', 'begin');
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
      logSuite('SerialSessionIsolation', 'end');
    });

    /**
     * @tc.name SerialSessionIsolationTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONISOLATION_0100
     * @tc.desc write and onDataRead isolate two controllers for 1 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionIsolationTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const other: SerialFixture = new SerialFixture();
      try {
        await Promise.all([fixture.open(), other.open()]);
        await Promise.all([fixture.controller.onDataRead(), other.controller.onDataRead()]);
        expect(await fixture.controller.write(payload(1, 0))).assertEqual(1);
        other.port.emitData(payload(2, 1));
        expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
        expect(other.controller.snapshot().transmittedBytes).assertEqual(0);
        expect(other.controller.snapshot().receivedBytes).assertEqual(2);
        expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
        await fixture.controller.dispose();
        expectReleased(fixture);
        expectSession(other);
        other.port.emitData(new Uint8Array([0]));
        expect(other.controller.snapshot().receivedBytes).assertEqual(3);
      } finally {
        await other.dispose();
      }
    });

    /**
     * @tc.name SerialSessionIsolationTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONISOLATION_0200
     * @tc.desc write and onDataRead isolate two controllers for 2 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionIsolationTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const other: SerialFixture = new SerialFixture();
      try {
        await Promise.all([fixture.open(), other.open()]);
        await Promise.all([fixture.controller.onDataRead(), other.controller.onDataRead()]);
        expect(await fixture.controller.write(payload(2, 0))).assertEqual(2);
        other.port.emitData(payload(3, 1));
        expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
        expect(other.controller.snapshot().transmittedBytes).assertEqual(0);
        expect(other.controller.snapshot().receivedBytes).assertEqual(3);
        expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
        await fixture.controller.dispose();
        expectReleased(fixture);
        expectSession(other);
        other.port.emitData(new Uint8Array([1]));
        expect(other.controller.snapshot().receivedBytes).assertEqual(4);
      } finally {
        await other.dispose();
      }
    });

    /**
     * @tc.name SerialSessionIsolationTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONISOLATION_0300
     * @tc.desc write and onDataRead isolate two controllers for 3 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionIsolationTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const other: SerialFixture = new SerialFixture();
      try {
        await Promise.all([fixture.open(), other.open()]);
        await Promise.all([fixture.controller.onDataRead(), other.controller.onDataRead()]);
        expect(await fixture.controller.write(payload(3, 0))).assertEqual(3);
        other.port.emitData(payload(4, 1));
        expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
        expect(other.controller.snapshot().transmittedBytes).assertEqual(0);
        expect(other.controller.snapshot().receivedBytes).assertEqual(4);
        expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
        await fixture.controller.dispose();
        expectReleased(fixture);
        expectSession(other);
        other.port.emitData(new Uint8Array([2]));
        expect(other.controller.snapshot().receivedBytes).assertEqual(5);
      } finally {
        await other.dispose();
      }
    });

    /**
     * @tc.name SerialSessionIsolationTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONISOLATION_0400
     * @tc.desc write and onDataRead isolate two controllers for 4 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionIsolationTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const other: SerialFixture = new SerialFixture();
      try {
        await Promise.all([fixture.open(), other.open()]);
        await Promise.all([fixture.controller.onDataRead(), other.controller.onDataRead()]);
        expect(await fixture.controller.write(payload(4, 0))).assertEqual(4);
        other.port.emitData(payload(5, 1));
        expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
        expect(other.controller.snapshot().transmittedBytes).assertEqual(0);
        expect(other.controller.snapshot().receivedBytes).assertEqual(5);
        expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
        await fixture.controller.dispose();
        expectReleased(fixture);
        expectSession(other);
        other.port.emitData(new Uint8Array([3]));
        expect(other.controller.snapshot().receivedBytes).assertEqual(6);
      } finally {
        await other.dispose();
      }
    });

    /**
     * @tc.name SerialSessionIsolationTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONISOLATION_0500
     * @tc.desc write and onDataRead isolate two controllers for 5 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionIsolationTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const other: SerialFixture = new SerialFixture();
      try {
        await Promise.all([fixture.open(), other.open()]);
        await Promise.all([fixture.controller.onDataRead(), other.controller.onDataRead()]);
        expect(await fixture.controller.write(payload(5, 0))).assertEqual(5);
        other.port.emitData(payload(6, 1));
        expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
        expect(other.controller.snapshot().transmittedBytes).assertEqual(0);
        expect(other.controller.snapshot().receivedBytes).assertEqual(6);
        expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
        await fixture.controller.dispose();
        expectReleased(fixture);
        expectSession(other);
        other.port.emitData(new Uint8Array([4]));
        expect(other.controller.snapshot().receivedBytes).assertEqual(7);
      } finally {
        await other.dispose();
      }
    });

    /**
     * @tc.name SerialSessionIsolationTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONISOLATION_0600
     * @tc.desc write and onDataRead isolate two controllers for 7 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionIsolationTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const other: SerialFixture = new SerialFixture();
      try {
        await Promise.all([fixture.open(), other.open()]);
        await Promise.all([fixture.controller.onDataRead(), other.controller.onDataRead()]);
        expect(await fixture.controller.write(payload(7, 0))).assertEqual(7);
        other.port.emitData(payload(8, 1));
        expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
        expect(other.controller.snapshot().transmittedBytes).assertEqual(0);
        expect(other.controller.snapshot().receivedBytes).assertEqual(8);
        expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
        await fixture.controller.dispose();
        expectReleased(fixture);
        expectSession(other);
        other.port.emitData(new Uint8Array([5]));
        expect(other.controller.snapshot().receivedBytes).assertEqual(9);
      } finally {
        await other.dispose();
      }
    });

    /**
     * @tc.name SerialSessionIsolationTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONISOLATION_0700
     * @tc.desc write and onDataRead isolate two controllers for 8 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionIsolationTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const other: SerialFixture = new SerialFixture();
      try {
        await Promise.all([fixture.open(), other.open()]);
        await Promise.all([fixture.controller.onDataRead(), other.controller.onDataRead()]);
        expect(await fixture.controller.write(payload(8, 0))).assertEqual(8);
        other.port.emitData(payload(9, 1));
        expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
        expect(other.controller.snapshot().transmittedBytes).assertEqual(0);
        expect(other.controller.snapshot().receivedBytes).assertEqual(9);
        expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
        await fixture.controller.dispose();
        expectReleased(fixture);
        expectSession(other);
        other.port.emitData(new Uint8Array([6]));
        expect(other.controller.snapshot().receivedBytes).assertEqual(10);
      } finally {
        await other.dispose();
      }
    });

    /**
     * @tc.name SerialSessionIsolationTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONISOLATION_0800
     * @tc.desc write and onDataRead isolate two controllers for 16 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionIsolationTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const other: SerialFixture = new SerialFixture();
      try {
        await Promise.all([fixture.open(), other.open()]);
        await Promise.all([fixture.controller.onDataRead(), other.controller.onDataRead()]);
        expect(await fixture.controller.write(payload(16, 0))).assertEqual(16);
        other.port.emitData(payload(17, 1));
        expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
        expect(other.controller.snapshot().transmittedBytes).assertEqual(0);
        expect(other.controller.snapshot().receivedBytes).assertEqual(17);
        expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
        await fixture.controller.dispose();
        expectReleased(fixture);
        expectSession(other);
        other.port.emitData(new Uint8Array([7]));
        expect(other.controller.snapshot().receivedBytes).assertEqual(18);
      } finally {
        await other.dispose();
      }
    });

    /**
     * @tc.name SerialSessionIsolationTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONISOLATION_0900
     * @tc.desc write and onDataRead isolate two controllers for 31 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionIsolationTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const other: SerialFixture = new SerialFixture();
      try {
        await Promise.all([fixture.open(), other.open()]);
        await Promise.all([fixture.controller.onDataRead(), other.controller.onDataRead()]);
        expect(await fixture.controller.write(payload(31, 0))).assertEqual(31);
        other.port.emitData(payload(32, 1));
        expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
        expect(other.controller.snapshot().transmittedBytes).assertEqual(0);
        expect(other.controller.snapshot().receivedBytes).assertEqual(32);
        expect(fixture.controller.snapshot().transmittedBytes).assertEqual(31);
        await fixture.controller.dispose();
        expectReleased(fixture);
        expectSession(other);
        other.port.emitData(new Uint8Array([8]));
        expect(other.controller.snapshot().receivedBytes).assertEqual(33);
      } finally {
        await other.dispose();
      }
    });

    /**
     * @tc.name SerialSessionIsolationTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONISOLATION_1000
     * @tc.desc write and onDataRead isolate two controllers for 32 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionIsolationTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const other: SerialFixture = new SerialFixture();
      try {
        await Promise.all([fixture.open(), other.open()]);
        await Promise.all([fixture.controller.onDataRead(), other.controller.onDataRead()]);
        expect(await fixture.controller.write(payload(32, 0))).assertEqual(32);
        other.port.emitData(payload(33, 1));
        expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
        expect(other.controller.snapshot().transmittedBytes).assertEqual(0);
        expect(other.controller.snapshot().receivedBytes).assertEqual(33);
        expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
        await fixture.controller.dispose();
        expectReleased(fixture);
        expectSession(other);
        other.port.emitData(new Uint8Array([9]));
        expect(other.controller.snapshot().receivedBytes).assertEqual(34);
      } finally {
        await other.dispose();
      }
    });

    /**
     * @tc.name SerialSessionIsolationTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONISOLATION_1100
     * @tc.desc write and onDataRead isolate two controllers for 63 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionIsolationTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const other: SerialFixture = new SerialFixture();
      try {
        await Promise.all([fixture.open(), other.open()]);
        await Promise.all([fixture.controller.onDataRead(), other.controller.onDataRead()]);
        expect(await fixture.controller.write(payload(63, 0))).assertEqual(63);
        other.port.emitData(payload(64, 1));
        expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
        expect(other.controller.snapshot().transmittedBytes).assertEqual(0);
        expect(other.controller.snapshot().receivedBytes).assertEqual(64);
        expect(fixture.controller.snapshot().transmittedBytes).assertEqual(63);
        await fixture.controller.dispose();
        expectReleased(fixture);
        expectSession(other);
        other.port.emitData(new Uint8Array([10]));
        expect(other.controller.snapshot().receivedBytes).assertEqual(65);
      } finally {
        await other.dispose();
      }
    });

    /**
     * @tc.name SerialSessionIsolationTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONISOLATION_1200
     * @tc.desc write and onDataRead isolate two controllers for 64 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionIsolationTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const other: SerialFixture = new SerialFixture();
      try {
        await Promise.all([fixture.open(), other.open()]);
        await Promise.all([fixture.controller.onDataRead(), other.controller.onDataRead()]);
        expect(await fixture.controller.write(payload(64, 0))).assertEqual(64);
        other.port.emitData(payload(65, 1));
        expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
        expect(other.controller.snapshot().transmittedBytes).assertEqual(0);
        expect(other.controller.snapshot().receivedBytes).assertEqual(65);
        expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
        await fixture.controller.dispose();
        expectReleased(fixture);
        expectSession(other);
        other.port.emitData(new Uint8Array([11]));
        expect(other.controller.snapshot().receivedBytes).assertEqual(66);
      } finally {
        await other.dispose();
      }
    });

    /**
     * @tc.name SerialSessionIsolationTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALSESSIONISOLATION_1300
     * @tc.desc write and onDataRead isolate two controllers for 127 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialSessionIsolationTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const other: SerialFixture = new SerialFixture();
      try {
        await Promise.all([fixture.open(), other.open()]);
        await Promise.all([fixture.controller.onDataRead(), other.controller.onDataRead()]);
        expect(await fixture.controller.write(payload(127, 0))).assertEqual(127);
        other.port.emitData(payload(128, 1));
        expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
        expect(other.controller.snapshot().transmittedBytes).assertEqual(0);
        expect(other.controller.snapshot().receivedBytes).assertEqual(128);
        expect(fixture.controller.snapshot().transmittedBytes).assertEqual(127);
        await fixture.controller.dispose();
        expectReleased(fixture);
        expectSession(other);
        other.port.emitData(new Uint8Array([12]));
        expect(other.controller.snapshot().receivedBytes).assertEqual(129);
      } finally {
        await other.dispose();
      }
    });
  });
}
