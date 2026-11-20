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
 * 跨模块不变量。
 *
 * 这些用例不追求新的输入取值，而是要求同一份数据在不同模块里得到一致的结论：
 * 错误码的分类与文案一致、连接状态的文案与谓词一致、设备摘要与长度一致、脱敏前后段数一致。
 */

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import {
  ProbeStatus,
  classifyErrorCode,
  connectionStateName,
  isConnected,
  isTransitionState,
  probeStatusHint,
  probeStatusName,
  summarizeDeviceList
} from '../../../main/ets/model/ProfileState';
import { ProfileKind } from '../../../main/ets/model/ProfileCatalog';
import { ProfileSnapshot } from '../../../main/ets/model/ProfileSnapshot';
import { maskDeviceId, splitAddress } from '../../../main/ets/model/DeviceAddress';

/** 生成 count 个连续尾号的设备地址，避免用例里出现超长数组字面量 */
function devicesOf(count: number, start: number = 0): string[] {
  const list: string[] = [];
  for (let index = 0; index < count; index++) {
    list.push('A1:B2:C3:D4:E5:F' + (start + index));
  }
  return list;
}

/** 以状态三元组构造快照，避免在用例里写超长对象字面量 */
function snapshotOf(status: ProbeStatus, code: number, message: string): ProfileSnapshot {
  return new ProfileSnapshot(ProfileKind.HFP, { status: status, code: code, message: message });
}

export default function bluetoothProfileQualityInvariantTest() {
  describe('BluetoothProfileQualityInvariantTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_INVARIANT_0001
     * @tc.name qualityInvariant0001
     * @tc.desc Verify the classification, the status name and the hint for code 201 never disagree.
     */
    it('qualityInvariant0001', 0, () => {
      const status: ProbeStatus = classifyErrorCode(201);
      expect(status).assertEqual(ProbeStatus.PERMISSION_DENIED);
      expect(probeStatusName(status).length > 0).assertTrue();
      expect(probeStatusHint(status).length > 0).assertTrue();
      expect(probeStatusName(status) === probeStatusName(ProbeStatus.IDLE)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_INVARIANT_0002
     * @tc.name qualityInvariant0002
     * @tc.desc Verify the classification, the status name and the hint for code 401 never disagree.
     */
    it('qualityInvariant0002', 0, () => {
      const status: ProbeStatus = classifyErrorCode(401);
      expect(status).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(status).length > 0).assertTrue();
      expect(probeStatusHint(status).length > 0).assertTrue();
      expect(probeStatusName(status) === probeStatusName(ProbeStatus.IDLE)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_INVARIANT_0003
     * @tc.name qualityInvariant0003
     * @tc.desc Verify the classification, the status name and the hint for code 801 never disagree.
     */
    it('qualityInvariant0003', 0, () => {
      const status: ProbeStatus = classifyErrorCode(801);
      expect(status).assertEqual(ProbeStatus.CAPABILITY_UNSUPPORTED);
      expect(probeStatusName(status).length > 0).assertTrue();
      expect(probeStatusHint(status).length > 0).assertTrue();
      expect(probeStatusName(status) === probeStatusName(ProbeStatus.IDLE)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_INVARIANT_0004
     * @tc.name qualityInvariant0004
     * @tc.desc Verify the classification, the status name and the hint for code 2900001 never disagree.
     */
    it('qualityInvariant0004', 0, () => {
      const status: ProbeStatus = classifyErrorCode(2900001);
      expect(status).assertEqual(ProbeStatus.SERVICE_STOPPED);
      expect(probeStatusName(status).length > 0).assertTrue();
      expect(probeStatusHint(status).length > 0).assertTrue();
      expect(probeStatusName(status) === probeStatusName(ProbeStatus.IDLE)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_INVARIANT_0005
     * @tc.name qualityInvariant0005
     * @tc.desc Verify the classification, the status name and the hint for code 2900003 never disagree.
     */
    it('qualityInvariant0005', 0, () => {
      const status: ProbeStatus = classifyErrorCode(2900003);
      expect(status).assertEqual(ProbeStatus.BLUETOOTH_DISABLED);
      expect(probeStatusName(status).length > 0).assertTrue();
      expect(probeStatusHint(status).length > 0).assertTrue();
      expect(probeStatusName(status) === probeStatusName(ProbeStatus.IDLE)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_INVARIANT_0006
     * @tc.name qualityInvariant0006
     * @tc.desc Verify the classification, the status name and the hint for code 2900004 never disagree.
     */
    it('qualityInvariant0006', 0, () => {
      const status: ProbeStatus = classifyErrorCode(2900004);
      expect(status).assertEqual(ProbeStatus.PROFILE_UNSUPPORTED);
      expect(probeStatusName(status).length > 0).assertTrue();
      expect(probeStatusHint(status).length > 0).assertTrue();
      expect(probeStatusName(status) === probeStatusName(ProbeStatus.IDLE)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_INVARIANT_0007
     * @tc.name qualityInvariant0007
     * @tc.desc Verify the classification, the status name and the hint for code 2900099 never disagree.
     */
    it('qualityInvariant0007', 0, () => {
      const status: ProbeStatus = classifyErrorCode(2900099);
      expect(status).assertEqual(ProbeStatus.FAILED);
      expect(probeStatusName(status).length > 0).assertTrue();
      expect(probeStatusHint(status).length > 0).assertTrue();
      expect(probeStatusName(status) === probeStatusName(ProbeStatus.IDLE)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_INVARIANT_0008
     * @tc.name qualityInvariant0008
     * @tc.desc Verify connection state 0 keeps text, connected flag and transition flag consistent.
     */
    it('qualityInvariant0008', 0, () => {
      expect(connectionStateName(0)).assertEqual('已断开');
      expect(isConnected(0)).assertEqual(false);
      expect(isTransitionState(0)).assertEqual(false);
      expect(isConnected(0) && isTransitionState(0)).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_INVARIANT_0009
     * @tc.name qualityInvariant0009
     * @tc.desc Verify connection state 1 keeps text, connected flag and transition flag consistent.
     */
    it('qualityInvariant0009', 0, () => {
      expect(connectionStateName(1)).assertEqual('正在连接');
      expect(isConnected(1)).assertEqual(false);
      expect(isTransitionState(1)).assertEqual(true);
      expect(isConnected(1) && isTransitionState(1)).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_INVARIANT_0010
     * @tc.name qualityInvariant0010
     * @tc.desc Verify connection state 2 keeps text, connected flag and transition flag consistent.
     */
    it('qualityInvariant0010', 0, () => {
      expect(connectionStateName(2)).assertEqual('已连接');
      expect(isConnected(2)).assertEqual(true);
      expect(isTransitionState(2)).assertEqual(false);
      expect(isConnected(2) && isTransitionState(2)).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_INVARIANT_0011
     * @tc.name qualityInvariant0011
     * @tc.desc Verify connection state 3 keeps text, connected flag and transition flag consistent.
     */
    it('qualityInvariant0011', 0, () => {
      expect(connectionStateName(3)).assertEqual('正在断开');
      expect(isConnected(3)).assertEqual(false);
      expect(isTransitionState(3)).assertEqual(true);
      expect(isConnected(3) && isTransitionState(3)).assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_INVARIANT_0012
     * @tc.name qualityInvariant0012
     * @tc.desc Verify the device summary and the raw length agree for 0 devices.
     */
    it('qualityInvariant0012', 0, () => {
      const devices: string[] = devicesOf(0);
      expect(devices.length).assertEqual(0);
      expect(summarizeDeviceList(devices)).assertEqual('暂无已连接设备');
      expect(summarizeDeviceList(devices).length).assertEqual(7);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_INVARIANT_0013
     * @tc.name qualityInvariant0013
     * @tc.desc Verify the device summary and the raw length agree for 1 devices.
     */
    it('qualityInvariant0013', 0, () => {
      const devices: string[] = devicesOf(1);
      expect(devices.length).assertEqual(1);
      expect(summarizeDeviceList(devices)).assertEqual('1 台已连接设备');
      expect(summarizeDeviceList(devices).length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_INVARIANT_0014
     * @tc.name qualityInvariant0014
     * @tc.desc Verify the device summary and the raw length agree for 2 devices.
     */
    it('qualityInvariant0014', 0, () => {
      const devices: string[] = devicesOf(2);
      expect(devices.length).assertEqual(2);
      expect(summarizeDeviceList(devices)).assertEqual('2 台已连接设备');
      expect(summarizeDeviceList(devices).length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_INVARIANT_0015
     * @tc.name qualityInvariant0015
     * @tc.desc Verify the device summary and the raw length agree for 3 devices.
     */
    it('qualityInvariant0015', 0, () => {
      const devices: string[] = devicesOf(3);
      expect(devices.length).assertEqual(3);
      expect(summarizeDeviceList(devices)).assertEqual('3 台已连接设备');
      expect(summarizeDeviceList(devices).length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_INVARIANT_0016
     * @tc.name qualityInvariant0016
     * @tc.desc Verify the device summary and the raw length agree for 4 devices.
     */
    it('qualityInvariant0016', 0, () => {
      const devices: string[] = devicesOf(4);
      expect(devices.length).assertEqual(4);
      expect(summarizeDeviceList(devices)).assertEqual('4 台已连接设备');
      expect(summarizeDeviceList(devices).length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_INVARIANT_0017
     * @tc.name qualityInvariant0017
     * @tc.desc Verify the device summary and the raw length agree for 6 devices.
     */
    it('qualityInvariant0017', 0, () => {
      const devices: string[] = devicesOf(6);
      expect(devices.length).assertEqual(6);
      expect(summarizeDeviceList(devices)).assertEqual('6 台已连接设备');
      expect(summarizeDeviceList(devices).length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_INVARIANT_0018
     * @tc.name qualityInvariant0018
     * @tc.desc Verify the device summary and the raw length agree for 8 devices.
     */
    it('qualityInvariant0018', 0, () => {
      const devices: string[] = devicesOf(8);
      expect(devices.length).assertEqual(8);
      expect(summarizeDeviceList(devices)).assertEqual('8 台已连接设备');
      expect(summarizeDeviceList(devices).length).assertEqual(8);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_INVARIANT_0019
     * @tc.name qualityInvariant0019
     * @tc.desc Verify the snapshot describe line stays aligned with probeStatusName for IDLE.
     */
    it('qualityInvariant0019', 0, () => {
      const snapshot: ProfileSnapshot = snapshotOf(ProbeStatus.IDLE, 5, 'detail');
      expect(snapshot.describe().indexOf(probeStatusName(snapshot.status))).assertEqual(0);
      expect(snapshot.describe().indexOf('（5）') >= 0).assertTrue();
      expect(snapshot.describe().indexOf('detail') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_INVARIANT_0020
     * @tc.name qualityInvariant0020
     * @tc.desc Verify the snapshot describe line stays aligned with probeStatusName for READY.
     */
    it('qualityInvariant0020', 0, () => {
      const snapshot: ProfileSnapshot = snapshotOf(ProbeStatus.READY, 5, 'detail');
      expect(snapshot.describe().indexOf(probeStatusName(snapshot.status))).assertEqual(0);
      expect(snapshot.describe().indexOf('（5）') >= 0).assertTrue();
      expect(snapshot.describe().indexOf('detail') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_INVARIANT_0021
     * @tc.name qualityInvariant0021
     * @tc.desc Verify the snapshot describe line stays aligned with probeStatusName for NO_DEVICE.
     */
    it('qualityInvariant0021', 0, () => {
      const snapshot: ProfileSnapshot = snapshotOf(ProbeStatus.NO_DEVICE, 5, 'detail');
      expect(snapshot.describe().indexOf(probeStatusName(snapshot.status))).assertEqual(0);
      expect(snapshot.describe().indexOf('（5）') >= 0).assertTrue();
      expect(snapshot.describe().indexOf('detail') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_INVARIANT_0022
     * @tc.name qualityInvariant0022
     * @tc.desc Verify the snapshot describe line stays aligned with probeStatusName for PERMISSION_DENIED.
     */
    it('qualityInvariant0022', 0, () => {
      const snapshot: ProfileSnapshot = snapshotOf(ProbeStatus.PERMISSION_DENIED, 5, 'detail');
      expect(snapshot.describe().indexOf(probeStatusName(snapshot.status))).assertEqual(0);
      expect(snapshot.describe().indexOf('（5）') >= 0).assertTrue();
      expect(snapshot.describe().indexOf('detail') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_INVARIANT_0023
     * @tc.name qualityInvariant0023
     * @tc.desc Verify the snapshot describe line stays aligned with probeStatusName for FAILED.
     */
    it('qualityInvariant0023', 0, () => {
      const snapshot: ProfileSnapshot = snapshotOf(ProbeStatus.FAILED, 5, 'detail');
      expect(snapshot.describe().indexOf(probeStatusName(snapshot.status))).assertEqual(0);
      expect(snapshot.describe().indexOf('（5）') >= 0).assertTrue();
      expect(snapshot.describe().indexOf('detail') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_INVARIANT_0024
     * @tc.name qualityInvariant0024
     * @tc.desc Verify masking A1:B2:C3:D4:E5:F6 keeps the head, the tail and the segment count.
     */
    it('qualityInvariant0024', 0, () => {
      const masked: string = maskDeviceId('A1:B2:C3:D4:E5:F6');
      expect(masked).assertEqual('A1:B2:**:**:**:F6');
      expect(masked.length).assertEqual(17);
      expect(masked.indexOf(':C3:D')).assertEqual(-1);
      expect(splitAddress(masked).length).assertEqual(6);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_INVARIANT_0025
     * @tc.name qualityInvariant0025
     * @tc.desc Verify masking 00:11:22:33:44:55 keeps the head, the tail and the segment count.
     */
    it('qualityInvariant0025', 0, () => {
      const masked: string = maskDeviceId('00:11:22:33:44:55');
      expect(masked).assertEqual('00:11:**:**:**:55');
      expect(masked.length).assertEqual(17);
      expect(masked.indexOf(':22:3')).assertEqual(-1);
      expect(splitAddress(masked).length).assertEqual(6);
    });

    /**
     * @tc.number SUB_BLUETOOTH_QUALITY_INVARIANT_0026
     * @tc.name qualityInvariant0026
     * @tc.desc Verify masking FF:FE:FD:FC:FB:FA keeps the head, the tail and the segment count.
     */
    it('qualityInvariant0026', 0, () => {
      const masked: string = maskDeviceId('FF:FE:FD:FC:FB:FA');
      expect(masked).assertEqual('FF:FE:**:**:**:FA');
      expect(masked.length).assertEqual(17);
      expect(masked.indexOf(':FD:F')).assertEqual(-1);
      expect(splitAddress(masked).length).assertEqual(6);
    });
  });
}
