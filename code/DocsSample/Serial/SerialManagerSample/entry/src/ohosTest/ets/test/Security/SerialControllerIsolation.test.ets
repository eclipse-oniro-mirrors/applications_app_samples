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

export default function SerialControllerIsolationTest(): void {
  describe('SerialControllerIsolationTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialControllerIsolation', 'begin');
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
      logSuite('SerialControllerIsolation', 'end');
    });

    /**
     * @tc.name SerialControllerIsolationTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONTROLLERISOLATION_0100
     * @tc.desc write and onDataRead isolate two controllers for 128 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialControllerIsolationTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const other: SerialFixture = new SerialFixture();
      try {
        await Promise.all([fixture.open(), other.open()]);
        await Promise.all([fixture.controller.onDataRead(), other.controller.onDataRead()]);
        expect(await fixture.controller.write(payload(128, 0))).assertEqual(128);
        other.port.emitData(payload(129, 1));
        expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
        expect(other.controller.snapshot().transmittedBytes).assertEqual(0);
        expect(other.controller.snapshot().receivedBytes).assertEqual(129);
        expect(fixture.controller.snapshot().transmittedBytes).assertEqual(128);
        await fixture.controller.dispose();
        expectReleased(fixture);
        expectSession(other);
        other.port.emitData(new Uint8Array([13]));
        expect(other.controller.snapshot().receivedBytes).assertEqual(130);
      } finally {
        await other.dispose();
      }
    });

    /**
     * @tc.name SerialControllerIsolationTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONTROLLERISOLATION_0200
     * @tc.desc write and onDataRead isolate two controllers for 255 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialControllerIsolationTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const other: SerialFixture = new SerialFixture();
      try {
        await Promise.all([fixture.open(), other.open()]);
        await Promise.all([fixture.controller.onDataRead(), other.controller.onDataRead()]);
        expect(await fixture.controller.write(payload(255, 0))).assertEqual(255);
        other.port.emitData(payload(256, 1));
        expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
        expect(other.controller.snapshot().transmittedBytes).assertEqual(0);
        expect(other.controller.snapshot().receivedBytes).assertEqual(256);
        expect(fixture.controller.snapshot().transmittedBytes).assertEqual(255);
        await fixture.controller.dispose();
        expectReleased(fixture);
        expectSession(other);
        other.port.emitData(new Uint8Array([14]));
        expect(other.controller.snapshot().receivedBytes).assertEqual(257);
      } finally {
        await other.dispose();
      }
    });

    /**
     * @tc.name SerialControllerIsolationTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONTROLLERISOLATION_0300
     * @tc.desc write and onDataRead isolate two controllers for 256 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialControllerIsolationTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const other: SerialFixture = new SerialFixture();
      try {
        await Promise.all([fixture.open(), other.open()]);
        await Promise.all([fixture.controller.onDataRead(), other.controller.onDataRead()]);
        expect(await fixture.controller.write(payload(256, 0))).assertEqual(256);
        other.port.emitData(payload(257, 1));
        expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
        expect(other.controller.snapshot().transmittedBytes).assertEqual(0);
        expect(other.controller.snapshot().receivedBytes).assertEqual(257);
        expect(fixture.controller.snapshot().transmittedBytes).assertEqual(256);
        await fixture.controller.dispose();
        expectReleased(fixture);
        expectSession(other);
        other.port.emitData(new Uint8Array([15]));
        expect(other.controller.snapshot().receivedBytes).assertEqual(258);
      } finally {
        await other.dispose();
      }
    });

    /**
     * @tc.name SerialControllerIsolationTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONTROLLERISOLATION_0400
     * @tc.desc write and onDataRead isolate two controllers for 511 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialControllerIsolationTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const other: SerialFixture = new SerialFixture();
      try {
        await Promise.all([fixture.open(), other.open()]);
        await Promise.all([fixture.controller.onDataRead(), other.controller.onDataRead()]);
        expect(await fixture.controller.write(payload(511, 0))).assertEqual(511);
        other.port.emitData(payload(512, 1));
        expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
        expect(other.controller.snapshot().transmittedBytes).assertEqual(0);
        expect(other.controller.snapshot().receivedBytes).assertEqual(512);
        expect(fixture.controller.snapshot().transmittedBytes).assertEqual(511);
        await fixture.controller.dispose();
        expectReleased(fixture);
        expectSession(other);
        other.port.emitData(new Uint8Array([16]));
        expect(other.controller.snapshot().receivedBytes).assertEqual(513);
      } finally {
        await other.dispose();
      }
    });

    /**
     * @tc.name SerialControllerIsolationTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONTROLLERISOLATION_0500
     * @tc.desc write and onDataRead isolate two controllers for 512 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialControllerIsolationTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const other: SerialFixture = new SerialFixture();
      try {
        await Promise.all([fixture.open(), other.open()]);
        await Promise.all([fixture.controller.onDataRead(), other.controller.onDataRead()]);
        expect(await fixture.controller.write(payload(512, 0))).assertEqual(512);
        other.port.emitData(payload(513, 1));
        expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
        expect(other.controller.snapshot().transmittedBytes).assertEqual(0);
        expect(other.controller.snapshot().receivedBytes).assertEqual(513);
        expect(fixture.controller.snapshot().transmittedBytes).assertEqual(512);
        await fixture.controller.dispose();
        expectReleased(fixture);
        expectSession(other);
        other.port.emitData(new Uint8Array([17]));
        expect(other.controller.snapshot().receivedBytes).assertEqual(514);
      } finally {
        await other.dispose();
      }
    });

    /**
     * @tc.name SerialControllerIsolationTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONTROLLERISOLATION_0600
     * @tc.desc write and onDataRead isolate two controllers for 1023 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialControllerIsolationTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const other: SerialFixture = new SerialFixture();
      try {
        await Promise.all([fixture.open(), other.open()]);
        await Promise.all([fixture.controller.onDataRead(), other.controller.onDataRead()]);
        expect(await fixture.controller.write(payload(1023, 0))).assertEqual(1023);
        other.port.emitData(payload(1024, 1));
        expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
        expect(other.controller.snapshot().transmittedBytes).assertEqual(0);
        expect(other.controller.snapshot().receivedBytes).assertEqual(1024);
        expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1023);
        await fixture.controller.dispose();
        expectReleased(fixture);
        expectSession(other);
        other.port.emitData(new Uint8Array([18]));
        expect(other.controller.snapshot().receivedBytes).assertEqual(1025);
      } finally {
        await other.dispose();
      }
    });

    /**
     * @tc.name SerialControllerIsolationTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONTROLLERISOLATION_0700
     * @tc.desc write and onDataRead isolate two controllers for 1024 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialControllerIsolationTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const other: SerialFixture = new SerialFixture();
      try {
        await Promise.all([fixture.open(), other.open()]);
        await Promise.all([fixture.controller.onDataRead(), other.controller.onDataRead()]);
        expect(await fixture.controller.write(payload(1024, 0))).assertEqual(1024);
        other.port.emitData(payload(1025, 1));
        expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
        expect(other.controller.snapshot().transmittedBytes).assertEqual(0);
        expect(other.controller.snapshot().receivedBytes).assertEqual(1025);
        expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1024);
        await fixture.controller.dispose();
        expectReleased(fixture);
        expectSession(other);
        other.port.emitData(new Uint8Array([19]));
        expect(other.controller.snapshot().receivedBytes).assertEqual(1026);
      } finally {
        await other.dispose();
      }
    });

    /**
     * @tc.name SerialControllerIsolationTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONTROLLERISOLATION_0800
     * @tc.desc write and onDataRead isolate two controllers for 2048 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialControllerIsolationTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const other: SerialFixture = new SerialFixture();
      try {
        await Promise.all([fixture.open(), other.open()]);
        await Promise.all([fixture.controller.onDataRead(), other.controller.onDataRead()]);
        expect(await fixture.controller.write(payload(2048, 0))).assertEqual(2048);
        other.port.emitData(payload(2049, 1));
        expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
        expect(other.controller.snapshot().transmittedBytes).assertEqual(0);
        expect(other.controller.snapshot().receivedBytes).assertEqual(2049);
        expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2048);
        await fixture.controller.dispose();
        expectReleased(fixture);
        expectSession(other);
        other.port.emitData(new Uint8Array([20]));
        expect(other.controller.snapshot().receivedBytes).assertEqual(2050);
      } finally {
        await other.dispose();
      }
    });

    /**
     * @tc.name SerialControllerIsolationTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONTROLLERISOLATION_0900
     * @tc.desc write and onDataRead isolate two controllers for 4095 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialControllerIsolationTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const other: SerialFixture = new SerialFixture();
      try {
        await Promise.all([fixture.open(), other.open()]);
        await Promise.all([fixture.controller.onDataRead(), other.controller.onDataRead()]);
        expect(await fixture.controller.write(payload(4095, 0))).assertEqual(4095);
        other.port.emitData(payload(4096, 1));
        expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
        expect(other.controller.snapshot().transmittedBytes).assertEqual(0);
        expect(other.controller.snapshot().receivedBytes).assertEqual(4096);
        expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4095);
        await fixture.controller.dispose();
        expectReleased(fixture);
        expectSession(other);
        other.port.emitData(new Uint8Array([21]));
        expect(other.controller.snapshot().receivedBytes).assertEqual(4097);
      } finally {
        await other.dispose();
      }
    });

    /**
     * @tc.name SerialControllerIsolationTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONTROLLERISOLATION_1000
     * @tc.desc write and onDataRead isolate two controllers for 4096 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialControllerIsolationTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const other: SerialFixture = new SerialFixture();
      try {
        await Promise.all([fixture.open(), other.open()]);
        await Promise.all([fixture.controller.onDataRead(), other.controller.onDataRead()]);
        expect(await fixture.controller.write(payload(4096, 0))).assertEqual(4096);
        other.port.emitData(payload(4097, 1));
        expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
        expect(other.controller.snapshot().transmittedBytes).assertEqual(0);
        expect(other.controller.snapshot().receivedBytes).assertEqual(4097);
        expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4096);
        await fixture.controller.dispose();
        expectReleased(fixture);
        expectSession(other);
        other.port.emitData(new Uint8Array([22]));
        expect(other.controller.snapshot().receivedBytes).assertEqual(4098);
      } finally {
        await other.dispose();
      }
    });

    /**
     * @tc.name SerialControllerIsolationTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONTROLLERISOLATION_1100
     * @tc.desc write and onDataRead isolate two controllers for 1 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialControllerIsolationTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const other: SerialFixture = new SerialFixture();
      try {
        await Promise.all([fixture.open(), other.open()]);
        await Promise.all([fixture.controller.onDataRead(), other.controller.onDataRead()]);
        expect(await fixture.controller.write(payload(1, 1))).assertEqual(1);
        other.port.emitData(payload(2, 2));
        expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
        expect(other.controller.snapshot().transmittedBytes).assertEqual(0);
        expect(other.controller.snapshot().receivedBytes).assertEqual(2);
        expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
        await fixture.controller.dispose();
        expectReleased(fixture);
        expectSession(other);
        other.port.emitData(new Uint8Array([23]));
        expect(other.controller.snapshot().receivedBytes).assertEqual(3);
      } finally {
        await other.dispose();
      }
    });

    /**
     * @tc.name SerialControllerIsolationTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALCONTROLLERISOLATION_1200
     * @tc.desc write and onDataRead isolate two controllers for 2 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialControllerIsolationTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const other: SerialFixture = new SerialFixture();
      try {
        await Promise.all([fixture.open(), other.open()]);
        await Promise.all([fixture.controller.onDataRead(), other.controller.onDataRead()]);
        expect(await fixture.controller.write(payload(2, 1))).assertEqual(2);
        other.port.emitData(payload(3, 2));
        expect(fixture.controller.snapshot().receivedBytes).assertEqual(0);
        expect(other.controller.snapshot().transmittedBytes).assertEqual(0);
        expect(other.controller.snapshot().receivedBytes).assertEqual(3);
        expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
        await fixture.controller.dispose();
        expectReleased(fixture);
        expectSession(other);
        other.port.emitData(new Uint8Array([24]));
        expect(other.controller.snapshot().receivedBytes).assertEqual(4);
      } finally {
        await other.dispose();
      }
    });
  });
}
