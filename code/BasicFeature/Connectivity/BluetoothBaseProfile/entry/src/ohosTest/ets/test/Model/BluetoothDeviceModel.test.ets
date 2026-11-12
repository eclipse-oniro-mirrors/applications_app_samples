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
      const device = new BluetoothDeviceModel();

      expect(device.deviceId).assertEqual('');
      expect(device.deviceName).assertEqual('');
      expect(device.macAddress).assertEqual('');
      expect(device.deviceType).assertEqual(BluetoothDeviceType.UNKNOWN);
      expect(device.connectionState).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(device.majorServices.length).assertEqual(0);
      expect(device.supportedProfiles.length).assertEqual(0);
      expect(device.rssi).assertEqual(0);
      expect(device.bondState).assertEqual(0);
      expect(device.lastConnectedTime).assertEqual(0);
      expect(device.connectionCount).assertEqual(0);
      expect(device.signalStrength).assertEqual(0);
      expect(device.deviceClass).assertEqual(0);
      expect(device.isConnected()).assertFalse();
      expect(device.isBonded()).assertFalse();
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
      const device = new BluetoothDeviceModel(DEVICE_ID, DEVICE_NAME, MAC_ADDRESS, BluetoothDeviceType.CLASSIC);
      const sibling = new BluetoothDeviceModel('other_id');

      expect(device.deviceId).assertEqual(DEVICE_ID);
      expect(device.deviceName).assertEqual(DEVICE_NAME);
      expect(device.macAddress).assertEqual(MAC_ADDRESS);
      expect(device.deviceType).assertEqual(BluetoothDeviceType.CLASSIC);
      expect(device.getDeviceTypeLabel()).assertEqual('classic_bluetooth');
      expect(sibling.deviceId).assertEqual('other_id');
      expect(sibling.deviceName).assertEqual('');
      expect(sibling.deviceType).assertEqual(BluetoothDeviceType.UNKNOWN);

      device.addSupportedProfile(BluetoothProfileType.A2DP);
      expect(device.supportedProfiles.length).assertEqual(1);
      expect(sibling.supportedProfiles.length).assertEqual(0);
      expect(sibling.majorServices.length).assertEqual(0);
      expect(sibling.connectionCount).assertEqual(0);
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
      const device = new BluetoothDeviceModel(DEVICE_ID);
      const before: number = Date.now();

      device.updateConnectionState(BluetoothConnectionState.CONNECTED);
      const after: number = Date.now();

      expect(device.connectionState).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(device.isConnected()).assertTrue();
      expect(device.connectionCount).assertEqual(1);
      expect(device.lastConnectedTime >= before && device.lastConnectedTime <= after).assertTrue();
      expect(device.rssi).assertEqual(0);
      expect(device.bondState).assertEqual(0);
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
      const device = new BluetoothDeviceModel(DEVICE_ID);

      device.updateConnectionState(BluetoothConnectionState.CONNECTING);
      expect(device.connectionState).assertEqual(BluetoothConnectionState.CONNECTING);
      expect(device.isConnected()).assertFalse();
      expect(device.connectionCount).assertEqual(0);
      expect(device.lastConnectedTime).assertEqual(0);

      device.updateConnectionState(BluetoothConnectionState.DISCONNECTING);
      expect(device.connectionCount).assertEqual(0);
      expect(device.getConnectionStateLabel()).assertEqual('disconnecting');

      device.updateConnectionState(BluetoothConnectionState.CONNECTION_FAILED);
      expect(device.isConnected()).assertFalse();
      expect(device.connectionCount).assertEqual(0);
      expect(device.lastConnectedTime).assertEqual(0);
      expect(device.getConnectionStateLabel()).assertEqual('connection_failed');
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
      const device = new BluetoothDeviceModel(DEVICE_ID);

      device.updateConnectionState(BluetoothConnectionState.CONNECTED);
      const firstTime: number = device.lastConnectedTime;
      device.updateConnectionState(BluetoothConnectionState.DISCONNECTED);
      device.updateConnectionState(BluetoothConnectionState.CONNECTED);
      const secondTime: number = device.lastConnectedTime;
      device.updateConnectionState(BluetoothConnectionState.CONNECTED);

      expect(device.connectionCount).assertEqual(3);
      expect(device.isConnected()).assertTrue();
      expect(secondTime >= firstTime).assertTrue();
      expect(device.lastConnectedTime >= secondTime).assertTrue();
      expect(device.majorServices.length).assertEqual(0);
      expect(device.supportedProfiles.length).assertEqual(0);
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
      const device = new BluetoothDeviceModel(DEVICE_ID);

      device.bondState = 0;
      expect(device.isBonded()).assertFalse();
      device.bondState = 11;
      expect(device.isBonded()).assertFalse();
      device.bondState = 13;
      expect(device.isBonded()).assertFalse();
      device.bondState = UNBONDED_VALUE;
      expect(device.isBonded()).assertFalse();
      expect(device.isConnected()).assertFalse();

      device.bondState = BONDED_VALUE;
      expect(device.isBonded()).assertTrue();
      expect(device.connectionCount).assertEqual(0);
      expect(device.toJSON().bondState).assertEqual(BONDED_VALUE);

      device.bondState = 0;
      expect(device.isBonded()).assertFalse();
      expect(device.toJSON().bondState).assertEqual(0);
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
      const device = new BluetoothDeviceModel(DEVICE_ID);
      expect(device.supportsProfile(BluetoothProfileType.A2DP)).assertFalse();

      device.addSupportedProfile(BluetoothProfileType.A2DP);
      device.addSupportedProfile(BluetoothProfileType.HFP);
      device.addSupportedProfile(BluetoothProfileType.A2DP);

      expect(device.supportedProfiles.length).assertEqual(2);
      expect(countOf(device.supportedProfiles, BluetoothProfileType.A2DP)).assertEqual(1);
      expect(countOf(device.supportedProfiles, BluetoothProfileType.HFP)).assertEqual(1);
      expect(device.supportsProfile(BluetoothProfileType.A2DP)).assertTrue();
      expect(device.supportsProfile(BluetoothProfileType.HFP)).assertTrue();
      expect(device.supportsProfile(BluetoothProfileType.HID)).assertFalse();
      expect(device.supportsProfile(BluetoothProfileType.AVRCP)).assertFalse();
      expect(device.majorServices.length).assertEqual(0);
      expect(device.toJSON().supportedProfiles.length).assertEqual(2);
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
      const device = new BluetoothDeviceModel(DEVICE_ID);

      device.addMajorService(BluetoothMajorService.AUDIO);
      device.addMajorService(BluetoothMajorService.TELEPHONY);
      device.addMajorService(BluetoothMajorService.AUDIO);
      device.addMajorService(BluetoothMajorService.NETWORK);
      device.addMajorService(BluetoothMajorService.TELEPHONY);

      expect(device.majorServices.length).assertEqual(3);
      expect(device.majorServices[0]).assertEqual(BluetoothMajorService.AUDIO);
      expect(device.majorServices[1]).assertEqual(BluetoothMajorService.TELEPHONY);
      expect(device.majorServices[2]).assertEqual(BluetoothMajorService.NETWORK);
      expect(countOf(device.majorServices, BluetoothMajorService.HEALTH)).assertEqual(0);
      expect(device.supportedProfiles.length).assertEqual(0);
      expect(device.connectionState).assertEqual(BluetoothConnectionState.DISCONNECTED);
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
      const device = new BluetoothDeviceModel(DEVICE_ID);

      device.updateRssi(-110);
      expect(device.rssi).assertEqual(-110);
      expect(device.signalStrength).assertEqual(0);

      device.updateRssi(-100);
      expect(device.signalStrength).assertEqual(0);

      device.updateRssi(-30);
      expect(device.signalStrength).assertEqual(100);

      device.updateRssi(0);
      expect(device.rssi).assertEqual(0);
      expect(device.signalStrength).assertEqual(100);

      device.updateRssi(-50);
      expect(device.signalStrength).assertEqual(71);

      device.updateRssi(-70);
      expect(device.signalStrength).assertEqual(43);

      device.updateRssi(-85);
      expect(device.signalStrength).assertEqual(21);
      expect(device.connectionCount).assertEqual(0);
      expect(device.isConnected()).assertFalse();
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
      const device = new BluetoothDeviceModel(DEVICE_ID);

      device.updateRssi(-44);
      expect(device.signalStrength).assertEqual(80);
      expect(device.getSignalLevel()).assertEqual('excellent');

      device.updateRssi(-45);
      expect(device.signalStrength).assertEqual(79);
      expect(device.getSignalLevel()).assertEqual('good');

      device.updateRssi(-58);
      expect(device.signalStrength).assertEqual(60);
      expect(device.getSignalLevel()).assertEqual('good');

      device.updateRssi(-59);
      expect(device.signalStrength).assertEqual(59);
      expect(device.getSignalLevel()).assertEqual('fair');

      device.updateRssi(-72);
      expect(device.signalStrength).assertEqual(40);
      expect(device.getSignalLevel()).assertEqual('fair');

      device.updateRssi(-86);
      expect(device.signalStrength).assertEqual(20);
      expect(device.getSignalLevel()).assertEqual('weak');

      device.updateRssi(-100);
      expect(device.signalStrength).assertEqual(0);
      expect(device.getSignalLevel()).assertEqual('very_weak');

      const fresh = new BluetoothDeviceModel('fresh_device');
      expect(fresh.signalStrength).assertEqual(0);
      expect(fresh.getSignalLevel()).assertEqual('very_weak');
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
      const classic = new BluetoothDeviceModel(DEVICE_ID, DEVICE_NAME, MAC_ADDRESS, BluetoothDeviceType.CLASSIC);
      const ble = new BluetoothDeviceModel(DEVICE_ID, DEVICE_NAME, MAC_ADDRESS, BluetoothDeviceType.BLE);
      const dual = new BluetoothDeviceModel(DEVICE_ID, DEVICE_NAME, MAC_ADDRESS, BluetoothDeviceType.DUAL_MODE);
      const unknown = new BluetoothDeviceModel(DEVICE_ID, DEVICE_NAME, MAC_ADDRESS, BluetoothDeviceType.UNKNOWN);

      expect(classic.getDeviceTypeLabel()).assertEqual('classic_bluetooth');
      expect(ble.getDeviceTypeLabel()).assertEqual('ble');
      expect(dual.getDeviceTypeLabel()).assertEqual('dual_mode');
      expect(unknown.getDeviceTypeLabel()).assertEqual('unknown');
      expect(ble.deviceType).assertEqual(BluetoothDeviceType.BLE);
      expect(dual.deviceType).assertEqual(BluetoothDeviceType.DUAL_MODE);
      expect(ble.getDeviceTypeLabel() === classic.getDeviceTypeLabel()).assertFalse();
      expect(unknown.getDeviceTypeLabel() === dual.getDeviceTypeLabel()).assertFalse();
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
      const device = new BluetoothDeviceModel(DEVICE_ID);
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

      expect(labels[0]).assertEqual('disconnected');
      expect(labels[1]).assertEqual('connecting');
      expect(labels[2]).assertEqual('connected');
      expect(labels[3]).assertEqual('disconnecting');
      expect(labels[4]).assertEqual('connection_failed');
      expect(labels[5]).assertEqual('connection_timeout');
      expect(fallbackCount).assertEqual(0);
      expect(countOf(labels, 'connected')).assertEqual(1);
      expect(device.connectionState).assertEqual(BluetoothConnectionState.CONNECTION_TIMEOUT);
      expect(device.isConnected()).assertFalse();
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
      const device = new BluetoothDeviceModel(DEVICE_ID, DEVICE_NAME, MAC_ADDRESS, BluetoothDeviceType.BLE);
      const sibling = new BluetoothDeviceModel('other_id', 'Other', '11:22:33:44:55:FF', BluetoothDeviceType.CLASSIC);

      const initial: string = device.toString();
      expect(initial.indexOf('BluetoothDeviceModel[id=' + DEVICE_ID + ', name=' + DEVICE_NAME)).assertEqual(0);
      expect(initial.indexOf('mac=' + MAC_ADDRESS)).assertLarger(0);
      expect(initial.indexOf('type=ble')).assertLarger(0);
      expect(initial.indexOf('state=disconnected')).assertLarger(0);

      device.updateConnectionState(BluetoothConnectionState.CONNECTED);
      const updated: string = device.toString();
      expect(updated.indexOf('state=connected')).assertLarger(0);
      expect(updated.indexOf('disconnected')).assertEqual(-1);
      expect(updated.indexOf('type=ble')).assertLarger(0);
      expect(updated.length).assertEqual(initial.length - 3);
      expect(sibling.toString().indexOf('state=disconnected')).assertLarger(0);
      expect(sibling.toString().indexOf(DEVICE_ID)).assertEqual(-1);
      expect(sibling.isConnected()).assertFalse();
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
      const device = new BluetoothDeviceModel(DEVICE_ID, DEVICE_NAME, MAC_ADDRESS, BluetoothDeviceType.DUAL_MODE);
      device.deviceClass = 2360;
      device.bondState = BONDED_VALUE;
      device.addSupportedProfile(BluetoothProfileType.HFP);
      device.addMajorService(BluetoothMajorService.TELEPHONY);
      device.updateRssi(-60);
      device.updateConnectionState(BluetoothConnectionState.CONNECTED);

      const json: BluetoothDeviceJson = device.toJSON();
      expect(json.deviceId).assertEqual(DEVICE_ID);
      expect(json.deviceName).assertEqual(DEVICE_NAME);
      expect(json.macAddress).assertEqual(MAC_ADDRESS);
      expect(json.deviceType).assertEqual(BluetoothDeviceType.DUAL_MODE);
      expect(json.connectionState).assertEqual(BluetoothConnectionState.CONNECTED);
      expect(json.rssi).assertEqual(-60);
      expect(json.signalStrength).assertEqual(57);
      expect(json.bondState).assertEqual(BONDED_VALUE);
      expect(json.deviceClass).assertEqual(2360);
      expect(json.connectionCount).assertEqual(1);
      expect(json.lastConnectedTime > 0).assertTrue();
      expect(json.supportedProfiles.length).assertEqual(1);
      expect(json.majorServices[0]).assertEqual(BluetoothMajorService.TELEPHONY);

      device.addSupportedProfile(BluetoothProfileType.PAN);
      expect(json.supportedProfiles.length).assertEqual(2);
      expect(device.supportedProfiles.length).assertEqual(2);
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
      const device = new BluetoothDeviceModel(DEVICE_ID, DEVICE_NAME, MAC_ADDRESS, BluetoothDeviceType.CLASSIC);
      device.addSupportedProfile(BluetoothProfileType.A2DP);
      device.addMajorService(BluetoothMajorService.AUDIO);
      device.updateRssi(-40);
      device.updateConnectionState(BluetoothConnectionState.CONNECTED);
      device.bondState = BONDED_VALUE;
      device.deviceClass = 5;
      expect(device.connectionCount).assertEqual(1);

      device.reset();

      expect(device.connectionState).assertEqual(BluetoothConnectionState.DISCONNECTED);
      expect(device.isConnected()).assertFalse();
      expect(device.rssi).assertEqual(0);
      expect(device.signalStrength).assertEqual(0);
      expect(device.getSignalLevel()).assertEqual('very_weak');
      expect(device.lastConnectedTime).assertEqual(0);

      expect(device.deviceId).assertEqual(DEVICE_ID);
      expect(device.deviceName).assertEqual(DEVICE_NAME);
      expect(device.macAddress).assertEqual(MAC_ADDRESS);
      expect(device.deviceType).assertEqual(BluetoothDeviceType.CLASSIC);
      expect(device.connectionCount).assertEqual(1);
      expect(device.bondState).assertEqual(BONDED_VALUE);
      expect(device.isBonded()).assertTrue();
      expect(device.deviceClass).assertEqual(5);
      expect(device.supportedProfiles.length).assertEqual(1);
      expect(device.majorServices.length).assertEqual(1);
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
      const device = new BluetoothDeviceModel(DEVICE_ID, DEVICE_NAME, MAC_ADDRESS, BluetoothDeviceType.CLASSIC);

      device.updateRssi(-75);
      expect(device.getSignalLevel()).assertEqual('weak');
      expect(device.signalStrength).assertEqual(36);
      expect(device.isConnected()).assertFalse();

      device.addSupportedProfile(BluetoothProfileType.A2DP);
      device.addSupportedProfile(BluetoothProfileType.HFP);
      device.addSupportedProfile(BluetoothProfileType.AVRCP);
      device.addMajorService(BluetoothMajorService.AUDIO);
      device.addMajorService(BluetoothMajorService.TELEPHONY);
      device.bondState = BONDED_VALUE;
      expect(device.isBonded()).assertTrue();
      expect(device.supportedProfiles.length).assertEqual(3);
      expect(device.majorServices.length).assertEqual(2);

      device.updateConnectionState(BluetoothConnectionState.CONNECTING);
      expect(device.getConnectionStateLabel()).assertEqual('connecting');
      expect(device.connectionCount).assertEqual(0);

      device.updateRssi(-50);
      device.updateConnectionState(BluetoothConnectionState.CONNECTED);
      expect(device.isConnected()).assertTrue();
      expect(device.connectionCount).assertEqual(1);
      expect(device.signalStrength).assertEqual(71);
      expect(device.getSignalLevel()).assertEqual('good');
      expect(device.lastConnectedTime > 0).assertTrue();

      const snapshot: BluetoothDeviceJson = device.toJSON();
      expect(snapshot.supportedProfiles.length).assertEqual(3);
      expect(snapshot.connectionCount).assertEqual(1);
      expect(snapshot.connectionState).assertEqual(BluetoothConnectionState.CONNECTED);
    });
  });
}
