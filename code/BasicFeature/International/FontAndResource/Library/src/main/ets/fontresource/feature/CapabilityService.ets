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

// Import the bundle manager used to inspect requested permissions of this application.
import { bundleManager } from '@kit.AbilityKit';
// Import device info and business error types from the basic services kit.
import { BusinessError, deviceInfo } from '@kit.BasicServicesKit';
// Import the capability check model produced by this service.
import { CapabilityCheck } from '../model/FontTypes';
// Import the logger used for observable check outcomes.
import { Logger } from '../utils/Logger';
// Import the trace facade used for performance marks around the check flow.
import { TraceUtil } from '../utils/TraceUtil';

// The update-font permission string checked by the permission probe.
const UPDATE_FONT_PERMISSION: string = 'ohos.permission.UPDATE_FONT';
// The system capability name that gates the font manager APIs.
const FONT_SYSCAP: string = 'SystemCapability.Global.FontManager';
// The minimum API level that supports custom font registration for previews.
const REGISTER_FONT_MIN_API: number = 12;
// The module tag used for every log line emitted by this service.
const TAG: string = 'Capability';

// Static service that probes device capabilities required by the font demo.
export class CapabilityService {
  // Checks whether the font manager system capability exists on this device.
  private static checkSysCap(): CapabilityCheck {
    // Ask the platform whether the capability is supported.
    const supported: boolean = canIUse(FONT_SYSCAP);
    // Pick the localized detail text that matches the outcome.
    const detail: ResourceStr = supported
      ? $r('app.string.fr_check_syscap_supported')
      : $r('app.string.fr_check_syscap_unsupported');
    // Log the system capability probe outcome.
    Logger.debug(TAG, `checkSysCap supported=${supported}`);
    // Return the assembled check row.
    return new CapabilityCheck($r('app.string.fr_check_syscap_name'), supported, detail);
  }

  // Checks whether the UPDATE_FONT permission is declared and granted.
  private static checkPermission(): CapabilityCheck {
    try {
      // Compose the bundle flags that keep application and permission details.
      const flags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION;
      // Query the bundle info of this application synchronously.
      const info: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(flags);
      // Read the requested permission list from the bundle info.
      const details: bundleManager.ReqPermissionDetail[] = info.reqPermissionDetails;
      // Track the index of the update-font permission inside the list.
      let index: number = -1;
      // Walk the requested permissions looking for the update-font entry.
      for (let i = 0; i < details.length; i++) {
        // Compare each name against the target permission.
        if (details[i].name === UPDATE_FONT_PERMISSION) {
          // Remember the matching index and stop scanning.
          index = i;
          break;
        }
      }
      // Handle the case where the permission is not declared at all.
      if (index < 0) {
        // Log the missing declaration for diagnosis.
        Logger.warn(TAG, 'UPDATE_FONT permission is not declared');
        // Return a failed check row for the missing permission.
        return new CapabilityCheck($r('app.string.fr_check_permission_name'), false,
          $r('app.string.fr_check_permission_absent'));
      }
      // Read the grant state of the declared permission.
      const granted: boolean = info.permissionGrantStates[index] ===
        bundleManager.PermissionGrantState.PERMISSION_GRANTED;
      // Pick the localized detail text that matches the grant state.
      const detail: ResourceStr = granted
        ? $r('app.string.fr_check_permission_granted')
        : $r('app.string.fr_check_permission_denied');
      // Log the permission probe outcome.
      Logger.debug(TAG, `checkPermission granted=${granted}`);
      // Return the assembled check row.
      return new CapabilityCheck($r('app.string.fr_check_permission_name'), granted, detail);
    } catch (error) {
      // Normalize the thrown value into a business error.
      const err: BusinessError = error as BusinessError;
      // Log the probe failure with its error code.
      Logger.error(TAG, `checkPermission failed, code ${err.code}: ${err.message}`);
      // Return a failed check row carrying the error message.
      return new CapabilityCheck($r('app.string.fr_check_permission_name'), false,
        $r('app.string.fr_check_permission_error', err.message));
    }
  }

  // Checks whether the API level supports custom font preview registration.
  private static checkPreview(): CapabilityCheck {
    // Compare the running API level against the minimum requirement.
    const supported: boolean = deviceInfo.sdkApiVersion >= REGISTER_FONT_MIN_API;
    // Pick the localized detail text that matches the outcome.
    const detail: ResourceStr = supported
      ? $r('app.string.fr_check_preview_supported')
      : $r('app.string.fr_check_preview_unsupported', REGISTER_FONT_MIN_API);
    // Log the preview support probe outcome.
    Logger.debug(TAG, `checkPreview supported=${supported}`);
    // Return the assembled check row.
    return new CapabilityCheck($r('app.string.fr_check_preview_name'), supported, detail);
  }

  // Runs all capability probes and returns the assembled check rows.
  static async checkFontCapability(): Promise<CapabilityCheck[]> {
    // Open a trace section around the full check flow.
    const taskId: number = TraceUtil.begin('Capability.checkFontCapability');
    try {
      // Create the empty result list.
      const checks: CapabilityCheck[] = [];
      // Append the system capability probe result.
      checks.push(CapabilityService.checkSysCap());
      // Append the permission probe result.
      checks.push(CapabilityService.checkPermission());
      // Append the preview support probe result.
      checks.push(CapabilityService.checkPreview());
      // Log the completion of the whole check flow.
      TraceUtil.point(TAG, 'Capability checks finished');
      // Return the assembled rows to the caller.
      return checks;
    } finally {
      // Close the trace section even when a probe throws.
      TraceUtil.end('Capability.checkFontCapability', taskId);
    }
  }
}
