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
 * 系统枚举与本地常量的对齐矩阵。
 *
 * 本地把连接状态、蓝牙开关、断开原因各抄了一份数值常量，
 * 一旦系统枚举顺序变化，页面文案就会整体错位，因此逐个取值对拍一次。
 */

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { access, baseProfile, constant, hfp } from '@kit.ConnectivityKit';
import {
  BT_STATE_BLE_ON,
  BT_STATE_BLE_TURNING_OFF,
  BT_STATE_BLE_TURNING_ON,
  BT_STATE_OFF,
  BT_STATE_ON,
  BT_STATE_TURNING_OFF,
  BT_STATE_TURNING_ON,
  CONNECTION_STATE_CONNECTED,
  CONNECTION_STATE_CONNECTING,
  CONNECTION_STATE_DISCONNECTED,
  CONNECTION_STATE_DISCONNECTING,
  DISCONNECT_CAUSE_CAR,
  DISCONNECT_CAUSE_INTERNAL_FAILURE,
  DISCONNECT_CAUSE_KEYBOARD,
  DISCONNECT_CAUSE_MOUSE,
  DISCONNECT_CAUSE_TOO_MANY_DEVICES,
  DISCONNECT_CAUSE_USER,
  bluetoothStateName,
  connectionStateName,
  disconnectCauseName,
  isBluetoothUsable,
  isConnected
} from '../../../main/ets/model/ProfileState';
import { ProfileKind, isProfileKind, metaOf } from '../../../main/ets/model/ProfileCatalog';

export default function bluetoothProfileDeviceEnumTest() {
  describe('BluetoothProfileDeviceEnumTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_ENUM_0001
     * @tc.name deviceEnum0001
     * @tc.desc Verify the local disconnected literal matches the system profile connection state enum.
     */
    it('deviceEnum0001', 0, () => {
      expect(constant.ProfileConnectionState.STATE_DISCONNECTED).assertEqual(CONNECTION_STATE_DISCONNECTED);
      expect(constant.ProfileConnectionState.STATE_DISCONNECTED).assertEqual(0);
      expect(connectionStateName(constant.ProfileConnectionState.STATE_DISCONNECTED)).assertEqual('已断开');
      expect(isConnected(constant.ProfileConnectionState.STATE_DISCONNECTED)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_ENUM_0002
     * @tc.name deviceEnum0002
     * @tc.desc Verify the local connecting literal matches the system profile connection state enum.
     */
    it('deviceEnum0002', 0, () => {
      expect(constant.ProfileConnectionState.STATE_CONNECTING).assertEqual(CONNECTION_STATE_CONNECTING);
      expect(constant.ProfileConnectionState.STATE_CONNECTING).assertEqual(1);
      expect(connectionStateName(constant.ProfileConnectionState.STATE_CONNECTING)).assertEqual('正在连接');
      expect(isConnected(constant.ProfileConnectionState.STATE_CONNECTING)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_ENUM_0003
     * @tc.name deviceEnum0003
     * @tc.desc Verify the local connected literal matches the system profile connection state enum.
     */
    it('deviceEnum0003', 0, () => {
      expect(constant.ProfileConnectionState.STATE_CONNECTED).assertEqual(CONNECTION_STATE_CONNECTED);
      expect(constant.ProfileConnectionState.STATE_CONNECTED).assertEqual(2);
      expect(connectionStateName(constant.ProfileConnectionState.STATE_CONNECTED)).assertEqual('已连接');
      expect(isConnected(constant.ProfileConnectionState.STATE_CONNECTED)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_ENUM_0004
     * @tc.name deviceEnum0004
     * @tc.desc Verify the local disconnecting literal matches the system profile connection state enum.
     */
    it('deviceEnum0004', 0, () => {
      expect(constant.ProfileConnectionState.STATE_DISCONNECTING).assertEqual(CONNECTION_STATE_DISCONNECTING);
      expect(constant.ProfileConnectionState.STATE_DISCONNECTING).assertEqual(3);
      expect(connectionStateName(constant.ProfileConnectionState.STATE_DISCONNECTING)).assertEqual('正在断开');
      expect(isConnected(constant.ProfileConnectionState.STATE_DISCONNECTING)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_ENUM_0005
     * @tc.name deviceEnum0005
     * @tc.desc Verify the local switch off literal matches the system bluetooth state enum.
     */
    it('deviceEnum0005', 0, () => {
      expect(access.BluetoothState.STATE_OFF).assertEqual(BT_STATE_OFF);
      expect(access.BluetoothState.STATE_OFF).assertEqual(0);
      expect(isBluetoothUsable(access.BluetoothState.STATE_OFF)).assertEqual(false);
      expect(bluetoothStateName(access.BluetoothState.STATE_OFF).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_ENUM_0006
     * @tc.name deviceEnum0006
     * @tc.desc Verify the local turning on literal matches the system bluetooth state enum.
     */
    it('deviceEnum0006', 0, () => {
      expect(access.BluetoothState.STATE_TURNING_ON).assertEqual(BT_STATE_TURNING_ON);
      expect(access.BluetoothState.STATE_TURNING_ON).assertEqual(1);
      expect(isBluetoothUsable(access.BluetoothState.STATE_TURNING_ON)).assertEqual(false);
      expect(bluetoothStateName(access.BluetoothState.STATE_TURNING_ON).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_ENUM_0007
     * @tc.name deviceEnum0007
     * @tc.desc Verify the local switch on literal matches the system bluetooth state enum.
     */
    it('deviceEnum0007', 0, () => {
      expect(access.BluetoothState.STATE_ON).assertEqual(BT_STATE_ON);
      expect(access.BluetoothState.STATE_ON).assertEqual(2);
      expect(isBluetoothUsable(access.BluetoothState.STATE_ON)).assertEqual(true);
      expect(bluetoothStateName(access.BluetoothState.STATE_ON).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_ENUM_0008
     * @tc.name deviceEnum0008
     * @tc.desc Verify the local turning off literal matches the system bluetooth state enum.
     */
    it('deviceEnum0008', 0, () => {
      expect(access.BluetoothState.STATE_TURNING_OFF).assertEqual(BT_STATE_TURNING_OFF);
      expect(access.BluetoothState.STATE_TURNING_OFF).assertEqual(3);
      expect(isBluetoothUsable(access.BluetoothState.STATE_TURNING_OFF)).assertEqual(false);
      expect(bluetoothStateName(access.BluetoothState.STATE_TURNING_OFF).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_ENUM_0009
     * @tc.name deviceEnum0009
     * @tc.desc Verify the local ble turning on literal matches the system bluetooth state enum.
     */
    it('deviceEnum0009', 0, () => {
      expect(access.BluetoothState.STATE_BLE_TURNING_ON).assertEqual(BT_STATE_BLE_TURNING_ON);
      expect(access.BluetoothState.STATE_BLE_TURNING_ON).assertEqual(4);
      expect(isBluetoothUsable(access.BluetoothState.STATE_BLE_TURNING_ON)).assertEqual(false);
      expect(bluetoothStateName(access.BluetoothState.STATE_BLE_TURNING_ON).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_ENUM_0010
     * @tc.name deviceEnum0010
     * @tc.desc Verify the local ble only literal matches the system bluetooth state enum.
     */
    it('deviceEnum0010', 0, () => {
      expect(access.BluetoothState.STATE_BLE_ON).assertEqual(BT_STATE_BLE_ON);
      expect(access.BluetoothState.STATE_BLE_ON).assertEqual(5);
      expect(isBluetoothUsable(access.BluetoothState.STATE_BLE_ON)).assertEqual(false);
      expect(bluetoothStateName(access.BluetoothState.STATE_BLE_ON).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_ENUM_0011
     * @tc.name deviceEnum0011
     * @tc.desc Verify the local ble turning off literal matches the system bluetooth state enum.
     */
    it('deviceEnum0011', 0, () => {
      expect(access.BluetoothState.STATE_BLE_TURNING_OFF).assertEqual(BT_STATE_BLE_TURNING_OFF);
      expect(access.BluetoothState.STATE_BLE_TURNING_OFF).assertEqual(6);
      expect(isBluetoothUsable(access.BluetoothState.STATE_BLE_TURNING_OFF)).assertEqual(false);
      expect(bluetoothStateName(access.BluetoothState.STATE_BLE_TURNING_OFF).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_ENUM_0012
     * @tc.name deviceEnum0012
     * @tc.desc Verify the local user disconnect literal matches the system disconnect cause enum.
     */
    it('deviceEnum0012', 0, () => {
      expect(baseProfile.DisconnectCause.USER_DISCONNECT).assertEqual(DISCONNECT_CAUSE_USER);
      expect(baseProfile.DisconnectCause.USER_DISCONNECT).assertEqual(0);
      expect(disconnectCauseName(baseProfile.DisconnectCause.USER_DISCONNECT).length > 0).assertTrue();
      expect(disconnectCauseName(baseProfile.DisconnectCause.USER_DISCONNECT) === '未知原因').assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_ENUM_0013
     * @tc.name deviceEnum0013
     * @tc.desc Verify the local keyboard side literal matches the system disconnect cause enum.
     */
    it('deviceEnum0013', 0, () => {
      expect(baseProfile.DisconnectCause.CONNECT_FROM_KEYBOARD).assertEqual(DISCONNECT_CAUSE_KEYBOARD);
      expect(baseProfile.DisconnectCause.CONNECT_FROM_KEYBOARD).assertEqual(1);
      expect(disconnectCauseName(baseProfile.DisconnectCause.CONNECT_FROM_KEYBOARD).length > 0).assertTrue();
      expect(disconnectCauseName(baseProfile.DisconnectCause.CONNECT_FROM_KEYBOARD) === '未知原因').assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_ENUM_0014
     * @tc.name deviceEnum0014
     * @tc.desc Verify the local mouse side literal matches the system disconnect cause enum.
     */
    it('deviceEnum0014', 0, () => {
      expect(baseProfile.DisconnectCause.CONNECT_FROM_MOUSE).assertEqual(DISCONNECT_CAUSE_MOUSE);
      expect(baseProfile.DisconnectCause.CONNECT_FROM_MOUSE).assertEqual(2);
      expect(disconnectCauseName(baseProfile.DisconnectCause.CONNECT_FROM_MOUSE).length > 0).assertTrue();
      expect(disconnectCauseName(baseProfile.DisconnectCause.CONNECT_FROM_MOUSE) === '未知原因').assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_ENUM_0015
     * @tc.name deviceEnum0015
     * @tc.desc Verify the local car side literal matches the system disconnect cause enum.
     */
    it('deviceEnum0015', 0, () => {
      expect(baseProfile.DisconnectCause.CONNECT_FROM_CAR).assertEqual(DISCONNECT_CAUSE_CAR);
      expect(baseProfile.DisconnectCause.CONNECT_FROM_CAR).assertEqual(3);
      expect(disconnectCauseName(baseProfile.DisconnectCause.CONNECT_FROM_CAR).length > 0).assertTrue();
      expect(disconnectCauseName(baseProfile.DisconnectCause.CONNECT_FROM_CAR) === '未知原因').assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_ENUM_0016
     * @tc.name deviceEnum0016
     * @tc.desc Verify the local device limit literal matches the system disconnect cause enum.
     */
    it('deviceEnum0016', 0, () => {
      expect(baseProfile.DisconnectCause.TOO_MANY_CONNECTED_DEVICES).assertEqual(DISCONNECT_CAUSE_TOO_MANY_DEVICES);
      expect(baseProfile.DisconnectCause.TOO_MANY_CONNECTED_DEVICES).assertEqual(4);
      expect(disconnectCauseName(baseProfile.DisconnectCause.TOO_MANY_CONNECTED_DEVICES).length > 0).assertTrue();
      expect(disconnectCauseName(baseProfile.DisconnectCause.TOO_MANY_CONNECTED_DEVICES) === '未知原因').assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_ENUM_0017
     * @tc.name deviceEnum0017
     * @tc.desc Verify the local internal failure literal matches the system disconnect cause enum.
     */
    it('deviceEnum0017', 0, () => {
      expect(baseProfile.DisconnectCause.CONNECT_FAIL_INTERNAL).assertEqual(DISCONNECT_CAUSE_INTERNAL_FAILURE);
      expect(baseProfile.DisconnectCause.CONNECT_FAIL_INTERNAL).assertEqual(5);
      expect(disconnectCauseName(baseProfile.DisconnectCause.CONNECT_FAIL_INTERNAL).length > 0).assertTrue();
      expect(disconnectCauseName(baseProfile.DisconnectCause.CONNECT_FAIL_INTERNAL) === '未知原因').assertFalse();
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_ENUM_0018
     * @tc.name deviceEnum0018
     * @tc.desc Verify the catalog profileId of the remaining HFP entry matches the system ProfileId enum.
     */
    it('deviceEnum0018', 0, () => {
      expect(metaOf(ProfileKind.HFP).profileId).assertEqual(constant.ProfileId.PROFILE_HANDSFREE_AUDIO_GATEWAY);
      expect(constant.ProfileId.PROFILE_HANDSFREE_AUDIO_GATEWAY).assertEqual(4);
      expect(metaOf(ProfileKind.HFP).code).assertEqual('HFP');
      expect(metaOf(ProfileKind.HFP).profileId > 0).assertTrue();
    });

    /**
     * @tc.number SUB_BLUETOOTH_DEVICE_ENUM_0019
     * @tc.name deviceEnum0019
     * @tc.desc Verify the hfp module exposes the create entry as a callable function.
     */
    it('deviceEnum0019', 0, () => {
      expect(typeof hfp.createHfpAgProfile).assertEqual('function');
      expect(typeof hfp.createHfpAgProfile === 'function').assertTrue();
      expect(isProfileKind(metaOf(ProfileKind.HFP).kind)).assertTrue();
    });
  });
}
