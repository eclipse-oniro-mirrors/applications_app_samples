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

import { sleep } from './common';
// [Start import]
import { abilityToolAccessCtrl, common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
// [End import]

export async function requestControlAppPermissionFromUser(): Promise<string> {
  let result: string = '';
  // [Start requestControlAppPermissionFromUserContextPrepare]
  let context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;
  // [End requestControlAppPermissionFromUserContextPrepare]
  // [Start requestControlAppPermissionFromUserAppInfoPrepare]
  let appInfo: abilityToolAccessCtrl.AppInfo[] = [{
    bundleName: 'com.example.hmos.email',
    index: 0
  }, {
    bundleName: 'com.example.hmos.notepad',
    index: 0
  }, {
    bundleName: 'com.example.hmos.browser',
    index: 0
  }];
  // [End requestControlAppPermissionFromUserAppInfoPrepare]
  // [Start requestControlAppPermissionFromUserFunctionCall]
  abilityToolAccessCtrl.requestControlAppPermissionFromUser(context, appInfo)
    .then((data: abilityToolAccessCtrl.ControlAppStatusResult[]) => {
      // [StartExclude requestControlAppPermissionFromUser]
      result = 'Succeeded in request control app permission from user';
      // [EndExclude requestControlAppPermissionFromUser]
      for (let i = 0; i < data.length; i++) {
        let bundleName = data[i].appInfo.bundleName;
        let index = data[i].appInfo.index;
        let status = data[i].status;
        console.info(`bundleName: ${bundleName}, index: ${index}, status: ${status}`);
        if (status === abilityToolAccessCtrl.ControlAppStatus.ALLOW) {
          // The user has granted the permission. You can control the target app.
        } else {
          // The user has denied the permission. You cannot control the target app.
        }
      }
      // [End requestControlAppPermissionFromUserFunctionCall]
      // [Start requestControlAppPermissionFromUserErrorHandle]
    }).catch((err: BusinessError): void => {
    console.error(`requestControlAppPermissionFromUser fail, code: ${err.code}, message: ${err.message}`);
    // [StartExclude requestControlAppPermissionFromUser]
    result = 'Failed to request control app permission from user';
    // [EndExclude requestControlAppPermissionFromUser]
  });
  // [End requestControlAppPermissionFromUserErrorHandle]
  await sleep(500);
  return result;
}