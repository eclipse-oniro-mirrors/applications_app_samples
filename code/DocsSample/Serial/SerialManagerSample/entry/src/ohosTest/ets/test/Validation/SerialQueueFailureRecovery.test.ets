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

export default function SerialQueueFailureRecoveryTest(): void {
  describe('SerialQueueFailureRecoveryTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialQueueFailureRecovery', 'begin');
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
      logSuite('SerialQueueFailureRecovery', 'end');
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_0100
     * @tc.desc write rejects code 35700001 while a queued write of 1 bytes seed 0 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700001);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([0])),
        'BusinessError', 35700001);
      const next: Promise<number> = fixture.controller.write(payload(1, 0));
      await failed;
      expect(await next).assertEqual(1);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(1, 0)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_0200
     * @tc.desc write rejects code 35700002 while a queued write of 2 bytes seed 0 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700002);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([1])),
        'BusinessError', 35700002);
      const next: Promise<number> = fixture.controller.write(payload(2, 0));
      await failed;
      expect(await next).assertEqual(2);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(2, 0)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_0300
     * @tc.desc write rejects code 35700003 while a queued write of 3 bytes seed 0 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700003);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([2])),
        'BusinessError', 35700003);
      const next: Promise<number> = fixture.controller.write(payload(3, 0));
      await failed;
      expect(await next).assertEqual(3);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(3, 0)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_0400
     * @tc.desc write rejects code 35700004 while a queued write of 4 bytes seed 0 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700004);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([3])),
        'BusinessError', 35700004);
      const next: Promise<number> = fixture.controller.write(payload(4, 0));
      await failed;
      expect(await next).assertEqual(4);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(4, 0)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_0500
     * @tc.desc write rejects code 35700005 while a queued write of 5 bytes seed 0 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700005);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([4])),
        'BusinessError', 35700005);
      const next: Promise<number> = fixture.controller.write(payload(5, 0));
      await failed;
      expect(await next).assertEqual(5);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(5, 0)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_0600
     * @tc.desc write rejects code 35700006 while a queued write of 7 bytes seed 0 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700006);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([5])),
        'BusinessError', 35700006);
      const next: Promise<number> = fixture.controller.write(payload(7, 0));
      await failed;
      expect(await next).assertEqual(7);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(7, 0)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_0700
     * @tc.desc write rejects code 35700007 while a queued write of 8 bytes seed 0 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700007);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([6])),
        'BusinessError', 35700007);
      const next: Promise<number> = fixture.controller.write(payload(8, 0));
      await failed;
      expect(await next).assertEqual(8);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(8, 0)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_0800
     * @tc.desc write rejects code 35700001 while a queued write of 16 bytes seed 0 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700001);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([7])),
        'BusinessError', 35700001);
      const next: Promise<number> = fixture.controller.write(payload(16, 0));
      await failed;
      expect(await next).assertEqual(16);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(16, 0)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_0900
     * @tc.desc write rejects code 35700002 while a queued write of 31 bytes seed 0 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700002);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([8])),
        'BusinessError', 35700002);
      const next: Promise<number> = fixture.controller.write(payload(31, 0));
      await failed;
      expect(await next).assertEqual(31);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(31, 0)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(31);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_1000
     * @tc.desc write rejects code 35700003 while a queued write of 32 bytes seed 0 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700003);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([9])),
        'BusinessError', 35700003);
      const next: Promise<number> = fixture.controller.write(payload(32, 0));
      await failed;
      expect(await next).assertEqual(32);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(32, 0)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_1100
     * @tc.desc write rejects code 35700004 while a queued write of 63 bytes seed 0 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700004);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([10])),
        'BusinessError', 35700004);
      const next: Promise<number> = fixture.controller.write(payload(63, 0));
      await failed;
      expect(await next).assertEqual(63);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(63, 0)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(63);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_1200
     * @tc.desc write rejects code 35700005 while a queued write of 64 bytes seed 0 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700005);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([11])),
        'BusinessError', 35700005);
      const next: Promise<number> = fixture.controller.write(payload(64, 0));
      await failed;
      expect(await next).assertEqual(64);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(64, 0)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_1300
     * @tc.desc write rejects code 35700006 while a queued write of 127 bytes seed 0 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700006);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([12])),
        'BusinessError', 35700006);
      const next: Promise<number> = fixture.controller.write(payload(127, 0));
      await failed;
      expect(await next).assertEqual(127);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(127, 0)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(127);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_1400
     * @tc.desc write rejects code 35700007 while a queued write of 128 bytes seed 0 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700007);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([13])),
        'BusinessError', 35700007);
      const next: Promise<number> = fixture.controller.write(payload(128, 0));
      await failed;
      expect(await next).assertEqual(128);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(128, 0)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(128);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_1500
     * @tc.desc write rejects code 35700001 while a queued write of 255 bytes seed 0 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700001);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([14])),
        'BusinessError', 35700001);
      const next: Promise<number> = fixture.controller.write(payload(255, 0));
      await failed;
      expect(await next).assertEqual(255);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(255, 0)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(255);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_1600
     * @tc.desc write rejects code 35700002 while a queued write of 256 bytes seed 0 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700002);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([15])),
        'BusinessError', 35700002);
      const next: Promise<number> = fixture.controller.write(payload(256, 0));
      await failed;
      expect(await next).assertEqual(256);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(256, 0)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(256);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_1700
     * @tc.desc write rejects code 35700003 while a queued write of 511 bytes seed 0 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700003);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([16])),
        'BusinessError', 35700003);
      const next: Promise<number> = fixture.controller.write(payload(511, 0));
      await failed;
      expect(await next).assertEqual(511);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(511, 0)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(511);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_1800
     * @tc.desc write rejects code 35700004 while a queued write of 512 bytes seed 0 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700004);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([17])),
        'BusinessError', 35700004);
      const next: Promise<number> = fixture.controller.write(payload(512, 0));
      await failed;
      expect(await next).assertEqual(512);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(512, 0)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(512);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_1900
     * @tc.desc write rejects code 35700005 while a queued write of 1023 bytes seed 0 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700005);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([18])),
        'BusinessError', 35700005);
      const next: Promise<number> = fixture.controller.write(payload(1023, 0));
      await failed;
      expect(await next).assertEqual(1023);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(1023, 0)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1023);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_2000
     * @tc.desc write rejects code 35700006 while a queued write of 1024 bytes seed 0 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700006);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([19])),
        'BusinessError', 35700006);
      const next: Promise<number> = fixture.controller.write(payload(1024, 0));
      await failed;
      expect(await next).assertEqual(1024);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(1024, 0)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1024);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_2100
     * @tc.desc write rejects code 35700007 while a queued write of 2048 bytes seed 0 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700007);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([20])),
        'BusinessError', 35700007);
      const next: Promise<number> = fixture.controller.write(payload(2048, 0));
      await failed;
      expect(await next).assertEqual(2048);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(2048, 0)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2048);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_2200
     * @tc.desc write rejects code 35700001 while a queued write of 4095 bytes seed 0 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700001);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([21])),
        'BusinessError', 35700001);
      const next: Promise<number> = fixture.controller.write(payload(4095, 0));
      await failed;
      expect(await next).assertEqual(4095);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(4095, 0)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4095);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_2300
     * @tc.desc write rejects code 35700002 while a queued write of 4096 bytes seed 0 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700002);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([22])),
        'BusinessError', 35700002);
      const next: Promise<number> = fixture.controller.write(payload(4096, 0));
      await failed;
      expect(await next).assertEqual(4096);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(4096, 0)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4096);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_2400
     * @tc.desc write rejects code 35700003 while a queued write of 1 bytes seed 1 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700003);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([23])),
        'BusinessError', 35700003);
      const next: Promise<number> = fixture.controller.write(payload(1, 1));
      await failed;
      expect(await next).assertEqual(1);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(1, 1)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_2500
     * @tc.desc write rejects code 35700004 while a queued write of 2 bytes seed 1 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700004);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([24])),
        'BusinessError', 35700004);
      const next: Promise<number> = fixture.controller.write(payload(2, 1));
      await failed;
      expect(await next).assertEqual(2);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(2, 1)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_2600
     * @tc.desc write rejects code 35700005 while a queued write of 3 bytes seed 1 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700005);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([25])),
        'BusinessError', 35700005);
      const next: Promise<number> = fixture.controller.write(payload(3, 1));
      await failed;
      expect(await next).assertEqual(3);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(3, 1)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(3);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_2700
     * @tc.desc write rejects code 35700006 while a queued write of 4 bytes seed 1 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700006);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([26])),
        'BusinessError', 35700006);
      const next: Promise<number> = fixture.controller.write(payload(4, 1));
      await failed;
      expect(await next).assertEqual(4);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(4, 1)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_2800
     * @tc.desc write rejects code 35700007 while a queued write of 5 bytes seed 1 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700007);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([27])),
        'BusinessError', 35700007);
      const next: Promise<number> = fixture.controller.write(payload(5, 1));
      await failed;
      expect(await next).assertEqual(5);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(5, 1)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(5);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_2900
     * @tc.desc write rejects code 35700001 while a queued write of 7 bytes seed 1 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700001);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([28])),
        'BusinessError', 35700001);
      const next: Promise<number> = fixture.controller.write(payload(7, 1));
      await failed;
      expect(await next).assertEqual(7);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(7, 1)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(7);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_3000
     * @tc.desc write rejects code 35700002 while a queued write of 8 bytes seed 1 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700002);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([29])),
        'BusinessError', 35700002);
      const next: Promise<number> = fixture.controller.write(payload(8, 1));
      await failed;
      expect(await next).assertEqual(8);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(8, 1)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_3100
     * @tc.desc write rejects code 35700003 while a queued write of 16 bytes seed 1 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700003);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([30])),
        'BusinessError', 35700003);
      const next: Promise<number> = fixture.controller.write(payload(16, 1));
      await failed;
      expect(await next).assertEqual(16);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(16, 1)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_3200
     * @tc.desc write rejects code 35700004 while a queued write of 31 bytes seed 1 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700004);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([31])),
        'BusinessError', 35700004);
      const next: Promise<number> = fixture.controller.write(payload(31, 1));
      await failed;
      expect(await next).assertEqual(31);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(31, 1)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(31);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_3300
     * @tc.desc write rejects code 35700005 while a queued write of 32 bytes seed 1 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700005);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([32])),
        'BusinessError', 35700005);
      const next: Promise<number> = fixture.controller.write(payload(32, 1));
      await failed;
      expect(await next).assertEqual(32);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(32, 1)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_3400
     * @tc.desc write rejects code 35700006 while a queued write of 63 bytes seed 1 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700006);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([33])),
        'BusinessError', 35700006);
      const next: Promise<number> = fixture.controller.write(payload(63, 1));
      await failed;
      expect(await next).assertEqual(63);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(63, 1)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(63);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_3500
     * @tc.desc write rejects code 35700007 while a queued write of 64 bytes seed 1 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700007);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([34])),
        'BusinessError', 35700007);
      const next: Promise<number> = fixture.controller.write(payload(64, 1));
      await failed;
      expect(await next).assertEqual(64);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(64, 1)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
      expectSession(fixture);
    });

    /**
     * @tc.name SerialQueueFailureRecoveryTest036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALQUEUEFAILURERECOVERY_3600
     * @tc.desc write rejects code 35700001 while a queued write of 127 bytes seed 1 completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialQueueFailureRecoveryTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await fixture.open();
      fixture.port.failOnce('write', 35700001);
      const failed: Promise<void> = expectFailure(async () => fixture.controller.write(new Uint8Array([35])),
        'BusinessError', 35700001);
      const next: Promise<number> = fixture.controller.write(payload(127, 1));
      await failed;
      expect(await next).assertEqual(127);
      expect(fixture.port.callCount('write')).assertEqual(2);
      expect(fixture.port.writes.length).assertEqual(1);
      expectBytes(fixture.port.writes[0], Array.from(payload(127, 1)));
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(127);
      expectSession(fixture);
    });
  });
}
