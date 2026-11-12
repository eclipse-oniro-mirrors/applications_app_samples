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
import { ControlBody } from '@ohos/connect_cloud';
import { HttpApi } from '@ohos/connect_cloud';
import { Logger } from '@ohos/common';
import { ServiceData } from '@ohos/connect_cloud';
import { InfDeviceInfo, InfDeviceState, InfIpInfo } from '@ohos/common';
import { ChannelInterface } from './ChannelInterface';
import { ControlOption, QueryInfoOption, QueryOption } from './DeviceManagerInterface';

const TAG = 'HttpChannel';

export default class HttpChannel implements ChannelInterface {
  public queryDeviceInfo(option: QueryInfoOption): Promise<InfDeviceInfo> {
    return Promise.reject(new Error('Method not implemented.'));
  }

  public queryIpInfo(option: QueryInfoOption): Promise<InfIpInfo> {
    return Promise.reject(new Error('Method not implemented.'));
  }

  public queryDeviceAllServices(option: QueryOption): Promise<InfDeviceState[]> {
    return Promise.reject(new Error('Method not implemented.'));
  }

  public controlDevice(option: ControlOption): Promise<boolean> {
    Logger.debug(TAG, '===>controlDevice ' + JSON.stringify(option));
    let serviceData: ServiceData = {
      sid: option.serviceId,
      st: option.serviceType,
      data: JSON.parse(option.controlJson)
    };
    let controlBody: ControlBody = {
      devId: option.deviceId || '',
      prodId: option.productId || '',
      services: [serviceData]
    };
    Logger.debug(TAG, 'controlBody ' + JSON.stringify(controlBody));
    return new Promise(async (resolve, reject) => {
      try {
        await HttpApi.getInstance().controlDevice(controlBody);
        resolve(true);
      } catch (e) {
        reject(e);
      }
    });
  }

  public queryDeviceState(option: QueryOption): Promise<InfDeviceState[]> {
    return Promise.reject(new Error('Method not implemented.'));
  }
};