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

import { common, Want } from '@kit.AbilityKit';
import { policy } from '@kit.NetworkKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Logger } from '../utils/Logger';
import { AccessPolicyView } from './PolicyTypes';

/**
 * Wraps the two public APIs plus the system only per-UID network access policy.
 * getNetAccessPolicy() (API 26) needs no permission, so it works on a non-system-signed device.
 * getNetworkAccessPolicy(uid) is @systemapi and usually fails with 202 or 201 there.
 * openSettings() launches the Settings app by bundle name and ability name because showAppNetPolicySettings()
 * renders an empty embedded modal on board images without the app net policy page and blocks all input.
 */
export class AccessPolicyService {
  /**
   * Reads the public per-application access policy. Never throws: a failure returns a safe view.
   * @returns the access policy view, degraded to loaded = false on error.
   */
  static async read(): Promise<AccessPolicyView> {
    // Open the trace section for this public API.
    Logger.beginTrace('NetworkSecurity.policy.read', 1);
    Logger.enter('[AccessPolicyService#read]');
    try {
      // Query the public per-application network access policy.
      const result: policy.NetAccessPolicy = await policy.getNetAccessPolicy();
      Logger.info('[AccessPolicy] public policy, allowWiFi=' + result.allowWiFi + ', allowCellular=' +
        result.allowCellular);
      Logger.exit('[AccessPolicyService#read]', 'loaded: true');
      // Close the trace section on the success return path.
      Logger.endTrace('NetworkSecurity.policy.read', 1);
      return new AccessPolicyView(result.allowWiFi, result.allowCellular, true, '');
    } catch (error) {
      // Normalize the caught error so the code and message can be logged.
      const err: BusinessError = error as BusinessError;
      Logger.error('[AccessPolicy] failed to read the public policy, code ' + err.code + ': ' + err.message);
      Logger.exit('[AccessPolicyService#read]', 'loaded: false');
      // Close the trace section on the degraded return path.
      Logger.endTrace('NetworkSecurity.policy.read', 1);
      return new AccessPolicyView(false, false, false, $r('app.string.ns_pol_access_unavailable'));
    }
  }

  /**
   * Opens the system Settings main page via bundle name and ability name. Errors are propagated to the caller.
   * showAppNetPolicySettings() is not used: on board images without the app net policy page it resolves
   * successfully but leaves an empty full-screen modal that swallows every later touch.
   * @param context UIAbility context used to start the settings ability.
   */
  static async openSettings(context: common.UIAbilityContext): Promise<void> {
    // Open the trace section for this public API.
    Logger.beginTrace('NetworkSecurity.policy.openSettings', 1);
    Logger.enter('[AccessPolicyService#openSettings]');
    // Launch the system Settings app by element name; errors propagate to the caller.
    const want: Want = {
      bundleName: 'com.ohos.settings',
      abilityName: 'com.ohos.settings.MainAbility'
    };
    await context.startAbility(want);
    Logger.info('[AccessPolicy] system settings page opened');
    Logger.exit('[AccessPolicyService#openSettings]');
    // Close the trace section after the await completes.
    Logger.endTrace('NetworkSecurity.policy.openSettings', 1);
  }

  /**
   * Reads the per-UID access policy. @systemapi: needs MANAGE_NET_STRATEGY, errors are propagated.
   * @param uid target application UID.
   * @returns the per-UID network access policy.
   */
  static async readUidAccess(uid: number): Promise<policy.NetworkAccessPolicy> {
    // Open the trace section for this public API.
    Logger.beginTrace('NetworkSecurity.policy.readUidAccess', 1);
    Logger.enter('[AccessPolicyService#readUidAccess]', 'uid: ' + uid);
    // Query the per-UID access policy; errors propagate to the caller.
    const result: policy.NetworkAccessPolicy = await policy.getNetworkAccessPolicy(uid);
    // Normalize the flags to strict booleans for logging and callers.
    const allowWiFi: boolean = result.allowWiFi === true;
    const allowCellular: boolean = result.allowCellular === true;
    Logger.info('[AccessPolicy] uid ' + uid + ' access, allowWiFi ' + allowWiFi + ', allowCellular ' + allowCellular);
    Logger.exit('[AccessPolicyService#readUidAccess]', 'allowWiFi: ' + allowWiFi + ', allowCellular: ' + allowCellular);
    // Close the trace section after the await completes.
    Logger.endTrace('NetworkSecurity.policy.readUidAccess', 1);
    return result;
  }
}
