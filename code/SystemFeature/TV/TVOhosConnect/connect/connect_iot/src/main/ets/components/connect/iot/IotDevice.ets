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

import { Device, getImageFromDevice, InfDevice, ProtocolType, SubProtocolType } from '@ohos/common';
import { DeviceManager } from 'iotmanagementkit';

interface LocalControlDeviceInfo {
  devId: string;
  authCodeId: string;
  sessId: string;
  authCode: string;
}

export default class IotDevice implements InfDevice {
  private deviceInfo: DeviceManager.DeviceInfo;
  private libDevice: Device;
  private imageResource: string | Resource;

  constructor(deviceInfo: DeviceManager.DeviceInfo, device: Device) {
    this.deviceInfo = deviceInfo;
    this.libDevice = device;
    this.imageResource = getImageFromDevice(device);
  }

  public getUnionCode(): string {
    return this.deviceInfo.udid;
  }

  public getScannedProtocol(): DeviceManager.ScanProtocol {
    return this.deviceInfo.scannedProtocol;
  }

  public getSignalStrength(): number {
    return this.deviceInfo.rssi;
  }

  public getDeviceName(): string {
    return this.libDevice.deviceName;
  }

  public getImageResource(): string | Resource {
    return this.imageResource;
  }

  public getLibDevice(): Device | null {
    return this.libDevice;
  }

  public getProductID(): string {
    return this.deviceInfo.prodId;
  }

  public getRandomFlag(): string {
    let snFlag = this.deviceInfo.mDeviceSn;
    if (snFlag && snFlag.length >= 5) {
      snFlag = snFlag.substring(0, 4);
    }
    return snFlag;
  }

  public getProtocolType(): ProtocolType {
    if (this.getScannedProtocol() == DeviceManager.ScanProtocol.BLE) {
      return ProtocolType.BLE;
    }
    return ProtocolType.WIFI;
  }

  public getSubProtocolType(): SubProtocolType {
    return SubProtocolType.iot_connect;
  }

  public getLocalControlDeviceInfo(): LocalControlDeviceInfo {
    return this.deviceInfo.localControlDeviceInfo;
  }
};