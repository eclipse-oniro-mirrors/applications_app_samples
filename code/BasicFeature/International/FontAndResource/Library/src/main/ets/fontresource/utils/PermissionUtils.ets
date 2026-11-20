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

// Import the ability access controller for token permission checks.
import { abilityAccessCtrl, bundleManager, common, Permissions } from '@kit.AbilityKit';
// Import the in-house logger so permission failures are observable.
import { Logger } from './Logger';

// The module tag used for every log line emitted by this utility.
const TAG: string = 'PermissionUtils';

// Runtime permission helpers: check grant state and request permissions from the user.
export class PermissionUtils {
  // Resolves the access token id of the running application bundle.
  private static selfTokenId(): number {
    // Query the bundle info of this application synchronously with application details.
    const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(
      bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
    // Read the access token id from the application info.
    return info.appInfo.accessTokenId;
  }

  // Returns true when the given permission is currently granted to this application.
  static isGranted(permission: Permissions): boolean {
    try {
      // Create the access token manager instance.
      const manager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      // Resolve this application's access token id.
      const tokenId: number = PermissionUtils.selfTokenId();
      // Ask the token manager for the grant state of the permission synchronously.
      const state: abilityAccessCtrl.GrantStatus = manager.checkAccessTokenSync(tokenId, permission);
      // Compare the state against the granted constant.
      return state === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED;
    } catch (error) {
      // Failures such as unknown permissions are reported as not granted.
      Logger.warn(TAG, 'isGranted check failed for ' + permission);
      // Report the denial to the caller.
      return false;
    }
  }

  // Requests the permission list from the user and returns the request result.
  static async request(context: common.UIAbilityContext, permissions: Permissions[]):
    Promise<boolean> {
    try {
      // Create the access token manager instance.
      const manager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      // Open the system permission dialog for the requested permissions.
      const result = await manager.requestPermissionsFromUser(context, permissions);
      // Verify that every requested permission ended up granted.
      for (let i: number = 0; i < result.authResults.length; i++) {
        // Compare the numeric auth result against the granted constant.
        if (result.authResults[i] !== 0) {
          // One of the permissions was denied.
          return false;
        }
      }
      // Every requested permission was granted.
      return true;
    } catch (error) {
      // Dialog failures mean the permission was not granted.
      Logger.error(TAG, 'requestPermissionsFromUser failed');
      // Report the denial to the caller.
      return false;
    }
  }

  // Checks a permission and requests it from the user only when it is missing.
  static async ensure(context: common.UIAbilityContext, permission: Permissions): Promise<boolean> {
    // Skip the dialog when the permission is already granted.
    if (PermissionUtils.isGranted(permission)) {
      // The permission is already available.
      return true;
    }
    // Ask the user for the missing permission.
    const granted: boolean = await PermissionUtils.request(context, [permission]);
    // Mirror the user's decision into the log channel.
    Logger.info(TAG, 'ensure ' + permission + ' granted=' + granted.toString());
    // Return the request outcome.
    return granted;
  }
}
