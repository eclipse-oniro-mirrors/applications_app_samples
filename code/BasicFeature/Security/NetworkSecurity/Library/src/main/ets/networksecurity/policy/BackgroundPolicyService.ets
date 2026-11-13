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

import { policy } from '@kit.NetworkKit';
import { Logger } from '../utils/Logger';

/**
 * Background network policy. All three APIs are @systemapi and require MANAGE_NET_STRATEGY
 * (system_basic) with a Full SDK and system signing. Errors (202 on a normal device) are propagated
 * so the caller can explain them; nothing is swallowed here.
 */
export class BackgroundPolicyService {
  /**
   * Check whether background network usage is currently allowed for the whole device.
   * @returns true when background network usage is allowed.
   */
  static async isAllowed(): Promise<boolean> {
    // Open the trace section for this public API.
    Logger.beginTrace('NetworkSecurity.policy.isAllowed', 1);
    Logger.enter('[BackgroundPolicyService#isAllowed]');
    // Query the global background policy state; errors propagate to the caller.
    const allowed: boolean = await policy.isBackgroundAllowed();
    Logger.exit('[BackgroundPolicyService#isAllowed]', 'allowed: ' + allowed);
    // Close the trace section after the await completes.
    Logger.endTrace('NetworkSecurity.policy.isAllowed', 1);
    return allowed;
  }

  /**
   * Globally allow or forbid background network usage.
   * @param allowed true to allow background usage, false to forbid it.
   */
  static async setAllowed(allowed: boolean): Promise<void> {
    // Open the trace section for this public API.
    Logger.beginTrace('NetworkSecurity.policy.setAllowed', 1);
    Logger.enter('[BackgroundPolicyService#setAllowed]', 'allowed: ' + allowed);
    // Apply the new background policy state; errors propagate to the caller.
    await policy.setBackgroundAllowed(allowed);
    Logger.exit('[BackgroundPolicyService#setAllowed]');
    // Close the trace section after the await completes.
    Logger.endTrace('NetworkSecurity.policy.setAllowed', 1);
  }

  /**
   * Read the background policy configured for one UID.
   * @param uid target application UID.
   * @returns the background policy kind of the UID.
   */
  static async policyByUid(uid: number): Promise<policy.NetBackgroundPolicy> {
    // Open the trace section for this public API.
    Logger.beginTrace('NetworkSecurity.policy.policyByUid', 1);
    Logger.enter('[BackgroundPolicyService#policyByUid]', 'uid: ' + uid);
    // Query the per-UID background policy; errors propagate to the caller.
    const result: policy.NetBackgroundPolicy = await policy.getBackgroundPolicyByUid(uid);
    Logger.exit('[BackgroundPolicyService#policyByUid]', 'policy: ' + result);
    // Close the trace section after the await completes.
    Logger.endTrace('NetworkSecurity.policy.policyByUid', 1);
    return result;
  }
}
