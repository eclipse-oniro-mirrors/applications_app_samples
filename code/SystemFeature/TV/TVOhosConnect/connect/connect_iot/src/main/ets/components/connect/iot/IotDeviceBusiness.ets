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

import { InfControl, InfDeviceInfo, InfDevicesBusiness, InfDeviceState, InfIpInfo, Logger } from '@ohos/common';
import IotDevicesController from './IotDevicesController';
import IotHelper from './IotHelper';

const TAG = 'IotDeviceBusiness';

export default class IotDeviceBusiness implements InfDevicesBusiness {
  public controller: IotDevicesController;

  constructor(controller: IotDevicesController) {
    this.controller = controller;
  }

  public queryDeviceState(sid: string[]): Promise<InfDeviceState[]> {
    return IotHelper.getInstance().queryDeviceState(sid);
  }

  public queryDeviceAllServices(): Promise<InfDeviceState[]> {
    return IotHelper.getInstance().queryDeviceAllServices();
  }

  public queryDeviceInfo(): Promise<InfDeviceInfo> {
    return IotHelper.getInstance().queryDeviceInfo().catch((error: Error) => {
      Logger.error(TAG, 'queryDeviceInfo failed: ' + error.message);
      return Promise.reject(error);
    });
  }

  public queryIpInfo(): Promise<InfIpInfo> {
    return IotHelper.getInstance().queryIpInfo().catch((error: Error) => {
      Logger.error(TAG, 'queryIpInfo failed: ' + error.message);
      return Promise.reject(error);
    });
  }

  public controlDevice(control: InfControl): Promise<boolean> {
    return IotHelper.getInstance().controlDevice(control).catch((error: Error) => {
      Logger.error(TAG, 'controlDevice failed: ' + error.message);
      return Promise.reject(error);
    });
  }
};
