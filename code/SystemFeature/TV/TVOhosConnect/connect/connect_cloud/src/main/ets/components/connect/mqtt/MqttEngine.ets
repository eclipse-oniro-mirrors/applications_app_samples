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
import MqttConnectTask from './MqttConnectTask';
import { BusinessError } from '@kit.BasicServicesKit';
import { Logger } from '@ohos/common';
import MqttManager from './MqttManager';

const TAG = 'MqttEngine';

export default class MqttEngine {
  public static connect(reConnect: boolean = false) {
    Logger.info(TAG, `MqttEngine connect start`);
    new MqttConnectTask().executeSync(reConnect).then((value) => {
      Logger.info(TAG, `MqttEngine connect complete isSuccess=${value}`);
    }).catch((error: BusinessError) => {
      Logger.info(TAG, `MqttEngine connect error=${error.message}`);
    });
  }

  public static disConnect() {
    Logger.info(TAG, `MqttEngine disConnect`);
    MqttManager.getInstance().disconnect();
  }
};