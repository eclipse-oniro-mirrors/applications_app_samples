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

import { InfDevice, InfDevicesConnector, Logger, ProtocolType, SubProtocolType } from '@ohos/common';
import IotConstants from './IotConstants';
import IotDevice from './IotDevice';
import IotHelper from './IotHelper';
import { BusinessError } from '@kit.BasicServicesKit';
import Timers from './Timers';

const TAG = 'IotDevicesConnector';

export default class IotDevicesConnector implements InfDevicesConnector {
  public connect(device: InfDevice): Promise<boolean> {
    if (device.getSubProtocolType() != SubProtocolType.iot_connect) {
      const error: BusinessError<void> = {
        name: IotConstants.IOT_NAME,
        message: IotConstants.IOT_TYPE_ERROR_MSG,
        code: IotConstants.IOT_TYPE_ERROR,
      };
      return Promise.reject(error);
    }
    let iotDevice = device as IotDevice;
    return IotHelper.getInstance().connectDevice(iotDevice);
  }

  public getCurrentConnectedDevice(): InfDevice | undefined {
    return IotHelper.getInstance().getConnectDevice();
  }

  public async stopConnect(device: InfDevice): Promise<boolean> {
    if (device.getSubProtocolType() != SubProtocolType.iot_connect) {
      const error: BusinessError<void> = {
        name: IotConstants.IOT_NAME,
        message: IotConstants.IOT_TYPE_ERROR_MSG,
        code: IotConstants.IOT_TYPE_ERROR,
      };
      return Promise.reject(error);
    }
    let iotDevice = device as IotDevice;
    IotHelper.getInstance().stopConnect(iotDevice);
    try {
      await Timers.delay(500);
      return true;
    } catch (error) {
      Logger.error(TAG, 'Failed to complete device disconnect');
      return false;
    }
  }
};
