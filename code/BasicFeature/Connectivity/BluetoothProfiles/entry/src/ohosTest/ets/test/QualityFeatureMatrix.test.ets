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
 * AG 角色探测结果的模型矩阵。
 *
 * HfpAgResult 决定页面上一行结论与是否需要补充说明，因此逐字段、逐分支锁定：
 * 创建失败、创建成功但查询失败、创建成功且有 N 台设备三种形态的文案必须彼此可区分。
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

export default function bluetoothProfileQualityFeatureTest() {
  describe('BluetoothProfileQualityFeatureTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_FEATURE_0001
     * @tc.name qualityFeature0001
     * @tc.desc Verify HfpAgResult keeps all six fields of a created probe untouched.
     */
    it('qualityFeature0001', 0, () => {
      const result: HfpAgResult = new HfpAgResult('fn', true, 2, ProbeStatus.READY, 0, 'ok');
      expect(result.createFunction).assertEqual('fn');
      expect(result.created).assertTrue();
      expect(result.deviceCount).assertEqual(2);
      expect(result.status).assertEqual(ProbeStatus.READY);
      expect(result.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_FEATURE_0002
     * @tc.name qualityFeature0002
     * @tc.desc Verify HfpAgResult keeps all six fields of a failed probe untouched.
     */
    it('qualityFeature0002', 0, () => {
      const result: HfpAgResult = new HfpAgResult('fn', false, -1, ProbeStatus.CAPABILITY_UNSUPPORTED, 801, 'failed');
      expect(result.message).assertEqual('failed');
      expect(result.created).assertFalse();
      expect(result.deviceCount).assertEqual(-1);
      expect(result.code).assertEqual(801);
      expect(result.usableDeviceCount()).assertEqual(-1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_FEATURE_0003
     * @tc.name qualityFeature0003
     * @tc.desc Verify describe reports 0 connected devices with the documented wording.
     */
    it('qualityFeature0003', 0, () => {
      const fn: string = 'hfp.createHfpAgProfile';
      const result: HfpAgResult = new HfpAgResult(fn, true, 0, ProbeStatus.READY, 0, 'ok');
      expect(result.describe()).assertEqual('AG：实例已创建，已连接 0 台');
      expect(result.describe().length).assertEqual(16);
      expect(result.usableDeviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_FEATURE_0004
     * @tc.name qualityFeature0004
     * @tc.desc Verify describe reports 1 connected devices with the documented wording.
     */
    it('qualityFeature0004', 0, () => {
      const fn: string = 'hfp.createHfpAgProfile';
      const result: HfpAgResult = new HfpAgResult(fn, true, 1, ProbeStatus.READY, 0, 'ok');
      expect(result.describe()).assertEqual('AG：实例已创建，已连接 1 台');
      expect(result.describe().length).assertEqual(16);
      expect(result.usableDeviceCount()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_FEATURE_0005
     * @tc.name qualityFeature0005
     * @tc.desc Verify describe reports 2 connected devices with the documented wording.
     */
    it('qualityFeature0005', 0, () => {
      const fn: string = 'hfp.createHfpAgProfile';
      const result: HfpAgResult = new HfpAgResult(fn, true, 2, ProbeStatus.READY, 0, 'ok');
      expect(result.describe()).assertEqual('AG：实例已创建，已连接 2 台');
      expect(result.describe().length).assertEqual(16);
      expect(result.usableDeviceCount()).assertEqual(2);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_FEATURE_0006
     * @tc.name qualityFeature0006
     * @tc.desc Verify describe reports 3 connected devices with the documented wording.
     */
    it('qualityFeature0006', 0, () => {
      const fn: string = 'hfp.createHfpAgProfile';
      const result: HfpAgResult = new HfpAgResult(fn, true, 3, ProbeStatus.READY, 0, 'ok');
      expect(result.describe()).assertEqual('AG：实例已创建，已连接 3 台');
      expect(result.describe().length).assertEqual(16);
      expect(result.usableDeviceCount()).assertEqual(3);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_FEATURE_0007
     * @tc.name qualityFeature0007
     * @tc.desc Verify describe explains a create failure with the create function name and the code.
     */
    it('qualityFeature0007', 0, () => {
      const fn: string = 'hfp.createHfpAgProfile';
      const result: HfpAgResult = new HfpAgResult(fn, false, -1, ProbeStatus.CAPABILITY_UNSUPPORTED, 801, 'x');
      expect(result.describe()).assertEqual('AG：hfp.createHfpAgProfile() 失败（801）');
      expect(result.describe().indexOf('createHfpAgProfile') >= 0).assertTrue();
      expect(result.usableDeviceCount()).assertEqual(DEVICE_COUNT_UNKNOWN);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_FEATURE_0008
     * @tc.name qualityFeature0008
     * @tc.desc Verify describe explains a device query failure even though the instance was created.
     */
    it('qualityFeature0008', 0, () => {
      const result: HfpAgResult = new HfpAgResult('hfp.createHfpAgProfile', true, -1, ProbeStatus.FAILED, 2900099, 'x');
      expect(result.describe()).assertEqual('AG：实例已创建，getConnectedDevices() 失败（2900099）');
      expect(result.created).assertTrue();
      expect(result.deviceCount).assertEqual(DEVICE_COUNT_UNKNOWN);
      expect(result.usableDeviceCount()).assertEqual(DEVICE_COUNT_UNKNOWN);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_FEATURE_0009
     * @tc.name qualityFeature0009
     * @tc.desc Verify the 801 create failure explains that the entry exists on six device types.
     */
    it('qualityFeature0009', 0, () => {
      const fn: string = 'hfp.createHfpAgProfile';
      const result: HfpAgResult = new HfpAgResult(fn, false, -1, ProbeStatus.CAPABILITY_UNSUPPORTED, 801, 'x');
      expect(result.reason()).assertEqual('AG 入口在六种设备类型上都有实现，这里的 801 一般是蓝牙服务尚未就绪，请确认蓝牙已打开后重试');
      expect(result.reason().length).assertEqual(49);
      expect(result.reason().indexOf('801') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_FEATURE_0010
     * @tc.name qualityFeature0010
     * @tc.desc Verify a created probe never appends an extra explanation line.
     */
    it('qualityFeature0010', 0, () => {
      const result: HfpAgResult = new HfpAgResult('hfp.createHfpAgProfile', true, 0, ProbeStatus.READY, 0, 'ok');
      expect(result.reason()).assertEqual('');
      expect(result.reason().length).assertEqual(0);
      expect(result.usableDeviceCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_FEATURE_0011
     * @tc.name qualityFeature0011
     * @tc.desc Verify a non 801 create failure stays silent because the cause is already specific.
     */
    it('qualityFeature0011', 0, () => {
      const fn: string = 'hfp.createHfpAgProfile';
      const result: HfpAgResult = new HfpAgResult(fn, false, -1, ProbeStatus.PERMISSION_DENIED, 201, 'x');
      expect(result.reason()).assertEqual('');
      expect(result.describe().indexOf('201') >= 0).assertTrue();
      expect(result.usableDeviceCount()).assertEqual(DEVICE_COUNT_UNKNOWN);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_FEATURE_0012
     * @tc.name qualityFeature0012
     * @tc.desc Verify probeHfpAgWith counts 0 devices from the injected profile.
     */
    it('qualityFeature0012', 0, () => {
      const stub: ProfileStub = new ProfileStub([]);
      const result: HfpAgResult = probeHfpAgWith(stub);
      expect(result.deviceCount).assertEqual(0);
      expect(result.created).assertTrue();
      expect(result.status).assertEqual(ProbeStatus.READY);
      expect(stub.deviceCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_FEATURE_0013
     * @tc.name qualityFeature0013
     * @tc.desc Verify probeHfpAgWith counts 1 devices from the injected profile.
     */
    it('qualityFeature0013', 0, () => {
      const stub: ProfileStub = new ProfileStub(['A1:B2:C3:D4:E5:F0']);
      const result: HfpAgResult = probeHfpAgWith(stub);
      expect(result.deviceCount).assertEqual(1);
      expect(result.created).assertTrue();
      expect(result.status).assertEqual(ProbeStatus.READY);
      expect(stub.deviceCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_FEATURE_0014
     * @tc.name qualityFeature0014
     * @tc.desc Verify probeHfpAgWith counts 3 devices from the injected profile.
     */
    it('qualityFeature0014', 0, () => {
      const stub: ProfileStub = new ProfileStub(['A1:B2:C3:D4:E5:F0', 'A1:B2:C3:D4:E5:F1', 'A1:B2:C3:D4:E5:F2']);
      const result: HfpAgResult = probeHfpAgWith(stub);
      expect(result.deviceCount).assertEqual(3);
      expect(result.created).assertTrue();
      expect(result.status).assertEqual(ProbeStatus.READY);
      expect(stub.deviceCalls).assertEqual(1);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_FEATURE_0015
     * @tc.name qualityFeature0015
     * @tc.desc Verify probeHfpAgWith maps a device query failure 201 to PERMISSION_DENIED.
     */
    it('qualityFeature0015', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.devicesError = 201;
      const result: HfpAgResult = probeHfpAgWith(stub);
      expect(result.code).assertEqual(201);
      expect(result.status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(result.created).assertTrue();
      expect(result.deviceCount).assertEqual(DEVICE_COUNT_UNKNOWN);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_FEATURE_0016
     * @tc.name qualityFeature0016
     * @tc.desc Verify probeHfpAgWith maps a device query failure 801 to CAPABILITY_UNSUPPORTED.
     */
    it('qualityFeature0016', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.devicesError = 801;
      const result: HfpAgResult = probeHfpAgWith(stub);
      expect(result.code).assertEqual(801);
      expect(result.status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(result.created).assertTrue();
      expect(result.deviceCount).assertEqual(DEVICE_COUNT_UNKNOWN);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_FEATURE_0017
     * @tc.name qualityFeature0017
     * @tc.desc Verify probeHfpAgWith maps a device query failure 2900099 to FAILED.
     */
    it('qualityFeature0017', 0, () => {
      const stub: ProfileStub = new ProfileStub();
      stub.devicesError = 2900099;
      const result: HfpAgResult = probeHfpAgWith(stub);
      expect(result.code).assertEqual(2900099);
      expect(result.status).assertEqual(ProbeStatus.FAILED);
      expect(result.created).assertTrue();
      expect(result.deviceCount).assertEqual(DEVICE_COUNT_UNKNOWN);
    });
  });
}
