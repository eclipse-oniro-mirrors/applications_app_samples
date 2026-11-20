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
 * AG 探测结果的组合矩阵。
 *
 * 探测结果有三种形态：创建失败、创建成功但查询失败、创建成功且有 N 台设备，
 * 每种形态的文案必须彼此可区分，且「可继续查询的台数」只在最后一种形态下等于真实台数。
 */

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import {
  DEVICE_COUNT_UNKNOWN,
  HfpAgResult,
  probeHfpAgWith
} from '../../../main/ets/utils/ProfileFeature';
import { ProbeStatus } from '../../../main/ets/model/ProfileState';
import { ProfileStub } from './support/ProfileStub';

/** 生成 count 个连续尾号的设备地址 */
function devicesOf(count: number): string[] {
  const list: string[] = [];
  for (let index = 0; index < count; index++) {
    list.push('A1:B2:C3:D4:E5:F' + index);
  }
  return list;
}

export default function bluetoothProfileFeatureCrossTest() {
  describe('BluetoothProfileFeatureCrossTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FEATURE_CROSS_0001
     * @tc.name featureCross0001
     * @tc.desc Verify a create failure 201 renders the failure line with the create function name.
     */
    it('featureCross0001', 0, () => {
      const fn: string = 'hfp.createHfpAgProfile';
      const result: HfpAgResult = new HfpAgResult(fn, false, -1, ProbeStatus.PERMISSION_DENIED, 201, 'x');
      expect(result.describe()).assertEqual('AG：hfp.createHfpAgProfile() 失败（201）');
      expect(result.deviceCount).assertEqual(-1);
      expect(result.status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(result.usableDeviceCount()).assertEqual(DEVICE_COUNT_UNKNOWN);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FEATURE_CROSS_0002
     * @tc.name featureCross0002
     * @tc.desc Verify a create failure 401 renders the failure line with the create function name.
     */
    it('featureCross0002', 0, () => {
      const fn: string = 'hfp.createHfpAgProfile';
      const result: HfpAgResult = new HfpAgResult(fn, false, -1, ProbeStatus.FAILED, 401, 'x');
      expect(result.describe()).assertEqual('AG：hfp.createHfpAgProfile() 失败（401）');
      expect(result.deviceCount).assertEqual(-1);
      expect(result.status).assertEqual(ProbeStatus.FAILED);
      expect(result.usableDeviceCount()).assertEqual(DEVICE_COUNT_UNKNOWN);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FEATURE_CROSS_0003
     * @tc.name featureCross0003
     * @tc.desc Verify a create failure 801 renders the failure line with the create function name.
     */
    it('featureCross0003', 0, () => {
      const fn: string = 'hfp.createHfpAgProfile';
      const result: HfpAgResult = new HfpAgResult(fn, false, -1, ProbeStatus.CAPABILITY_UNSUPPORTED, 801, 'x');
      expect(result.describe()).assertEqual('AG：hfp.createHfpAgProfile() 失败（801）');
      expect(result.deviceCount).assertEqual(-1);
      expect(result.status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(result.usableDeviceCount()).assertEqual(DEVICE_COUNT_UNKNOWN);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FEATURE_CROSS_0004
     * @tc.name featureCross0004
     * @tc.desc Verify a create failure 2900001 renders the failure line with the create function name.
     */
    it('featureCross0004', 0, () => {
      const fn: string = 'hfp.createHfpAgProfile';
      const result: HfpAgResult = new HfpAgResult(fn, false, -1, ProbeStatus.SERVICE_STOPPED, 2900001, 'x');
      expect(result.describe()).assertEqual('AG：hfp.createHfpAgProfile() 失败（2900001）');
      expect(result.deviceCount).assertEqual(-1);
      expect(result.status).assertEqual(ProbeStatus.SERVICE_STOPPED);
      expect(result.usableDeviceCount()).assertEqual(DEVICE_COUNT_UNKNOWN);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FEATURE_CROSS_0005
     * @tc.name featureCross0005
     * @tc.desc Verify a create failure 2900003 renders the failure line with the create function name.
     */
    it('featureCross0005', 0, () => {
      const fn: string = 'hfp.createHfpAgProfile';
      const result: HfpAgResult = new HfpAgResult(fn, false, -1, ProbeStatus.BLUETOOTH_DISABLED, 2900003, 'x');
      expect(result.describe()).assertEqual('AG：hfp.createHfpAgProfile() 失败（2900003）');
      expect(result.deviceCount).assertEqual(-1);
      expect(result.status).assertEqual(ProbeStatus.BLUETOOTH_DISABLED);
      expect(result.usableDeviceCount()).assertEqual(DEVICE_COUNT_UNKNOWN);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FEATURE_CROSS_0006
     * @tc.name featureCross0006
     * @tc.desc Verify a create failure 2900004 renders the failure line with the create function name.
     */
    it('featureCross0006', 0, () => {
      const fn: string = 'hfp.createHfpAgProfile';
      const result: HfpAgResult = new HfpAgResult(fn, false, -1, ProbeStatus.PROFILE_UNSUPPORTED, 2900004, 'x');
      expect(result.describe()).assertEqual('AG：hfp.createHfpAgProfile() 失败（2900004）');
      expect(result.deviceCount).assertEqual(-1);
      expect(result.status).assertEqual(ProbeStatus.PROFILE_UNSUPPORTED);
      expect(result.usableDeviceCount()).assertEqual(DEVICE_COUNT_UNKNOWN);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FEATURE_CROSS_0007
     * @tc.name featureCross0007
     * @tc.desc Verify a create failure 2900099 renders the failure line with the create function name.
     */
    it('featureCross0007', 0, () => {
      const fn: string = 'hfp.createHfpAgProfile';
      const result: HfpAgResult = new HfpAgResult(fn, false, -1, ProbeStatus.FAILED, 2900099, 'x');
      expect(result.describe()).assertEqual('AG：hfp.createHfpAgProfile() 失败（2900099）');
      expect(result.deviceCount).assertEqual(-1);
      expect(result.status).assertEqual(ProbeStatus.FAILED);
      expect(result.usableDeviceCount()).assertEqual(DEVICE_COUNT_UNKNOWN);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FEATURE_CROSS_0008
     * @tc.name featureCross0008
     * @tc.desc Verify a device query failure 201 on a created instance names the query call.
     */
    it('featureCross0008', 0, () => {
      const fn: string = 'hfp.createHfpAgProfile';
      const result: HfpAgResult = new HfpAgResult(fn, true, -1, ProbeStatus.PERMISSION_DENIED, 201, 'x');
      expect(result.describe().indexOf('getConnectedDevices') >= 0).assertTrue();
      expect(result.describe().indexOf('201') >= 0).assertTrue();
      expect(result.usableDeviceCount()).assertEqual(DEVICE_COUNT_UNKNOWN);
      expect(result.created).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FEATURE_CROSS_0009
     * @tc.name featureCross0009
     * @tc.desc Verify a device query failure 401 on a created instance names the query call.
     */
    it('featureCross0009', 0, () => {
      const fn: string = 'hfp.createHfpAgProfile';
      const result: HfpAgResult = new HfpAgResult(fn, true, -1, ProbeStatus.FAILED, 401, 'x');
      expect(result.describe().indexOf('getConnectedDevices') >= 0).assertTrue();
      expect(result.describe().indexOf('401') >= 0).assertTrue();
      expect(result.usableDeviceCount()).assertEqual(DEVICE_COUNT_UNKNOWN);
      expect(result.created).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FEATURE_CROSS_0010
     * @tc.name featureCross0010
     * @tc.desc Verify a device query failure 801 on a created instance names the query call.
     */
    it('featureCross0010', 0, () => {
      const fn: string = 'hfp.createHfpAgProfile';
      const result: HfpAgResult = new HfpAgResult(fn, true, -1, ProbeStatus.CAPABILITY_UNSUPPORTED, 801, 'x');
      expect(result.describe().indexOf('getConnectedDevices') >= 0).assertTrue();
      expect(result.describe().indexOf('801') >= 0).assertTrue();
      expect(result.usableDeviceCount()).assertEqual(DEVICE_COUNT_UNKNOWN);
      expect(result.created).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FEATURE_CROSS_0011
     * @tc.name featureCross0011
     * @tc.desc Verify a device query failure 2900099 on a created instance names the query call.
     */
    it('featureCross0011', 0, () => {
      const fn: string = 'hfp.createHfpAgProfile';
      const result: HfpAgResult = new HfpAgResult(fn, true, -1, ProbeStatus.FAILED, 2900099, 'x');
      expect(result.describe().indexOf('getConnectedDevices') >= 0).assertTrue();
      expect(result.describe().indexOf('2900099') >= 0).assertTrue();
      expect(result.usableDeviceCount()).assertEqual(DEVICE_COUNT_UNKNOWN);
      expect(result.created).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FEATURE_CROSS_0012
     * @tc.name featureCross0012
     * @tc.desc Verify describe reports 0 connected devices after a successful probe.
     */
    it('featureCross0012', 0, () => {
      const fn: string = 'hfp.createHfpAgProfile';
      const result: HfpAgResult = new HfpAgResult(fn, true, 0, ProbeStatus.READY, 0, 'ok');
      expect(result.describe()).assertEqual('AG：实例已创建，已连接 0 台');
      expect(result.describe().length).assertEqual(16);
      expect(result.usableDeviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FEATURE_CROSS_0013
     * @tc.name featureCross0013
     * @tc.desc Verify describe reports 1 connected devices after a successful probe.
     */
    it('featureCross0013', 0, () => {
      const fn: string = 'hfp.createHfpAgProfile';
      const result: HfpAgResult = new HfpAgResult(fn, true, 1, ProbeStatus.READY, 0, 'ok');
      expect(result.describe()).assertEqual('AG：实例已创建，已连接 1 台');
      expect(result.describe().length).assertEqual(16);
      expect(result.usableDeviceCount()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FEATURE_CROSS_0014
     * @tc.name featureCross0014
     * @tc.desc Verify describe reports 2 connected devices after a successful probe.
     */
    it('featureCross0014', 0, () => {
      const fn: string = 'hfp.createHfpAgProfile';
      const result: HfpAgResult = new HfpAgResult(fn, true, 2, ProbeStatus.READY, 0, 'ok');
      expect(result.describe()).assertEqual('AG：实例已创建，已连接 2 台');
      expect(result.describe().length).assertEqual(16);
      expect(result.usableDeviceCount()).assertEqual(2);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FEATURE_CROSS_0015
     * @tc.name featureCross0015
     * @tc.desc Verify describe reports 3 connected devices after a successful probe.
     */
    it('featureCross0015', 0, () => {
      const fn: string = 'hfp.createHfpAgProfile';
      const result: HfpAgResult = new HfpAgResult(fn, true, 3, ProbeStatus.READY, 0, 'ok');
      expect(result.describe()).assertEqual('AG：实例已创建，已连接 3 台');
      expect(result.describe().length).assertEqual(16);
      expect(result.usableDeviceCount()).assertEqual(3);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FEATURE_CROSS_0016
     * @tc.name featureCross0016
     * @tc.desc Verify describe reports 5 connected devices after a successful probe.
     */
    it('featureCross0016', 0, () => {
      const fn: string = 'hfp.createHfpAgProfile';
      const result: HfpAgResult = new HfpAgResult(fn, true, 5, ProbeStatus.READY, 0, 'ok');
      expect(result.describe()).assertEqual('AG：实例已创建，已连接 5 台');
      expect(result.describe().length).assertEqual(16);
      expect(result.usableDeviceCount()).assertEqual(5);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FEATURE_CROSS_0017
     * @tc.name featureCross0017
     * @tc.desc Verify describe reports 10 connected devices after a successful probe.
     */
    it('featureCross0017', 0, () => {
      const fn: string = 'hfp.createHfpAgProfile';
      const result: HfpAgResult = new HfpAgResult(fn, true, 10, ProbeStatus.READY, 0, 'ok');
      expect(result.describe()).assertEqual('AG：实例已创建，已连接 10 台');
      expect(result.describe().length).assertEqual(17);
      expect(result.usableDeviceCount()).assertEqual(10);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FEATURE_CROSS_0018
     * @tc.name featureCross0018
     * @tc.desc Verify describe reports 99 connected devices after a successful probe.
     */
    it('featureCross0018', 0, () => {
      const fn: string = 'hfp.createHfpAgProfile';
      const result: HfpAgResult = new HfpAgResult(fn, true, 99, ProbeStatus.READY, 0, 'ok');
      expect(result.describe()).assertEqual('AG：实例已创建，已连接 99 台');
      expect(result.describe().length).assertEqual(17);
      expect(result.usableDeviceCount()).assertEqual(99);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FEATURE_CROSS_0019
     * @tc.name featureCross0019
     * @tc.desc Verify the 801 create failure appends the explanation about the six device types.
     */
    it('featureCross0019', 0, () => {
      const fn: string = 'hfp.createHfpAgProfile';
      const result: HfpAgResult = new HfpAgResult(fn, false, -1, ProbeStatus.CAPABILITY_UNSUPPORTED, 801, 'x');
      expect(result.reason()).assertEqual('AG 入口在六种设备类型上都有实现，这里的 801 一般是蓝牙服务尚未就绪，请确认蓝牙已打开后重试');
      expect(result.reason().length).assertEqual(49);
      expect(result.reason().indexOf('六种设备类型') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FEATURE_CROSS_0020
     * @tc.name featureCross0020
     * @tc.desc Verify a permission create failure needs no extra explanation.
     */
    it('featureCross0020', 0, () => {
      const fn: string = 'hfp.createHfpAgProfile';
      const result: HfpAgResult = new HfpAgResult(fn, false, -1, ProbeStatus.PERMISSION_DENIED, 201, 'x');
      expect(result.reason()).assertEqual('');
      expect(result.reason().length).assertEqual(0);
      expect(result.describe().indexOf('201') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FEATURE_CROSS_0021
     * @tc.name featureCross0021
     * @tc.desc Verify a created instance never appends the explanation even with code 801.
     */
    it('featureCross0021', 0, () => {
      const fn: string = 'hfp.createHfpAgProfile';
      const result: HfpAgResult = new HfpAgResult(fn, true, -1, ProbeStatus.CAPABILITY_UNSUPPORTED, 801, 'x');
      expect(result.reason()).assertEqual('');
      expect(result.created).assertTrue();
      expect(result.usableDeviceCount()).assertEqual(DEVICE_COUNT_UNKNOWN);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FEATURE_CROSS_0022
     * @tc.name featureCross0022
     * @tc.desc Verify a generic create failure stays silent because the hint already explains it.
     */
    it('featureCross0022', 0, () => {
      const fn: string = 'hfp.createHfpAgProfile';
      const result: HfpAgResult = new HfpAgResult(fn, false, -1, ProbeStatus.FAILED, 2900099, 'x');
      expect(result.reason()).assertEqual('');
      expect(result.reason().length).assertEqual(0);
      expect(result.describe().indexOf('2900099') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_FEATURE_CROSS_0023
     * @tc.name featureCross0023
     * @tc.desc Verify probeHfpAgWith reports 0 devices for a stub holding that many.
     */
    it('featureCross0023', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(0));
      const result: HfpAgResult = probeHfpAgWith(stub);
      expect(result.created).assertTrue();
      expect(result.deviceCount).assertEqual(0);
      expect(result.describe()).assertEqual('AG：实例已创建，已连接 0 台');
      expect(result.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FEATURE_CROSS_0024
     * @tc.name featureCross0024
     * @tc.desc Verify probeHfpAgWith reports 1 devices for a stub holding that many.
     */
    it('featureCross0024', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(1));
      const result: HfpAgResult = probeHfpAgWith(stub);
      expect(result.created).assertTrue();
      expect(result.deviceCount).assertEqual(1);
      expect(result.describe()).assertEqual('AG：实例已创建，已连接 1 台');
      expect(result.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FEATURE_CROSS_0025
     * @tc.name featureCross0025
     * @tc.desc Verify probeHfpAgWith reports 3 devices for a stub holding that many.
     */
    it('featureCross0025', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(3));
      const result: HfpAgResult = probeHfpAgWith(stub);
      expect(result.created).assertTrue();
      expect(result.deviceCount).assertEqual(3);
      expect(result.describe()).assertEqual('AG：实例已创建，已连接 3 台');
      expect(result.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FEATURE_CROSS_0026
     * @tc.name featureCross0026
     * @tc.desc Verify probeHfpAgWith maps a device query failure 201 to status PERMISSION_DENIED.
     */
    it('featureCross0026', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2));
      stub.devicesError = 201;
      const result: HfpAgResult = probeHfpAgWith(stub);
      expect(result.status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(result.code).assertEqual(201);
      expect(result.usableDeviceCount()).assertEqual(DEVICE_COUNT_UNKNOWN);
      expect(stub.deviceCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FEATURE_CROSS_0027
     * @tc.name featureCross0027
     * @tc.desc Verify probeHfpAgWith maps a device query failure 401 to status FAILED.
     */
    it('featureCross0027', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2));
      stub.devicesError = 401;
      const result: HfpAgResult = probeHfpAgWith(stub);
      expect(result.status).assertEqual(ProbeStatus.FAILED);
      expect(result.code).assertEqual(401);
      expect(result.usableDeviceCount()).assertEqual(DEVICE_COUNT_UNKNOWN);
      expect(stub.deviceCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FEATURE_CROSS_0028
     * @tc.name featureCross0028
     * @tc.desc Verify probeHfpAgWith maps a device query failure 801 to status CAPABILITY_UNSUPPORTED.
     */
    it('featureCross0028', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2));
      stub.devicesError = 801;
      const result: HfpAgResult = probeHfpAgWith(stub);
      expect(result.status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(result.code).assertEqual(801);
      expect(result.usableDeviceCount()).assertEqual(DEVICE_COUNT_UNKNOWN);
      expect(stub.deviceCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FEATURE_CROSS_0029
     * @tc.name featureCross0029
     * @tc.desc Verify probeHfpAgWith maps a device query failure 2900001 to status SERVICE_STOPPED.
     */
    it('featureCross0029', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2));
      stub.devicesError = 2900001;
      const result: HfpAgResult = probeHfpAgWith(stub);
      expect(result.status).assertEqual(ProbeStatus.SERVICE_STOPPED);
      expect(result.code).assertEqual(2900001);
      expect(result.usableDeviceCount()).assertEqual(DEVICE_COUNT_UNKNOWN);
      expect(stub.deviceCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FEATURE_CROSS_0030
     * @tc.name featureCross0030
     * @tc.desc Verify probeHfpAgWith maps a device query failure 2900003 to status BLUETOOTH_DISABLED.
     */
    it('featureCross0030', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2));
      stub.devicesError = 2900003;
      const result: HfpAgResult = probeHfpAgWith(stub);
      expect(result.status).assertEqual(ProbeStatus.BLUETOOTH_DISABLED);
      expect(result.code).assertEqual(2900003);
      expect(result.usableDeviceCount()).assertEqual(DEVICE_COUNT_UNKNOWN);
      expect(stub.deviceCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_FEATURE_CROSS_0031
     * @tc.name featureCross0031
     * @tc.desc Verify probeHfpAgWith maps a device query failure 2900099 to status FAILED.
     */
    it('featureCross0031', 0, () => {
      const stub: ProfileStub = new ProfileStub(devicesOf(2));
      stub.devicesError = 2900099;
      const result: HfpAgResult = probeHfpAgWith(stub);
      expect(result.status).assertEqual(ProbeStatus.FAILED);
      expect(result.code).assertEqual(2900099);
      expect(result.usableDeviceCount()).assertEqual(DEVICE_COUNT_UNKNOWN);
      expect(stub.deviceCalls).assertEqual(1);
    });
  });
}
