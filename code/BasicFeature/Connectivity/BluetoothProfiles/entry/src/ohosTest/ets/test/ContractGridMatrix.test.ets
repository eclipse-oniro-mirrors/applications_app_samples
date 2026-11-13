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
 * 常量与结果文案的契约锁。
 *
 * 常量被页面、组件与日志同时引用，改动会牵动多处，因此用精确值锁住；
 * 两个结果类的 describe 是界面上直接展示的文字，也一并锁住，
 * 避免实现改动文案后界面提示与文档对不上。
 */

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import {
  BLUETOOTH_PERMISSION,
  HILOG_DOMAIN,
  HILOG_TAG,
  HOME_LOG_LIMIT,
  LOG_STORE_CAPACITY,
  PAGE_LOG_LIMIT,
  PROFILE_COUNT,
  RouteKey,
  StorageKeys,
  appSubtitle,
  defaultNavTitle,
  isRouteKey
} from '../../../main/ets/common/AppConstants';
import { ProbeStatus } from '../../../main/ets/model/ProfileState';
import { BluetoothStateResult } from '../../../main/ets/utils/BluetoothAccess';
import { PermissionOutcome } from '../../../main/ets/utils/PermissionUtil';
import { createFunctionNameOf, isProfileLike } from '../../../main/ets/utils/ProfileFactory';
import { ProfileFactory, ProfileLike } from '../../../main/ets/utils/ProfileLike';
import { ProfileStub, stubFactoryOf } from './support/ProfileStub';

/** 生成 count 个连续尾号的设备地址 */
function devicesOf(count: number): string[] {
  const list: string[] = [];
  for (let index = 0; index < count; index++) {
    list.push('A1:B2:C3:D4:E5:F' + index);
  }
  return list;
}

export default function bluetoothProfileContractGridTest() {
  describe('BluetoothProfileContractGridTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONTRACT_0001
     * @tc.name contractGrid0001
     * @tc.desc Verify the bluetooth state result describes raw value 0 as 蓝牙已关闭.
     */
    it('contractGrid0001', 0, () => {
      const result: BluetoothStateResult = new BluetoothStateResult(0, ProbeStatus.READY, 0, 'raw');
      expect(result.describe()).assertEqual('蓝牙已关闭（原始值 0）');
      expect(result.describe().length).assertEqual(12);
      expect(result.state).assertEqual(0);
      expect(result.status).assertEqual(ProbeStatus.READY);
      expect(result.message).assertEqual('raw');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONTRACT_0002
     * @tc.name contractGrid0002
     * @tc.desc Verify the bluetooth state result describes raw value 1 as 蓝牙正在开启.
     */
    it('contractGrid0002', 0, () => {
      const result: BluetoothStateResult = new BluetoothStateResult(1, ProbeStatus.READY, 0, 'raw');
      expect(result.describe()).assertEqual('蓝牙正在开启（原始值 1）');
      expect(result.describe().length).assertEqual(13);
      expect(result.state).assertEqual(1);
      expect(result.status).assertEqual(ProbeStatus.READY);
      expect(result.message).assertEqual('raw');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONTRACT_0003
     * @tc.name contractGrid0003
     * @tc.desc Verify the bluetooth state result describes raw value 2 as 蓝牙已开启.
     */
    it('contractGrid0003', 0, () => {
      const result: BluetoothStateResult = new BluetoothStateResult(2, ProbeStatus.READY, 0, 'raw');
      expect(result.describe()).assertEqual('蓝牙已开启（原始值 2）');
      expect(result.describe().length).assertEqual(12);
      expect(result.state).assertEqual(2);
      expect(result.status).assertEqual(ProbeStatus.READY);
      expect(result.message).assertEqual('raw');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONTRACT_0004
     * @tc.name contractGrid0004
     * @tc.desc Verify the bluetooth state result describes raw value 3 as 蓝牙正在关闭.
     */
    it('contractGrid0004', 0, () => {
      const result: BluetoothStateResult = new BluetoothStateResult(3, ProbeStatus.READY, 0, 'raw');
      expect(result.describe()).assertEqual('蓝牙正在关闭（原始值 3）');
      expect(result.describe().length).assertEqual(13);
      expect(result.state).assertEqual(3);
      expect(result.status).assertEqual(ProbeStatus.READY);
      expect(result.message).assertEqual('raw');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONTRACT_0005
     * @tc.name contractGrid0005
     * @tc.desc Verify the bluetooth state result describes raw value 4 as BLE 正在开启.
     */
    it('contractGrid0005', 0, () => {
      const result: BluetoothStateResult = new BluetoothStateResult(4, ProbeStatus.READY, 0, 'raw');
      expect(result.describe()).assertEqual('BLE 正在开启（原始值 4）');
      expect(result.describe().length).assertEqual(15);
      expect(result.state).assertEqual(4);
      expect(result.status).assertEqual(ProbeStatus.READY);
      expect(result.message).assertEqual('raw');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONTRACT_0006
     * @tc.name contractGrid0006
     * @tc.desc Verify the bluetooth state result describes raw value 5 as 仅 BLE 模式.
     */
    it('contractGrid0006', 0, () => {
      const result: BluetoothStateResult = new BluetoothStateResult(5, ProbeStatus.READY, 0, 'raw');
      expect(result.describe()).assertEqual('仅 BLE 模式（原始值 5）');
      expect(result.describe().length).assertEqual(15);
      expect(result.state).assertEqual(5);
      expect(result.status).assertEqual(ProbeStatus.READY);
      expect(result.message).assertEqual('raw');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONTRACT_0007
     * @tc.name contractGrid0007
     * @tc.desc Verify the bluetooth state result describes raw value 6 as BLE 正在关闭.
     */
    it('contractGrid0007', 0, () => {
      const result: BluetoothStateResult = new BluetoothStateResult(6, ProbeStatus.READY, 0, 'raw');
      expect(result.describe()).assertEqual('BLE 正在关闭（原始值 6）');
      expect(result.describe().length).assertEqual(15);
      expect(result.state).assertEqual(6);
      expect(result.status).assertEqual(ProbeStatus.READY);
      expect(result.message).assertEqual('raw');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONTRACT_0008
     * @tc.name contractGrid0008
     * @tc.desc Verify the bluetooth state result describes raw value 7 as 未知状态.
     */
    it('contractGrid0008', 0, () => {
      const result: BluetoothStateResult = new BluetoothStateResult(7, ProbeStatus.FAILED, 0, 'raw');
      expect(result.describe()).assertEqual('未知状态（原始值 7）');
      expect(result.describe().length).assertEqual(11);
      expect(result.state).assertEqual(7);
      expect(result.status).assertEqual(ProbeStatus.FAILED);
      expect(result.message).assertEqual('raw');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONTRACT_0009
     * @tc.name contractGrid0009
     * @tc.desc Verify the bluetooth state result describes raw value -1 as 未知状态.
     */
    it('contractGrid0009', 0, () => {
      const result: BluetoothStateResult = new BluetoothStateResult(-1, ProbeStatus.FAILED, 0, 'raw');
      expect(result.describe()).assertEqual('未知状态（原始值 -1）');
      expect(result.describe().length).assertEqual(12);
      expect(result.state).assertEqual(-1);
      expect(result.status).assertEqual(ProbeStatus.FAILED);
      expect(result.message).assertEqual('raw');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONTRACT_0010
     * @tc.name contractGrid0010
     * @tc.desc Verify the bluetooth state result describes raw value 99 as 未知状态.
     */
    it('contractGrid0010', 0, () => {
      const result: BluetoothStateResult = new BluetoothStateResult(99, ProbeStatus.FAILED, 0, 'raw');
      expect(result.describe()).assertEqual('未知状态（原始值 99）');
      expect(result.describe().length).assertEqual(12);
      expect(result.state).assertEqual(99);
      expect(result.status).assertEqual(ProbeStatus.FAILED);
      expect(result.message).assertEqual('raw');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONTRACT_0011
     * @tc.name contractGrid0011
     * @tc.desc Verify a permission outcome with granted true and code 0 describes itself.
     */
    it('contractGrid0011', 0, () => {
      const status: ProbeStatus = ProbeStatus.READY;
      const outcome: PermissionOutcome = new PermissionOutcome(true, status, 0, 'granted');
      expect(outcome.describe()).assertEqual('权限已授予');
      expect(outcome.describe().length).assertEqual(5);
      expect(outcome.granted).assertEqual(true);
      expect(outcome.code).assertEqual(0);
      expect(outcome.status).assertEqual(status);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONTRACT_0012
     * @tc.name contractGrid0012
     * @tc.desc Verify a permission outcome with granted false and code 201 describes itself.
     */
    it('contractGrid0012', 0, () => {
      const status: ProbeStatus = ProbeStatus.PERMISSION_DENIED;
      const outcome: PermissionOutcome = new PermissionOutcome(false, status, 201, 'denied');
      expect(outcome.describe()).assertEqual('权限未授予（201）：denied');
      expect(outcome.describe().length).assertEqual(17);
      expect(outcome.granted).assertEqual(false);
      expect(outcome.code).assertEqual(201);
      expect(outcome.status).assertEqual(status);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONTRACT_0013
     * @tc.name contractGrid0013
     * @tc.desc Verify a permission outcome with granted false and code 401 describes itself.
     */
    it('contractGrid0013', 0, () => {
      const status: ProbeStatus = ProbeStatus.FAILED;
      const outcome: PermissionOutcome = new PermissionOutcome(false, status, 401, 'bad param');
      expect(outcome.describe()).assertEqual('权限未授予（401）：bad param');
      expect(outcome.describe().length).assertEqual(20);
      expect(outcome.granted).assertEqual(false);
      expect(outcome.code).assertEqual(401);
      expect(outcome.status).assertEqual(status);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONTRACT_0014
     * @tc.name contractGrid0014
     * @tc.desc Verify a permission outcome with granted false and code 801 describes itself.
     */
    it('contractGrid0014', 0, () => {
      const status: ProbeStatus = ProbeStatus.CAPABILITY_UNSUPPORTED;
      const outcome: PermissionOutcome = new PermissionOutcome(false, status, 801, 'no capability');
      expect(outcome.describe()).assertEqual('权限未授予（801）：no capability');
      expect(outcome.describe().length).assertEqual(24);
      expect(outcome.granted).assertEqual(false);
      expect(outcome.code).assertEqual(801);
      expect(outcome.status).assertEqual(status);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONTRACT_0015
     * @tc.name contractGrid0015
     * @tc.desc Verify a permission outcome with granted false and code 2900001 describes itself.
     */
    it('contractGrid0015', 0, () => {
      const status: ProbeStatus = ProbeStatus.SERVICE_STOPPED;
      const outcome: PermissionOutcome = new PermissionOutcome(false, status, 2900001, 'stopped');
      expect(outcome.describe()).assertEqual('权限未授予（2900001）：stopped');
      expect(outcome.describe().length).assertEqual(22);
      expect(outcome.granted).assertEqual(false);
      expect(outcome.code).assertEqual(2900001);
      expect(outcome.status).assertEqual(status);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONTRACT_0016
     * @tc.name contractGrid0016
     * @tc.desc Verify a permission outcome with granted false and code 2900003 describes itself.
     */
    it('contractGrid0016', 0, () => {
      const status: ProbeStatus = ProbeStatus.BLUETOOTH_DISABLED;
      const outcome: PermissionOutcome = new PermissionOutcome(false, status, 2900003, 'disabled');
      expect(outcome.describe()).assertEqual('权限未授予（2900003）：disabled');
      expect(outcome.describe().length).assertEqual(23);
      expect(outcome.granted).assertEqual(false);
      expect(outcome.code).assertEqual(2900003);
      expect(outcome.status).assertEqual(status);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONTRACT_0017
     * @tc.name contractGrid0017
     * @tc.desc Verify a permission outcome with granted false and code 2900004 describes itself.
     */
    it('contractGrid0017', 0, () => {
      const status: ProbeStatus = ProbeStatus.PROFILE_UNSUPPORTED;
      const outcome: PermissionOutcome = new PermissionOutcome(false, status, 2900004, 'unsupported');
      expect(outcome.describe()).assertEqual('权限未授予（2900004）：unsupported');
      expect(outcome.describe().length).assertEqual(26);
      expect(outcome.granted).assertEqual(false);
      expect(outcome.code).assertEqual(2900004);
      expect(outcome.status).assertEqual(status);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONTRACT_0018
     * @tc.name contractGrid0018
     * @tc.desc Verify a permission outcome with granted false and code 0 describes itself.
     */
    it('contractGrid0018', 0, () => {
      const status: ProbeStatus = ProbeStatus.IDLE;
      const outcome: PermissionOutcome = new PermissionOutcome(false, status, 0, 'none');
      expect(outcome.describe()).assertEqual('权限未授予（0）：none');
      expect(outcome.describe().length).assertEqual(13);
      expect(outcome.granted).assertEqual(false);
      expect(outcome.code).assertEqual(0);
      expect(outcome.status).assertEqual(status);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONTRACT_0019
     * @tc.name contractGrid0019
     * @tc.desc Verify the storage keys used by the page and the logger stay unchanged.
     */
    it('contractGrid0019', 0, () => {
      expect(StorageKeys.APP_LOGS).assertEqual('appLogs');
      expect(StorageKeys.LAYOUT_PROFILE).assertEqual('layoutProfile');
      expect(StorageKeys.BLUETOOTH_STATE).assertEqual('bluetoothState');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONTRACT_0020
     * @tc.name contractGrid0020
     * @tc.desc Verify the single route key is accepted by the route predicate.
     */
    it('contractGrid0020', 0, () => {
      expect(RouteKey.HFP).assertEqual('hfp');
      expect(isRouteKey(RouteKey.HFP)).assertTrue();
      expect(isRouteKey('hfp')).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONTRACT_0021
     * @tc.name contractGrid0021
     * @tc.desc Verify the route predicate rejects unknown and differently shaped keys.
     */
    it('contractGrid0021', 0, () => {
      expect(isRouteKey('')).assertFalse();
      expect(isRouteKey('pan')).assertFalse();
      expect(isRouteKey('HFP')).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONTRACT_0022
     * @tc.name contractGrid0022
     * @tc.desc Verify the store capacity outranks both page and home log limits.
     */
    it('contractGrid0022', 0, () => {
      expect(LOG_STORE_CAPACITY).assertEqual(200);
      expect(LOG_STORE_CAPACITY > HOME_LOG_LIMIT).assertTrue();
      expect(HOME_LOG_LIMIT).assertEqual(30);
      expect(LOG_STORE_CAPACITY > PAGE_LOG_LIMIT).assertTrue();
      expect(PAGE_LOG_LIMIT).assertEqual(20);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONTRACT_0023
     * @tc.name contractGrid0023
     * @tc.desc Verify the home log limit stays above the page log limit and below the capacity.
     */
    it('contractGrid0023', 0, () => {
      expect(HOME_LOG_LIMIT > PAGE_LOG_LIMIT).assertTrue();
      expect(PAGE_LOG_LIMIT > 0).assertTrue();
      expect(HOME_LOG_LIMIT < LOG_STORE_CAPACITY).assertTrue();
      expect(HOME_LOG_LIMIT - PAGE_LOG_LIMIT).assertEqual(10);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONTRACT_0024
     * @tc.name contractGrid0024
     * @tc.desc Verify the hilog domain and tag line up with the documented constants.
     */
    it('contractGrid0024', 0, () => {
      expect(HILOG_DOMAIN).assertEqual(63505);
      expect(HILOG_DOMAIN > 0).assertTrue();
      expect(HILOG_TAG).assertEqual('BluetoothProfiles');
      expect(HILOG_TAG.length).assertEqual(17);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONTRACT_0025
     * @tc.name contractGrid0025
     * @tc.desc Verify the bluetooth permission name matches the one declared in the module.
     */
    it('contractGrid0025', 0, () => {
      expect(BLUETOOTH_PERMISSION).assertEqual('ohos.permission.ACCESS_BLUETOOTH');
      expect(BLUETOOTH_PERMISSION.length).assertEqual(32);
      expect(BLUETOOTH_PERMISSION.indexOf('ACCESS_BLUETOOTH') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONTRACT_0026
     * @tc.name contractGrid0026
     * @tc.desc Verify the demo keeps a single profile entry after the panel removal.
     */
    it('contractGrid0026', 0, () => {
      expect(PROFILE_COUNT).assertEqual(1);
      expect(PROFILE_COUNT >= 1).assertTrue();
      expect(RouteKey.HFP.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONTRACT_0027
     * @tc.name contractGrid0027
     * @tc.desc Verify the navigation title and subtitle describe the HFP AG sample.
     */
    it('contractGrid0027', 0, () => {
      expect(defaultNavTitle()).assertEqual('蓝牙 Profile 示例');
      expect(defaultNavTitle().length).assertEqual(13);
      expect(defaultNavTitle().indexOf('蓝牙')).assertEqual(0);
      expect(appSubtitle()).assertEqual('HFP（AG 角色）经典蓝牙 Profile 的最小示例');
      expect(appSubtitle().length).assertEqual(28);
      expect(appSubtitle().indexOf('HFP') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONTRACT_0028
     * @tc.name contractGrid0028
     * @tc.desc Verify the create function name splits into the namespace and the AG create call.
     */
    it('contractGrid0028', 0, () => {
      expect(createFunctionNameOf()).assertEqual('hfp.createHfpAgProfile');
      expect(createFunctionNameOf().length).assertEqual(22);
      const segments: string[] = createFunctionNameOf().split('.');
      expect(segments.length).assertEqual(2);
      expect(segments[1]).assertEqual('createHfpAgProfile');
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONTRACT_0029
     * @tc.name contractGrid0029
     * @tc.desc Verify the stub instance satisfies the profile shape check.
     */
    it('contractGrid0029', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(1), 2);
      expect(isProfileLike(stub)).assertTrue();
      expect(isProfileLike(null)).assertFalse();
      expect(stub.getConnectedDevices().length).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_CONTRACT_0030
     * @tc.name contractGrid0030
     * @tc.desc Verify the stub factory hands back the very instance it was built with.
     */
    it('contractGrid0030', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2), 3);
      const factory: ProfileFactory = stubFactoryOf(stub);
      const again: ProfileLike = factory();
      expect(again === stub).assertTrue();
      expect(again.getConnectionState('A1:B2:C3:D4:E5:F6')).assertEqual(3);
      expect(stub.deviceCalls).assertEqual(0);
    });
  });
}
