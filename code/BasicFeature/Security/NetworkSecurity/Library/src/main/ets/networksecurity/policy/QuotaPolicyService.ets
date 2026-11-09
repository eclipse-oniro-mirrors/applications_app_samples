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

import { connection, policy } from '@kit.NetworkKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Logger } from '../utils/Logger';
import { PolicyErrorCodeMap } from './PolicyErrorCodeMap';
import { QuotaSummary, QuotaView } from './PolicyTypes';

// One megabyte in bytes, used to build the demo quota thresholds.
const MEGA_BYTES: number = 1024 * 1024;
// Demo warning threshold: 100 MB per month.
const QUOTA_WARNING_BYTES: number = 100 * MEGA_BYTES;
// Demo hard limit threshold: 200 MB per month.
const QUOTA_LIMIT_BYTES: number = 200 * MEGA_BYTES;
// Monthly period code expected by QuotaPolicy.periodDuration.
const PERIOD_MONTH: string = 'M1';
// An empty simId / identity means "the default SIM".
const DEFAULT_SIM_ID: string = '';

/**
 * Traffic quota policies. Every API is @systemapi (MANAGE_NET_STRATEGY, system_basic).
 * Mutating calls propagate their BusinessError; read() degrades safely so the page keeps rendering.
 */
export class QuotaPolicyService {
  /**
   * Apply a demo monthly quota policy on the cellular network of the default SIM.
   */
  static async applyDemoQuota(): Promise<void> {
    // Open the trace section for this public API.
    Logger.beginTrace('NetworkSecurity.policy.applyDemoQuota', 1);
    Logger.enter('[QuotaPolicyService#applyDemoQuota]');
    // Match the cellular bearer of the default SIM.
    const rule: policy.NetworkMatchRule = {
      netType: connection.NetBearType.BEARER_CELLULAR,
      identity: DEFAULT_SIM_ID,
      simId: DEFAULT_SIM_ID
    };
    // Build the demo quota: monthly period, 100 MB warning, 200 MB limit, alert only.
    const quota: policy.QuotaPolicy = {
      periodDuration: PERIOD_MONTH,
      warningBytes: QUOTA_WARNING_BYTES,
      limitBytes: QUOTA_LIMIT_BYTES,
      metered: true,
      limitAction: policy.LimitAction.LIMIT_ACTION_ALERT_ONLY
    };
    // Wrap the match rule and the quota into one policy item.
    const item: policy.NetQuotaPolicy = {
      networkMatchRule: rule,
      quotaPolicy: quota
    };
    // Apply the quota policy item list; errors propagate to the caller.
    await policy.setNetQuotaPolicies([item]);
    Logger.exit('[QuotaPolicyService#applyDemoQuota]');
    // Close the trace section after the await completes.
    Logger.endTrace('NetworkSecurity.policy.applyDemoQuota', 1);
  }

  /**
   * Read all quota policies for rendering. Never throws: a failure returns an empty summary
   * plus a reason for the UI.
   * @returns the quota summary, degraded to loaded = false with a message on error.
   */
  static async read(): Promise<QuotaSummary> {
    // Open the trace section for this public API.
    Logger.beginTrace('NetworkSecurity.policy.read', 1);
    Logger.enter('[QuotaPolicyService#read]');
    try {
      // Query the full quota policy list from the system.
      const items: Array<policy.NetQuotaPolicy> = await policy.getNetQuotaPolicies();
      // Collect per-item views for the UI list.
      const views: QuotaView[] = [];
      // Walk the policy items in order to keep the list stable.
      for (let index = 0; index < items.length; index++) {
        // Take the quota part of the current policy item.
        const quota: policy.QuotaPolicy = items[index].quotaPolicy;
        // Map the quota fields into the view model.
        views.push(new QuotaView(quota.warningBytes, quota.limitBytes, quota.metered, quota.limitAction,
          quota.periodDuration));
      }
      Logger.info('[Quota] read ' + views.length + ' quota policies');
      Logger.exit('[QuotaPolicyService#read]', 'count: ' + views.length);
      // Close the trace section on the success return path.
      Logger.endTrace('NetworkSecurity.policy.read', 1);
      return new QuotaSummary(views, true, '');
    } catch (error) {
      // Normalize the caught error so the code and message can be logged.
      const err: BusinessError = error as BusinessError;
      Logger.error('[Quota] failed to read quota policies, code ' + err.code + ': ' + err.message);
      // Choose a specific message when the failure is a permission restriction.
      const message: ResourceStr = PolicyErrorCodeMap.isSystemRestricted(err.code) ?
        $r('app.string.ns_pol_restricted') : $r('app.string.ns_pol_quota_read_failed');
      Logger.exit('[QuotaPolicyService#read]', 'loaded: false');
      // Close the trace section on the degraded return path.
      Logger.endTrace('NetworkSecurity.policy.read', 1);
      return new QuotaSummary([], false, message);
    }
  }

  /**
   * Reset all network policies of the default SIM to system defaults.
   */
  static async reset(): Promise<void> {
    // Open the trace section for this public API.
    Logger.beginTrace('NetworkSecurity.policy.reset', 1);
    Logger.enter('[QuotaPolicyService#reset]');
    // Reset the policies of the default SIM; errors propagate to the caller.
    await policy.resetPolicies(DEFAULT_SIM_ID);
    Logger.exit('[QuotaPolicyService#reset]');
    // Close the trace section after the await completes.
    Logger.endTrace('NetworkSecurity.policy.reset', 1);
  }

  /**
   * Restore all network policies of the default SIM to the carrier configuration.
   */
  static async restoreAll(): Promise<void> {
    // Open the trace section for this public API.
    Logger.beginTrace('NetworkSecurity.policy.restoreAll', 1);
    Logger.enter('[QuotaPolicyService#restoreAll]');
    // Restore the policies of the default SIM; errors propagate to the caller.
    await policy.restoreAllPolicies(DEFAULT_SIM_ID);
    Logger.exit('[QuotaPolicyService#restoreAll]');
    // Close the trace section after the await completes.
    Logger.endTrace('NetworkSecurity.policy.restoreAll', 1);
  }

  /**
   * Trigger the warning reminder for the cellular network of the default SIM.
   */
  static async remind(): Promise<void> {
    // Open the trace section for this public API.
    Logger.beginTrace('NetworkSecurity.policy.remind', 1);
    Logger.enter('[QuotaPolicyService#remind]');
    // Update the remind policy to the warning level; errors propagate to the caller.
    await policy.updateRemindPolicy(connection.NetBearType.BEARER_CELLULAR, DEFAULT_SIM_ID,
      policy.RemindType.REMIND_TYPE_WARNING);
    Logger.exit('[QuotaPolicyService#remind]');
    // Close the trace section after the await completes.
    Logger.endTrace('NetworkSecurity.policy.remind', 1);
  }
}
