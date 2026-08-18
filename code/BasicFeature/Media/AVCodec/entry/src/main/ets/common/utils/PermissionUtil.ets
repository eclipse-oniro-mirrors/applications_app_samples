/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { abilityAccessCtrl, bundleManager, Context, Permissions } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import Logger from './Logger';

const TAG: string = 'PermissionUtil';
const RECORD_PERMISSIONS: Permissions[] = [
  'ohos.permission.CAMERA',
  'ohos.permission.MICROPHONE'
];

function isPermissionGranted(status: number): boolean {
  return status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED;
}

async function getDeniedPermissions(atManager: abilityAccessCtrl.AtManager): Promise<Permissions[] | undefined> {
  try {
    const bundleInfo = await bundleManager.getBundleInfoForSelf(
      bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
    const tokenId: number = bundleInfo.appInfo.accessTokenId;
    const deniedPermissions: Permissions[] = [];

    for (const permission of RECORD_PERMISSIONS) {
      const status = await atManager.checkAccessToken(tokenId, permission);
      if (!isPermissionGranted(status)) {
        deniedPermissions.push(permission);
      }
    }
    return deniedPermissions;
  } catch (error) {
    const err = error as BusinessError;
    Logger.error(TAG, `Check record permissions failed, code: ${err.code}, message: ${err.message}`);
    return undefined;
  }
}

function getStillDeniedPermissions(permissions: Permissions[], authResults: number[]): Permissions[] {
  const deniedPermissions: Permissions[] = [];
  for (let index = 0; index < permissions.length; index++) {
    if (!isPermissionGranted(authResults[index])) {
      deniedPermissions.push(permissions[index]);
    }
  }
  return deniedPermissions;
}

async function requestPermissionsOnSetting(atManager: abilityAccessCtrl.AtManager, context: Context,
  permissions: Permissions[]): Promise<boolean> {
  try {
    let allGranted: boolean = true;
    for (const permission of permissions) {
      // Camera and microphone belong to different permission groups and must be requested separately.
      const settingResults = await atManager.requestPermissionOnSetting(context, [permission]);
      if (settingResults.length === 0 || !isPermissionGranted(settingResults[0])) {
        allGranted = false;
      }
    }
    return allGranted;
  } catch (error) {
    const err = error as BusinessError;
    Logger.error(TAG, `Open permission setting failed, code: ${err.code}, message: ${err.message}`);
    return false;
  }
}

export async function requestRecordPermissions(context: Context): Promise<boolean> {
  const atManager = abilityAccessCtrl.createAtManager();
  try {
    const deniedPermissions = await getDeniedPermissions(atManager);
    if (deniedPermissions === undefined) {
      return false;
    }
    if (deniedPermissions.length === 0) {
      return true;
    }

    const requestResult = await atManager.requestPermissionsFromUser(context, deniedPermissions);
    const stillDeniedPermissions = getStillDeniedPermissions(deniedPermissions, requestResult.authResults);
    if (stillDeniedPermissions.length === 0) {
      return true;
    }

    return await requestPermissionsOnSetting(atManager, context, stillDeniedPermissions);
  } catch (error) {
    const err = error as BusinessError;
    Logger.error(TAG, `Request record permissions failed, code: ${err.code}, message: ${err.message}`);
    return false;
  }
}
