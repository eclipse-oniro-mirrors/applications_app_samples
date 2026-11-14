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
import { abilityToolAccessCtrl } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
// [End import]

export async function queryControlAppStatus(): Promise<string> {
  let result: string = '';
  // [Start queryControlAppStatusAppInfoPrepare]
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
  // [End queryControlAppStatusAppInfoPrepare]
  // [Start queryControlAppStatusFunctionCall]
  abilityToolAccessCtrl.queryControlAppStatus(appInfo)
    .then((data: abilityToolAccessCtrl.ControlAppStatusResult[]) => {
      // [StartExclude queryControlAppStatus]
      result = 'Succeeded in query control app status';
      // [EndExclude queryControlAppStatus]
      for (let i = 0; i < data.length; i++) {
        let bundleName = data[i].appInfo.bundleName;
        let index = data[i].appInfo.index;
        let status = data[i].status;
        console.info(`bundleName: ${bundleName}, index: ${index}, status: ${status}`);
        if (status === abilityToolAccessCtrl.ControlAppStatus.ALLOW) {
          // The control permission is ALLOW. You can proceed with subsequent control operations.
        } else {
          // The control permission is DENY. Call requestControlAppPermissionFromUser() to request user authorization.
        }
      }
      // [End queryControlAppStatusFunctionCall]
      // [Start queryControlAppStatusErrorHandle]
    }).catch((err: BusinessError): void => {
    console.error(`queryControlAppStatus fail, code: ${err.code}, message: ${err.message}`);
    // [StartExclude queryControlAppStatus]
    result = 'Failed to query control app status';
    // [EndExclude queryControlAppStatus]
  });
  // [End queryControlAppStatusErrorHandle]
  await sleep(500);
  return result;
}