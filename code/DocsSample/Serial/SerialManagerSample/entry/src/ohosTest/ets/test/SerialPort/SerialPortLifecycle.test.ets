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

export default function SerialPortLifecycleTest(): void {
  describe('SerialPortLifecycleTest', () => {
    let fixture: SerialFixture = new SerialFixture();

    beforeAll(() => {
      logSuite('SerialPortLifecycle', 'begin');
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
      logSuite('SerialPortLifecycle', 'end');
    });

    /**
     * @tc.name SerialPortLifecycleTest001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTLIFECYCLE_0100
     * @tc.desc getSerialPortList open close repeat 1 sessions with 256 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortLifecycleTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index: number = 0; index < 1; index++) {
        await fixture.select();
        await fixture.controller.open();
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
        expect(await fixture.controller.write(payload(256, 0))).assertEqual(256);
        fixture.port.emitData(payload(256, 0));
        expectSession(fixture);
        await fixture.controller.close();
        expectReleased(fixture);
      }
      expect(fixture.port.callCount('open')).assertEqual(1);
      expect(fixture.port.callCount('close')).assertEqual(1);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(256);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(256);
    });

    /**
     * @tc.name SerialPortLifecycleTest002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTLIFECYCLE_0200
     * @tc.desc getSerialPortList open close repeat 1 sessions with 511 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortLifecycleTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index: number = 0; index < 1; index++) {
        await fixture.select();
        await fixture.controller.open();
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
        expect(await fixture.controller.write(payload(511, 0))).assertEqual(511);
        fixture.port.emitData(payload(511, 0));
        expectSession(fixture);
        await fixture.controller.close();
        expectReleased(fixture);
      }
      expect(fixture.port.callCount('open')).assertEqual(1);
      expect(fixture.port.callCount('close')).assertEqual(1);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(511);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(511);
    });

    /**
     * @tc.name SerialPortLifecycleTest003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTLIFECYCLE_0300
     * @tc.desc getSerialPortList open close repeat 1 sessions with 512 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortLifecycleTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index: number = 0; index < 1; index++) {
        await fixture.select();
        await fixture.controller.open();
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
        expect(await fixture.controller.write(payload(512, 0))).assertEqual(512);
        fixture.port.emitData(payload(512, 0));
        expectSession(fixture);
        await fixture.controller.close();
        expectReleased(fixture);
      }
      expect(fixture.port.callCount('open')).assertEqual(1);
      expect(fixture.port.callCount('close')).assertEqual(1);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(512);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(512);
    });

    /**
     * @tc.name SerialPortLifecycleTest004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTLIFECYCLE_0400
     * @tc.desc getSerialPortList open close repeat 1 sessions with 1023 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortLifecycleTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index: number = 0; index < 1; index++) {
        await fixture.select();
        await fixture.controller.open();
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
        expect(await fixture.controller.write(payload(1023, 0))).assertEqual(1023);
        fixture.port.emitData(payload(1023, 0));
        expectSession(fixture);
        await fixture.controller.close();
        expectReleased(fixture);
      }
      expect(fixture.port.callCount('open')).assertEqual(1);
      expect(fixture.port.callCount('close')).assertEqual(1);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1023);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1023);
    });

    /**
     * @tc.name SerialPortLifecycleTest005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTLIFECYCLE_0500
     * @tc.desc getSerialPortList open close repeat 1 sessions with 1024 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortLifecycleTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index: number = 0; index < 1; index++) {
        await fixture.select();
        await fixture.controller.open();
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
        expect(await fixture.controller.write(payload(1024, 0))).assertEqual(1024);
        fixture.port.emitData(payload(1024, 0));
        expectSession(fixture);
        await fixture.controller.close();
        expectReleased(fixture);
      }
      expect(fixture.port.callCount('open')).assertEqual(1);
      expect(fixture.port.callCount('close')).assertEqual(1);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(1024);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(1024);
    });

    /**
     * @tc.name SerialPortLifecycleTest006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTLIFECYCLE_0600
     * @tc.desc getSerialPortList open close repeat 1 sessions with 2048 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortLifecycleTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index: number = 0; index < 1; index++) {
        await fixture.select();
        await fixture.controller.open();
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
        expect(await fixture.controller.write(payload(2048, 0))).assertEqual(2048);
        fixture.port.emitData(payload(2048, 0));
        expectSession(fixture);
        await fixture.controller.close();
        expectReleased(fixture);
      }
      expect(fixture.port.callCount('open')).assertEqual(1);
      expect(fixture.port.callCount('close')).assertEqual(1);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2048);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2048);
    });

    /**
     * @tc.name SerialPortLifecycleTest007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTLIFECYCLE_0700
     * @tc.desc getSerialPortList open close repeat 1 sessions with 4095 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortLifecycleTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index: number = 0; index < 1; index++) {
        await fixture.select();
        await fixture.controller.open();
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
        expect(await fixture.controller.write(payload(4095, 0))).assertEqual(4095);
        fixture.port.emitData(payload(4095, 0));
        expectSession(fixture);
        await fixture.controller.close();
        expectReleased(fixture);
      }
      expect(fixture.port.callCount('open')).assertEqual(1);
      expect(fixture.port.callCount('close')).assertEqual(1);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4095);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4095);
    });

    /**
     * @tc.name SerialPortLifecycleTest008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTLIFECYCLE_0800
     * @tc.desc getSerialPortList open close repeat 1 sessions with 4096 bytes seed 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortLifecycleTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index: number = 0; index < 1; index++) {
        await fixture.select();
        await fixture.controller.open();
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
        expect(await fixture.controller.write(payload(4096, 0))).assertEqual(4096);
        fixture.port.emitData(payload(4096, 0));
        expectSession(fixture);
        await fixture.controller.close();
        expectReleased(fixture);
      }
      expect(fixture.port.callCount('open')).assertEqual(1);
      expect(fixture.port.callCount('close')).assertEqual(1);
      expect(fixture.provider.calls).assertEqual(1);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4096);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4096);
    });

    /**
     * @tc.name SerialPortLifecycleTest009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTLIFECYCLE_0900
     * @tc.desc getSerialPortList open close repeat 2 sessions with 1 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortLifecycleTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index: number = 0; index < 2; index++) {
        await fixture.select();
        await fixture.controller.open();
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
        expect(await fixture.controller.write(payload(1, 1))).assertEqual(1);
        fixture.port.emitData(payload(1, 1));
        expectSession(fixture);
        await fixture.controller.close();
        expectReleased(fixture);
      }
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expect(fixture.provider.calls).assertEqual(2);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(2);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(2);
    });

    /**
     * @tc.name SerialPortLifecycleTest010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTLIFECYCLE_1000
     * @tc.desc getSerialPortList open close repeat 2 sessions with 2 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortLifecycleTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index: number = 0; index < 2; index++) {
        await fixture.select();
        await fixture.controller.open();
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
        expect(await fixture.controller.write(payload(2, 1))).assertEqual(2);
        fixture.port.emitData(payload(2, 1));
        expectSession(fixture);
        await fixture.controller.close();
        expectReleased(fixture);
      }
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expect(fixture.provider.calls).assertEqual(2);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(4);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(4);
    });

    /**
     * @tc.name SerialPortLifecycleTest011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTLIFECYCLE_1100
     * @tc.desc getSerialPortList open close repeat 2 sessions with 3 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortLifecycleTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index: number = 0; index < 2; index++) {
        await fixture.select();
        await fixture.controller.open();
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
        expect(await fixture.controller.write(payload(3, 1))).assertEqual(3);
        fixture.port.emitData(payload(3, 1));
        expectSession(fixture);
        await fixture.controller.close();
        expectReleased(fixture);
      }
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expect(fixture.provider.calls).assertEqual(2);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(6);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(6);
    });

    /**
     * @tc.name SerialPortLifecycleTest012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTLIFECYCLE_1200
     * @tc.desc getSerialPortList open close repeat 2 sessions with 4 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortLifecycleTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index: number = 0; index < 2; index++) {
        await fixture.select();
        await fixture.controller.open();
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
        expect(await fixture.controller.write(payload(4, 1))).assertEqual(4);
        fixture.port.emitData(payload(4, 1));
        expectSession(fixture);
        await fixture.controller.close();
        expectReleased(fixture);
      }
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expect(fixture.provider.calls).assertEqual(2);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(8);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(8);
    });

    /**
     * @tc.name SerialPortLifecycleTest013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTLIFECYCLE_1300
     * @tc.desc getSerialPortList open close repeat 2 sessions with 5 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortLifecycleTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index: number = 0; index < 2; index++) {
        await fixture.select();
        await fixture.controller.open();
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
        expect(await fixture.controller.write(payload(5, 1))).assertEqual(5);
        fixture.port.emitData(payload(5, 1));
        expectSession(fixture);
        await fixture.controller.close();
        expectReleased(fixture);
      }
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expect(fixture.provider.calls).assertEqual(2);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(10);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(10);
    });

    /**
     * @tc.name SerialPortLifecycleTest014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTLIFECYCLE_1400
     * @tc.desc getSerialPortList open close repeat 2 sessions with 7 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortLifecycleTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index: number = 0; index < 2; index++) {
        await fixture.select();
        await fixture.controller.open();
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
        expect(await fixture.controller.write(payload(7, 1))).assertEqual(7);
        fixture.port.emitData(payload(7, 1));
        expectSession(fixture);
        await fixture.controller.close();
        expectReleased(fixture);
      }
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expect(fixture.provider.calls).assertEqual(2);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(14);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(14);
    });

    /**
     * @tc.name SerialPortLifecycleTest015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTLIFECYCLE_1500
     * @tc.desc getSerialPortList open close repeat 2 sessions with 8 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortLifecycleTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index: number = 0; index < 2; index++) {
        await fixture.select();
        await fixture.controller.open();
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
        expect(await fixture.controller.write(payload(8, 1))).assertEqual(8);
        fixture.port.emitData(payload(8, 1));
        expectSession(fixture);
        await fixture.controller.close();
        expectReleased(fixture);
      }
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expect(fixture.provider.calls).assertEqual(2);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(16);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(16);
    });

    /**
     * @tc.name SerialPortLifecycleTest016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTLIFECYCLE_1600
     * @tc.desc getSerialPortList open close repeat 2 sessions with 16 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortLifecycleTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index: number = 0; index < 2; index++) {
        await fixture.select();
        await fixture.controller.open();
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
        expect(await fixture.controller.write(payload(16, 1))).assertEqual(16);
        fixture.port.emitData(payload(16, 1));
        expectSession(fixture);
        await fixture.controller.close();
        expectReleased(fixture);
      }
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expect(fixture.provider.calls).assertEqual(2);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(32);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(32);
    });

    /**
     * @tc.name SerialPortLifecycleTest017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTLIFECYCLE_1700
     * @tc.desc getSerialPortList open close repeat 2 sessions with 31 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortLifecycleTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index: number = 0; index < 2; index++) {
        await fixture.select();
        await fixture.controller.open();
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
        expect(await fixture.controller.write(payload(31, 1))).assertEqual(31);
        fixture.port.emitData(payload(31, 1));
        expectSession(fixture);
        await fixture.controller.close();
        expectReleased(fixture);
      }
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expect(fixture.provider.calls).assertEqual(2);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(62);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(62);
    });

    /**
     * @tc.name SerialPortLifecycleTest018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTLIFECYCLE_1800
     * @tc.desc getSerialPortList open close repeat 2 sessions with 32 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortLifecycleTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index: number = 0; index < 2; index++) {
        await fixture.select();
        await fixture.controller.open();
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
        expect(await fixture.controller.write(payload(32, 1))).assertEqual(32);
        fixture.port.emitData(payload(32, 1));
        expectSession(fixture);
        await fixture.controller.close();
        expectReleased(fixture);
      }
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expect(fixture.provider.calls).assertEqual(2);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(64);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(64);
    });

    /**
     * @tc.name SerialPortLifecycleTest019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SERIAL_SERIALPORTLIFECYCLE_1900
     * @tc.desc getSerialPortList open close repeat 2 sessions with 63 bytes seed 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('SerialPortLifecycleTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let index: number = 0; index < 2; index++) {
        await fixture.select();
        await fixture.controller.open();
        await fixture.controller.onDataRead();
        await fixture.controller.onDisconnect();
        expect(await fixture.controller.write(payload(63, 1))).assertEqual(63);
        fixture.port.emitData(payload(63, 1));
        expectSession(fixture);
        await fixture.controller.close();
        expectReleased(fixture);
      }
      expect(fixture.port.callCount('open')).assertEqual(2);
      expect(fixture.port.callCount('close')).assertEqual(2);
      expect(fixture.provider.calls).assertEqual(2);
      expect(fixture.controller.snapshot().receivedBytes).assertEqual(126);
      expect(fixture.controller.snapshot().transmittedBytes).assertEqual(126);
    });
  });
}
