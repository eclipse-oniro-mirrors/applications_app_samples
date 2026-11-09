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
import { BusinessError, Callback } from '@kit.BasicServicesKit';
import { Logger } from '../utils/Logger';
import { uidPolicyText, uidRuleText } from './PolicyTypes';

// Event tag reported for UID policy changes.
const TAG_UID_POLICY: string = 'UidPolicyChange';
// Event tag reported for UID rule changes.
const TAG_UID_RULE: string = 'UidRuleChange';
// Event tag reported for metered interface changes.
const TAG_METERED_IFACES: string = 'MeteredIfacesChange';
// Event tag reported for quota policy changes.
const TAG_QUOTA: string = 'QuotaPolicyChange';
// Event tag reported for background policy changes.
const TAG_BACKGROUND: string = 'BackgroundPolicyChange';
// Sentinel passed to the listener when the event payload carries no UID.
const NO_EVENT_UID: number = -1;

/**
 * ArkTS only allows throwing Error subclasses, so the BusinessError code is carried here.
 */
export class PolicyEventError extends Error {
  // BusinessError code carried by the wrapped error.
  code: number;

  /**
   * Build a wrapped error that keeps the original BusinessError code.
   * @param code original BusinessError code.
   * @param message original BusinessError message.
   */
  constructor(code: number, message: string) {
    // Pass the message to the Error base class.
    super(message);
    // Store the code so callers can classify the failure.
    this.code = code;
  }
}

/**
 * Subscribes the five policy events and translates every numeric payload into English text
 * before handing it to the listener. Subscription itself is @systemapi, so on a non-system-signed
 * device it fails with 202 / 201; start() cleans up and rethrows so the caller can report it.
 */
export class PolicyEventService {
  // Cached netUidPolicyChange listener, kept so stop() can unsubscribe the same reference.
  private static uidPolicyListener: Callback<policy.NetUidPolicyInfo> | null = null;
  // Cached netUidRuleChange listener, kept so stop() can unsubscribe the same reference.
  private static uidRuleListener: Callback<policy.NetUidRuleInfo> | null = null;
  // Cached netMeteredIfacesChange listener, kept so stop() can unsubscribe the same reference.
  private static meteredIfacesListener: Callback<Array<string>> | null = null;
  // Cached netQuotaPolicyChange listener, kept so stop() can unsubscribe the same reference.
  private static quotaListener: Callback<Array<policy.NetQuotaPolicy>> | null = null;
  // Cached netBackgroundPolicyChange listener, kept so stop() can unsubscribe the same reference.
  private static backgroundListener: Callback<boolean> | null = null;

  /**
   * Subscribe the five policy events and forward translated texts to the listener.
   * Cleans up and rethrows on failure so the caller can report the error.
   * @param listener callback that receives an event tag, its English text and the payload UID,
   * or NO_EVENT_UID when the payload carries no UID.
   */
  static start(listener: (tag: string, text: string, uid: number) => void): void {
    // Open the trace section for this public API.
    Logger.beginTrace('NetworkSecurity.policy.start', 1);
    Logger.enter('[PolicyEventService#start]');
    // Remove any listeners left over from a previous subscription.
    PolicyEventService.stop();
    // Build the netUidPolicyChange listener that translates the payload to text.
    const uidPolicyListener: Callback<policy.NetUidPolicyInfo> = (info: policy.NetUidPolicyInfo) => {
      // Forward the UID policy change as readable text.
      listener(TAG_UID_POLICY, 'uid ' + info.uid + ' -> ' + uidPolicyText(info.policy), info.uid);
    };
    // Build the netUidRuleChange listener that translates the payload to text.
    const uidRuleListener: Callback<policy.NetUidRuleInfo> = (info: policy.NetUidRuleInfo) => {
      // Forward the UID rule change as readable text.
      listener(TAG_UID_RULE, 'uid ' + info.uid + ' -> ' + uidRuleText(info.rule), info.uid);
    };
    // Build the netMeteredIfacesChange listener that joins the interface names.
    const meteredIfacesListener: Callback<Array<string>> = (ifaces: Array<string>) => {
      // Forward the metered interface list, or none when the list is empty.
      listener(TAG_METERED_IFACES, 'metered ifaces -> ' + (ifaces.length === 0 ? 'none' : ifaces.join(', ')),
        NO_EVENT_UID);
    };
    // Build the netQuotaPolicyChange listener that only reports the item count.
    const quotaListener: Callback<Array<policy.NetQuotaPolicy>> = (items: Array<policy.NetQuotaPolicy>) => {
      // Forward the quota change as a short count summary.
      listener(TAG_QUOTA, 'quota policies updated, count ' + items.length, NO_EVENT_UID);
    };
    // Build the netBackgroundPolicyChange listener that reports the new state.
    const backgroundListener: Callback<boolean> = (allowed: boolean) => {
      // Forward the background policy change as readable text.
      listener(TAG_BACKGROUND, 'background allowed -> ' + allowed, NO_EVENT_UID);
    };

    // Cache all five listeners so stop() can unsubscribe the same references.
    PolicyEventService.uidPolicyListener = uidPolicyListener;
    PolicyEventService.uidRuleListener = uidRuleListener;
    PolicyEventService.meteredIfacesListener = meteredIfacesListener;
    PolicyEventService.quotaListener = quotaListener;
    PolicyEventService.backgroundListener = backgroundListener;

    // Register all five listeners; registration is @systemapi and may throw 201 / 202.
    try {
      // Register the netUidPolicyChange listener.
      policy.on('netUidPolicyChange', uidPolicyListener);
      // Register the netUidRuleChange listener.
      policy.on('netUidRuleChange', uidRuleListener);
      // Register the netMeteredIfacesChange listener.
      policy.on('netMeteredIfacesChange', meteredIfacesListener);
      // Register the netQuotaPolicyChange listener.
      policy.on('netQuotaPolicyChange', quotaListener);
      // Register the netBackgroundPolicyChange listener.
      policy.on('netBackgroundPolicyChange', backgroundListener);
      Logger.info('[Event] five policy listeners registered');
      Logger.exit('[PolicyEventService#start]');
      // Close the trace section on the success path.
      Logger.endTrace('NetworkSecurity.policy.start', 1);
    } catch (error) {
      // Normalize the caught error so the code and message can be logged.
      const err: BusinessError = error as BusinessError;
      Logger.warn('[Event] failed to register policy listeners, code ' + err.code + ': ' + err.message);
      // Roll back partial subscriptions before reporting the failure.
      PolicyEventService.stop();
      Logger.exit('[PolicyEventService#start]', 'aborted');
      // Close the trace section before rethrowing.
      Logger.endTrace('NetworkSecurity.policy.start', 1);
      // Rethrow as an Error subclass that carries the BusinessError code.
      throw new PolicyEventError(err.code, err.message);
    }
  }

  /**
   * Unsubscribe all five policy events and clear the cached listeners.
   */
  static stop(): void {
    // Open the trace section for this public API.
    Logger.beginTrace('NetworkSecurity.policy.stop', 1);
    Logger.enter('[PolicyEventService#stop]');
    // Take the cached netUidPolicyChange listener; null means it was never registered.
    const uidPolicyListener: Callback<policy.NetUidPolicyInfo> | null = PolicyEventService.uidPolicyListener;
    if (uidPolicyListener !== null) {
      try {
        // Unsubscribe the netUidPolicyChange event.
        policy.off('netUidPolicyChange', uidPolicyListener);
      } catch (error) {
        // Normalize the caught error so the code can be logged.
        const err: BusinessError = error as BusinessError;
        Logger.warn('[Event] failed to remove netUidPolicyChange, code ' + err.code);
      }
      // Clear the cached reference after the unsubscribe attempt.
      PolicyEventService.uidPolicyListener = null;
    }

    // Take the cached netUidRuleChange listener; null means it was never registered.
    const uidRuleListener: Callback<policy.NetUidRuleInfo> | null = PolicyEventService.uidRuleListener;
    if (uidRuleListener !== null) {
      try {
        // Unsubscribe the netUidRuleChange event.
        policy.off('netUidRuleChange', uidRuleListener);
      } catch (error) {
        // Normalize the caught error so the code can be logged.
        const err: BusinessError = error as BusinessError;
        Logger.warn('[Event] failed to remove netUidRuleChange, code ' + err.code);
      }
      // Clear the cached reference after the unsubscribe attempt.
      PolicyEventService.uidRuleListener = null;
    }

    // Take the cached netMeteredIfacesChange listener; null means it was never registered.
    const meteredIfacesListener: Callback<Array<string>> | null = PolicyEventService.meteredIfacesListener;
    if (meteredIfacesListener !== null) {
      try {
        // Unsubscribe the netMeteredIfacesChange event.
        policy.off('netMeteredIfacesChange', meteredIfacesListener);
      } catch (error) {
        // Normalize the caught error so the code can be logged.
        const err: BusinessError = error as BusinessError;
        Logger.warn('[Event] failed to remove netMeteredIfacesChange, code ' + err.code);
      }
      // Clear the cached reference after the unsubscribe attempt.
      PolicyEventService.meteredIfacesListener = null;
    }

    // Take the cached netQuotaPolicyChange listener; null means it was never registered.
    const quotaListener: Callback<Array<policy.NetQuotaPolicy>> | null = PolicyEventService.quotaListener;
    if (quotaListener !== null) {
      try {
        // Unsubscribe the netQuotaPolicyChange event.
        policy.off('netQuotaPolicyChange', quotaListener);
      } catch (error) {
        // Normalize the caught error so the code can be logged.
        const err: BusinessError = error as BusinessError;
        Logger.warn('[Event] failed to remove netQuotaPolicyChange, code ' + err.code);
      }
      // Clear the cached reference after the unsubscribe attempt.
      PolicyEventService.quotaListener = null;
    }

    // Take the cached netBackgroundPolicyChange listener; null means it was never registered.
    const backgroundListener: Callback<boolean> | null = PolicyEventService.backgroundListener;
    if (backgroundListener !== null) {
      try {
        // Unsubscribe the netBackgroundPolicyChange event.
        policy.off('netBackgroundPolicyChange', backgroundListener);
      } catch (error) {
        // Normalize the caught error so the code can be logged.
        const err: BusinessError = error as BusinessError;
        Logger.warn('[Event] failed to remove netBackgroundPolicyChange, code ' + err.code);
      }
      // Clear the cached reference after the unsubscribe attempt.
      PolicyEventService.backgroundListener = null;
    }

    Logger.exit('[PolicyEventService#stop]');
    // Close the trace section after all unsubscribe attempts.
    Logger.endTrace('NetworkSecurity.policy.stop', 1);
  }
}
