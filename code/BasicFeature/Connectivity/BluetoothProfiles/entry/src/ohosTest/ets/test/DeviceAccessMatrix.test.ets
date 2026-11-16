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

/**
 * 系统蓝牙访问矩阵（真机）。
 *
 * 每个用例先断言「调用确实发生」的结构性证据（消息前缀、返回对象形态），
 * 再按成功或失败分叉断言具体值，保证设备当时开未开蓝牙都不会变成恒真用例。
 */

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { CaseLog } from '../util/CaseLog';
import { access } from '@kit.ConnectivityKit';
import { ProbeStatus, bluetoothStateName } from '../../../main/ets/model/ProfileState';
import { isValidDeviceId } from '../../../main/ets/model/DeviceAddress';
import { isKnownBluetoothCode } from '../../../main/ets/utils/ErrorUtil';
import {
  BluetoothStateResult,
  BluetoothStateWatcher,
  PairedDeviceResult,
  listPairedDevices,
  readBluetoothState,
  readRemoteDeviceName
} from '../../../main/ets/utils/BluetoothAccess';
import { PermissionOutcome, checkBluetoothPermission } from '../../../main/ets/utils/PermissionUtil';

export default function bluetoothProfileDeviceAccessTest() {
  describe('BluetoothProfileDeviceAccessTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_ACCESS_0001
     * @tc.name deviceAccess0001
     * @tc.desc Verify access.getState returns a documented state or a classified failure.
     */
    it('deviceAccess0001', 0, () => {
      CaseLog.begin('deviceAccess0001');
      const result: BluetoothStateResult = readBluetoothState();
      CaseLog.param('deviceAccess0001', 'code', result.code);
      CaseLog.param('deviceAccess0001', 'status', result.status);
      CaseLog.param('deviceAccess0001', 'state', result.state);
      expect(result.message.indexOf('access.getState()')).assertEqual(0);
      if (result.code === 0) {
        expect(result.status).assertEqual(ProbeStatus.READY);
        expect(result.state >= access.BluetoothState.STATE_OFF).assertTrue();
        expect(result.state <= access.BluetoothState.STATE_BLE_TURNING_OFF).assertTrue();
      } else {
        expect(result.state).assertEqual(-1);
        expect(result.status === ProbeStatus.READY).assertFalse();
        expect(result.code).assertEqual(result.code > 0 ? result.code : 0);
      }
      CaseLog.end('deviceAccess0001');
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_ACCESS_0002
     * @tc.name deviceAccess0002
     * @tc.desc Verify the bluetooth state result describes itself with the raw value appended.
     */
    it('deviceAccess0002', 0, () => {
      CaseLog.begin('deviceAccess0002');
      const result: BluetoothStateResult = readBluetoothState();
      CaseLog.param('deviceAccess0002', 'code', result.code);
      CaseLog.param('deviceAccess0002', 'describe', result.describe());
      expect(result.describe().length > 0).assertTrue();
      if (result.code === 0) {
        expect(result.describe().indexOf('原始值')).assertEqual(6);
        expect(result.describe().indexOf(bluetoothStateName(result.state))).assertEqual(0);
      } else {
        expect(result.describe().indexOf('原始值')).assertEqual(6);
        expect(result.describe().length > 5).assertTrue();
      }
      CaseLog.end('deviceAccess0002');
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_ACCESS_0003
     * @tc.name deviceAccess0003
     * @tc.desc Verify the paired device list returns addresses or a classified failure.
     */
    it('deviceAccess0003', 0, () => {
      CaseLog.begin('deviceAccess0003');
      const result: PairedDeviceResult = listPairedDevices();
      CaseLog.param('deviceAccess0003', 'code', result.code);
      CaseLog.param('deviceAccess0003', 'deviceCount', result.devices.length);
      CaseLog.param('deviceAccess0003', 'message', result.message);
      expect(result.message.indexOf('connection.getPairedDevices()')).assertEqual(0);
      if (result.code === 0) {
        expect(result.message.indexOf('返回') >= 0).assertTrue();
        for (const device of result.devices) {
          expect(isValidDeviceId(device)).assertTrue();
        }
      } else {
        expect(result.devices.length).assertEqual(0);
        expect(result.code > 0).assertTrue();
        expect(isKnownBluetoothCode(result.code)).assertTrue();
      }
      CaseLog.end('deviceAccess0003');
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_ACCESS_0004
     * @tc.name deviceAccess0004
     * @tc.desc Verify the permission check reports a boolean outcome with a readable description.
     */
    it('deviceAccess0004', 0, () => {
      CaseLog.begin('deviceAccess0004');
      const outcome: PermissionOutcome = checkBluetoothPermission();
      CaseLog.param('deviceAccess0004', 'granted', outcome.granted);
      CaseLog.param('deviceAccess0004', 'status', outcome.status);
      CaseLog.param('deviceAccess0004', 'message', outcome.message);
      expect(outcome.describe().length > 0).assertTrue();
      if (outcome.granted) {
        expect(outcome.status).assertEqual(ProbeStatus.READY);
        expect(outcome.describe()).assertEqual('权限已授予');
      } else {
        expect(outcome.status === ProbeStatus.READY).assertFalse();
        expect(outcome.describe().indexOf('权限未授予')).assertEqual(0);
      }
      CaseLog.end('deviceAccess0004');
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_ACCESS_0005
     * @tc.name deviceAccess0005
     * @tc.desc Verify the state watcher reports the same watching flag that start returned.
     */
    it('deviceAccess0005', 0, () => {
      CaseLog.begin('deviceAccess0005');
      const watcher: BluetoothStateWatcher = new BluetoothStateWatcher((state: number) => {});
      CaseLog.param('deviceAccess0005', 'watchingBeforeStart', watcher.isWatching());
      expect(watcher.isWatching()).assertFalse();
      const started: boolean = watcher.start();
      CaseLog.param('deviceAccess0005', 'startReturned', started);
      expect(watcher.isWatching()).assertEqual(started);
      watcher.stop();
      expect(watcher.isWatching()).assertFalse();
      CaseLog.end('deviceAccess0005');
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_ACCESS_0006
     * @tc.name deviceAccess0006
     * @tc.desc Verify a repeated start on the same watcher does not throw and stays watching.
     */
    it('deviceAccess0006', 0, () => {
      CaseLog.begin('deviceAccess0006');
      const watcher: BluetoothStateWatcher = new BluetoothStateWatcher((state: number) => {});
      const first: boolean = watcher.start();
      const second: boolean = watcher.start();
      CaseLog.param('deviceAccess0006', 'firstStart', first);
      CaseLog.param('deviceAccess0006', 'secondStart', second);
      expect(second).assertEqual(first);
      expect(watcher.isWatching()).assertEqual(first);
      watcher.stop();
      expect(watcher.isWatching()).assertFalse();
      CaseLog.end('deviceAccess0006');
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_ACCESS_0007
     * @tc.name deviceAccess0007
     * @tc.desc Verify stopping a watcher that never started is a silent no-op.
     */
    it('deviceAccess0007', 0, () => {
      CaseLog.begin('deviceAccess0007');
      const watcher: BluetoothStateWatcher = new BluetoothStateWatcher((state: number) => {});
      watcher.stop();
      CaseLog.param('deviceAccess0007', 'watchingAfterStopBeforeStart', watcher.isWatching());
      expect(watcher.isWatching()).assertFalse();
      const started: boolean = watcher.start();
      CaseLog.param('deviceAccess0007', 'startReturned', started);
      expect(watcher.isWatching()).assertEqual(started);
      watcher.stop();
      expect(watcher.isWatching()).assertFalse();
      CaseLog.end('deviceAccess0007');
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_ACCESS_0008
     * @tc.name deviceAccess0008
     * @tc.desc Verify reading a remote device name fails softly for an illegal address.
     */
    it('deviceAccess0008', 0, () => {
      CaseLog.begin('deviceAccess0008');
      const name: string = readRemoteDeviceName('not-a-device-id');
      CaseLog.param('deviceAccess0008', 'deviceId', 'not-a-device-id');
      CaseLog.param('deviceAccess0008', 'nameLength', name.length);
      expect(name).assertEqual('');
      expect(name.length).assertEqual(0);
      expect(isValidDeviceId('not-a-device-id')).assertFalse();
      CaseLog.end('deviceAccess0008');
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_ACCESS_0009
     * @tc.name deviceAccess0009
     * @tc.desc Verify reading a remote device name never throws for a well formed but unknown address.
     */
    it('deviceAccess0009', 0, () => {
      CaseLog.begin('deviceAccess0009');
      const address: string = 'A1:B2:C3:D4:E5:F6';
      CaseLog.param('deviceAccess0009', 'deviceId', address);
      expect(isValidDeviceId(address)).assertTrue();
      const name: string = readRemoteDeviceName(address);
      CaseLog.param('deviceAccess0009', 'nameLength', name.length);
      expect(name.length >= 0).assertTrue();
      expect(name === null).assertFalse();
      CaseLog.end('deviceAccess0009');
    });
  });
}
