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

import { abilityAccessCtrl, bundleManager, common, PermissionRequestResult, Permissions } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Logger } from './Logger';

const TAG = 'PermissionUtil';

export async function checkPermission(permission: Permissions): Promise<abilityAccessCtrl.GrantStatus> {
  let grantStatus: abilityAccessCtrl.GrantStatus = abilityAccessCtrl.GrantStatus.PERMISSION_DENIED;

  try {
    let bundleInfo: bundleManager.BundleInfo =
      await bundleManager.getBundleInfoForSelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
    let tokenId: number = bundleInfo.appInfo.accessTokenId;
    grantStatus = await abilityAccessCtrl.createAtManager().checkAccessToken(tokenId, permission);
  } catch (err) {
    Logger.error(TAG, `Get bundle info failed, message: ${(err as BusinessError).message}`);
  }
  return grantStatus;
}

export function requestPermissions(context: common.UIAbilityContext, permissions: Permissions[]): void {
  let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  atManager.requestPermissionsFromUser(context, permissions)
    .then((result: PermissionRequestResult) => {
      for (let i = 0; i < result.authResults.length; i++) {
        if (result.authResults[i] !== 0) {
          Logger.info(TAG, `User reject to grant permission: ${permissions[i]}`);
        }
      }
    })
    .catch((err: BusinessError) => {
      Logger.error(TAG, `Request permissions from user failed, message:${err.message}`);
    });
}