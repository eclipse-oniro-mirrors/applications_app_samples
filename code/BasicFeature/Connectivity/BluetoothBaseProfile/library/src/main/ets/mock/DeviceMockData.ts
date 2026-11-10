/*
 * Copyright (c) 2024 Hunan OpenValley Digital Industry Development Co., Ltd.
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

import { BluetoothDeviceModel, BluetoothDeviceType, BluetoothMajorService } from '../model/BluetoothDeviceModel';
import { BluetoothProfileType, BluetoothConnectionState } from '../constants/BluetoothConstants';

/**
 * 设备Mock数据。
 * 提供预定义的蓝牙设备模拟数据。
 */
export class DeviceMockData {
  /**
   * 获取预定义的音频设备列表。
   * @returns {BluetoothDeviceModel[]} 音频设备列表
   */
  static getAudioDevices(): BluetoothDeviceModel[] {
    const devices: BluetoothDeviceModel[] = [];

    const speaker: BluetoothDeviceModel = new BluetoothDeviceModel(
      'audio_speaker_001', 'JBL Flip 6', 'AA:BB:CC:DD:EE:01', BluetoothDeviceType.CLASSIC);
    speaker.addSupportedProfile(BluetoothProfileType.A2DP);
    speaker.addSupportedProfile(BluetoothProfileType.AVRCP);
    speaker.addMajorService(BluetoothMajorService.AUDIO);
    speaker.updateRssi(-45);
    speaker.bondState = 12;
    devices.push(speaker);

    const headphone: BluetoothDeviceModel = new BluetoothDeviceModel(
      'audio_headphone_001', 'Sony WH-1000XM5', 'AA:BB:CC:DD:EE:02', BluetoothDeviceType.DUAL_MODE);
    headphone.addSupportedProfile(BluetoothProfileType.A2DP);
    headphone.addSupportedProfile(BluetoothProfileType.AVRCP);
    headphone.addSupportedProfile(BluetoothProfileType.HFP);
    headphone.addMajorService(BluetoothMajorService.AUDIO);
    headphone.addMajorService(BluetoothMajorService.TELEPHONY);
    headphone.updateRssi(-38);
    headphone.bondState = 12;
    devices.push(headphone);

    const earbuds: BluetoothDeviceModel = new BluetoothDeviceModel(
      'audio_earbuds_001', 'AirPods Pro 2', 'AA:BB:CC:DD:EE:03', BluetoothDeviceType.DUAL_MODE);
    earbuds.addSupportedProfile(BluetoothProfileType.A2DP);
    earbuds.addSupportedProfile(BluetoothProfileType.AVRCP);
    earbuds.addSupportedProfile(BluetoothProfileType.HFP);
    earbuds.addMajorService(BluetoothMajorService.AUDIO);
    earbuds.updateRssi(-42);
    earbuds.bondState = 12;
    devices.push(earbuds);

    const carAudio: BluetoothDeviceModel = new BluetoothDeviceModel(
      'audio_car_001', 'BMW Car Audio', 'AA:BB:CC:DD:EE:04', BluetoothDeviceType.CLASSIC);
    carAudio.addSupportedProfile(BluetoothProfileType.A2DP);
    carAudio.addSupportedProfile(BluetoothProfileType.AVRCP);
    carAudio.addSupportedProfile(BluetoothProfileType.HFP);
    carAudio.addSupportedProfile(BluetoothProfileType.PBAP);
    carAudio.addMajorService(BluetoothMajorService.AUDIO);
    carAudio.updateRssi(-65);
    carAudio.bondState = 0;
    devices.push(carAudio);

    return devices;
  }

  /**
   * 获取预定义的输入设备列表。
   * @returns {BluetoothDeviceModel[]} 输入设备列表
   */
  static getInputDevices(): BluetoothDeviceModel[] {
    const devices: BluetoothDeviceModel[] = [];

    const keyboard: BluetoothDeviceModel = new BluetoothDeviceModel(
      'input_keyboard_001', 'Logitech K380', 'AA:BB:CC:DD:EE:10', BluetoothDeviceType.BLE);
    keyboard.addSupportedProfile(BluetoothProfileType.HID);
    keyboard.addMajorService(BluetoothMajorService.INPUT);
    keyboard.updateRssi(-50);
    keyboard.bondState = 12;
    devices.push(keyboard);

    const mouse: BluetoothDeviceModel = new BluetoothDeviceModel(
      'input_mouse_001', 'Microsoft Arc Mouse', 'AA:BB:CC:DD:EE:11', BluetoothDeviceType.BLE);
    mouse.addSupportedProfile(BluetoothProfileType.HID);
    mouse.addMajorService(BluetoothMajorService.INPUT);
    mouse.updateRssi(-55);
    mouse.bondState = 12;
    devices.push(mouse);

    const gamepad: BluetoothDeviceModel = new BluetoothDeviceModel(
      'input_gamepad_001', 'Xbox Wireless Controller', 'AA:BB:CC:DD:EE:12', BluetoothDeviceType.DUAL_MODE);
    gamepad.addSupportedProfile(BluetoothProfileType.HID);
    gamepad.addMajorService(BluetoothMajorService.INPUT);
    gamepad.updateRssi(-48);
    gamepad.bondState = 0;
    devices.push(gamepad);

    return devices;
  }

  /**
   * 获取预定义的健康设备列表。
   * @returns {BluetoothDeviceModel[]} 健康设备列表
   */
  static getHealthDevices(): BluetoothDeviceModel[] {
    const devices: BluetoothDeviceModel[] = [];

    const watch: BluetoothDeviceModel = new BluetoothDeviceModel(
      'health_watch_001', 'Huawei Watch GT4', 'AA:BB:CC:DD:EE:20', BluetoothDeviceType.DUAL_MODE);
    watch.addSupportedProfile(BluetoothProfileType.HDP);
    watch.addMajorService(BluetoothMajorService.HEALTH);
    watch.updateRssi(-40);
    watch.bondState = 12;
    devices.push(watch);

    const band: BluetoothDeviceModel = new BluetoothDeviceModel(
      'health_band_001', 'Fitbit Charge 6', 'AA:BB:CC:DD:EE:21', BluetoothDeviceType.BLE);
    band.addSupportedProfile(BluetoothProfileType.HDP);
    band.addMajorService(BluetoothMajorService.HEALTH);
    band.updateRssi(-52);
    band.bondState = 12;
    devices.push(band);

    const scale: BluetoothDeviceModel = new BluetoothDeviceModel(
      'health_scale_001', 'Xiaomi Body Scale', 'AA:BB:CC:DD:EE:22', BluetoothDeviceType.BLE);
    scale.addSupportedProfile(BluetoothProfileType.HDP);
    scale.addMajorService(BluetoothMajorService.HEALTH);
    scale.updateRssi(-60);
    scale.bondState = 0;
    devices.push(scale);

    return devices;
  }

  /**
   * 获取预定义的手机设备列表。
   * @returns {BluetoothDeviceModel[]} 手机设备列表
   */
  static getPhoneDevices(): BluetoothDeviceModel[] {
    const devices: BluetoothDeviceModel[] = [];

    const phone1: BluetoothDeviceModel = new BluetoothDeviceModel(
      'phone_001', 'Samsung Galaxy S24', 'AA:BB:CC:DD:EE:30', BluetoothDeviceType.DUAL_MODE);
    phone1.addSupportedProfile(BluetoothProfileType.PBAP);
    phone1.addSupportedProfile(BluetoothProfileType.MAP);
    phone1.addSupportedProfile(BluetoothProfileType.HFP);
    phone1.addMajorService(BluetoothMajorService.TELEPHONY);
    phone1.addMajorService(BluetoothMajorService.INFORMATION);
    phone1.updateRssi(-35);
    phone1.bondState = 12;
    devices.push(phone1);

    const phone2: BluetoothDeviceModel = new BluetoothDeviceModel(
      'phone_002', 'iPhone 15 Pro', 'AA:BB:CC:DD:EE:31', BluetoothDeviceType.DUAL_MODE);
    phone2.addSupportedProfile(BluetoothProfileType.PBAP);
    phone2.addSupportedProfile(BluetoothProfileType.MAP);
    phone2.addMajorService(BluetoothMajorService.TELEPHONY);
    phone2.updateRssi(-42);
    phone2.bondState = 12;
    devices.push(phone2);

    return devices;
  }

  /**
   * 获取所有预定义设备。
   * @returns {BluetoothDeviceModel[]} 所有设备
   */
  static getAllDevices(): BluetoothDeviceModel[] {
    return [
      ...DeviceMockData.getAudioDevices(),
      ...DeviceMockData.getInputDevices(),
      ...DeviceMockData.getHealthDevices(),
      ...DeviceMockData.getPhoneDevices()
    ];
  }
}
