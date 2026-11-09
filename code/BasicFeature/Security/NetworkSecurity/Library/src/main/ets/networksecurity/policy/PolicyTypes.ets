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

/**
 * View data of the public application network access policy (getNetAccessPolicy, API 26, no permission).
 */
export class AccessPolicyView {
  // Whether applications are allowed to use Wi-Fi networks.
  allowWiFi: boolean;
  // Whether applications are allowed to use cellular networks.
  allowCellular: boolean;
  // Whether the query succeeded; false means the fields hold degraded values.
  loaded: boolean;
  // Failure message for the UI, empty on success.
  message: ResourceStr;

  /**
   * Build a view of the public network access policy.
   * @param allowWiFi whether Wi-Fi access is allowed.
   * @param allowCellular whether cellular access is allowed.
   * @param loaded whether the query succeeded.
   * @param message failure message for the UI, empty on success.
   */
  constructor(allowWiFi: boolean, allowCellular: boolean, loaded: boolean, message: ResourceStr) {
    // Store the Wi-Fi permission flag.
    this.allowWiFi = allowWiFi;
    // Store the cellular permission flag.
    this.allowCellular = allowCellular;
    // Store the load result flag.
    this.loaded = loaded;
    // Store the failure message.
    this.message = message;
  }
}

/**
 * View data of the system background network policy (@systemapi, needs MANAGE_NET_STRATEGY).
 */
export class BackgroundView {
  // Whether the background policy query succeeded.
  allowed: boolean;
  // Global background policy kind reported by the system.
  policy: policy.NetBackgroundPolicy;
  // Application UID the policy was queried for.
  uid: number;
  // Whether the per-UID query succeeded; false means degraded values.
  loaded: boolean;

  /**
   * Build a view of the background policy for one UID.
   * @param allowed whether the background policy query succeeded.
   * @param policyKind background policy kind reported by the system.
   * @param uid application UID the policy belongs to.
   * @param loaded whether the per-UID query succeeded.
   */
  constructor(allowed: boolean, policyKind: policy.NetBackgroundPolicy, uid: number, loaded: boolean) {
    // Store the query result flag.
    this.allowed = allowed;
    // Store the background policy kind.
    this.policy = policyKind;
    // Store the UID the policy belongs to.
    this.uid = uid;
    // Store the per-UID load result flag.
    this.loaded = loaded;
  }
}

/**
 * View data of a single UID policy query (@systemapi).
 */
export class UidPolicyView {
  // Application UID the policy belongs to.
  uid: number;
  // UID policy kind reported by the system.
  policy: policy.NetUidPolicy;
  // Whether the UID may use metered networks.
  meteredAllowed: boolean;
  // Network interface name used for the per-interface check.
  iface: string;
  // Whether the per-interface check succeeded.
  ifaceAllowed: boolean;
  // Whether all queries succeeded; false means degraded values.
  loaded: boolean;

  /**
   * Build a view of one UID policy.
   * @param uid application UID the policy belongs to.
   * @param policyKind UID policy kind reported by the system.
   * @param meteredAllowed whether metered network usage is allowed.
   * @param iface network interface name used for the check.
   * @param ifaceAllowed whether the interface is allowed for the UID.
   * @param loaded whether all queries succeeded.
   */
  constructor(uid: number, policyKind: policy.NetUidPolicy, meteredAllowed: boolean, iface: string,
    ifaceAllowed: boolean, loaded: boolean) {
    // Store the UID the policy belongs to.
    this.uid = uid;
    // Store the UID policy kind.
    this.policy = policyKind;
    // Store the metered-network permission flag.
    this.meteredAllowed = meteredAllowed;
    // Store the interface name used for the check.
    this.iface = iface;
    // Store the interface permission flag.
    this.ifaceAllowed = ifaceAllowed;
    // Store the overall load result flag.
    this.loaded = loaded;
  }
}

/**
 * View data of one quota policy item (@systemapi).
 */
export class QuotaView {
  // Traffic volume in bytes that triggers the warning reminder.
  warningBytes: number;
  // Traffic volume in bytes that triggers the hard limit.
  limitBytes: number;
  // Whether the policy applies to metered (cellular) networks.
  metered: boolean;
  // Action taken when the limit is reached.
  limitAction: policy.LimitAction;
  // Period length code, for example 'M1' for one month.
  periodDuration: string;

  /**
   * Build a view of one quota policy item.
   * @param warningBytes warning threshold in bytes.
   * @param limitBytes hard limit threshold in bytes.
   * @param metered whether the policy applies to metered networks.
   * @param limitAction action taken when the limit is reached.
   * @param periodDuration period length code of the quota.
   */
  constructor(warningBytes: number, limitBytes: number, metered: boolean, limitAction: policy.LimitAction,
    periodDuration: string) {
    // Store the warning threshold.
    this.warningBytes = warningBytes;
    // Store the hard limit threshold.
    this.limitBytes = limitBytes;
    // Store the metered flag.
    this.metered = metered;
    // Store the limit action.
    this.limitAction = limitAction;
    // Store the period length code.
    this.periodDuration = periodDuration;
  }
}

/**
 * Result of a quota policy query, including the safe degradation message.
 */
export class QuotaSummary {
  // Quota item views in system order.
  items: QuotaView[];
  // Whether the query succeeded.
  loaded: boolean;
  // Failure message for the UI, empty on success.
  message: ResourceStr;

  /**
   * Build a summary of a quota policy query.
   * @param items quota item views in system order.
   * @param loaded whether the query succeeded.
   * @param message failure message for the UI, empty on success.
   */
  constructor(items: QuotaView[], loaded: boolean, message: ResourceStr) {
    // Store the item views.
    this.items = items;
    // Store the load result flag.
    this.loaded = loaded;
    // Store the failure message.
    this.message = message;
  }
}

/**
 * View data of the device idle and power save trust lists (@systemapi).
 */
export class TrustlistView {
  // UIDs allowed to use the network in device idle mode.
  deviceIdle: number[];
  // UIDs allowed to use the network in power save mode.
  powerSave: number[];
  // Whether the query succeeded.
  loaded: boolean;

  /**
   * Build a view of both trust lists.
   * @param deviceIdle UIDs allowed in device idle mode.
   * @param powerSave UIDs allowed in power save mode.
   * @param loaded whether the query succeeded.
   */
  constructor(deviceIdle: number[], powerSave: number[], loaded: boolean) {
    // Store the device idle trust list.
    this.deviceIdle = deviceIdle;
    // Store the power save trust list.
    this.powerSave = powerSave;
    // Store the load result flag.
    this.loaded = loaded;
  }
}

/**
 * One received policy event. The id keeps the Repeat key stable when new events are prepended.
 */
export class PolicyEventItem {
  // Stable unique id used as the Repeat key.
  id: number;
  // Event tag such as 'UidPolicyChange'.
  type: string;
  // Translated English text of the event.
  text: string;
  // Local receive time formatted for display.
  time: string;
  // UID carried by the event payload, undefined when the payload has no UID.
  uid?: number;

  /**
   * Build one displayable policy event.
   * @param id stable unique id for the Repeat key.
   * @param type event tag reported by the service.
   * @param text translated English event text.
   * @param time local receive time for display.
   */
  constructor(id: number, type: string, text: string, time: string) {
    // Store the stable id.
    this.id = id;
    // Store the event tag.
    this.type = type;
    // Store the event text.
    this.text = text;
    // Store the receive time.
    this.time = time;
  }
}

/**
 * Human readable explanation of a BusinessError code.
 */
export class ErrorExplain {
  // BusinessError code this entry explains.
  code: number;
  // Short localized title of the error.
  title: ResourceStr;
  // Localized root cause of the error.
  reason: ResourceStr;
  // Localized suggested fix for the error.
  suggestion: ResourceStr;
  // Severity, either 'error' or 'warning'.
  level: string;

  /**
   * Build one error explanation entry.
   * @param code BusinessError code this entry explains.
   * @param title short localized title.
   * @param reason localized root cause.
   * @param suggestion localized suggested fix.
   * @param level severity, 'error' or 'warning'.
   */
  constructor(code: number, title: ResourceStr, reason: ResourceStr, suggestion: ResourceStr, level: string) {
    // Store the explained code.
    this.code = code;
    // Store the title.
    this.title = title;
    // Store the reason.
    this.reason = reason;
    // Store the suggestion.
    this.suggestion = suggestion;
    // Store the severity level.
    this.level = level;
  }
}

/**
 * Map an allowed flag to its localized label.
 * @param allowed whether the action is allowed.
 * @returns the localized "allowed" or "denied" label.
 */
export function allowedLabel(allowed: boolean): ResourceStr {
  // Pick the label from the boolean flag.
  return allowed ? $r('app.string.ns_common_allowed') : $r('app.string.ns_common_denied');
}

/**
 * Map a background policy enum to its localized label.
 * @param value background policy value from policy.NetBackgroundPolicy.
 * @returns the localized label for the value.
 */
export function backgroundPolicyLabel(value: policy.NetBackgroundPolicy): ResourceStr {
  // Enable means background traffic is globally allowed.
  if (value === policy.NetBackgroundPolicy.NET_BACKGROUND_POLICY_ENABLE) {
    return $r('app.string.ns_pol_bg_enable');
  }
  // Disable means background traffic is globally forbidden.
  if (value === policy.NetBackgroundPolicy.NET_BACKGROUND_POLICY_DISABLE) {
    return $r('app.string.ns_pol_bg_disable');
  }
  // Trustlist means only trusted UIDs may use background traffic.
  if (value === policy.NetBackgroundPolicy.NET_BACKGROUND_POLICY_TRUSTLIST) {
    return $r('app.string.ns_pol_bg_trustlist');
  }
  // Unknown enum values fall back to the none label.
  return $r('app.string.ns_pol_bg_none');
}

/**
 * Map a background policy enum to a plain English text for logs.
 * @param value background policy value from policy.NetBackgroundPolicy.
 * @returns the English text of the policy value.
 */
export function backgroundPolicyText(value: policy.NetBackgroundPolicy): string {
  // Enable means background traffic is globally allowed.
  if (value === policy.NetBackgroundPolicy.NET_BACKGROUND_POLICY_ENABLE) {
    return 'enable';
  }
  // Disable means background traffic is globally forbidden.
  if (value === policy.NetBackgroundPolicy.NET_BACKGROUND_POLICY_DISABLE) {
    return 'disable';
  }
  // Trustlist means only trusted UIDs may use background traffic.
  if (value === policy.NetBackgroundPolicy.NET_BACKGROUND_POLICY_TRUSTLIST) {
    return 'trustlist';
  }
  // Unknown enum values fall back to none.
  return 'none';
}

/**
 * Map a UID policy enum to its localized label.
 * @param value UID policy value from policy.NetUidPolicy.
 * @returns the localized label for the value.
 */
export function uidPolicyLabel(value: policy.NetUidPolicy): ResourceStr {
  // Allow means the UID may use metered networks in the background.
  if (value === policy.NetUidPolicy.NET_POLICY_ALLOW_METERED_BACKGROUND) {
    return $r('app.string.ns_pol_uid_policy_allow');
  }
  // Reject means the UID may not use metered networks in the background.
  if (value === policy.NetUidPolicy.NET_POLICY_REJECT_METERED_BACKGROUND) {
    return $r('app.string.ns_pol_uid_policy_reject');
  }
  // Unknown enum values fall back to the none label.
  return $r('app.string.ns_pol_uid_policy_none');
}

/**
 * Map a UID policy enum to a plain English text for logs.
 * @param value UID policy value from policy.NetUidPolicy.
 * @returns the English text of the policy value.
 */
export function uidPolicyText(value: policy.NetUidPolicy): string {
  // Allow means the UID may use metered networks in the background.
  if (value === policy.NetUidPolicy.NET_POLICY_ALLOW_METERED_BACKGROUND) {
    return 'allow metered background';
  }
  // Reject means the UID may not use metered networks in the background.
  if (value === policy.NetUidPolicy.NET_POLICY_REJECT_METERED_BACKGROUND) {
    return 'reject metered background';
  }
  // Unknown enum values fall back to none.
  return 'none';
}

/**
 * Map a UID rule enum to a plain English text for logs.
 * @param value UID rule value from policy.NetUidRule.
 * @returns the English text of the rule value.
 */
export function uidRuleText(value: policy.NetUidRule): string {
  // Foreground traffic on metered networks is allowed.
  if (value === policy.NetUidRule.NET_RULE_ALLOW_METERED_FOREGROUND) {
    return 'allow metered foreground';
  }
  // All traffic on metered networks is allowed.
  if (value === policy.NetUidRule.NET_RULE_ALLOW_METERED) {
    return 'allow metered';
  }
  // All traffic on metered networks is rejected.
  if (value === policy.NetUidRule.NET_RULE_REJECT_METERED) {
    return 'reject metered';
  }
  // All network traffic is allowed.
  if (value === policy.NetUidRule.NET_RULE_ALLOW_ALL) {
    return 'allow all';
  }
  // All network traffic is rejected.
  if (value === policy.NetUidRule.NET_RULE_REJECT_ALL) {
    return 'reject all';
  }
  // Unknown enum values fall back to none.
  return 'none';
}

/**
 * Map a limit action enum to its localized label.
 * @param value limit action value from policy.LimitAction.
 * @returns the localized label for the value.
 */
export function limitActionLabel(value: policy.LimitAction): ResourceStr {
  // Access disabled means the network is blocked once the limit is reached.
  if (value === policy.LimitAction.LIMIT_ACTION_ACCESS_DISABLED) {
    return $r('app.string.ns_pol_limit_disabled');
  }
  // Alert only means the user is warned but the network stays available.
  if (value === policy.LimitAction.LIMIT_ACTION_ALERT_ONLY) {
    return $r('app.string.ns_pol_limit_alert');
  }
  // Unknown enum values fall back to the none label.
  return $r('app.string.ns_pol_limit_none');
}
