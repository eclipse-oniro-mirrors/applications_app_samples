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
import DeviceManagerFactory from './DeviceManager';
import { Logger } from '@ohos/common';
import {
  InfControl,
  InfDeviceInfo,
  InfDevicesBusiness,
  InfDeviceState,
  InfIpInfo,
  SubProtocolType
} from '@ohos/common';
import { ChannelInterface } from './ChannelInterface';
import { ControlOption, QueryInfoOption, QueryOption } from './DeviceManagerInterface';

const TAG = 'HiLinkChannel';

export default class HiLinkChannel implements ChannelInterface {
  public getDevicesBusiness(protocolType?: SubProtocolType): InfDevicesBusiness | undefined {
    if (protocolType == undefined) {
      protocolType = SubProtocolType.iot_connect;
    }
    return DeviceManagerFactory.getDeviceManager().getDevicesBusiness(protocolType);
  }

  public queryDeviceInfo(option: QueryInfoOption): Promise<InfDeviceInfo> {
    let business = this.getDevicesBusiness(option.protocolType);
    if (business == undefined) {
      return Promise.reject('DevicesBusiness is undefined');
    }
    return business.queryDeviceInfo();
  }

  public queryIpInfo(option: QueryInfoOption): Promise<InfIpInfo> {
    let business = this.getDevicesBusiness(option.protocolType);
    if (business == undefined) {
      return Promise.reject('DevicesBusiness is undefined');
    }
    return business.queryIpInfo();
  }

  public controlDevice(option: ControlOption): Promise<boolean> {
    Logger.info(TAG, `===>option ${JSON.stringify(option)}`);
    let business = this.getDevicesBusiness(option.protocolType);
    if (business == undefined) {
      return Promise.reject('DevicesBusiness is undefined');
    }
    let cmd = new DeviceControlCmd(option.serviceId, option.controlJson);
    return business.controlDevice(cmd);
  }

  public queryDeviceState(option: QueryOption): Promise<InfDeviceState[]> {
    Logger.info(TAG, `===>option ${JSON.stringify(option)}`);
    let business = this.getDevicesBusiness(option.protocolType);
    if (business == undefined) {
      return Promise.reject('DevicesBusiness is undefined');
    }
    return business.queryDeviceState(option.sids);
  }

  public queryDeviceAllServices(option: QueryOption): Promise<InfDeviceState[]> {
    let business = this.getDevicesBusiness(option.protocolType);
    if (business == undefined) {
      return Promise.reject('DevicesBusiness is undefined');
    }
    return business.queryDeviceAllServices();
  }
};

class DeviceControlCmd implements InfControl {
  public serviceId: string;
  public dataJson: string;

  constructor(serviceId: string, dataJson: string) {
    this.serviceId = serviceId;
    this.dataJson = dataJson;
  }

  public getServiceId(): string {
    return this.serviceId;
  }

  public getDataJson(): string {
    return this.dataJson;
  }
}
