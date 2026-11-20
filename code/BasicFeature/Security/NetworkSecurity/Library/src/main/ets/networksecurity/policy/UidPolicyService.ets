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
 * Per-UID policy. Every API here is @systemapi and requires MANAGE_NET_STRATEGY (system_basic),
 * so a normal application receives BusinessError 202 (or 201). Errors are propagated on purpose.
 */
export class UidPolicyService {
  /**
   * Set the network policy kind for one UID.
   * @param uid target application UID.
   * @param policyKind policy kind to apply, from policy.NetUidPolicy.
   */
  static async setPolicy(uid: number, policyKind: policy.NetUidPolicy): Promise<void> {
    // Open the trace section for this public API.
    Logger.beginTrace('NetworkSecurity.policy.setPolicy', 1);
    Logger.enter('[UidPolicyService#setPolicy]', 'uid: ' + uid + ', policyKind: ' + policyKind);
    // Apply the policy kind to the target UID; errors propagate to the caller.
    await policy.setPolicyByUid(uid, policyKind);
    Logger.exit('[UidPolicyService#setPolicy]');
    // Close the trace section after the await completes.
    Logger.endTrace('NetworkSecurity.policy.setPolicy', 1);
  }

  /**
   * Get the current network policy kind of one UID.
   * @param uid target application UID.
   * @returns the policy kind currently configured for the UID.
   */
  static async getPolicy(uid: number): Promise<policy.NetUidPolicy> {
    // Open the trace section for this public API.
    Logger.beginTrace('NetworkSecurity.policy.getPolicy', 1);
    Logger.enter('[UidPolicyService#getPolicy]', 'uid: ' + uid);
    // Query the policy kind of the target UID; errors propagate to the caller.
    const result: policy.NetUidPolicy = await policy.getPolicyByUid(uid);
    Logger.exit('[UidPolicyService#getPolicy]', 'policy: ' + result);
    // Close the trace section after the await completes.
    Logger.endTrace('NetworkSecurity.policy.getPolicy', 1);
    return result;
  }

  /**
   * List all UIDs that currently hold one policy kind.
   * @param policyKind policy kind to filter by.
   * @returns the UID array matching the given policy kind.
   */
  static async uidsByPolicy(policyKind: policy.NetUidPolicy): Promise<number[]> {
    // Open the trace section for this public API.
    Logger.beginTrace('NetworkSecurity.policy.uidsByPolicy', 1);
    Logger.enter('[UidPolicyService#uidsByPolicy]', 'policyKind: ' + policyKind);
    // Query the UID list for the given policy kind; errors propagate to the caller.
    const result: number[] = await policy.getUidsByPolicy(policyKind);
    Logger.exit('[UidPolicyService#uidsByPolicy]', 'count: ' + result.length);
    // Close the trace section after the await completes.
    Logger.endTrace('NetworkSecurity.policy.uidsByPolicy', 1);
    return result;
  }

  /**
   * Check whether one UID may use metered networks.
   * @param uid target application UID.
   * @returns true when metered network usage is allowed for the UID.
   */
  static async isMeteredAllowed(uid: number): Promise<boolean> {
    // Open the trace section for this public API.
    Logger.beginTrace('NetworkSecurity.policy.isMeteredAllowed', 1);
    Logger.enter('[UidPolicyService#isMeteredAllowed]', 'uid: ' + uid);
    // Query the metered-network permission of the target UID; errors propagate to the caller.
    const allowed: boolean = await policy.isUidNetAllowed(uid, true);
    Logger.exit('[UidPolicyService#isMeteredAllowed]', 'allowed: ' + allowed);
    // Close the trace section after the await completes.
    Logger.endTrace('NetworkSecurity.policy.isMeteredAllowed', 1);
    return allowed;
  }

  /**
   * Check whether one UID may use a given network interface.
   * iface example: 'wlan0' for Wi-Fi, 'rmnet0' for cellular.
   * @param uid target application UID.
   * @param iface network interface name, for example 'wlan0'.
   * @returns true when the interface is allowed for the UID.
   */
  static async isIfaceAllowed(uid: number, iface: string): Promise<boolean> {
    // Open the trace section for this public API.
    Logger.beginTrace('NetworkSecurity.policy.isIfaceAllowed', 1);
    Logger.enter('[UidPolicyService#isIfaceAllowed]', 'uid: ' + uid + ', iface: ' + iface);
    // Query the interface permission of the target UID; errors propagate to the caller.
    const allowed: boolean = await policy.isUidNetAllowed(uid, iface);
    Logger.exit('[UidPolicyService#isIfaceAllowed]', 'allowed: ' + allowed);
    // Close the trace section after the await completes.
    Logger.endTrace('NetworkSecurity.policy.isIfaceAllowed', 1);
    return allowed;
  }
}
