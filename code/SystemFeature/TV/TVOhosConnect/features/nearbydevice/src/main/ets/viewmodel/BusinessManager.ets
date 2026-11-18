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
 * 设备业务管理
 */
import {
  InfControl,
  InfDevice,
  InfDeviceInfo,
  InfDevicesBusiness,
  InfDevicesController,
  InfDeviceState,
  InfIpInfo
} from '@ohos/common';
import { DeviceManagerFactory } from '@ohos/device_manager';

import DeviceDiscoverManager from './DeviceDiscoverManager';

/**
 * 从已知已注册设备中，进行服务调用
 */
export default class BusinessManager {
  constructor() {
  }

  /**
   * 查询设备状态
   */
  public queryDeviceState(device: InfDevice, sids: string[]): Promise<InfDeviceState[]> {
    const business = this.findBusiness(device);
    if (!business) {
      return Promise.reject(new Error('Device business is unavailable'));
    }
    return business.queryDeviceState(sids);
  }

  /**
   * 查询设备所有服务
   */
  public queryDeviceAllServices(device: InfDevice): Promise<Array<InfDeviceState>> {
    const business = this.findBusiness(device);
    if (!business) {
      return Promise.reject(new Error('Device business is unavailable'));
    }
    return business.queryDeviceAllServices();
  }

  /**
   * 查询设备信息
   */
  public queryDeviceInfo(device: InfDevice): Promise<InfDeviceInfo> {
    const business = this.findBusiness(device);
    if (!business) {
      return Promise.reject(new Error('Device business is unavailable'));
    }
    return business.queryDeviceInfo();
  }

  /**
   * 查询Ip信息
   */
  public queryIpInfo(device: InfDevice): Promise<InfIpInfo> {
    const business = this.findBusiness(device);
    if (!business) {
      return Promise.reject(new Error('Device business is unavailable'));
    }
    return business.queryIpInfo();
  }

  /**
   * 控制设备信息
   */
  public controlDevice(device: InfDevice, control: InfControl): Promise<boolean> {
    const business = this.findBusiness(device);
    if (!business) {
      return Promise.reject(new Error('Device business is unavailable'));
    }
    return business.controlDevice(control);
  }

  private findBusiness(device: InfDevice): InfDevicesBusiness | undefined {
    return DeviceManagerFactory.getDeviceManager().getDevicesBusiness(device.getSubProtocolType());
  }
};
