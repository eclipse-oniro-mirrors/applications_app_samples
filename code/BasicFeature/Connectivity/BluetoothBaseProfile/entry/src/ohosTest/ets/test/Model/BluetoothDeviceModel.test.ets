/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  BluetoothConnectionState,
  BluetoothDeviceJson,
  BluetoothDeviceModel,
  BluetoothDeviceType,
  BluetoothMajorService,
  BluetoothProfileType
} from 'library';

const DEVICE_ID: string = 'bt_device_model';
const DEVICE_NAME: string = 'Sample Headset';
const MAC_ADDRESS: string = '00:11:22:33:44:55';
const BONDED_VALUE: number = 12;
const UNBONDED_VALUE: number = 10;

/**
 * statistics string array in target value output current times number.
 * @param {string[]} values - array to count
 * @param {string} target - target value
 * @returns {number} occurrence count
 */
function countOf(values: string[], target: string): number {
  let count: number = 0;
  for (let i = 0; i < values.length; i++) {
    if (values[i] === target) {
      count += 1;
    }
  }
  return count;
}

/**
 * @description Test suite for BluetoothDeviceModel
 * @since 26.0.0
 */
export default function bluetoothDeviceModelTest(): void {
  describe('BluetoothDeviceModelTest', () => {
    // ==================== structure build and default value (2 cases) ====================

    /*
     * @tc.number: SUB_BT_DEVICE_MODEL_0100
     * @tc.name: testBluetoothDeviceModel0001
     * @tc.desc: Verify the default field values of a device model created without arguments.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testBluetoothDeviceModel0001', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0001', 'begin');
      const device: BluetoothDeviceModel = new BluetoothDeviceModel();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0001',
        '#1 ' + "device.deviceId" + ' = ' + JSON.stringify(device.deviceId));
      expect(device.deviceId).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0001',
        '#2 ' + "device.deviceName" + ' = ' + JSON.stringify(device.deviceName));
      expect(device.deviceName).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0001',
        '#3 ' + "device.macAddress" + ' = ' + JSON.stringify(device.macAddress));
      expect(device.macAddress).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0001',
        '#4 ' + "device.deviceType" + ' = ' + JSON.stringify(device.deviceType));
      expect(device.deviceType).assertEqual(BluetoothDeviceType.UNKNOWN);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0001',
        '#5 ' + "device.connectionState" + ' = ' + JSON.stringify(device.connectionState));
      expect(device.connectionState).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0001',
        '#6 ' + "device.majorServices.length" + ' = ' + JSON.stringify(device.majorServices.length));
      expect(device.majorServices.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0001',
        '#7 ' + "device.supportedProfiles.length" + ' = ' + JSON.stringify(device.supportedProfiles.length));
      expect(device.supportedProfiles.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0001',
        '#8 ' + "device.rssi" + ' = ' + JSON.stringify(device.rssi));
      expect(device.rssi).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0001',
        '#9 ' + "device.bondState" + ' = ' + JSON.stringify(device.bondState));
      expect(device.bondState).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0001',
        '#10 ' + "device.lastConnectedTime" + ' = ' + JSON.stringify(device.lastConnectedTime));
      expect(device.lastConnectedTime).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0001',
        '#11 ' + "device.connectionCount" + ' = ' + JSON.stringify(device.connectionCount));
      expect(device.connectionCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0001',
        '#12 ' + "device.signalStrength" + ' = ' + JSON.stringify(device.signalStrength));
      expect(device.signalStrength).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0001',
        '#13 ' + "device.deviceClass" + ' = ' + JSON.stringify(device.deviceClass));
      expect(device.deviceClass).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0001',
        '#14 assert ' + "expect(device.isConnected()).assertFalse()");
      expect(device.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0001',
        '#15 assert ' + "expect(device.isBonded()).assertFalse()");
      expect(device.isBonded()).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0001', 'end');
    });

    /*
     * @tc.number: SUB_BT_DEVICE_MODEL_0200
     * @tc.name: testBluetoothDeviceModel0002
     * @tc.desc: Verify a device model built with identity arguments keeps its own empty capability lists.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testBluetoothDeviceModel0002', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0002', 'begin');
      const device: BluetoothDeviceModel = new BluetoothDeviceModel(
        DEVICE_ID, DEVICE_NAME, MAC_ADDRESS, BluetoothDeviceType.CLASSIC);
      const sibling: BluetoothDeviceModel = new BluetoothDeviceModel('other_id');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0002',
        '#1 ' + "device.deviceId" + ' = ' + JSON.stringify(device.deviceId));
      expect(device.deviceId).assertEqual(DEVICE_ID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0002',
        '#2 ' + "device.deviceName" + ' = ' + JSON.stringify(device.deviceName));
      expect(device.deviceName).assertEqual(DEVICE_NAME);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0002',
        '#3 ' + "device.macAddress" + ' = ' + JSON.stringify(device.macAddress));
      expect(device.macAddress).assertEqual(MAC_ADDRESS);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0002',
        '#4 ' + "device.deviceType" + ' = ' + JSON.stringify(device.deviceType));
      expect(device.deviceType).assertEqual(BluetoothDeviceType.CLASSIC);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0002',
        '#5 assert ' + "expect(device.getDeviceTypeLabel()).assertEqual('classic_bluetooth')");
      expect(device.getDeviceTypeLabel()).assertEqual('classic_bluetooth');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0002',
        '#6 ' + "sibling.deviceId" + ' = ' + JSON.stringify(sibling.deviceId));
      expect(sibling.deviceId).assertEqual('other_id');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0002',
        '#7 ' + "sibling.deviceName" + ' = ' + JSON.stringify(sibling.deviceName));
      expect(sibling.deviceName).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0002',
        '#8 ' + "sibling.deviceType" + ' = ' + JSON.stringify(sibling.deviceType));
      expect(sibling.deviceType).assertEqual(BluetoothDeviceType.UNKNOWN);

      device.addSupportedProfile(BluetoothProfileType.A2DP);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0002',
        '#9 ' + "device.supportedProfiles.length" + ' = ' + JSON.stringify(device.supportedProfiles.length));
      expect(device.supportedProfiles.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0002',
        '#10 ' + "sibling.supportedProfiles.length" + ' = ' + JSON.stringify(sibling.supportedProfiles.length));
      expect(sibling.supportedProfiles.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0002',
        '#11 ' + "sibling.majorServices.length" + ' = ' + JSON.stringify(sibling.majorServices.length));
      expect(sibling.majorServices.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0002',
        '#12 ' + "sibling.connectionCount" + ' = ' + JSON.stringify(sibling.connectionCount));
      expect(sibling.connectionCount).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0002', 'end');
    });

    // ==================== connection state and count number (3 cases) ====================

    /*
     * @tc.number: SUB_BT_DEVICE_MODEL_0300
     * @tc.name: testBluetoothDeviceModel0003
     * @tc.desc: Verify switching to the connected state stores the timestamp and raises the connection counter.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testBluetoothDeviceModel0003', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0003', 'begin');
      const device: BluetoothDeviceModel = new BluetoothDeviceModel(DEVICE_ID);
      const before: number = Date.now();

      device.updateConnectionState(BluetoothConnectionState.CONNECTED);
      const after: number = Date.now();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0003',
        '#1 ' + "device.connectionState" + ' = ' + JSON.stringify(device.connectionState));
      expect(device.connectionState).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0003',
        '#2 assert ' + "expect(device.isConnected()).assertTrue()");
      expect(device.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0003',
        '#3 ' + "device.connectionCount" + ' = ' + JSON.stringify(device.connectionCount));
      expect(device.connectionCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0003',
        '#4 ' + "device.lastConnectedTime >= before && device.lastConnectedTime <= after" + ' = ' +
        JSON.stringify(device.lastConnectedTime >= before && device.lastConnectedTime <= after));
      expect(device.lastConnectedTime >= before && device.lastConnectedTime <= after).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0003',
        '#5 ' + "device.rssi" + ' = ' + JSON.stringify(device.rssi));
      expect(device.rssi).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0003',
        '#6 ' + "device.bondState" + ' = ' + JSON.stringify(device.bondState));
      expect(device.bondState).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0003', 'end');
    });

    /*
     * @tc.number: SUB_BT_DEVICE_MODEL_0400
     * @tc.name: testBluetoothDeviceModel0004
     * @tc.desc: Verify transitional and failed states change the label without touching the connection counter.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testBluetoothDeviceModel0004', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0004', 'begin');
      const device: BluetoothDeviceModel = new BluetoothDeviceModel(DEVICE_ID);

      device.updateConnectionState(BluetoothConnectionState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0004',
        '#1 ' + "device.connectionState" + ' = ' + JSON.stringify(device.connectionState));
      expect(device.connectionState).assertEqual(BluetoothConnectionState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0004',
        '#2 assert ' + "expect(device.isConnected()).assertFalse()");
      expect(device.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0004',
        '#3 ' + "device.connectionCount" + ' = ' + JSON.stringify(device.connectionCount));
      expect(device.connectionCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0004',
        '#4 ' + "device.lastConnectedTime" + ' = ' + JSON.stringify(device.lastConnectedTime));
      expect(device.lastConnectedTime).assertEqual(0);

      device.updateConnectionState(BluetoothConnectionState.DISCONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0004',
        '#5 ' + "device.connectionCount" + ' = ' + JSON.stringify(device.connectionCount));
      expect(device.connectionCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0004',
        '#6 assert ' + "expect(device.getConnectionStateLabel()).assertEqual('disconnecting')");
      expect(device.getConnectionStateLabel()).assertEqual('disconnecting');

      device.updateConnectionState(BluetoothConnectionState.CONNECTION_FAILED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0004',
        '#7 assert ' + "expect(device.isConnected()).assertFalse()");
      expect(device.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0004',
        '#8 ' + "device.connectionCount" + ' = ' + JSON.stringify(device.connectionCount));
      expect(device.connectionCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0004',
        '#9 ' + "device.lastConnectedTime" + ' = ' + JSON.stringify(device.lastConnectedTime));
      expect(device.lastConnectedTime).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0004',
        '#10 assert ' + "expect(device.getConnectionStateLabel()).assertEqual('connection_failed')");
      expect(device.getConnectionStateLabel()).assertEqual('connection_failed');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0004', 'end');
    });

    /*
     * @tc.number: SUB_BT_DEVICE_MODEL_0500
     * @tc.name: testBluetoothDeviceModel0005
     * @tc.desc: Verify repeated connections accumulate the counter and keep the last timestamp non decreasing.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testBluetoothDeviceModel0005', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0005', 'begin');
      const device: BluetoothDeviceModel = new BluetoothDeviceModel(DEVICE_ID);

      device.updateConnectionState(BluetoothConnectionState.CONNECTED);
      const firstTime: number = device.lastConnectedTime;
      device.updateConnectionState(BluetoothConnectionState.DISCONNECTED);
      device.updateConnectionState(BluetoothConnectionState.CONNECTED);
      const secondTime: number = device.lastConnectedTime;
      device.updateConnectionState(BluetoothConnectionState.CONNECTED);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0005',
        '#1 ' + "device.connectionCount" + ' = ' + JSON.stringify(device.connectionCount));
      expect(device.connectionCount).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0005',
        '#2 assert ' + "expect(device.isConnected()).assertTrue()");
      expect(device.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0005',
        '#3 ' + "secondTime >= firstTime" + ' = ' + JSON.stringify(secondTime >= firstTime));
      expect(secondTime >= firstTime).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0005',
        '#4 ' + "device.lastConnectedTime >= secondTime" + ' = ' +
        JSON.stringify(device.lastConnectedTime >= secondTime));
      expect(device.lastConnectedTime >= secondTime).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0005',
        '#5 ' + "device.majorServices.length" + ' = ' + JSON.stringify(device.majorServices.length));
      expect(device.majorServices.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0005',
        '#6 ' + "device.supportedProfiles.length" + ' = ' + JSON.stringify(device.supportedProfiles.length));
      expect(device.supportedProfiles.length).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0005', 'end');
    });

    // ==================== pairing and capability set (3 cases) ====================

    /*
     * @tc.number: SUB_BT_DEVICE_MODEL_0600
     * @tc.name: testBluetoothDeviceModel0006
     * @tc.desc: Verify the bonding predicate is satisfied only by the bonded state value twelve.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testBluetoothDeviceModel0006', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0006', 'begin');
      const device: BluetoothDeviceModel = new BluetoothDeviceModel(DEVICE_ID);

      device.bondState = 0;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0006',
        '#1 assert ' + "expect(device.isBonded()).assertFalse()");
      expect(device.isBonded()).assertFalse();
      device.bondState = 11;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0006',
        '#2 assert ' + "expect(device.isBonded()).assertFalse()");
      expect(device.isBonded()).assertFalse();
      device.bondState = 13;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0006',
        '#3 assert ' + "expect(device.isBonded()).assertFalse()");
      expect(device.isBonded()).assertFalse();
      device.bondState = UNBONDED_VALUE;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0006',
        '#4 assert ' + "expect(device.isBonded()).assertFalse()");
      expect(device.isBonded()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0006',
        '#5 assert ' + "expect(device.isConnected()).assertFalse()");
      expect(device.isConnected()).assertFalse();

      device.bondState = BONDED_VALUE;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0006',
        '#6 assert ' + "expect(device.isBonded()).assertTrue()");
      expect(device.isBonded()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0006',
        '#7 ' + "device.connectionCount" + ' = ' + JSON.stringify(device.connectionCount));
      expect(device.connectionCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0006',
        '#8 assert ' + "expect(device.toJSON().bondState).assertEqual(BONDED_VALUE)");
      expect(device.toJSON().bondState).assertEqual(BONDED_VALUE);

      device.bondState = 0;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0006',
        '#9 assert ' + "expect(device.isBonded()).assertFalse()");
      expect(device.isBonded()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0006',
        '#10 assert ' + "expect(device.toJSON().bondState).assertEqual(0)");
      expect(device.toJSON().bondState).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0006', 'end');
    });

    /*
     * @tc.number: SUB_BT_DEVICE_MODEL_0700
     * @tc.name: testBluetoothDeviceModel0007
     * @tc.desc: Verify supported profiles are appended once and the support query follows the list content.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testBluetoothDeviceModel0007', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0007', 'begin');
      const device: BluetoothDeviceModel = new BluetoothDeviceModel(DEVICE_ID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0007',
        '#1 assert ' + "expect(device.supportsProfile(BluetoothProfileType.A2DP)).assertFalse()");
      expect(device.supportsProfile(BluetoothProfileType.A2DP)).assertFalse();

      device.addSupportedProfile(BluetoothProfileType.A2DP);
      device.addSupportedProfile(BluetoothProfileType.HFP);
      device.addSupportedProfile(BluetoothProfileType.A2DP);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0007',
        '#2 ' + "device.supportedProfiles.length" + ' = ' + JSON.stringify(device.supportedProfiles.length));
      expect(device.supportedProfiles.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0007',
        '#3 assert ' + "expect(countOf(device.supportedProfiles, BluetoothProfileType.A2DP)).assertEqual(1)");
      expect(countOf(device.supportedProfiles, BluetoothProfileType.A2DP)).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0007',
        '#4 assert ' + "expect(countOf(device.supportedProfiles, BluetoothProfileType.HFP)).assertEqual(1)");
      expect(countOf(device.supportedProfiles, BluetoothProfileType.HFP)).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0007',
        '#5 assert ' + "expect(device.supportsProfile(BluetoothProfileType.A2DP)).assertTrue()");
      expect(device.supportsProfile(BluetoothProfileType.A2DP)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0007',
        '#6 assert ' + "expect(device.supportsProfile(BluetoothProfileType.HFP)).assertTrue()");
      expect(device.supportsProfile(BluetoothProfileType.HFP)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0007',
        '#7 assert ' + "expect(device.supportsProfile(BluetoothProfileType.HID)).assertFalse()");
      expect(device.supportsProfile(BluetoothProfileType.HID)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0007',
        '#8 assert ' + "expect(device.supportsProfile(BluetoothProfileType.AVRCP)).assertFalse()");
      expect(device.supportsProfile(BluetoothProfileType.AVRCP)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0007',
        '#9 ' + "device.majorServices.length" + ' = ' + JSON.stringify(device.majorServices.length));
      expect(device.majorServices.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0007',
        '#10 assert ' + "expect(device.toJSON().supportedProfiles.length).assertEqual(2)");
      expect(device.toJSON().supportedProfiles.length).assertEqual(2);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0007', 'end');
    });

    /*
     * @tc.number: SUB_BT_DEVICE_MODEL_0800
     * @tc.name: testBluetoothDeviceModel0008
     * @tc.desc: Verify major services are de duplicated while the insertion order is preserved.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testBluetoothDeviceModel0008', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0008', 'begin');
      const device: BluetoothDeviceModel = new BluetoothDeviceModel(DEVICE_ID);

      device.addMajorService(BluetoothMajorService.AUDIO);
      device.addMajorService(BluetoothMajorService.TELEPHONY);
      device.addMajorService(BluetoothMajorService.AUDIO);
      device.addMajorService(BluetoothMajorService.NETWORK);
      device.addMajorService(BluetoothMajorService.TELEPHONY);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0008',
        '#1 ' + "device.majorServices.length" + ' = ' + JSON.stringify(device.majorServices.length));
      expect(device.majorServices.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0008',
        '#2 ' + "device.majorServices[0]" + ' = ' + JSON.stringify(device.majorServices[0]));
      expect(device.majorServices[0]).assertEqual(BluetoothMajorService.AUDIO);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0008',
        '#3 ' + "device.majorServices[1]" + ' = ' + JSON.stringify(device.majorServices[1]));
      expect(device.majorServices[1]).assertEqual(BluetoothMajorService.TELEPHONY);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0008',
        '#4 ' + "device.majorServices[2]" + ' = ' + JSON.stringify(device.majorServices[2]));
      expect(device.majorServices[2]).assertEqual(BluetoothMajorService.NETWORK);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0008',
        '#5 assert ' + "expect(countOf(device.majorServices, BluetoothMajorService.HEALTH)).assertEqual(0)");
      expect(countOf(device.majorServices, BluetoothMajorService.HEALTH)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0008',
        '#6 ' + "device.supportedProfiles.length" + ' = ' + JSON.stringify(device.supportedProfiles.length));
      expect(device.supportedProfiles.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0008',
        '#7 ' + "device.connectionState" + ' = ' + JSON.stringify(device.connectionState));
      expect(device.connectionState).assertEqual(BluetoothConnectionState.DISCONNECTED);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0008', 'end');
    });

    // ==================== signal strength conversion (2 cases) ====================

    /*
     * @tc.number: SUB_BT_DEVICE_MODEL_0900
     * @tc.name: testBluetoothDeviceModel0009
     * @tc.desc: Verify the received signal value is clamped at both ends and mapped linearly in between.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testBluetoothDeviceModel0009', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0009', 'begin');
      const device: BluetoothDeviceModel = new BluetoothDeviceModel(DEVICE_ID);

      device.updateRssi(-110);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0009',
        '#1 ' + "device.rssi" + ' = ' + JSON.stringify(device.rssi));
      expect(device.rssi).assertEqual(-110);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0009',
        '#2 ' + "device.signalStrength" + ' = ' + JSON.stringify(device.signalStrength));
      expect(device.signalStrength).assertEqual(0);

      device.updateRssi(-100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0009',
        '#3 ' + "device.signalStrength" + ' = ' + JSON.stringify(device.signalStrength));
      expect(device.signalStrength).assertEqual(0);

      device.updateRssi(-30);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0009',
        '#4 ' + "device.signalStrength" + ' = ' + JSON.stringify(device.signalStrength));
      expect(device.signalStrength).assertEqual(100);

      device.updateRssi(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0009',
        '#5 ' + "device.rssi" + ' = ' + JSON.stringify(device.rssi));
      expect(device.rssi).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0009',
        '#6 ' + "device.signalStrength" + ' = ' + JSON.stringify(device.signalStrength));
      expect(device.signalStrength).assertEqual(100);

      device.updateRssi(-50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0009',
        '#7 ' + "device.signalStrength" + ' = ' + JSON.stringify(device.signalStrength));
      expect(device.signalStrength).assertEqual(71);

      device.updateRssi(-70);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0009',
        '#8 ' + "device.signalStrength" + ' = ' + JSON.stringify(device.signalStrength));
      expect(device.signalStrength).assertEqual(43);

      device.updateRssi(-85);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0009',
        '#9 ' + "device.signalStrength" + ' = ' + JSON.stringify(device.signalStrength));
      expect(device.signalStrength).assertEqual(21);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0009',
        '#10 ' + "device.connectionCount" + ' = ' + JSON.stringify(device.connectionCount));
      expect(device.connectionCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0009',
        '#11 assert ' + "expect(device.isConnected()).assertFalse()");
      expect(device.isConnected()).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0009', 'end');
    });

    /*
     * @tc.number: SUB_BT_DEVICE_MODEL_1000
     * @tc.name: testBluetoothDeviceModel0010
     * @tc.desc: Verify each signal level boundary switches exactly at the documented percentage thresholds.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testBluetoothDeviceModel0010', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0010', 'begin');
      const device: BluetoothDeviceModel = new BluetoothDeviceModel(DEVICE_ID);

      device.updateRssi(-44);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0010',
        '#1 ' + "device.signalStrength" + ' = ' + JSON.stringify(device.signalStrength));
      expect(device.signalStrength).assertEqual(80);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0010',
        '#2 assert ' + "expect(device.getSignalLevel()).assertEqual('excellent')");
      expect(device.getSignalLevel()).assertEqual('excellent');

      device.updateRssi(-45);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0010',
        '#3 ' + "device.signalStrength" + ' = ' + JSON.stringify(device.signalStrength));
      expect(device.signalStrength).assertEqual(79);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0010',
        '#4 assert ' + "expect(device.getSignalLevel()).assertEqual('good')");
      expect(device.getSignalLevel()).assertEqual('good');

      device.updateRssi(-58);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0010',
        '#5 ' + "device.signalStrength" + ' = ' + JSON.stringify(device.signalStrength));
      expect(device.signalStrength).assertEqual(60);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0010',
        '#6 assert ' + "expect(device.getSignalLevel()).assertEqual('good')");
      expect(device.getSignalLevel()).assertEqual('good');

      device.updateRssi(-59);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0010',
        '#7 ' + "device.signalStrength" + ' = ' + JSON.stringify(device.signalStrength));
      expect(device.signalStrength).assertEqual(59);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0010',
        '#8 assert ' + "expect(device.getSignalLevel()).assertEqual('fair')");
      expect(device.getSignalLevel()).assertEqual('fair');

      device.updateRssi(-72);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0010',
        '#9 ' + "device.signalStrength" + ' = ' + JSON.stringify(device.signalStrength));
      expect(device.signalStrength).assertEqual(40);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0010',
        '#10 assert ' + "expect(device.getSignalLevel()).assertEqual('fair')");
      expect(device.getSignalLevel()).assertEqual('fair');

      device.updateRssi(-86);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0010',
        '#11 ' + "device.signalStrength" + ' = ' + JSON.stringify(device.signalStrength));
      expect(device.signalStrength).assertEqual(20);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0010',
        '#12 assert ' + "expect(device.getSignalLevel()).assertEqual('weak')");
      expect(device.getSignalLevel()).assertEqual('weak');

      device.updateRssi(-100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0010',
        '#13 ' + "device.signalStrength" + ' = ' + JSON.stringify(device.signalStrength));
      expect(device.signalStrength).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0010',
        '#14 assert ' + "expect(device.getSignalLevel()).assertEqual('very_weak')");
      expect(device.getSignalLevel()).assertEqual('very_weak');

      const fresh: BluetoothDeviceModel = new BluetoothDeviceModel('fresh_device');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0010',
        '#15 ' + "fresh.signalStrength" + ' = ' + JSON.stringify(fresh.signalStrength));
      expect(fresh.signalStrength).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0010',
        '#16 assert ' + "expect(fresh.getSignalLevel()).assertEqual('very_weak')");
      expect(fresh.getSignalLevel()).assertEqual('very_weak');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0010', 'end');
    });

    // ==================== text label (3 cases) ====================

    /*
     * @tc.number: SUB_BT_DEVICE_MODEL_1100
     * @tc.name: testBluetoothDeviceModel0011
     * @tc.desc: Verify every device type maps to its own readable label.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testBluetoothDeviceModel0011', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0011', 'begin');
      const classic: BluetoothDeviceModel = new BluetoothDeviceModel(
        DEVICE_ID, DEVICE_NAME, MAC_ADDRESS, BluetoothDeviceType.CLASSIC);
      const ble: BluetoothDeviceModel = new BluetoothDeviceModel(
        DEVICE_ID, DEVICE_NAME, MAC_ADDRESS, BluetoothDeviceType.BLE);
      const dual: BluetoothDeviceModel = new BluetoothDeviceModel(
        DEVICE_ID, DEVICE_NAME, MAC_ADDRESS, BluetoothDeviceType.DUAL_MODE);
      const unknown: BluetoothDeviceModel = new BluetoothDeviceModel(
        DEVICE_ID, DEVICE_NAME, MAC_ADDRESS, BluetoothDeviceType.UNKNOWN);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0011',
        '#1 assert ' + "expect(classic.getDeviceTypeLabel()).assertEqual('classic_bluetooth')");
      expect(classic.getDeviceTypeLabel()).assertEqual('classic_bluetooth');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0011',
        '#2 assert ' + "expect(ble.getDeviceTypeLabel()).assertEqual('ble')");
      expect(ble.getDeviceTypeLabel()).assertEqual('ble');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0011',
        '#3 assert ' + "expect(dual.getDeviceTypeLabel()).assertEqual('dual_mode')");
      expect(dual.getDeviceTypeLabel()).assertEqual('dual_mode');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0011',
        '#4 assert ' + "expect(unknown.getDeviceTypeLabel()).assertEqual('unknown')");
      expect(unknown.getDeviceTypeLabel()).assertEqual('unknown');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0011',
        '#5 ' + "ble.deviceType" + ' = ' + JSON.stringify(ble.deviceType));
      expect(ble.deviceType).assertEqual(BluetoothDeviceType.BLE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0011',
        '#6 ' + "dual.deviceType" + ' = ' + JSON.stringify(dual.deviceType));
      expect(dual.deviceType).assertEqual(BluetoothDeviceType.DUAL_MODE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0011',
        '#7 assert ' + "expect(ble.getDeviceTypeLabel() === classic.getDeviceTypeLabel()).assertFalse()");
      expect(ble.getDeviceTypeLabel() === classic.getDeviceTypeLabel()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0011',
        '#8 assert ' + "expect(unknown.getDeviceTypeLabel() === dual.getDeviceTypeLabel()).assertFalse()");
      expect(unknown.getDeviceTypeLabel() === dual.getDeviceTypeLabel()).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0011', 'end');
    });

    /*
     * @tc.number: SUB_BT_DEVICE_MODEL_1200
     * @tc.name: testBluetoothDeviceModel0012
     * @tc.desc: Verify all defined connection states resolve to a concrete label instead of the fallback text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testBluetoothDeviceModel0012', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0012', 'begin');
      const device: BluetoothDeviceModel = new BluetoothDeviceModel(DEVICE_ID);
      const states: BluetoothConnectionState[] = [
        BluetoothConnectionState.DISCONNECTED,
        BluetoothConnectionState.CONNECTING,
        BluetoothConnectionState.CONNECTED,
        BluetoothConnectionState.DISCONNECTING,
        BluetoothConnectionState.CONNECTION_FAILED,
        BluetoothConnectionState.CONNECTION_TIMEOUT
      ];
      const labels: string[] = [];
      let fallbackCount: number = 0;

      for (let i = 0; i < states.length; i++) {
        device.updateConnectionState(states[i]);
        const label: string = device.getConnectionStateLabel();
        labels.push(label);
        if (label === 'unknown_state') {
          fallbackCount += 1;
        }
      }

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0012',
        '#1 ' + "labels[0]" + ' = ' + JSON.stringify(labels[0]));
      expect(labels[0]).assertEqual('disconnected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0012',
        '#2 ' + "labels[1]" + ' = ' + JSON.stringify(labels[1]));
      expect(labels[1]).assertEqual('connecting');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0012',
        '#3 ' + "labels[2]" + ' = ' + JSON.stringify(labels[2]));
      expect(labels[2]).assertEqual('connected');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0012',
        '#4 ' + "labels[3]" + ' = ' + JSON.stringify(labels[3]));
      expect(labels[3]).assertEqual('disconnecting');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0012',
        '#5 ' + "labels[4]" + ' = ' + JSON.stringify(labels[4]));
      expect(labels[4]).assertEqual('connection_failed');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0012',
        '#6 ' + "labels[5]" + ' = ' + JSON.stringify(labels[5]));
      expect(labels[5]).assertEqual('connection_timeout');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0012',
        '#7 ' + "fallbackCount" + ' = ' + JSON.stringify(fallbackCount));
      expect(fallbackCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0012',
        '#8 assert ' + "expect(countOf(labels, 'connected')).assertEqual(1)");
      expect(countOf(labels, 'connected')).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0012',
        '#9 ' + "device.connectionState" + ' = ' + JSON.stringify(device.connectionState));
      expect(device.connectionState).assertEqual(BluetoothConnectionState.CONNECTION_TIMEOUT);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0012',
        '#10 assert ' + "expect(device.isConnected()).assertFalse()");
      expect(device.isConnected()).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0012', 'end');
    });

    /*
     * @tc.number: SUB_BT_DEVICE_MODEL_1300
     * @tc.name: testBluetoothDeviceModel0013
     * @tc.desc: Verify the readable description carries identity fields and reflects only the state of one instance.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testBluetoothDeviceModel0013', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0013', 'begin');
      const device: BluetoothDeviceModel = new BluetoothDeviceModel(
        DEVICE_ID, DEVICE_NAME, MAC_ADDRESS, BluetoothDeviceType.BLE);
      const sibling: BluetoothDeviceModel = new BluetoothDeviceModel(
        'other_id', 'Other', '11:22:33:44:55:FF', BluetoothDeviceType.CLASSIC);

      const initial: string = device.toString();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0013',
        '#1 assert ' +
        "expect(initial.indexOf('BluetoothDeviceModel[id=' + DEVICE_ID + ', name=' + DEVICE_NAME)).assertEqual(0)");
      expect(initial.indexOf('BluetoothDeviceModel[id=' + DEVICE_ID + ', name=' + DEVICE_NAME)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0013',
        '#2 assert ' + "expect(initial.indexOf('mac=' + MAC_ADDRESS)).assertLarger(0)");
      expect(initial.indexOf('mac=' + MAC_ADDRESS)).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0013',
        '#3 assert ' + "expect(initial.indexOf('type=ble')).assertLarger(0)");
      expect(initial.indexOf('type=ble')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0013',
        '#4 assert ' + "expect(initial.indexOf('state=disconnected')).assertLarger(0)");
      expect(initial.indexOf('state=disconnected')).assertLarger(0);

      device.updateConnectionState(BluetoothConnectionState.CONNECTED);
      const updated: string = device.toString();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0013',
        '#5 assert ' + "expect(updated.indexOf('state=connected')).assertLarger(0)");
      expect(updated.indexOf('state=connected')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0013',
        '#6 assert ' + "expect(updated.indexOf('disconnected')).assertEqual(-1)");
      expect(updated.indexOf('disconnected')).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0013',
        '#7 assert ' + "expect(updated.indexOf('type=ble')).assertLarger(0)");
      expect(updated.indexOf('type=ble')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0013',
        '#8 ' + "updated.length" + ' = ' + JSON.stringify(updated.length));
      expect(updated.length).assertEqual(initial.length - 3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0013',
        '#9 assert ' + "expect(sibling.toString().indexOf('state=disconnected')).assertLarger(0)");
      expect(sibling.toString().indexOf('state=disconnected')).assertLarger(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0013',
        '#10 assert ' + "expect(sibling.toString().indexOf(DEVICE_ID)).assertEqual(-1)");
      expect(sibling.toString().indexOf(DEVICE_ID)).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0013',
        '#11 assert ' + "expect(sibling.isConnected()).assertFalse()");
      expect(sibling.isConnected()).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0013', 'end');
    });

    // ==================== serialize and reset (2 cases) ====================

    /*
     * @tc.number: SUB_BT_DEVICE_MODEL_1400
     * @tc.name: testBluetoothDeviceModel0014
     * @tc.desc: Verify the serialized snapshot mirrors every instance field and shares the capability lists.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testBluetoothDeviceModel0014', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0014', 'begin');
      const device: BluetoothDeviceModel = new BluetoothDeviceModel(
        DEVICE_ID, DEVICE_NAME, MAC_ADDRESS, BluetoothDeviceType.DUAL_MODE);
      device.deviceClass = 2360;
      device.bondState = BONDED_VALUE;
      device.addSupportedProfile(BluetoothProfileType.HFP);
      device.addMajorService(BluetoothMajorService.TELEPHONY);
      device.updateRssi(-60);
      device.updateConnectionState(BluetoothConnectionState.CONNECTED);

      const json: BluetoothDeviceJson = device.toJSON();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0014',
        '#1 ' + "json.deviceId" + ' = ' + JSON.stringify(json.deviceId));
      expect(json.deviceId).assertEqual(DEVICE_ID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0014',
        '#2 ' + "json.deviceName" + ' = ' + JSON.stringify(json.deviceName));
      expect(json.deviceName).assertEqual(DEVICE_NAME);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0014',
        '#3 ' + "json.macAddress" + ' = ' + JSON.stringify(json.macAddress));
      expect(json.macAddress).assertEqual(MAC_ADDRESS);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0014',
        '#4 ' + "json.deviceType" + ' = ' + JSON.stringify(json.deviceType));
      expect(json.deviceType).assertEqual(BluetoothDeviceType.DUAL_MODE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0014',
        '#5 ' + "json.connectionState" + ' = ' + JSON.stringify(json.connectionState));
      expect(json.connectionState).assertEqual(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0014',
        '#6 ' + "json.rssi" + ' = ' + JSON.stringify(json.rssi));
      expect(json.rssi).assertEqual(-60);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0014',
        '#7 ' + "json.signalStrength" + ' = ' + JSON.stringify(json.signalStrength));
      expect(json.signalStrength).assertEqual(57);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0014',
        '#8 ' + "json.bondState" + ' = ' + JSON.stringify(json.bondState));
      expect(json.bondState).assertEqual(BONDED_VALUE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0014',
        '#9 ' + "json.deviceClass" + ' = ' + JSON.stringify(json.deviceClass));
      expect(json.deviceClass).assertEqual(2360);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0014',
        '#10 ' + "json.connectionCount" + ' = ' + JSON.stringify(json.connectionCount));
      expect(json.connectionCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0014',
        '#11 ' + "json.lastConnectedTime > 0" + ' = ' + JSON.stringify(json.lastConnectedTime > 0));
      expect(json.lastConnectedTime > 0).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0014',
        '#12 ' + "json.supportedProfiles.length" + ' = ' + JSON.stringify(json.supportedProfiles.length));
      expect(json.supportedProfiles.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0014',
        '#13 ' + "json.majorServices[0]" + ' = ' + JSON.stringify(json.majorServices[0]));
      expect(json.majorServices[0]).assertEqual(BluetoothMajorService.TELEPHONY);

      device.addSupportedProfile(BluetoothProfileType.PAN);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0014',
        '#14 ' + "json.supportedProfiles.length" + ' = ' + JSON.stringify(json.supportedProfiles.length));
      expect(json.supportedProfiles.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0014',
        '#15 ' + "device.supportedProfiles.length" + ' = ' + JSON.stringify(device.supportedProfiles.length));
      expect(device.supportedProfiles.length).assertEqual(2);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0014', 'end');
    });

    /*
     * @tc.number: SUB_BT_DEVICE_MODEL_1500
     * @tc.name: testBluetoothDeviceModel0015
     * @tc.desc: Verify reset drops the connection and signal state while identity and capabilities survive.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testBluetoothDeviceModel0015', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0015', 'begin');
      const device: BluetoothDeviceModel = new BluetoothDeviceModel(
        DEVICE_ID, DEVICE_NAME, MAC_ADDRESS, BluetoothDeviceType.CLASSIC);
      device.addSupportedProfile(BluetoothProfileType.A2DP);
      device.addMajorService(BluetoothMajorService.AUDIO);
      device.updateRssi(-40);
      device.updateConnectionState(BluetoothConnectionState.CONNECTED);
      device.bondState = BONDED_VALUE;
      device.deviceClass = 5;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0015',
        '#1 ' + "device.connectionCount" + ' = ' + JSON.stringify(device.connectionCount));
      expect(device.connectionCount).assertEqual(1);

      device.reset();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0015',
        '#2 ' + "device.connectionState" + ' = ' + JSON.stringify(device.connectionState));
      expect(device.connectionState).assertEqual(BluetoothConnectionState.DISCONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0015',
        '#3 assert ' + "expect(device.isConnected()).assertFalse()");
      expect(device.isConnected()).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0015',
        '#4 ' + "device.rssi" + ' = ' + JSON.stringify(device.rssi));
      expect(device.rssi).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0015',
        '#5 ' + "device.signalStrength" + ' = ' + JSON.stringify(device.signalStrength));
      expect(device.signalStrength).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0015',
        '#6 assert ' + "expect(device.getSignalLevel()).assertEqual('very_weak')");
      expect(device.getSignalLevel()).assertEqual('very_weak');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0015',
        '#7 ' + "device.lastConnectedTime" + ' = ' + JSON.stringify(device.lastConnectedTime));
      expect(device.lastConnectedTime).assertEqual(0);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0015',
        '#8 ' + "device.deviceId" + ' = ' + JSON.stringify(device.deviceId));
      expect(device.deviceId).assertEqual(DEVICE_ID);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0015',
        '#9 ' + "device.deviceName" + ' = ' + JSON.stringify(device.deviceName));
      expect(device.deviceName).assertEqual(DEVICE_NAME);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0015',
        '#10 ' + "device.macAddress" + ' = ' + JSON.stringify(device.macAddress));
      expect(device.macAddress).assertEqual(MAC_ADDRESS);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0015',
        '#11 ' + "device.deviceType" + ' = ' + JSON.stringify(device.deviceType));
      expect(device.deviceType).assertEqual(BluetoothDeviceType.CLASSIC);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0015',
        '#12 ' + "device.connectionCount" + ' = ' + JSON.stringify(device.connectionCount));
      expect(device.connectionCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0015',
        '#13 ' + "device.bondState" + ' = ' + JSON.stringify(device.bondState));
      expect(device.bondState).assertEqual(BONDED_VALUE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0015',
        '#14 assert ' + "expect(device.isBonded()).assertTrue()");
      expect(device.isBonded()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0015',
        '#15 ' + "device.deviceClass" + ' = ' + JSON.stringify(device.deviceClass));
      expect(device.deviceClass).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0015',
        '#16 ' + "device.supportedProfiles.length" + ' = ' + JSON.stringify(device.supportedProfiles.length));
      expect(device.supportedProfiles.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0015',
        '#17 ' + "device.majorServices.length" + ' = ' + JSON.stringify(device.majorServices.length));
      expect(device.majorServices.length).assertEqual(1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0015', 'end');
    });

    /*
     * @tc.number: SUB_BT_DEVICE_MODEL_1600
     * @tc.name: testBluetoothDeviceModel0016
     * @tc.desc: Verify a full discovery to bonding to connection lifecycle keeps every derived value consistent.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testBluetoothDeviceModel0016', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0016', 'begin');
      const device: BluetoothDeviceModel = new BluetoothDeviceModel(
        DEVICE_ID, DEVICE_NAME, MAC_ADDRESS, BluetoothDeviceType.CLASSIC);

      device.updateRssi(-75);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0016',
        '#1 assert ' + "expect(device.getSignalLevel()).assertEqual('weak')");
      expect(device.getSignalLevel()).assertEqual('weak');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0016',
        '#2 ' + "device.signalStrength" + ' = ' + JSON.stringify(device.signalStrength));
      expect(device.signalStrength).assertEqual(36);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0016',
        '#3 assert ' + "expect(device.isConnected()).assertFalse()");
      expect(device.isConnected()).assertFalse();

      device.addSupportedProfile(BluetoothProfileType.A2DP);
      device.addSupportedProfile(BluetoothProfileType.HFP);
      device.addSupportedProfile(BluetoothProfileType.AVRCP);
      device.addMajorService(BluetoothMajorService.AUDIO);
      device.addMajorService(BluetoothMajorService.TELEPHONY);
      device.bondState = BONDED_VALUE;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0016',
        '#4 assert ' + "expect(device.isBonded()).assertTrue()");
      expect(device.isBonded()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0016',
        '#5 ' + "device.supportedProfiles.length" + ' = ' + JSON.stringify(device.supportedProfiles.length));
      expect(device.supportedProfiles.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0016',
        '#6 ' + "device.majorServices.length" + ' = ' + JSON.stringify(device.majorServices.length));
      expect(device.majorServices.length).assertEqual(2);

      device.updateConnectionState(BluetoothConnectionState.CONNECTING);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0016',
        '#7 assert ' + "expect(device.getConnectionStateLabel()).assertEqual('connecting')");
      expect(device.getConnectionStateLabel()).assertEqual('connecting');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0016',
        '#8 ' + "device.connectionCount" + ' = ' + JSON.stringify(device.connectionCount));
      expect(device.connectionCount).assertEqual(0);

      device.updateRssi(-50);
      device.updateConnectionState(BluetoothConnectionState.CONNECTED);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0016',
        '#9 assert ' + "expect(device.isConnected()).assertTrue()");
      expect(device.isConnected()).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0016',
        '#10 ' + "device.connectionCount" + ' = ' + JSON.stringify(device.connectionCount));
      expect(device.connectionCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0016',
        '#11 ' + "device.signalStrength" + ' = ' + JSON.stringify(device.signalStrength));
      expect(device.signalStrength).assertEqual(71);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0016',
        '#12 assert ' + "expect(device.getSignalLevel()).assertEqual('good')");
      expect(device.getSignalLevel()).assertEqual('good');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0016',
        '#13 ' + "device.lastConnectedTime > 0" + ' = ' + JSON.stringify(device.lastConnectedTime > 0));
      expect(device.lastConnectedTime > 0).assertTrue();

      const snapshot: BluetoothDeviceJson = device.toJSON();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0016',
        '#14 ' + "snapshot.supportedProfiles.length" + ' = ' + JSON.stringify(snapshot.supportedProfiles.length));
      expect(snapshot.supportedProfiles.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0016',
        '#15 ' + "snapshot.connectionCount" + ' = ' + JSON.stringify(snapshot.connectionCount));
      expect(snapshot.connectionCount).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0016',
        '#16 ' + "snapshot.connectionState" + ' = ' + JSON.stringify(snapshot.connectionState));
      expect(snapshot.connectionState).assertEqual(BluetoothConnectionState.CONNECTED);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testBluetoothDeviceModel0016', 'end');
    });
  });
}
