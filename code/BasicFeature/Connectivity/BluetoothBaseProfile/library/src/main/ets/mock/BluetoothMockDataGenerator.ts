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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { BluetoothConstants, BluetoothProfileType, BluetoothConnectionState } from '../constants/BluetoothConstants';
import { BluetoothDeviceModel, BluetoothDeviceType, BluetoothMajorService } from '../model/BluetoothDeviceModel';

const TAG: string = BluetoothConstants.TAG;
const DOMAIN: number = BluetoothConstants.DOMAIN;

/**
 * Bluetooth mock data generator.
 * provides generation of mock Bluetooth device data capability, used for at without real devices time progress row test
 * try and render display.
 */
export class BluetoothMockDataGenerator {
  /** device name prefix list table */
  private static readonly DEVICE_PREFIXES: string[] = [
    'BT-Speaker', 'BT-Headphone', 'BT-Keyboard', 'BT-Mouse', 'BT-Watch',
    'BT-Health', 'BT-Car', 'BT-Phone', 'BT-Headset', 'BT-Gamepad',
    'BT-Monitor', 'BT-Printer', 'BT-Camera', 'BT-Scale', 'BT-Thermostat'
  ];

  /** control build vendor list table */
  private static readonly MANUFACTURERS: string[] = [
    'Sony', 'Bose', 'Samsung', 'Apple', 'JBL', 'Logitech',
    'Microsoft', 'DemoVendor', 'Xiaomi', 'Sennheiser', 'Garmin',
    'Fitbit', 'Beats', 'Anker', 'Plantronics'
  ];

  /**
   * generate random Bluetooth device.
   * @param {number} count - generate number amount
   * @returns {BluetoothDeviceModel[]} device list
   */
  static generateDevices(count: number = 10): BluetoothDeviceModel[] {
    hilog.info(DOMAIN, TAG, 'BluetoothMockDataGenerator generateDevices: count=%{public}d', count);
    const devices: BluetoothDeviceModel[] = [];
    for (let i: number = 0; i < count; i++) {
      devices.push(BluetoothMockDataGenerator.generateDevice(i));
    }
    return devices;
  }

  /**
   * generate single follow machine device.
   * @param {number} index - device index
   * @returns {BluetoothDeviceModel} device model
   */
  static generateDevice(index: number = 0): BluetoothDeviceModel {
    const prefix: string = BluetoothMockDataGenerator.DEVICE_PREFIXES[
      index % BluetoothMockDataGenerator.DEVICE_PREFIXES.length];
    const num: number = 1000 + Math.floor(Math.random() * 9000);
    const name: string = prefix + '-' + num;
    const mac: string = BluetoothMockDataGenerator.generateMacAddress();
    const types: BluetoothDeviceType[] = [
      BluetoothDeviceType.CLASSIC, BluetoothDeviceType.BLE, BluetoothDeviceType.DUAL_MODE
    ];
    const device: BluetoothDeviceModel = new BluetoothDeviceModel(
      'dev_' + index + '_' + Date.now().toString(36),
      name,
      mac,
      types[index % types.length]
    );

    // set follow machine signal strength
    device.updateRssi(-30 - Math.floor(Math.random() * 70));
    // follow machine pairing state state
    device.bondState = Math.random() > 0.5 ? 12 : 0;
    // set support hold Profile
    BluetoothMockDataGenerator.assignProfiles(device);
    // set main service
    BluetoothMockDataGenerator.assignServices(device);
    // set device class
    device.deviceClass = Math.floor(Math.random() * 10) + 1;

    return device;
  }

  /**
   * generate random MAC ground address.
   * @returns {string} MAC ground address
   */
  static generateMacAddress(): string {
    const hex: string = '0123456789ABCDEF';
    let mac: string = '';
    for (let i: number = 0; i < 6; i++) {
      if (i > 0) {
        mac += ':';
      }
      mac += hex.charAt(Math.floor(Math.random() * 16));
      mac += hex.charAt(Math.floor(Math.random() * 16));
    }
    return mac;
  }

  /**
   * for device assign support hold Profile.
   * @param {BluetoothDeviceModel} device - device
   */
  private static assignProfiles(device: BluetoothDeviceModel): void {
    const allProfiles: BluetoothProfileType[] = [
      BluetoothProfileType.A2DP, BluetoothProfileType.HFP, BluetoothProfileType.HID,
      BluetoothProfileType.PAN, BluetoothProfileType.PBAP, BluetoothProfileType.MAP,
      BluetoothProfileType.AVRCP, BluetoothProfileType.HDP
    ];

    // root data device name prefix resolve specify main Profile
    const name: string = device.deviceName;
    if (name.indexOf('Speaker') !== -1 || name.indexOf('Headphone') !== -1 ||
      name.indexOf('Headset') !== -1) {
      device.addSupportedProfile(BluetoothProfileType.A2DP);
      device.addSupportedProfile(BluetoothProfileType.AVRCP);
      if (name.indexOf('Headset') !== -1) {
        device.addSupportedProfile(BluetoothProfileType.HFP);
      }
    } else if (name.indexOf('Keyboard') !== -1 || name.indexOf('Mouse') !== -1 ||
      name.indexOf('Gamepad') !== -1) {
      device.addSupportedProfile(BluetoothProfileType.HID);
    } else if (name.indexOf('Watch') !== -1 || name.indexOf('Health') !== -1 ||
      name.indexOf('Scale') !== -1) {
      device.addSupportedProfile(BluetoothProfileType.HDP);
    } else if (name.indexOf('Car') !== -1) {
      device.addSupportedProfile(BluetoothProfileType.A2DP);
      device.addSupportedProfile(BluetoothProfileType.HFP);
      device.addSupportedProfile(BluetoothProfileType.AVRCP);
      device.addSupportedProfile(BluetoothProfileType.PAN);
    } else if (name.indexOf('Phone') !== -1) {
      device.addSupportedProfile(BluetoothProfileType.PBAP);
      device.addSupportedProfile(BluetoothProfileType.MAP);
      device.addSupportedProfile(BluetoothProfileType.HFP);
    } else {
      // follow machine assign 1-3 Profile
      const count: number = 1 + Math.floor(Math.random() * 3);
      for (let i: number = 0; i < count; i++) {
        device.addSupportedProfile(allProfiles[Math.floor(Math.random() * allProfiles.length)]);
      }
    }
  }

  /**
   * for device assign main service.
   * @param {BluetoothDeviceModel} device - device
   */
  private static assignServices(device: BluetoothDeviceModel): void {
    if (device.supportsProfile(BluetoothProfileType.A2DP) ||
      device.supportsProfile(BluetoothProfileType.AVRCP)) {
      device.addMajorService(BluetoothMajorService.AUDIO);
    }
    if (device.supportsProfile(BluetoothProfileType.HFP) ||
      device.supportsProfile(BluetoothProfileType.PBAP)) {
      device.addMajorService(BluetoothMajorService.TELEPHONY);
    }
    if (device.supportsProfile(BluetoothProfileType.PAN)) {
      device.addMajorService(BluetoothMajorService.NETWORK);
    }
    if (device.supportsProfile(BluetoothProfileType.HID)) {
      device.addMajorService(BluetoothMajorService.INPUT);
    }
    if (device.supportsProfile(BluetoothProfileType.HDP)) {
      device.addMajorService(BluetoothMajorService.HEALTH);
    }
    if (device.supportsProfile(BluetoothProfileType.MAP)) {
      device.addMajorService(BluetoothMajorService.INFORMATION);
    }
  }

  /**
   * generate paired device list.
   * @param {number} count - number amount
   * @returns {BluetoothDeviceModel[]} paired device list
   */
  static generateBondedDevices(count: number = 5): BluetoothDeviceModel[] {
    const devices: BluetoothDeviceModel[] = BluetoothMockDataGenerator.generateDevices(count);
    for (const device of devices) {
      device.bondState = 12;
      if (Math.random() > 0.3) {
        device.updateConnectionState(BluetoothConnectionState.CONNECTED);
        device.lastConnectedTime = Date.now() - Math.floor(Math.random() * 3600000);
      }
    }
    return devices;
  }

  /**
   * generate connection log.
   * @param {number} count - log count
   * @returns {string[]} log list
   */
  static generateConnectionLogs(count: number = 20): string[] {
    const logs: string[] = [];
    const actions: string[] = ['Connected', 'Disconnected', 'Reconnected', 'Pairing', 'Paired', 'Error'];
    const profiles: string[] = ['A2DP', 'HFP', 'HID', 'PAN', 'PBAP', 'MAP', 'AVRCP', 'HDP'];
    for (let i: number = 0; i < count; i++) {
      const time: string = new Date(Date.now() - (count - i) * 60000).toISOString();
      const action: string = actions[Math.floor(Math.random() * actions.length)];
      const profile: string = profiles[Math.floor(Math.random() * profiles.length)];
      const device: string = 'Device-' + (1000 + Math.floor(Math.random() * 9000));
      logs.push('[' + time + '] ' + action + ' ' + profile + ' ' + device);
    }
    return logs;
  }

  /**
   * generate profile usage stats.
   * @returns {Map<string, number>} statistics
   */
  static generateProfileStatistics(): Map<string, number> {
    const stats: Map<string, number> = new Map();
    stats.set('A2DP', Math.floor(Math.random() * 50) + 10);
    stats.set('HFP', Math.floor(Math.random() * 30) + 5);
    stats.set('HID', Math.floor(Math.random() * 20) + 3);
    stats.set('PAN', Math.floor(Math.random() * 15) + 2);
    stats.set('PBAP', Math.floor(Math.random() * 25) + 5);
    stats.set('MAP', Math.floor(Math.random() * 20) + 3);
    stats.set('AVRCP', Math.floor(Math.random() * 40) + 8);
    stats.set('HDP', Math.floor(Math.random() * 10) + 1);
    return stats;
  }
}
