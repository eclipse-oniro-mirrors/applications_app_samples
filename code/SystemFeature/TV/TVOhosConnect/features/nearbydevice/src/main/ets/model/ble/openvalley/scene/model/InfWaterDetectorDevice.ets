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

import { Device, getImageFromDevice, InfDevice, ProtocolType, SubProtocolType } from '@ohos/common/index';

export default class InfWaterDetectorDevice implements InfDevice {
  public signalStrength: number = 0;
  public macAddress: string = '';
  public productID: string = '';
  public randomFlag: string = '';
  public libDevice: Device = new Device();
  public imageResource: string | Resource = getImageFromDevice(new Device());

  public getSubProtocolType(): SubProtocolType {
    return SubProtocolType.wifi_open;
  }

  public getProtocolType(): ProtocolType {
    return ProtocolType.WIFI;
  }

  public getUnionCode(): string {
    return this.macAddress || this.productID + this.randomFlag;
  }

  //获取信号强度
  public getSignalStrength(): number {
    return this.signalStrength;
  }

  public getDeviceName(): string {
    return this.libDevice.deviceName;
  }

  public getImageResource(): string | Resource {
    return this.imageResource;
  }

  public getLibDevice(): Device {
    return this.libDevice;
  }

  public getProductID(): string {
    return this.productID;
  };

  public getRandomFlag(): string {
    return this.randomFlag;
  };
};
